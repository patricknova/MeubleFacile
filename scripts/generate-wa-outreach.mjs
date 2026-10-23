// ============================================================
// MeubléFacile — Générateur de liens WhatsApp pour outreach
// Usage : node scripts/generate-wa-outreach.mjs
// Sortie : scripts/outreach/wa-outreach.html
// ============================================================

import { readFileSync, writeFileSync, mkdirSync } from "fs";
import { resolve, dirname } from "path";
import { fileURLToPath } from "url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const CATALOG_PATH = resolve(__dirname, "../lib/catalog-data.json");
const OUTPUT_DIR = resolve(__dirname, "outreach");
const OUTPUT_PATH = resolve(OUTPUT_DIR, "wa-outreach.html");

const SITE_URL = "https://meublefacile.vercel.app";

// ── Ton nom (à personnaliser) ──
const FOUNDER_NAME = "Patrick"; // ← Change ton prénom ici

// ── Charger le catalogue ──
const catalog = JSON.parse(readFileSync(CATALOG_PATH, "utf-8"));

// ── Normaliser le numéro (retirer espaces, tirets) ──
function normalizePhone(raw) {
  return raw.replace(/[\s\-().]/g, "");
}

// ── Grouper par numéro de téléphone ──
const contactsMap = new Map();

for (const listing of catalog) {
  if (!listing.phone) continue;

  const phone = normalizePhone(listing.phone);
  const listingUrl = `${SITE_URL}/douala/${listing.neighborhood.slug}/${listing.type}/${listing.slug}`;

  if (!contactsMap.has(phone)) {
    contactsMap.set(phone, {
      phone,
      phoneRaw: listing.phone,
      listings: [],
    });
  }

  contactsMap.get(phone).listings.push({
    title: listing.title,
    type: listing.type,
    neighborhood: listing.neighborhood.name,
    neighborhoodSlug: listing.neighborhood.slug,
    url: listingUrl,
    slug: listing.slug,
    coverThumb: listing.listing_media?.[0]?.path_thumb || "",
  });
}

const contacts = Array.from(contactsMap.values()).sort(
  (a, b) => b.listings.length - a.listings.length
);

console.log(`\\n📊 Résultats :`);
console.log(`   Total annonces : ${catalog.length}`);
console.log(`   Annonces avec téléphone : ${catalog.filter((l) => l.phone).length}`);
console.log(`   Contacts uniques : ${contacts.length}`);
console.log(`   🏠 Particuliers (1-3 biens) : ${contacts.filter((c) => c.listings.length <= 3).length}`);
console.log(`   🏢 Petits gestionnaires (4-10 biens) : ${contacts.filter((c) => c.listings.length >= 4 && c.listings.length <= 10).length}`);
console.log(`   🏗️  Agences / Gros comptes (11+ biens) : ${contacts.filter((c) => c.listings.length >= 11).length}\n`);

// ── Déterminer le segment d'un contact ──
function getSegment(contact) {
  const n = contact.listings.length;
  if (n <= 3) return { tier: "particulier", label: "🏠 Particulier", color: "#16a34a" };
  if (n <= 10) return { tier: "gestionnaire", label: "🏢 Gestionnaire", color: "#2563eb" };
  return { tier: "agence", label: "🏗️ Agence", color: "#9333ea" };
}

// ── Collecter les quartiers uniques d'un contact ──
function getUniqueNeighborhoods(contact) {
  const map = new Map();
  for (const l of contact.listings) {
    if (!map.has(l.neighborhood)) {
      map.set(l.neighborhood, l);
    }
  }
  return Array.from(map.values());
}

