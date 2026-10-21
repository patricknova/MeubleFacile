# TRD — Spécifications techniques de MeubléFacile

Version 2.0 — 13 octobre 2026
Référence : 01-PRD.md, 08-SEO.md

> **Mise à jour v2.0** : la section **1 bis** définit l'architecture réellement utilisée pour le MVP (développeur seul, 0 FCFA : Next.js + Tailwind + Supabase). Les sections 2 à 12 décrivent l'architecture **cible de phase 2** et servent de feuille de route quand les revenus le permettront.

---

## 1. Principes directeurs

1. **Mobile d'abord, réseau faible d'abord** : tout est conçu pour Android bas/milieu de gamme et 3G.
2. **Simplicité opérationnelle** : monolithe modulaire au démarrage, pas de microservices prématurés.
3. **Sécurité des paiements et des données** dès le départ.
4. **Coûts maîtrisés** : services managés, pas d'infrastructure à administrer.
5. **Évolutif** : modules découplés pour extraire des services plus tard.

## 1 bis. Décision v2 — Architecture MVP (développeur seul, budget 0 FCFA)

### Stack MVP

| Couche | Choix MVP | Remplace (cible phase 2) |
|---|---|---|
| Front + back | **Next.js (App Router)**, TypeScript, Server Components, Route Handlers, Server Actions | Flutter + NestJS |
| Style | **Tailwind CSS** (v4, tokens dans `@theme`) | — |
| Base de données, auth, stockage | **Supabase** (Postgres, Auth, Storage, Row Level Security) | Postgres managé + Redis + S3 |
| Hébergement | **Cloudflare Pages** (adaptateur OpenNext) ou **Vercel** | PaaS / cloud |
| Carte | **Leaflet + OpenStreetMap** | Mapbox / Google Maps |
| Emails | Supabase Auth (SMTP limité) puis Resend (offre gratuite) | Service transactionnel dédié |
| Recherche | Postgres : filtres SQL + full-text + `pg_trgm` | Meilisearch / OpenSearch |
| Images | Compression côté navigateur (WebP, 2 tailles) avant envoi + `next/image` | Pipeline serveur |
| Anti-spam | Cloudflare Turnstile (gratuit) sur inscription et formulaires | WAF, détection avancée |
| Mesure | Search Console, Bing Webmaster, Plausible ou Google Analytics | PostHog |
| Paiement | Aucun (contact WhatsApp) | Agrégateur Mobile Money |

**Attention à l'hébergement** : l'offre gratuite « Hobby » de Vercel est réservée à un usage non commercial. Tant que le site ne génère pas de revenus, c'est acceptable ; avant de monétiser, migrer vers Cloudflare Pages (offre gratuite utilisable commercialement) ou passer à une offre payante. Vérifiez les conditions et les limites de chaque offre avant de vous engager.

### Schéma d'architecture MVP

```
Navigateur (mobile / PC)
      │  HTML rendu côté serveur (SSR / ISR) + JS léger
      ▼
CDN + hébergeur (Cloudflare / Vercel)
      │   Next.js (App Router)
      │   ├─ pages publiques : accueil, villes, quartiers, types, fiches, blog
      │   ├─ pages privées : déposer, mes annonces, favoris, profil
      │   ├─ /admin (rôle admin) : modération
      │   ├─ Server Actions : créer/modifier annonce, soumettre, signaler
      │   └─ sitemap.xml, robots.txt, flux IndexNow
      ▼
Supabase
  ├─ Auth (email lien magique / Google)
  ├─ Postgres (+ RLS)  ← schéma : 05-Backend-Schemas.md §9
  └─ Storage (photos : buckets public + privé)
Services gratuits : Leaflet/OSM, Turnstile, Search Console, Resend
```

### Structure du dépôt

```
/app
  /(public)
    page.tsx                         accueil
    /[city]/page.tsx                 ville
    /[city]/[neighborhood]/page.tsx  quartier
    /[city]/[neighborhood]/[type]/page.tsx   quartier + type
    /[city]/[neighborhood]/[type]/[slug]/page.tsx   fiche
    /blog/...
  /(account)/deposer, /mes-annonces, /favoris, /profil
  /admin/moderation, /admin/signalements
  /api/revalidate, /api/indexnow, /api/reports
  sitemap.ts, robots.ts
/components   (Card, Badge, SearchBar, FilterPanel, Gallery, Map, JsonLd…)
/lib          (supabase client/server, slug, format XAF, seo helpers)
/supabase     (migrations SQL, seed)
```

