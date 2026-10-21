// ============================================================
// Script d'importation Google Places API — MeubléFacile
// Permet d'extraire des lieux réels, coordonnées et photos de Douala
// ============================================================
import fs from "fs";
import path from "path";

// Lecture de la clé API depuis .env.local
const envPath = path.resolve(process.cwd(), ".env.local");
let apiKey = process.env.GOOGLE_PLACES_API_KEY;

if (!apiKey && fs.existsSync(envPath)) {
  const content = fs.readFileSync(envPath, "utf-8");
  const match = content.match(/GOOGLE_PLACES_API_KEY=(.+)/);
  if (match) apiKey = match[1].trim();
}

if (!apiKey) {
  console.error("❌ ERREUR : GOOGLE_PLACES_API_KEY introuvable dans .env.local");
  process.exit(1);
}

console.log("🔑 Clé Google Places détectée :", apiKey.slice(0, 8) + "..." + apiKey.slice(-4));

const QUARTIERS_DOUALA = [
  { name: "Bonapriso", query: "residence meublee Bonapriso Douala" },
  { name: "Akwa", query: "appartement meuble Akwa Douala" },
  { name: "Bonamoussadi", query: "studio meuble Bonamoussadi Douala" },
  { name: "Makepe", query: "logement meuble Makepe Douala" },
  { name: "Bonanjo", query: "appartement hotel Bonanjo Douala" },
  { name: "Bali", query: "residence meublee Bali Douala" },
  { name: "Kotto", query: "appartement Denver Kotto Douala" },
  { name: "Deido", query: "meuble Deido Douala" },
];

async function searchPlacesNew(query) {
  const url = "https://places.googleapis.com/v1/places:searchText";
  const body = JSON.stringify({
    textQuery: query,
    languageCode: "fr",
    maxResultCount: 5,
  });

  const res = await fetch(url, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "X-Goog-Api-Key": apiKey,
      "X-Goog-FieldMask":
        "places.id,places.displayName,places.formattedAddress,places.location,places.photos,places.rating,places.userRatingCount,places.types",
    },
    body,
  });

  if (!res.ok) {
    const errorText = await res.text();
    throw new Error(`Places API (New) Erreur HTTP ${res.status}: ${errorText}`);
  }

  const data = await res.json();
  return data.places || [];
}

async function run() {
  console.log("🚀 Lancement de la collecte des lieux réels sur Google Maps...");
  const allResults = [];

  for (const q of QUARTIERS_DOUALA) {
    try {
      console.log(`\n🔍 Recherche pour ${q.name} : "${q.query}"...`);
      const places = await searchPlacesNew(q.query);
      console.log(`  ✅ Trouvé : ${places.length} lieu(x)`);
      for (const p of places) {
        allResults.push({
          neighborhood: q.name,
          name: p.displayName?.text || p.name,
          address: p.formattedAddress,
          lat: p.location?.latitude,
          lng: p.location?.longitude,
          rating: p.rating,
          userRatingCount: p.userRatingCount,
          photos: (p.photos || []).slice(0, 3).map((ph) => ({
            name: ph.name,
            author: ph.authorAttributions?.[0]?.displayName,
          })),
        });
      }
    } catch (err) {
      console.warn(`  ⚠️ Échec pour ${q.name} :`, err.message);
    }
  }

  const outputPath = path.resolve(process.cwd(), "google_places_douala.json");
  fs.writeFileSync(outputPath, JSON.stringify(allResults, null, 2), "utf-8");
  console.log(`\n💾 Données exportées avec succès dans : ${outputPath}`);
}

run().catch((e) => {
  console.error("\n❌ Erreur d'exécution :", e.message);
  console.log("\n💡 Note importante :");
  console.log("Si vous recevez 'PERMISSION_DENIED', veuillez activer l'API 'Places API (New)'");
  console.log("sur votre projet Google Cloud Console :");
  console.log("👉 https://console.cloud.google.com/apis/library/places.googleapis.com");
});
