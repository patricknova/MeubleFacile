# Règles du projet — MeubléFacile

> Ces règles s'appliquent à **chaque prompt** et **chaque modification** de code dans ce projet.
> Sources : `context/02-TRD.md`, `03-App-Flow.md`, `04-UI-UX-Design.md`, `05-Backend-Schemas.md`, `06-Plan-Implementation.md`, `07-Plan-0-FCFA.md`, `08-SEO.md`.

---

## 0. Contexte et Vision du Projet

**MeubléFacile** est une plateforme web spécialisée dans la recherche et la location de logements meublés à Douala (Cameroun), inspirée des standards d'ergonomie et de conversion de Booking.com.

- **Phase actuelle** : MVP à 0 FCFA (développeur solo, budget 0 FCFA)
- **Stack technique** :
  - **Framework** : Next.js 15+ (App Router)
  - **Langage** : TypeScript (mode strict, typage rigoureux)
  - **Design & Styles** : Tailwind CSS v4 (palette de design system Booking.com-like)
  - **Backend & Auth** : Supabase (PostgreSQL, Row-Level Security, Supabase Auth, Storage)
  - **Cartographie** : OpenStreetMap / Leaflet (chargement dynamique côté client sans SSR)
- **Monnaie obligatoire** : XAF (FCFA), toujours représentée sous forme d'entiers (`formatXAF(amount)` -> `25 000 FCFA`). Jamais de centimes ni de flottants.
- **Langue principale** : Français (`fr-CM` / `fr-FR`).
- **Cible prioritaire** : Mobile-first (smartphones Android d'entrée/milieu de gamme, connectivité 3G/4G camerounaise).

---

## 1. Principes d'Architecture et Conventions de Code

### A. Structure des Répertoires
```
/app
  /(public)
    page.tsx                                          → Accueil
    /[city]/page.tsx                                  → Page ville
    /[city]/[neighborhood]/page.tsx                   → Page quartier
    /[city]/[neighborhood]/[type]/page.tsx            → Page quartier + type
    /[city]/[neighborhood]/[type]/[slug]/page.tsx     → Fiche détaillée logement
    /a-propos, /conditions, /confidentialite, /contact
  /(account)
    /deposer/page.tsx & /deposer/[id]/page.tsx        → Dépose d'annonce multi-étapes
    /mes-annonces/page.tsx                            → Gestion des annonces du bailleur
    /favoris/page.tsx                                 → Favoris de l'utilisateur
    /profil/page.tsx                                  → Profil utilisateur / bailleur
  /admin
    /moderation/page.tsx                              → Modération des annonces
    /signalements/page.tsx                            → Signalements des logements
    /utilisateurs/page.tsx                            → Administration utilisateurs
  /auth
    /connexion/..., /callback/route.ts, /deconnexion/route.ts
  sitemap.ts, robots.ts
/components
  /layout (Header, Footer, HeaderClient...)
  /ui (Button, Badge, Modal, Input...)
  (ListingCard, SearchBar, Gallery, AmenityList, MapViewClient...)
/lib
  /supabase (client.ts, server.ts)
  /actions (server actions Next.js)
  types.ts, slug.ts, format.ts, seo.ts
/supabase
  /migrations, schema.sql, seed.sql
```

### B. Règles Techniques Next.js & React
1. **Server Components par défaut** : Tout composant qui n'a pas besoin d'état (`useState`, `useEffect`) ou d'écouteurs d'événements DOM doit rester un Server Component.
2. **"use client" uniquement aux frontières** : L'isoler aux composants interactifs (boutons favoris, galeries, menus déroulants, formulaires interactifs).
3. **Typage strict** : Pas de `any` toléré. Toujours utiliser les types définis dans `@/lib/types.ts`.
4. **Supabase Client vs Server** :
   - Côté serveur : `import { createClient } from "@/lib/supabase/server"`
   - Côté client : `import { createClient } from "@/lib/supabase/client"`
5. **Gestion du cache et ISR** :
   - Fiches logements et pages catalogue : revalidation ISR ou fetch dynamique selon les besoins.
   - Toujours mettre à jour les metadata dynamiques (`generateMetadata`) pour un SEO optimal.

---

## 2. Normes UI/UX (Directives Booking.com)

1. **Hiérarchie visuelle claire** :
   - Prix mis en évidence (`text-xl font-bold text-gray-900` ou couleur d'accent).
   - Badge "Vérifié" pour rassurer les locataires contre les arnaques.
   - Informations clés visibles au premier coup d'œil : quartier, ville, chambres, surface, équipements majeurs (Wi-Fi, groupe électrogène, réserve d'eau, climatisation).
2. **Boutons d'action WhatsApp** :
   - Intégration WhatsApp directe avec message pré-rempli contenant le titre, le lien et la référence de l'annonce.
3. **Performance mobile** :
   - Optimisation des images (`next/image`), formats légers (WebP / AVIF).
   - Pas de bundles JavaScript lourds.

---

## 3. Règle Essentielle de Progression (`progression.md`)

- **Obligation permanente** : Le fichier `progression.md` à la racine du projet **DOIT** être mis à jour à chaque fois qu'une fonctionnalité est ajoutée, corrigée ou modifiée.
- Il sert de tableau de bord d'avancement pour le développeur et le modèle.
