// ============================================================
// Scraper Playwright Google Maps — Appartements Meublés Douala
// MeubléFacile (https://meublefacile.cm)
// ============================================================
// Extrait :
// - Nom, Catégorie, Note globale, Nombre d'avis
// - Coordonnées GPS (Lat, Lng) & Plus Code
// - Adresse exacte & Quartier normalisé
// - Téléphone formaté (+237 6xx xx xx xx) & Site Web
// - Galerie complète de photos en Haute Définition (Google CDN =s1600)
// - Avis clients exhaustifs (Auteur, Note, Date, Texte complet, Réponse)
// ============================================================

import { chromium } from "playwright";
import fs from "fs";
import path from "path";

// Configuration et arguments CLI
const args = process.argv.slice(2);
const isHeadless = !args.includes("--headful");
const maxPhotosPerPlace = parseInt(args.find((a) => a.startsWith("--max-photos="))?.split("=")[1] || "30", 10);
const maxReviewsPerPlace = parseInt(args.find((a) => a.startsWith("--max-reviews="))?.split("=")[1] || "50", 10);
const maxPlacesPerQuery = parseInt(args.find((a) => a.startsWith("--max-per-query="))?.split("=")[1] || "25", 10);

const targetNeighborhoodArg = args.find((a) => a.startsWith("--neighborhood="))?.split("=")[1];

// Dossier de sortie
const OUTPUT_DIR = path.resolve(process.cwd(), "scraped_data");
if (!fs.existsSync(OUTPUT_DIR)) {
  fs.mkdirSync(OUTPUT_DIR, { recursive: true });
}
const JSON_OUTPUT = path.join(OUTPUT_DIR, "meubles_douala.json");
const CSV_OUTPUT = path.join(OUTPUT_DIR, "meubles_douala.csv");

// Quartiers cibles à Douala avec coordonnées centrales
const ALL_NEIGHBORHOODS = [
  { name: "Bonapriso", center: "@4.0150,9.6880,15z" },
  { name: "Akwa", center: "@4.0510,9.6970,15z" },
  { name: "Bonamoussadi", center: "@4.0950,9.7350,15z" },
  { name: "Makepe", center: "@4.0820,9.7420,15z" },
  { name: "Denver", center: "@4.0880,9.7490,15z" },
  { name: "Kotto", center: "@4.0780,9.7610,15z" },
  { name: "Bonanjo", center: "@4.0430,9.6870,15z" },
  { name: "Bali", center: "@4.0320,9.6910,15z" },
  { name: "Deido", center: "@4.0620,9.7120,15z" },
  { name: "Logpom", center: "@4.0720,9.7710,15z" },
  { name: "Santa Barbara", center: "@4.0910,9.7280,15z" },
  { name: "Yassa", center: "@3.9850,9.7820,15z" },
  { name: "Ndogbong", center: "@4.0530,9.7450,15z" },
  { name: "Bépanda", center: "@4.0650,9.7310,15z" }
];

const NEIGHBORHOODS = targetNeighborhoodArg
  ? ALL_NEIGHBORHOODS.filter((n) => n.name.toLowerCase() === targetNeighborhoodArg.toLowerCase())
  : ALL_NEIGHBORHOODS;

const KEYWORD_TEMPLATES = [
  "appartement meublé {neighborhood} Douala",
  "résidence meublée {neighborhood} Douala",
  "studio meublé {neighborhood} Douala"
];

