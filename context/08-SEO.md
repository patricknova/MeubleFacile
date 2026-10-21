# Guide SEO — MeubléFacile (Next.js + Supabase)

Version 1.0 — 13 octobre 2026
Références : 01-PRD.md (§5.9), 02-TRD.md (§1 bis), 04-UI-UX-Design.md (§12.5), 05-Backend-Schemas.md (§9)

Objectif : que chaque annonce et chaque page de quartier soit **indexée rapidement, comprise par Google et mise à jour**, sans budget publicitaire.

---

## 1. Principes

1. Google doit recevoir du **HTML complet** : rendu serveur (SSR/ISR), jamais une page vide remplie par JavaScript.
2. **Une page = une intention de recherche** (ex. « studio meublé Bonamoussadi »).
3. **Pas de pages vides ni dupliquées** : mieux vaut 50 bonnes pages que 5 000 faibles.
4. **Fraîcheur réelle** : on ne signale une mise à jour que si le contenu change vraiment.
5. **Rapidité sur mobile** : la plupart des visiteurs sont sur téléphone et réseau variable.
6. Le SEO prend **3 à 6 mois** : on le met en place dès la semaine 1, avant les annonces.

## 2. Architecture des URL

```
/                                              accueil
/douala                                        ville
/douala/bonamoussadi                           quartier
/douala/bonamoussadi/studio-meuble             quartier + type
/douala/bonamoussadi/studio-meuble/studio-clim-pres-total-8f3k   fiche
/blog/prix-loyer-meuble-douala                 guide
```

Règles :
- Minuscules, sans accents, tirets, pas de paramètres pour les pages principales.
- Le **slug de la fiche contient un identifiant court** (`-8f3k`) : l'URL reste unique et stable même si le titre change.
- Si la ville ou le quartier dans l'URL ne correspond pas à l'annonce, **redirection 301** vers l'URL canonique.
- Slugs de types : `studio-meuble`, `appartement-meuble`, `chambre-meublee`, `duplex-meuble`.
- Les filtres et le tri utilisent des paramètres (`?prix_max=…&clim=1`) : ces pages portent `rel=canonical` vers la page sans paramètres et `noindex`.
- Pagination : `?page=2` indexable, avec canonical propre à chaque page.

## 3. Pages à créer et seuil d'indexation

| Page | Contenu unique | Indexée si |
|---|---|---|
| Ville | Introduction, quartiers, fourchettes de prix | toujours |
| Quartier | Texte de 150 à 300 mots (accès, ambiance, prix, sécurité) + liste | ≥ 3 annonces publiées |
| Quartier + type | Titre et texte propres + liste | ≥ 3 annonces publiées |
| Fiche | Description rédigée par le propriétaire, équipements, règles | statut `published` (ou `rented` tant que conservée) |
| Blog / guide | Article de 600+ mots | toujours |

En dessous du seuil, la page reste accessible mais envoie `noindex, follow`.

## 4. Métadonnées (Next.js App Router)

```ts
// app/[city]/[neighborhood]/[type]/[slug]/page.tsx
import type { Metadata } from 'next';

export const revalidate = 3600; // ISR : régénérée au plus toutes les heures

export async function generateMetadata(
  { params }: { params: Promise<{ city: string; neighborhood: string; type: string; slug: string }> }
): Promise<Metadata> {
  const { slug } = await params;
  const l = await getListingBySlug(slug);
  if (!l) return { title: 'Annonce introuvable', robots: { index: false, follow: false } };

  const url = `${SITE}/${l.city.slug}/${l.neighborhood.slug}/${typeSlug(l.type)}/${l.slug}`;
  const title = `${l.title} à ${l.neighborhood.name}, ${l.city.name} – ${formatXAF(l.price_night ?? l.price_month)}`;
  const description = buildDescription(l); // ~150 caractères, issus des données réelles
  const image = l.media[0]?.publicUrlFull;

  return {
    title,
    description,
    alternates: { canonical: url },
    robots: l.status === 'published' ? { index: true, follow: true } : { index: l.status === 'rented', follow: true },
    openGraph: { type: 'website', url, title, description, images: image ? [{ url: image, width: 1280, height: 960 }] : [], locale: 'fr_CM' },
    twitter: { card: 'summary_large_image', title, description, images: image ? [image] : [] },
  };
}
```