### Règles de développement
1. Les pages publiques sont des **Server Components** : aucune donnée critique pour le SEO n'est chargée côté client.
2. Les lectures publiques utilisent la clé `anon` + RLS ; la clé `service_role` n'est utilisée que dans du code serveur (Server Actions, Route Handlers admin), jamais exposée au navigateur.
3. Les modifications passent par des **Server Actions** avec validation (Zod) et vérification de l'utilisateur.
4. **ISR** : pages d'annonces et de listes régénérées toutes les heures, plus `revalidatePath` / `revalidateTag` à l'approbation ou à la modification d'une annonce.
5. Un propriétaire ne peut jamais passer lui-même une annonce en `published` (trigger SQL + contrôle serveur).
6. Les secrets restent dans les variables d'environnement de l'hébergeur ; aucun secret dans le dépôt.

### Sécurité minimale du MVP
- RLS activée sur toutes les tables ; tests des politiques (voir 05 §9)
- Téléversements : types MIME limités (JPEG, PNG, WebP), 10 Mo avant compression, EXIF/GPS supprimés par la compression côté navigateur
- Turnstile sur inscription, dépôt d'annonce et signalement ; limitation du nombre d'annonces en attente par utilisateur
- Numéros WhatsApp exposés uniquement sur les annonces publiées ; liens `wa.me` générés côté serveur
- Conditions d'utilisation et politique de confidentialité en ligne avant le premier dépôt

### Chemin de migration vers la cible
1. Le schéma SQL du MVP est un **sous-ensemble** du schéma cible (mêmes noms de tables et colonnes) pour éviter une réécriture.
2. Quand les revenus arrivent : paiement (agrégateur), messagerie interne, avis, puis API dédiée et application mobile.
3. Le front Next.js peut rester ; seul le « backend » (Server Actions) est extrait vers un service si nécessaire.

## 2. Architecture globale (cible phase 2)

```
┌──────────────┐  ┌──────────────┐  ┌──────────────────┐
│ App mobile   │  │ Web (Next.js)│  │ Back-office admin│
│ (Flutter)    │  │ SEO + PWA    │  │ (React/Next.js)  │
└──────┬───────┘  └──────┬───────┘  └────────┬─────────┘
       └─────────────┬───┴───────────────────┘
                     ▼
          ┌─────────────────────┐
          │  CDN + WAF (Cloudflare)│
          └──────────┬──────────┘
                     ▼
          ┌─────────────────────┐
          │ API REST (NestJS)   │  monolithe modulaire
          │ Auth│Listings│Search │
          │ Booking│Payments│... │
          └───┬─────┬─────┬─────┘
              │     │     │
     ┌────────▼┐ ┌──▼───┐ ┌▼──────────────┐
     │PostgreSQL│ │Redis │ │ Object storage│
     │+ PostGIS │ │cache/│ │ (S3 compatible)│
     │          │ │queue │ │ images/vidéos  │
     └──────────┘ └──┬───┘ └───────────────┘
                     ▼
            ┌─────────────────┐
            │ Workers (BullMQ)│  images, notifications,
            │                 │  paiements, tâches planifiées
            └─────────────────┘
   Services externes : Agrégateur paiement (MoMo/OM/carte), SMS/OTP,
   WhatsApp Business API, FCM (push), email, Google Maps/Mapbox, Sentry
```

## 3. Stack technologique cible (phase 2)

| Couche | Choix | Justification |
|---|---|---|
| App mobile | **Flutter** (Android prioritaire, iOS ensuite) | Une base de code, bonnes performances, bon rendu sur appareils modestes |
| Web public | **Next.js** (SSR) | SEO des annonces, partage de liens, PWA |
| Back-office | React + bibliothèque de composants (ex. Refine/MUI) | Rapidité de développement |
| API | **Node.js + NestJS (TypeScript)** | Structure modulaire, typage, large écosystème |
| Base de données | **PostgreSQL 16 + PostGIS** | Relationnel, recherche géographique, contraintes d'exclusion pour les réservations |
| Cache / files | **Redis** (cache, sessions, limitation de débit, BullMQ) | |
| Recherche | PostgreSQL full-text + trigrammes au départ ; **Meilisearch/OpenSearch** si volume > 50 000 annonces | Évite la complexité initiale |
| Stockage médias | S3 compatible + CDN, transformation d'images (WebP/AVIF, miniatures) | Réduction de la bande passante |
| Auth | OTP téléphone + JWT courts + refresh tokens | Adapté au contexte local |
| Paiements | Agrégateur local supportant MTN MoMo, Orange Money, cartes (à sélectionner) | |
| Notifications | FCM (push), SMS, WhatsApp Business API, email transactionnel | |
| Cartes | Mapbox ou Google Maps + géocodage | À arbitrer selon coût |
| CI/CD | GitHub Actions | |
| Conteneurs | Docker ; déploiement sur PaaS (Render/Fly.io) ou cloud (AWS/GCP/OVH) | |
| Observabilité | Sentry, Prometheus/Grafana ou équivalent managé, logs centralisés | |
| Analytique | PostHog ou Firebase Analytics | |