// ── Générer le message WhatsApp personnalisé selon le segment ──
function buildMessage(contact) {
  const nbBiens = contact.listings.length;
  const segment = getSegment(contact);

  // ── TIER 1 : Particulier (1-3 biens) → liste tous les liens ──
  if (segment.tier === "particulier") {
    const firstListing = contact.listings[0];
    const liensAnnonces = contact.listings
      .map((l) => `• ${l.title} → ${l.url}`)
      .join("\n");

    return `Bonjour 👋,

Je suis ${FOUNDER_NAME}, fondateur de *MeubléFacile* — la nouvelle plateforme de logements meublés à Douala.

Je vous contacte pour vous féliciter 🎉 ! Votre bien « ${firstListing.title} » a été référencé sur notre site.

🏠 Vous avez *${nbBiens} bien(s)* listé(s) chez nous :
${liensAnnonces}

MeubléFacile aide les locataires à trouver facilement un studio ou appartement meublé à Douala, avec photos réelles et contact WhatsApp direct.

Nous pourrions avoir besoin de quelques infos supplémentaires pour rendre votre annonce encore plus attractive (photos complémentaires, équipements, disponibilité...).

Seriez-vous disponible pour un court échange ? 🙏

Merci et bonne continuation !
— L'équipe MeubléFacile
🌐 ${SITE_URL}`;
  }

  // ── TIER 2 : Petit gestionnaire (4-10 biens) → 3 exemples + nombre total ──
  if (segment.tier === "gestionnaire") {
    const exemples = contact.listings
      .slice(0, 3)
      .map((l) => `• ${l.title} (${l.neighborhood})`)
      .join("\n");
    const neighborhoodSlugs = [...new Set(contact.listings.map((l) => l.neighborhoodSlug || ""))];
    const lienQuartier = neighborhoodSlugs[0]
      ? `${SITE_URL}/douala/${neighborhoodSlugs[0]}`
      : SITE_URL;

    return `Bonjour 👋,

Je suis ${FOUNDER_NAME}, fondateur de *MeubléFacile* — la nouvelle plateforme de logements meublés à Douala.

Je vous contacte pour vous informer que *${nbBiens} de vos biens meublés* sont désormais référencés sur notre plateforme 🎉

Parmi eux :
${exemples}
…et ${nbBiens - 3} autre(s).

👉 Retrouvez vos annonces ici : ${lienQuartier}

MeubléFacile met en avant vos logements avec photos réelles et contact WhatsApp direct auprès de locataires qualifiés.

Si vous souhaitez enrichir vos fiches (photos, équipements, disponibilités), je serais ravi d'échanger avec vous.

Merci et à bientôt !
— ${FOUNDER_NAME}, MeubléFacile
🌐 ${SITE_URL}`;
  }

  // ── TIER 3 : Agence / Gros compte (11+ biens) → message court et VIP ──
  const neighborhoods = [...new Set(contact.listings.map((l) => l.neighborhood))];
  const quartiersTexte = neighborhoods.slice(0, 3).join(", ");

  return `Bonjour 👋,

Je suis ${FOUNDER_NAME}, fondateur de *MeubléFacile*, la nouvelle plateforme de logements meublés à Douala.

Votre catalogue de *${nbBiens} logements meublés* (${quartiersTexte}…) est désormais référencé sur notre site 🎉

🌐 ${SITE_URL}

J'aimerais beaucoup échanger avec vous pour :
✅ Optimiser la visibilité de vos annonces
✅ Mettre à jour les infos et photos
✅ Explorer un éventuel partenariat

Seriez-vous disponible pour un court appel ou une rencontre ? 📞

Cordialement,
${FOUNDER_NAME} — MeubléFacile`;
}