Modèles de titres (≈ 60 caractères) et descriptions (≈ 150 caractères) :

| Page | Title | Description |
|---|---|---|
| Quartier + type | `Studios meublés à Bonamoussadi, Douala – dès 25 000 FCFA` | `42 studios meublés à Bonamoussadi : clim, wifi, groupe électrogène. Comparez les prix, voyez les photos, contactez le propriétaire sur WhatsApp.` |
| Fiche | `Studio meublé climatisé à Bonamoussadi – 25 000 FCFA/nuit` | `Studio de 28 m², clim, wifi, eau permanente, près de [repère]. Mis à jour le 13/10/2026. Contactez le propriétaire.` |
| Guide | `Louer un studio meublé à Douala : prix par quartier (2026)` | Résumé de l'article |

Règles :
- Un seul `h1` par page, proche du title mais pas identique.
- `alt` des photos : `salon du studio meublé, Bonamoussadi` (descriptif, sans bourrage de mots-clés).
- Langue `<html lang="fr">`.

## 5. Données structurées (JSON-LD)

Composant réutilisable :

```tsx
export function JsonLd({ data }: { data: Record<string, unknown> }) {
  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: JSON.stringify(data).replace(/</g, '\\u003c') }}
    />
  );
}
```

Fiche logement :

```ts
const jsonLd = {
  '@context': 'https://schema.org',
  '@type': 'Apartment',                       // ou 'Accommodation' / 'House' selon le type
  name: l.title,
  description: l.description,
  url,
  image: l.media.map(m => m.publicUrlFull),
  numberOfRooms: l.bedrooms,
  floorSize: { '@type': 'QuantitativeValue', value: l.surface_m2, unitCode: 'MTK' },
  address: { '@type': 'PostalAddress', addressLocality: l.neighborhood.name, addressRegion: l.city.name, addressCountry: 'CM' },
  geo: { '@type': 'GeoCoordinates', latitude: l.lat, longitude: l.lng },   // position approximative
  amenityFeature: l.amenities.map(a => ({ '@type': 'LocationFeatureSpecification', name: a.label_fr, value: true })),
  offers: {
    '@type': 'Offer',
    price: l.price_night ?? l.price_month,
    priceCurrency: 'XAF',
    availability: l.status === 'published' ? 'https://schema.org/InStock' : 'https://schema.org/SoldOut',
    url,
  },
};
```

Autres balises :
- `BreadcrumbList` sur toutes les pages (Accueil › Douala › Bonamoussadi › Studio meublé)
- `ItemList` sur les pages de liste (les 10 à 20 premières annonces)
- `Organization` + `WebSite` sur l'accueil
- `Article` sur les guides

À éviter : `AggregateRating` ou `Review` tant qu'il n'y a pas de vrais avis ; données qui ne correspondent pas au contenu visible. Testez 3 types de pages avec le **test des résultats enrichis** de Google et le **validateur schema.org**. Les types utiles et leur éligibilité aux résultats enrichis évoluent : vérifiez la documentation Google Search Central avant d'en attendre un affichage particulier.

## 6. Sitemaps et robots

`app/sitemap.ts` (retourne plusieurs sitemaps avec `generateSitemaps` si > 50 000 URL) :

```ts
import type { MetadataRoute } from 'next';

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const listings = await getPublishedListingsForSitemap();   // slug, city, neighborhood, type, updated_content_at
  const hubs = await getIndexableHubs();                     // quartiers et types atteignant le seuil
  return [
    { url: SITE, lastModified: new Date(), changeFrequency: 'daily', priority: 1 },
    ...hubs.map(h => ({ url: `${SITE}${h.path}`, lastModified: h.lastModified, changeFrequency: 'daily' as const, priority: 0.8 })),
    ...listings.map(l => ({
      url: `${SITE}/${l.city}/${l.neighborhood}/${l.typeSlug}/${l.slug}`,
      lastModified: new Date(l.updated_content_at),          // date réelle de modification de contenu
      changeFrequency: 'weekly' as const, priority: 0.6,
    })),
  ];
}
```

`app/robots.ts` :

