// ============================================================
// Convertisseur / Importateur Supabase — MeubléFacile
// Lit scraped_data/meubles_douala.json et génère un script SQL
// propre et prêt pour Supabase (supabase/seed_scraped_meubles.sql)
// ============================================================

import fs from "fs";
import path from "path";

const JSON_FILE = path.resolve(process.cwd(), "scraped_data", "meubles_douala.json");
const SQL_OUTPUT = path.resolve(process.cwd(), "supabase", "seed_scraped_meubles.sql");

if (!fs.existsSync(JSON_FILE)) {
  console.error(`❌ Fichier introuvable : ${JSON_FILE}`);
  console.log("👉 Lancez d'abord le scraper : npm run scrape:maps");
  process.exit(1);
}

const rawData = fs.readFileSync(JSON_FILE, "utf-8");
const items = JSON.parse(rawData);

console.log(`📦 Chargement de ${items.length} logement(s) extrait(s)...`);

function cleanText(text) {
  if (!text) return "";
  return text
    .replace(/[\uE000-\uF8FF]/g, "") // Supprime les icônes privées de Google Maps
    .replace(/^[,;\s\n\r]+|[,;\s\n\r]+$/g, "")
    .trim();
}

function cleanPhone(raw) {
  if (!raw) return "";
  const cleaned = raw.replace(/[\uE000-\uF8FF]/g, "").replace(/[^\d+]/g, "").trim();
  if (cleaned.startsWith("+")) return cleaned;
  if (cleaned.startsWith("237") && cleaned.length >= 11) return `+${cleaned}`;
  if (cleaned.length === 9) {
    return `+237 ${cleaned.slice(0, 3)} ${cleaned.slice(3, 5)} ${cleaned.slice(5, 7)} ${cleaned.slice(7)}`;
  }
  return cleaned;
}

function slugify(text) {
  return text
    .toString()
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .slice(0, 75);
}

function escapeSql(str) {
  if (!str) return "null";
  const cleaned = cleanText(String(str));
  if (!cleaned) return "null";
  return `'${cleaned.replace(/'/g, "''")}'`;
}

function detectType(name, category) {
  const combined = `${name} ${category}`.toLowerCase();
  if (combined.includes("studio")) return "studio";
  if (combined.includes("duplex") || combined.includes("villa")) return "duplex";
  if (combined.includes("chambre") || combined.includes("room")) return "room";
  return "apartment";
}

let sql = `-- ============================================================
-- Données Réelles Scrapées sur Google Maps (Douala)
-- Généré automatiquement par scripts/import-scraped-to-supabase.mjs
-- ============================================================

do $$
declare
  demo_owner uuid := '00000000-0000-0000-0000-000000000001'::uuid;
  c_douala_id int;
  v_listing_id uuid;
begin
  select id into c_douala_id from public.cities where slug = 'douala';
`;

let count = 0;
const usedSlugs = new Set();

for (const item of items) {
  const cleanedName = cleanText(item.name);
  if (!cleanedName) continue;
  count++;

  const rawSlug = slugify(`${cleanedName}-${item.neighborhood || "douala"}`);
  let slug = rawSlug;
  let counter = 1;
  while (usedSlugs.has(slug)) {
    slug = `${rawSlug}-${counter}`;
    counter++;
  }
  usedSlugs.add(slug);

  const type = detectType(cleanedName, item.category);
  const neighborhoodSlug = (item.neighborhood || "bonapriso")
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "");

  const cleanedPhone = cleanPhone(item.phone);
  const cleanedAddress = cleanText(item.address);

  const descriptionLines = [
    cleanedName,
    item.category ? `Catégorie : ${cleanText(item.category)}.` : "",
    cleanedAddress ? `Adresse : ${cleanedAddress}.` : "",
    cleanedPhone ? `Contact / WhatsApp : ${cleanedPhone}.` : "",
    item.rating ? `Note Google Maps : ${item.rating}/5 (${item.reviewsCount || 0} avis).` : ""
  ].filter(Boolean);

  if (item.reviews && item.reviews.length > 0) {
    descriptionLines.push("\nAvis clients récents :");
    for (const r of item.reviews.slice(0, 3)) {
      descriptionLines.push(`- "${cleanText(r.text)}" (${cleanText(r.author)}, note ${r.rating || "?"}/5)`);
    }
  }

  const description = descriptionLines.join("\n");
  const lat = item.lat || "null";
  const lng = item.lng || "null";

  sql += `
  -- [${count}] ${cleanedName} (${item.neighborhood})
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    ${escapeSql(slug)},
    '${type}',
    'published',
    ${escapeSql(cleanedName)},
    ${escapeSql(description)},
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = '${neighborhoodSlug}'), (select id from public.neighborhoods where slug = 'bonapriso')),
    ${escapeSql(cleanedAddress || item.neighborhood)},
    ${lat},
    ${lng},
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;
`;

  // Photos
  if (item.photos && item.photos.length > 0) {
    item.photos.slice(0, 10).forEach((photoUrl, index) => {
      const isCover = index === 0;
      sql += `
  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, ${escapeSql(photoUrl)}, ${escapeSql(photoUrl)}, ${isCover}, ${index}, ${escapeSql(cleanedName)})
  on conflict do nothing;
`;
    });
  }
}

sql += `
end $$;
`;

fs.writeFileSync(SQL_OUTPUT, sql, "utf-8");
console.log(`\n✅ Fichier SQL généré avec succès (${count} logements nettoyés) :`);
console.log(`👉 ${SQL_OUTPUT}`);