// ── Générer la page HTML ──
function buildHTML() {
  const rows = contacts
    .map((contact, index) => {
      const phone = contact.phone.replace("+", "");
      const message = encodeURIComponent(buildMessage(contact));
      const waUrl = `https://wa.me/${phone}?text=${message}`;
      const segment = getSegment(contact);

      // Limit displayed chips to 5 max in the table
      const displayListings = contact.listings.slice(0, 5);
      const remaining = contact.listings.length - displayListings.length;
      const listingsHTML =
        displayListings
          .map(
            (l) =>
              `<span class="listing-chip" title="${l.url}">${l.type === "studio" ? "🏨" : "🏠"} ${l.title} <small>(${l.neighborhood})</small></span>`
          )
          .join(" ") +
        (remaining > 0
          ? ` <span class="listing-chip" style="background:#e0e7ff;color:#3730a3">+${remaining} autres</span>`
          : "");

      return `
        <tr data-status="pending" data-segment="${segment.tier}" id="row-${index}">
          <td class="cell-index">${index + 1}</td>
          <td class="cell-phone">
            <strong>${contact.phoneRaw}</strong>
            <span class="segment-badge" style="background:${segment.color}">${segment.label}</span>
          </td>
          <td class="cell-count">${contact.listings.length}</td>
          <td class="cell-listings">${listingsHTML}</td>
          <td class="cell-action">
            <a href="${waUrl}" target="_blank" rel="noopener" class="btn-wa" onclick="markSent(${index})">
              💬 Envoyer
            </a>
          </td>
          <td class="cell-status">
            <select onchange="updateStatus(${index}, this.value)">
              <option value="pending">⏳ En attente</option>
              <option value="sent">✅ Envoyé</option>
              <option value="replied">💬 Répondu</option>
              <option value="skip">⏭️ Ignoré</option>
            </select>
          </td>
        </tr>`;
    })
    .join("\n");

  return `<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MeubléFacile — Outreach WhatsApp Propriétaires</title>
  <style>
    :root {
      --brand-50: #f0fdf4;
      --brand-100: #dcfce7;
      --brand-200: #bbf7d0;
      --brand-500: #22c55e;
      --brand-600: #16a34a;
      --brand-700: #15803d;
      --gray-50: #f9fafb;
      --gray-100: #f3f4f6;
      --gray-200: #e5e7eb;
      --gray-400: #9ca3af;
      --gray-600: #4b5563;
      --gray-800: #1f2937;
      --gray-900: #111827;
    }

    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
      font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
      background: var(--gray-50);
      color: var(--gray-800);
      padding: 24px;
    }

    .header {
      text-align: center;
      margin-bottom: 32px;
      padding: 24px;
      background: linear-gradient(135deg, var(--brand-700), var(--brand-600));
      border-radius: 16px;
      color: white;
    }

    .header h1 { font-size: 1.5rem; margin-bottom: 8px; }
    .header p { opacity: 0.9; font-size: 0.9rem; }

    .stats {
      display: flex;
      gap: 16px;
      justify-content: center;
      margin-top: 16px;
      flex-wrap: wrap;
    }

    .stat-card {
      background: rgba(255,255,255,0.15);
      border-radius: 12px;
      padding: 12px 20px;
      text-align: center;
      min-width: 120px;
    }

    .stat-card .number { font-size: 1.5rem; font-weight: 800; }
    .stat-card .label { font-size: 0.75rem; opacity: 0.85; margin-top: 2px; }

    .filters {
      display: flex;
      gap: 8px;
      margin-bottom: 16px;
      flex-wrap: wrap;
      align-items: center;
    }

    .filters input {
      padding: 8px 14px;
      border: 1px solid var(--gray-200);
      border-radius: 8px;
      font-size: 0.85rem;
      flex: 1;
      min-width: 200px;
    }

    .filter-btn {
      padding: 8px 16px;
      border: 1px solid var(--gray-200);
      border-radius: 8px;
      background: white;
      cursor: pointer;
      font-size: 0.8rem;
      transition: all 0.15s;
    }

    .filter-btn:hover { background: var(--brand-50); border-color: var(--brand-500); }
    .filter-btn.active { background: var(--brand-600); color: white; border-color: var(--brand-600); }

    .progress-bar {
      height: 6px;
      background: var(--gray-200);
      border-radius: 99px;
      margin-bottom: 16px;
      overflow: hidden;
    }

    .progress-fill {
      height: 100%;
      background: linear-gradient(90deg, var(--brand-500), var(--brand-600));
      border-radius: 99px;
      transition: width 0.4s ease;
    }

    .progress-text {
      font-size: 0.8rem;
      color: var(--gray-600);
      margin-bottom: 8px;
      text-align: right;
    }

    table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0;
      background: white;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 1px 3px rgba(0,0,0,0.08);
    }

    thead th {
      background: var(--gray-900);
      color: white;
      padding: 12px 14px;
      text-align: left;
      font-size: 0.8rem;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    tbody tr {
      transition: background 0.15s;
    }

    tbody tr:hover { background: var(--brand-50); }
    tbody tr[data-status="sent"] { background: #f0fdf4; }
    tbody tr[data-status="replied"] { background: #eff6ff; }
    tbody tr[data-status="skip"] { opacity: 0.5; }

    td {
      padding: 10px 14px;
      border-bottom: 1px solid var(--gray-100);
      font-size: 0.85rem;
      vertical-align: middle;
    }

    .cell-index { width: 40px; color: var(--gray-400); font-size: 0.75rem; }
    .cell-count { text-align: center; font-weight: 700; color: var(--brand-700); }

    .listing-chip {
      display: inline-block;
      background: var(--gray-100);
      padding: 3px 8px;
      border-radius: 6px;
      font-size: 0.75rem;
      margin: 2px;
      white-space: nowrap;
    }

    .listing-chip small { color: var(--gray-400); }

    .btn-wa {
      display: inline-flex;
      align-items: center;
      gap: 4px;
      padding: 8px 16px;
      background: #25D366;
      color: white;
      text-decoration: none;
      border-radius: 8px;
      font-size: 0.8rem;
      font-weight: 600;
      transition: all 0.15s;
      white-space: nowrap;
    }

    .btn-wa:hover { background: #1ebe57; transform: translateY(-1px); box-shadow: 0 2px 8px rgba(37,211,102,0.3); }

    .segment-badge {
      display: inline-block;
      padding: 2px 8px;
      border-radius: 99px;
      font-size: 0.65rem;
      font-weight: 600;
      color: white;
      margin-left: 6px;
      vertical-align: middle;
    }

    select {
      padding: 6px 10px;
      border: 1px solid var(--gray-200);
      border-radius: 6px;
      font-size: 0.8rem;
      background: white;
      cursor: pointer;
    }

    .filters-row2 {
      display: flex;
      gap: 6px;
      margin-top: 8px;
      flex-wrap: wrap;
    }

    .filters-row2 .filter-btn { font-size: 0.75rem; padding: 6px 12px; }

    @media (max-width: 768px) {
      body { padding: 12px; }
      .cell-listings { display: none; }
      table { font-size: 0.8rem; }
    }
  </style>
</head>
<body>

  <div class="header">
    <h1>📱 MeubléFacile — Outreach WhatsApp</h1>
    <p>Contactez les propriétaires pour vous présenter et enrichir les fiches</p>
    <div class="stats">
      <div class="stat-card">
        <div class="number" id="stat-total">${contacts.length}</div>
        <div class="label">Contacts</div>
      </div>
      <div class="stat-card">
        <div class="number" id="stat-sent">0</div>
        <div class="label">Envoyés</div>
      </div>
      <div class="stat-card">
        <div class="number" id="stat-replied">0</div>
        <div class="label">Répondu</div>
      </div>
      <div class="stat-card">
        <div class="number" id="stat-pending">${contacts.length}</div>
        <div class="label">En attente</div>
      </div>
    </div>
  </div>

  <div class="filters">
    <input type="text" id="search" placeholder="🔍 Rechercher par nom, quartier, numéro..." oninput="filterTable()">
    <button class="filter-btn active" onclick="setFilter('all', this)">Tous</button>
    <button class="filter-btn" onclick="setFilter('pending', this)">⏳ En attente</button>
    <button class="filter-btn" onclick="setFilter('sent', this)">✅ Envoyés</button>
    <button class="filter-btn" onclick="setFilter('replied', this)">💬 Répondu</button>
    <div class="filters-row2">
      <span style="font-size:0.8rem;color:var(--gray-600);align-self:center">Segment :</span>
      <button class="filter-btn active" onclick="setSegmentFilter('all', this)">Tous</button>
      <button class="filter-btn" onclick="setSegmentFilter('particulier', this)" style="border-color:#16a34a;color:#16a34a">🏠 Particuliers</button>
      <button class="filter-btn" onclick="setSegmentFilter('gestionnaire', this)" style="border-color:#2563eb;color:#2563eb">🏢 Gestionnaires</button>
      <button class="filter-btn" onclick="setSegmentFilter('agence', this)" style="border-color:#9333ea;color:#9333ea">🏗️ Agences</button>
    </div>
  </div>

  <div class="progress-text"><span id="progress-label">0</span> / ${contacts.length} contactés</div>
  <div class="progress-bar"><div class="progress-fill" id="progress-fill" style="width: 0%"></div></div>

  <table>
    <thead>
      <tr>
        <th>#</th>
        <th>Téléphone</th>
        <th>Biens</th>
        <th>Annonces</th>
        <th>Action</th>
        <th>Statut</th>
      </tr>
    </thead>
    <tbody id="contacts-body">
      ${rows}
    </tbody>
  </table>

  <script>
    // Persist status in localStorage
    const STORAGE_KEY = "mf_outreach_status";

    function loadStatuses() {
      try {
        return JSON.parse(localStorage.getItem(STORAGE_KEY) || "{}");
      } catch { return {}; }
    }

    function saveStatuses(data) {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(data));
    }

    function markSent(index) {
      const row = document.getElementById("row-" + index);
      const select = row.querySelector("select");
      if (select.value === "pending") {
        select.value = "sent";
        updateStatus(index, "sent");
      }
    }

    function updateStatus(index, value) {
      const row = document.getElementById("row-" + index);
      row.setAttribute("data-status", value);
      const statuses = loadStatuses();
      statuses[index] = value;
      saveStatuses(statuses);
      updateStats();
    }

    function updateStats() {
      const rows = document.querySelectorAll("tbody tr");
      let sent = 0, replied = 0, pending = 0;
      rows.forEach(r => {
        const s = r.getAttribute("data-status");
        if (s === "sent") sent++;
        else if (s === "replied") replied++;
        else if (s === "pending") pending++;
      });
      document.getElementById("stat-sent").textContent = sent;
      document.getElementById("stat-replied").textContent = replied;
      document.getElementById("stat-pending").textContent = pending;
      const total = ${contacts.length};
      const contacted = sent + replied;
      document.getElementById("progress-label").textContent = contacted;
      document.getElementById("progress-fill").style.width = ((contacted / total) * 100) + "%";
    }

    let currentFilter = "all";
    let currentSegment = "all";

    function setFilter(filter, btn) {
      currentFilter = filter;
      // Only reset active on status-filter buttons (those without segment-specific onclick)
      document.querySelectorAll(".filters > .filter-btn").forEach(b => b.classList.remove("active"));
      btn.classList.add("active");
      filterTable();
    }

    function setSegmentFilter(segment, btn) {
      currentSegment = segment;
      document.querySelectorAll(".filters-row2 .filter-btn").forEach(b => b.classList.remove("active"));
      btn.classList.add("active");
      filterTable();
    }

    function filterTable() {
      const query = document.getElementById("search").value.toLowerCase();
      const rows = document.querySelectorAll("tbody tr");
      rows.forEach(row => {
        const text = row.textContent.toLowerCase();
        const status = row.getAttribute("data-status");
        const segment = row.getAttribute("data-segment");
        const matchSearch = !query || text.includes(query);
        const matchFilter = currentFilter === "all" || status === currentFilter;
        const matchSegment = currentSegment === "all" || segment === currentSegment;
        row.style.display = matchSearch && matchFilter && matchSegment ? "" : "none";
      });
    }

    // Restore saved statuses on load
    (function restore() {
      const statuses = loadStatuses();
      for (const [index, value] of Object.entries(statuses)) {
        const row = document.getElementById("row-" + index);
        if (row) {
          row.setAttribute("data-status", value);
          row.querySelector("select").value = value;
        }
      }
      updateStats();
    })();
  </script>

</body>
</html>`;
}

// ── Écrire le fichier HTML ──
mkdirSync(OUTPUT_DIR, { recursive: true });
writeFileSync(OUTPUT_PATH, buildHTML(), "utf-8");

console.log(`✅ Page HTML générée : ${OUTPUT_PATH}`);
console.log(`\n👉 Ouvre ce fichier dans ton navigateur pour commencer l'outreach !\n`);