```ts
import type { MetadataRoute } from 'next';
export default function robots(): MetadataRoute.Robots {
  return {
    rules: [{ userAgent: '*', allow: '/', disallow: ['/admin', '/api', '/deposer', '/mes-annonces', '/favoris', '/profil', '/*?*'] }],
    sitemap: `${SITE}/sitemap.xml`,
  };
}
```

Remarque : bloquer les URL à paramètres dans `robots.txt` empêche aussi Google de voir leur `canonical`. Préférez `noindex` + canonical sur ces pages et n'utilisez `Disallow` que pour l'espace privé et l'API.

Étapes de mise en route :
1. Vérifier le domaine dans **Google Search Console** (et **Bing Webmaster Tools**).
2. Soumettre `sitemap.xml`.
3. Contrôler « Pages » (indexées / exclues) chaque semaine.
4. **IndexNow** (Bing et autres moteurs) : appeler l'endpoint à chaque publication ou retrait d'annonce. Google n'utilise pas IndexNow : il s'appuie sur le sitemap et l'exploration.

## 7. Fraîcheur et cycle de vie des annonces

| Événement | Action SEO |
|---|---|
| Annonce approuvée | `revalidatePath` de la fiche, du quartier et du type ; ajout au sitemap ; appel IndexNow |
| Contenu modifié (titre, description, prix) | `updated_content_at` mis à jour par trigger SQL ; `lastmod` suit ; page régénérée |
| Confirmation de disponibilité (J+25) | Date « Mis à jour le » actualisée uniquement si le propriétaire confirme ou modifie |
| Pas de réponse à J+30 | Statut `paused` : retirée des listes et du sitemap, la page renvoie `noindex` |
| Annonce `rented` | Page conservée avec « Plus disponible » + logements similaires ; `availability` = `SoldOut` |
| `rented` depuis plus de 90 jours | Redirection 301 vers la page quartier + type (ou 410 si le quartier n'existe plus) |
| Annonce supprimée | 410 ou 301 vers le quartier ; retrait du sitemap |

Règles d'or : ne jamais modifier artificiellement `lastmod` ; ne pas laisser des centaines de 404 ; toujours proposer des alternatives sur une page expirée.

## 8. Performance (Core Web Vitals)

Cibles mobiles : **LCP < 2,5 s**, **INP < 200 ms**, **CLS < 0,1**.

- `next/image` avec `sizes` précis ; `priority` uniquement sur la première image de la fiche.
- Photos envoyées en WebP (1280 px et 480 px) ; dimensions déclarées pour éviter les décalages.
- Polices via `next/font`, 1 famille, 2 graisses.
- Leaflet et la galerie plein écran chargés à la demande (`dynamic import`).
- Pas de script tiers lourd ; analytics léger.
- Cache CDN sur les pages ISR et les images publiques.
- Contrôle : Lighthouse mobile (performance ≥ 90, SEO 100), PageSpeed Insights, rapport Core Web Vitals de Search Console (données réelles après quelques semaines).

## 9. Contenu et maillage interne

- **Fil d'Ariane** visible sur toutes les pages.
- Fiche : bloc « Autres logements à [quartier] » et « Logements similaires » (même type, budget proche).
- Page quartier : liens vers les types, quartiers voisins, guides.
- Pied de page : ville, 8 à 10 quartiers principaux, types, guides.
- **Liens `<a href>` réels** pour la pagination et la navigation.
- **Guides à publier au lancement (4 à 6)** :
  1. « Louer un studio meublé à Douala : prix par quartier »
  2. « Que vérifier avant de payer une caution ? »
  3. « Quartiers de Douala : lequel choisir selon votre travail ? »
  4. « Groupe électrogène, eau, internet : les questions à poser avant de louer »
  5. « Louer en toute sécurité : éviter les arnaques »
  6. « Propriétaires : réussir ses photos et son annonce »
- Contenu rédigé à la main (ou assisté puis vérifié sur le terrain) avec des informations réelles ; éviter le texte générique sans valeur.

## 10. Qualité des annonces (contenu unique)

- Description minimale de 150 mots, avec champs guidés : « Décrivez le quartier », « Que voit-on depuis le logement ? », « Pourquoi ce logement ? ».
- Détection simple des doublons : comparer le titre et les 200 premiers caractères avec les annonces existantes ; avertissement au propriétaire.
- Ne pas copier-coller les textes depuis Facebook ou d'autres sites.
- Photos réelles uniquement ; bouton « Signaler » pour les abus.
- Un propriétaire ne peut pas publier la même annonce dans plusieurs quartiers.

## 11. SEO local et autorité

- Cohérence du nom, du logo et de l'adresse du site sur tous les profils (Facebook, WhatsApp Business, LinkedIn).
- **Google Business Profile** : possible seulement si le service dispose d'une adresse ou d'une zone de service réelle ; à vérifier selon les règles de Google.
- **Liens entrants** : sites d'associations et d'organisations proches, annuaires locaux, presse locale, vos autres plateformes, partenaires (agences, démarcheurs), invités de blog. Privilégier la qualité ; éviter l'achat de liens.
- Partages sociaux : l'aperçu Open Graph (photo, titre, prix) fait la différence sur WhatsApp et Facebook.
- Version anglaise (`/en`) et balises `hreflang` : phase 2, après stabilisation du français.

## 12. Suivi et indicateurs

| Indicateur | Outil | Fréquence | Objectif (8 semaines) |
|---|---|---|---|
| Pages indexées / exclues | Search Console | Hebdomadaire | > 90 % des pages utiles indexées |
| Impressions et clics | Search Console | Hebdomadaire | Croissance régulière |
| Requêtes et positions (« studio meublé + quartier ») | Search Console | Mensuelle | Top 20 sur 5 requêtes locales |
| Core Web Vitals | Search Console, PageSpeed | Mensuelle | Pages « bonnes » |
| Clics WhatsApp par page | Analytics (événement) | Hebdomadaire | Taux de contact > 3 % des visites de fiche |
| Annonces confirmées à J+30 | Base de données | Hebdomadaire | > 70 % |

Événements à suivre : clic WhatsApp, favori ajouté, filtre utilisé, dépôt d'annonce commencé / terminé.

## 13. Checklist avant lancement

- [ ] Rendu serveur vérifié : « Afficher le code source » montre le contenu des fiches
- [ ] URL propres, canonical et redirections 301 testés
- [ ] Title, description et Open Graph uniques sur chaque type de page
- [ ] JSON-LD valide sur fiche, liste, accueil, guide
- [ ] `sitemap.xml` et `robots.txt` accessibles ; soumission faite
- [ ] Pages sous le seuil en `noindex`
- [ ] Pages `paused` / `rented` / supprimées gérées (noindex, 301, 410)
- [ ] Fil d'Ariane, maillage interne et logements similaires en place
- [ ] Lighthouse mobile : performance ≥ 90, SEO 100, accessibilité ≥ 95
- [ ] Images compressées avec `alt` descriptifs
- [ ] Search Console et Bing Webmaster configurés ; IndexNow actif
- [ ] Conditions d'utilisation et politique de confidentialité en ligne
- [ ] 4 à 6 guides publiés et 2 ou 3 quartiers avec texte d'introduction

## 14. Calendrier SEO sur les 6 semaines du MVP

| Semaine | Tâches SEO |
|---|---|
| 1 | Next.js SSR, structure d'URL, Search Console, Bing, domaine/adresse |
| 2 | Référentiel villes/quartiers avec slugs et textes d'introduction |
| 3 | Génération des slugs, champs de description guidés, `generateMetadata` |
| 4 | JSON-LD, fil d'Ariane, sitemap, robots, pages liste avec seuil `noindex` |
| 5 | Guides, maillage interne, flux de confirmation J+25 / J+30, IndexNow, Lighthouse, Rich Results Test |
| 6 | Soumission des sitemaps, suivi des premières indexations, corrections |
| Mois 2 à 6 | Nouveaux guides, liens entrants, optimisation des titres selon les requêtes réelles |

## 15. Erreurs fréquentes à éviter

- Application en rendu client uniquement
- Pages de quartier générées sans texte ni annonces
- Filtres indexés à l'infini
- `lastmod` falsifié ou toujours égal à la date du jour
- Annonces périmées qui restent en ligne
- Photos non compressées, fort impact sur le LCP
- Mots-clés répétés artificiellement dans le texte
- Faux avis ou fausses notes dans les données structurées
- Changer les URL après publication sans redirection