Alternative si l'équipe est surtout web : React Native à la place de Flutter. Le choix doit suivre les compétences disponibles.

## 4. Modules backend

| Module | Responsabilités |
|---|---|
| auth | OTP, sessions, rôles, appareils |
| users | Profils, vérification d'identité |
| organizations | Agences, membres, droits |
| listings | CRUD annonces, brouillons, statuts, équipements, médias |
| availability | Calendrier, blocages, règles de séjour |
| search | Requêtes, filtres, carte, alertes |
| bookings | Demandes, acceptations, états, annulations |
| payments | Intentions de paiement, webhooks, séquestre, remboursements, retraits |
| messaging | Conversations, pièces jointes, modération |
| reviews | Avis et notes |
| notifications | Modèles, canaux, préférences |
| moderation | Files, règles automatiques, signalements, litiges |
| admin | Outils de back-office |
| reporting | Statistiques, exports |

## 5. Exigences techniques détaillées

### 5.1 Performance
- Réponse API p95 < 400 ms (hors médias)
- Recherche p95 < 800 ms
- Images : formats WebP, 3 tailles (miniature 320 px, carte 720 px, détail 1280 px) ; chargement différé ; placeholders flous
- Pagination par curseur, 20 résultats par page
- Cache Redis des recherches fréquentes (TTL 60 s) et des référentiels
- App : tailles cibles < 25 Mo, démarrage à froid < 3 s sur appareil d'entrée de gamme

### 5.2 Disponibilité et résilience
- Cible 99,5 % ; sauvegardes PostgreSQL quotidiennes + point-in-time recovery (7 à 14 jours)
- Webhooks de paiement : idempotence, rejouabilité, file de reprise
- Dégradation gracieuse : si le paiement est indisponible, la demande de réservation reste possible
- Tâches idempotentes avec reprises exponentielles

### 5.3 Intégrité des réservations
- Contrainte d'exclusion PostgreSQL sur `(listing_id, période)` pour empêcher la double réservation
- Verrou court lors de la création d'une réservation en attente de paiement (expiration 15 minutes)
- Machine à états stricte (voir section 7)