// Utilitaires de nettoyage du texte (suppression des icônes Unicode privées de Google)
function cleanText(text) {
  if (!text) return "";
  return text
    .replace(/[\uE000-\uF8FF]/g, "") // Supprime les glyphs privés (icônes d'adresse, de téléphone...)
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

// Conversion des URLs d'images Google CDN vers la Haute Définition originale
function toHighResPhotoUrl(rawUrl) {
  if (!rawUrl) return null;
  // Les URLs Google CDN utilisent des motifs comme =w...-h...-k-no ou =s...
  return rawUrl.replace(/=(?:w\d+-h\d+|s\d+)(?:-k-no)?/g, "=s1600");
}

// Extraction des coordonnées GPS à partir de l'URL Google Maps
function extractCoordsFromUrl(url) {
  if (!url) return { lat: null, lng: null };
  const atMatch = url.match(/@(-?\d+\.\d+),(-?\d+\.\d+)/);
  if (atMatch) {
    return { lat: parseFloat(atMatch[1]), lng: parseFloat(atMatch[2]) };
  }
  const dataMatch = url.match(/!3d(-?\d+\.\d+)!4d(-?\d+\.\d+)/);
  if (dataMatch) {
    return { lat: parseFloat(dataMatch[1]), lng: parseFloat(dataMatch[2]) };
  }
  return { lat: null, lng: null };
}

// Chargement des données déjà existantes pour reprise automatique et déduplication
let existingData = [];
if (fs.existsSync(JSON_OUTPUT)) {
  try {
    existingData = JSON.parse(fs.readFileSync(JSON_OUTPUT, "utf-8"));
  } catch {
    existingData = [];
  }
}
const seenUrls = new Set(existingData.map((item) => item.googleMapsUrl).filter(Boolean));
const seenNames = new Set(existingData.map((item) => (item.name || "").toLowerCase().trim()).filter(Boolean));

function saveProgress() {
  fs.writeFileSync(JSON_OUTPUT, JSON.stringify(existingData, null, 2), "utf-8");
  exportCsv();
}

function exportCsv() {
  if (existingData.length === 0) return;
  const headers = [
    "Nom",
    "Quartier",
    "Note",
    "Nombre_Avis",
    "Telephone",
    "Adresse",
    "Latitude",
    "Longitude",
    "Site_Web",
    "Nombre_Photos",
    "Google_Maps_URL"
  ];

  const escapeCsv = (str) => {
    if (str === null || str === undefined) return '""';
    const s = String(str).replace(/"/g, '""').replace(/\r?\n/g, " ");
    return `"${s}"`;
  };

  const rows = existingData.map((item) => [
    escapeCsv(item.name),
    escapeCsv(item.neighborhood),
    escapeCsv(item.rating),
    escapeCsv(item.reviewsCount),
    escapeCsv(item.phone),
    escapeCsv(item.address),
    escapeCsv(item.lat),
    escapeCsv(item.lng),
    escapeCsv(item.website),
    escapeCsv((item.photos || []).length),
    escapeCsv(item.googleMapsUrl)
  ]);

  const csvContent = [headers.join(","), ...rows.map((r) => r.join(","))].join("\n");
  fs.writeFileSync(CSV_OUTPUT, "\uFEFF" + csvContent, "utf-8"); // BOM UTF-8 pour Excel
}

// Gestion des cookies / popups de consentement Google
async function handleConsent(page) {
  try {
    const consentButtons = [
      "button:has-text('Tout accepter')",
      "button:has-text('J\\'accepte')",
      "button:has-text('Accept all')",
      "button[aria-label*='Tout accepter']",
      "button[aria-label*='Accept all']",
      "form:has-text('Tout accepter') button"
    ];

    for (const selector of consentButtons) {
      const btn = page.locator(selector).first();
      if (await btn.isVisible({ timeout: 1500 }).catch(() => false)) {
        await btn.click();
        await page.waitForTimeout(1000);
        break;
      }
    }
  } catch {
    // Aucune popup
  }
}

// Scraping détaillé d'une fiche Google Maps
async function scrapePlaceDetails(page, placeUrl, defaultNeighborhood) {
  await page.goto(placeUrl, { waitUntil: "domcontentloaded", timeout: 35000 });
  await handleConsent(page);
  await page.waitForTimeout(1500);

  // Nom du lieu
  let name = "";
  try {
    const titleEl = page.locator("h1.DUwDvf").first();
    name = cleanText(await titleEl.textContent({ timeout: 3000 })) || "";
  } catch {
    name = (await page.title())?.replace(" - Google Maps", "").trim() || "";
  }

  // Coordonnées GPS
  const currentUrl = page.url();
  const coords = extractCoordsFromUrl(currentUrl);

  // Note globale et nombre d'avis
  let rating = null;
  let reviewsCount = 0;
  try {
    const ratingEl = page.locator("div.F7nice span[aria-hidden='true']").first();
    if (await ratingEl.isVisible().catch(() => false)) {
      const text = await ratingEl.textContent();
      rating = parseFloat(text?.replace(",", ".") || "0");
    }

    const countEl = page.locator("div.F7nice span:has-text('(')").first();
    if (await countEl.isVisible().catch(() => false)) {
      const text = await countEl.textContent();
      const numMatch = text?.match(/[\d\s]+/);
      if (numMatch) {
        reviewsCount = parseInt(numMatch[0].replace(/\s/g, ""), 10);
      }
    }
  } catch {}

  // Catégorie
  let category = "";
  try {
    const catEl = page.locator("button.DkEaL").first();
    if (await catEl.isVisible().catch(() => false)) {
      category = cleanText(await catEl.textContent()) || "";
    }
  } catch {}

  // Adresse
  let address = "";
  try {
    const addrBtn = page.locator("button[data-item-id='address']").first();
    if (await addrBtn.isVisible().catch(() => false)) {
      address = cleanText(await addrBtn.innerText());
    }
  } catch {}

  // Téléphone
  let phone = "";
  try {
    const phoneBtn = page.locator("button[data-item-id*='phone:']").first();
    if (await phoneBtn.isVisible().catch(() => false)) {
      phone = cleanPhone(await phoneBtn.innerText());
    }
  } catch {}

  // Site web
  let website = "";
  try {
    const webBtn = page.locator("a[data-item-id='authority']").first();
    if (await webBtn.isVisible().catch(() => false)) {
      website = (await webBtn.getAttribute("href")) || "";
    }
  } catch {}

  // Plus Code
  let plusCode = "";
  try {
    const olocBtn = page.locator("button[data-item-id='oloc']").first();
    if (await olocBtn.isVisible().catch(() => false)) {
      plusCode = cleanText(await olocBtn.innerText());
    }
  } catch {}

  // Détection du quartier dans l'adresse ou à défaut celui de la recherche
  let detectedNeighborhood = defaultNeighborhood;
  for (const n of ALL_NEIGHBORHOODS) {
    if (new RegExp(`\\b${n.name}\\b`, "i").test(address) || new RegExp(`\\b${n.name}\\b`, "i").test(name)) {
      detectedNeighborhood = n.name;
      break;
    }
  }

  // --------------------------------------------------------------------------
  // Galerie Photos Haute Définition
  // --------------------------------------------------------------------------
  const photos = new Set();
  try {
    // 1. Photo principale d'en-tête
    const heroImg = page.locator("button[jsaction*='heroHeaderImage'] img, button[aria-label*='Photo'] img").first();
    if (await heroImg.isVisible().catch(() => false)) {
      const src = await heroImg.getAttribute("src");
      if (src && !src.includes("data:image")) {
        photos.add(toHighResPhotoUrl(src));
      }
    }

    // 2. Ouvrir la galerie de photos
    const heroBtn = page.locator("button[jsaction*='heroHeaderImage'], button[aria-label*='Photo:']").first();
    const photoTab = page.locator("button[role='tab']:has-text('Photos'), button[aria-label*='Photos']").first();

    const triggerPhotos = (await photoTab.isVisible().catch(() => false))
      ? photoTab
      : (await heroBtn.isVisible().catch(() => false))
      ? heroBtn
      : null;

    if (triggerPhotos) {
      await triggerPhotos.click().catch(() => {});
      await page.waitForTimeout(1500);

      // Scroll dans la galerie de photos
      for (let s = 0; s < 4 && photos.size < maxPhotosPerPlace; s++) {
        const foundUrls = await page.$$eval("img[src*='googleusercontent.com'], div[style*='googleusercontent.com']", (elements) => {
          return elements.map((el) => {
            if (el.tagName.toLowerCase() === "img") return el.src;
            const bg = el.style.backgroundImage;
            const m = bg.match(/url\(['"]?(.*?)['"]?\)/);
            return m ? m[1] : null;
          }).filter(Boolean);
        });

        for (const u of foundUrls) {
          if (!u.includes("data:image") && !u.includes("maps/vt/")) {
            photos.add(toHighResPhotoUrl(u));
          }
        }

        await page.mouse.wheel(0, 1500);
        await page.waitForTimeout(600);
      }

      // Retour à la vue principale (Touche Echap ou bouton Retour)
      await page.keyboard.press("Escape").catch(() => {});
      await page.waitForTimeout(800);
    }
  } catch (err) {
    // Poursuite si erreur photo
  }

  // --------------------------------------------------------------------------
  // Avis Clients Exhaustifs
  // --------------------------------------------------------------------------
  const reviews = [];
  try {
    // Clic sur l'onglet Avis ou sur le bouton des avis
    const reviewTab = page.locator("button[role='tab']:has-text('Avis'), button[aria-label*='Avis'], button[aria-label*='avis'], button:has(span:has-text('avis'))").first();

    if (await reviewTab.isVisible().catch(() => false)) {
      await reviewTab.click().catch(() => {});
      await page.waitForTimeout(1500);

      let scrollAttemptsWithoutNew = 0;
      let lastReviewCount = 0;

      while (reviews.length < maxReviewsPerPlace && scrollAttemptsWithoutNew < 3) {
        // Déplier les avis longs "Plus"
        const moreButtons = await page.$$("button.w8nwRe:has-text('Plus'), button[aria-label='Voir plus']");
        for (const btn of moreButtons.slice(0, 8)) {
          try {
            await btn.click({ timeout: 400 });
          } catch {}
        }

        // Extraire les avis visibles
        const reviewCards = await page.$$("div.jftiEf");

        for (const card of reviewCards) {
          try {
            const author = (await card.$eval(".d4r55", (el) => el.innerText).catch(() => ""))?.trim();
            const ratingText = await card.$eval(".kvMYJc", (el) => el.getAttribute("aria-label")).catch(() => "");
            const ratingNum = ratingText.match(/(\d+)/)?.[1] ? parseInt(ratingText.match(/(\d+)/)[1], 10) : null;
            const date = (await card.$eval(".rsqaWe", (el) => el.innerText).catch(() => ""))?.trim();
            const text = (await card.$eval(".wiI7m", (el) => el.innerText).catch(() => ""))?.trim();
            const ownerReply = (await card.$eval(".CDe7pd", (el) => el.innerText).catch(() => ""))?.trim();

            if (author && (text || ratingNum)) {
              const alreadyExists = reviews.some((r) => r.author === author && r.text === text);
              if (!alreadyExists) {
                reviews.push({
                  author,
                  rating: ratingNum,
                  date,
                  text: text || "Note sans commentaire écrit.",
                  ownerReply: ownerReply || null
                });
              }
            }
            if (reviews.length >= maxReviewsPerPlace) break;
          } catch {}
        }

        if (reviews.length === lastReviewCount) {
          scrollAttemptsWithoutNew++;
        } else {
          scrollAttemptsWithoutNew = 0;
          lastReviewCount = reviews.length;
        }

        // Scroll vers le bas dans le conteneur d'avis
        await page.mouse.wheel(0, 2000);
        await page.waitForTimeout(900);
      }
    }
  } catch (err) {
    // Poursuite si erreur avis
  }

  return {
    name,
    category,
    neighborhood: detectedNeighborhood,
    address,
    phone,
    website,
    plusCode,
    lat: coords.lat,
    lng: coords.lng,
    rating,
    reviewsCount: reviewsCount || reviews.length,
    photos: Array.from(photos).filter(Boolean),
    reviews,
    googleMapsUrl: currentUrl,
    scrapedAt: new Date().toISOString()
  };
}

// Point d'entrée principal
async function main() {
  console.log("============================================================");
  console.log("🏢 Scraper Playwright Google Maps — Appartements Meublés Douala");
  console.log(`📂 Destination JSON : ${JSON_OUTPUT}`);
  console.log(`📂 Destination CSV  : ${CSV_OUTPUT}`);
  console.log(`⚙️ Mode : ${isHeadless ? "Headless (Arrière-plan)" : "Visible (--headful)"}`);
  console.log(`🎯 Quartiers cibles : ${NEIGHBORHOODS.map((n) => n.name).join(", ")}`);
  console.log("============================================================\n");

  const browser = await chromium.launch({
    headless: isHeadless,
    args: ["--no-sandbox", "--disable-setuid-sandbox", "--disable-dev-shm-usage", "--lang=fr-FR"]
  });

  const context = await browser.newContext({
    locale: "fr-FR",
    viewport: { width: 1440, height: 900 },
    userAgent:
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36"
  });

  const page = await context.newPage();
  let totalScrapedThisSession = 0;

  for (const neighborhood of NEIGHBORHOODS) {
    console.log(`\n============================================================`);
    console.log(`📍 TRAITEMENT DU QUARTIER : ${neighborhood.name.toUpperCase()}`);
    console.log(`============================================================`);

    for (const kwTemplate of KEYWORD_TEMPLATES) {
      const query = kwTemplate.replace("{neighborhood}", neighborhood.name);
      const searchUrl = `https://www.google.com/maps/search/${encodeURIComponent(query)}/${neighborhood.center}`;

      console.log(`\n🔍 Recherche : "${query}"`);

      try {
        await page.goto(searchUrl, { waitUntil: "domcontentloaded", timeout: 45000 });
        await handleConsent(page);
        await page.waitForTimeout(2500);

        // Fiche unique directe
        if (page.url().includes("/maps/place/")) {
          const directUrl = page.url();
          if (!seenUrls.has(directUrl)) {
            const data = await scrapePlaceDetails(page, directUrl, neighborhood.name);
            if (data.name && !seenNames.has(data.name.toLowerCase())) {
              existingData.push(data);
              seenUrls.add(directUrl);
              seenNames.add(data.name.toLowerCase());
              saveProgress();
              totalScrapedThisSession++;
              console.log(
                `  ✅ [Unique] Ajouté : "${data.name}" (${data.neighborhood}) - 📞 ${data.phone || "N/A"} - 📸 ${data.photos.length} photos - 💬 ${data.reviews.length} avis`
              );
            }
          }
          continue;
        }

        // Liste de résultats (Feed)
        const feedSelector = "div[role='feed']";
        const feedExists = await page.locator(feedSelector).isVisible({ timeout: 5000 }).catch(() => false);

        if (!feedExists) {
          console.log("  ⚠️ Aucun flux de résultats pour cette requête.");
          continue;
        }

        const placeLinks = new Set();
        let scrollAttempts = 0;
        let lastCount = 0;

        while (placeLinks.size < maxPlacesPerQuery && scrollAttempts < 10) {
          const links = await page.$$eval("div[role='feed'] a[href*='/maps/place/']", (els) =>
            els.map((a) => a.href)
          );

          for (const l of links) {
            placeLinks.add(l);
          }

          if (placeLinks.size === lastCount) {
            scrollAttempts++;
          } else {
            scrollAttempts = 0;
            lastCount = placeLinks.size;
          }

          await page.$eval(feedSelector, (el) => el.scrollBy(0, 1500)).catch(() => {});
          await page.waitForTimeout(1000);

          const endOfList = await page.locator("text='Vous êtes arrivé à la fin de la liste'").isVisible().catch(() => false);
          if (endOfList) break;
        }

        console.log(`  🎯 ${placeLinks.size} lieu(x) détecté(s) pour "${query}".`);

        const detailPage = await context.newPage();

        for (const placeUrl of placeLinks) {
          if (seenUrls.has(placeUrl)) continue;

          try {
            console.log(`  👉 Analyse : ${placeUrl.slice(0, 65)}...`);
            const data = await scrapePlaceDetails(detailPage, placeUrl, neighborhood.name);
            if (data.name && !seenNames.has(data.name.toLowerCase().trim())) {
              existingData.push(data);
              seenUrls.add(placeUrl);
              seenNames.add(data.name.toLowerCase().trim());
              saveProgress();
              totalScrapedThisSession++;
              console.log(
                `  ✅ [${existingData.length}] Ajouté : "${data.name}" (${data.neighborhood}) - 📞 ${data.phone || "N/A"} - 📸 ${data.photos.length} photos - 💬 ${data.reviews.length} avis`
              );
            } else {
              seenUrls.add(placeUrl);
            }
          } catch (itemErr) {
            console.warn(`  ⚠️ Échec de traitement : ${itemErr.message}`);
          }

          await detailPage.waitForTimeout(800);
        }

        await detailPage.close().catch(() => {});
      } catch (queryErr) {
        console.error(`  ❌ Erreur recherche "${query}" : ${queryErr.message}`);
      }
    }
  }

  await browser.close();

  console.log("\n============================================================");
  console.log("🎉 SCRAPING TERMINÉ AVEC SUCCÈS !");
  console.log(`📊 Total logements uniques dans le catalogue : ${existingData.length}`);
  console.log(`🆕 Nouveaux logements ajoutés lors de cette session : ${totalScrapedThisSession}`);
  console.log(`📁 Fichier JSON complet : ${JSON_OUTPUT}`);
  console.log(`📁 Fichier CSV pour Excel : ${CSV_OUTPUT}`);
  console.log("============================================================\n");
}

main().catch((err) => {
  console.error("❌ Erreur fatale :", err);
  process.exit(1);
});