### 5.4 Sécurité
- TLS 1.2+ partout, HSTS ; WAF et limitation de débit (par IP, par numéro, par compte)
- OTP : 6 chiffres, expiration 5 min, 5 tentatives max, plafond d'envois par numéro/jour (anti-abus de SMS)
- Mots de passe (si utilisés) : Argon2id
- JWT d'accès 15 min, refresh 30 jours avec rotation et révocation par appareil
- Autorisation par rôle et par ressource (RBAC + contrôle de propriété)
- Données d'identité (CNI) : stockées chiffrées (chiffrement au repos AES-256, accès restreint et journalisé), URL signées à durée limitée
- Aucune donnée de carte stockée : tokenisation par l'agrégateur (hors périmètre PCI complet)
- Validation stricte des entrées, protection contre injection, XSS, CSRF, SSRF ; analyse des fichiers téléversés (type MIME réel, taille, suppression EXIF/GPS)
- Journal d'audit des actions sensibles (admin, paiements, changements de rôle)
- Secrets dans un gestionnaire dédié, rotation périodique
- Tests de sécurité avant lancement (revue de code, scan de dépendances, test d'intrusion)

### 5.5 Protection des données personnelles
- Minimisation et consentement explicite (CGU, politique de confidentialité)
- Droit d'accès, rectification, suppression ; procédure de suppression de compte
- Conservation limitée : pièces d'identité supprimées ou archivées selon durée légale à valider avec un conseil juridique
- Hébergement : privilégier une région proche (Europe/Afrique) ; vérifier les obligations camerounaises applicables

### 5.6 Médias
- Téléversement direct vers le stockage via URL pré-signées
- Traitement asynchrone (redimensionnement, détection de contenu inapproprié, hash de similarité pour doublons)
- Limites : photo 10 Mo max avant compression ; vidéo 60 s / 50 Mo max
- Reprise de téléversement en cas de coupure réseau

### 5.7 Recherche géographique
- Coordonnées en PostGIS (point), index GiST
- Recherche par rayon, par quartier (polygones de quartiers), tri par distance
- Les coordonnées exactes ne sont publiques qu'à ±200 m tant que la réservation n'est pas confirmée (protection du propriétaire et du locataire)

### 5.8 Paiements
- Flux : intention de paiement → push USSD/lien Mobile Money → webhook → confirmation → séquestre
- Livre de comptes interne en partie double (voir schémas)
- Réconciliation quotidienne avec les relevés de l'agrégateur
- Remboursements partiels et totaux selon politique d'annulation
- Retraits propriétaires vers Mobile Money, avec seuils et vérifications anti-fraude
- Toutes les montants en entiers (XAF, pas de flottants)

### 5.9 Notifications
- File d'attente avec priorités ; modèles localisés (FR/EN)
- Bascule de canal : push → WhatsApp → SMS selon préférence et échec
- Limitation de fréquence et désabonnement pour les messages non essentiels

### 5.10 Internationalisation
- i18n dès le départ (fichiers de traduction), FR par défaut, EN
- Formats : montants en FCFA, dates JJ/MM/AAAA, fuseau Africa/Douala

## 6. Environnements et déploiement

| Environnement | Usage |
|---|---|
| local | Docker Compose (API, Postgres, Redis, stockage émulé) |
| staging | Réplique de production, données anonymisées, paiements en bac à sable |
| production | Haute disponibilité simple (2 instances API, base managée avec réplique) |

- Déploiement continu depuis `main` vers staging ; production après validation manuelle
- Migrations de base versionnées (ex. Prisma/Knex/TypeORM) et réversibles
- Feature flags pour les déploiements progressifs
- Mises à jour mobiles : versions minimales supportées, écran de mise à jour forcée

## 7. Machines à états

**Annonce** : `draft → pending_review → published ⇄ paused → archived` ; `pending_review → rejected → draft`

**Réservation** : `requested → accepted → awaiting_payment → paid (escrow) → checked_in → completed` ; sorties : `declined`, `expired`, `cancelled_by_guest`, `cancelled_by_host`, `disputed → resolved`

**Paiement** : `initiated → pending → succeeded | failed | expired` ; `succeeded → held → released | refunded (partiel/total)`

## 8. Qualité et tests

- Tests unitaires (> 70 % sur les modules paiement et réservation), tests d'intégration API, tests de bout en bout sur les parcours critiques (publier, rechercher, réserver, payer)
- Tests de charge avant lancement (cible : 500 utilisateurs simultanés)
- Tests sur appareils Android réels d'entrée de gamme et réseau bridé
- Revue de code obligatoire, linting, analyse statique, scan de dépendances

## 9. Supervision et exploitation

- Alertes : erreurs API, latence, échecs de paiement/webhook, files bloquées, espace disque
- Tableaux de bord métier : inscriptions, annonces publiées, réservations, paiements
- Procédure d'incident, astreinte légère, journal de post-mortem
- Sauvegardes testées chaque trimestre

## 10. Estimation d'infrastructure (ordre de grandeur, phase de lancement)

| Poste | Estimation mensuelle |
|---|---|
| Hébergement API + workers | 40–120 USD |
| PostgreSQL managé | 30–100 USD |
| Redis managé | 10–30 USD |
| Stockage + CDN | 20–80 USD (croît avec les médias) |
| SMS/WhatsApp | variable (au volume d'OTP et messages) |
| Cartes | variable |
| Outils (Sentry, analytique) | 0–60 USD |

Chiffres indicatifs à confirmer par devis réels.

## 11. Dette technique acceptée en V1

- Pas de microservices ; moteur de recherche dédié repoussé
- Contrats générés à partir de modèles simples
- Modération assistée par règles et revue humaine plutôt que par modèles ML complexes

## 12. Décisions à valider

| Décision | Options | Recommandation |
|---|---|---|
| Framework mobile | Flutter / React Native | Flutter, sauf si l'équipe est surtout React |
| Hébergement | PaaS / cloud public | PaaS pour démarrer |
| Agrégateur de paiement | À comparer | Choisir selon couverture MoMo + OM, frais, séquestre, support |
| Fournisseur SMS | Local / international | Tester délivrabilité sur MTN et Orange |
| Cartographie | Mapbox / Google | Comparer coûts et qualité à Douala |
