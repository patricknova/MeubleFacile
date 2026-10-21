# UI/UX Design — MeubléFacile

Version 2.0 — 13 octobre 2026
Références : 01-PRD.md, 03-App-Flow.md, 08-SEO.md

> **Mise à jour v2.0** : l'interface est une **application web responsive en Tailwind CSS**, inspirée des *schémas d'usage* de Booking.com (barre de recherche, cartes horizontales, filtres latéraux, barre de réservation collante). On reprend les principes d'ergonomie, **pas** l'identité visuelle de Booking (couleurs, logo, textes, icônes). Les spécifications détaillées sont en **section 12**. Les wireframes mobiles des sections 4 et 5 restent valables pour l'affichage < 640 px.

---

## 1. Principes de design

1. **Confiance avant tout** : photos grandes, informations claires, badges de vérification visibles.
2. **Clarté des prix** : le total est toujours affiché, jamais de frais cachés.
3. **Léger et rapide** : fonctionne sur téléphone d'entrée de gamme et 3G.
4. **Simplicité pour tous** : vocabulaire courant, peu de texte, icônes explicites, utilisable par un propriétaire peu à l'aise avec le numérique.
5. **Local** : quartiers, repères, FCFA, Mobile Money, WhatsApp comme réflexes naturels.

## 2. Identité visuelle (proposition)

### Couleurs
| Rôle | Couleur | Usage |
|---|---|---|
| Primaire | `#0F766E` (vert-bleu profond) | Boutons principaux, éléments actifs |
| Primaire clair | `#CCFBF1` | Fonds d'accentuation, sélections |
| Accent | `#F59E0B` (ambre) | Mises en avant, étoiles, appels à l'action secondaires |
| Succès | `#16A34A` | Vérifié, confirmé |
| Alerte | `#D97706` | En attente |
| Erreur | `#DC2626` | Échec, refus |
| Texte principal | `#111827` | |
| Texte secondaire | `#4B5563` | |
| Bordures | `#E5E7EB` | |
| Fond | `#FFFFFF` / `#F9FAFB` | |

Contrastes conformes AA (4,5:1 minimum pour le texte). Mode sombre en V2.

### Typographie
- Police : **Inter** (ou Poppins pour les titres) ; repli sur police système
- Échelle : Titre 1 : 24/32 · Titre 2 : 20/28 · Titre 3 : 17/24 · Corps : 15/22 · Légende : 13/18
- Taille minimale du corps : 15 px ; respect du réglage de taille de police du système

### Espacements et formes
- Grille de 8 px ; marges d'écran 16 px
- Rayons : cartes 12 px, boutons 10 px, champs 10 px
- Zones tactiles ≥ 48 × 48 px
- Ombres légères uniquement sur les cartes flottantes

### Iconographie et illustrations
- Jeu d'icônes linéaires cohérent (ex. Lucide/Phosphor)
- Icônes d'équipements standardisées (lit, clim, wifi, groupe électrogène, eau, gardien, parking…)
- Illustrations légères pour états vides et onboarding (SVG, pas de gros fichiers)

## 3. Composants du design system

| Composant | Variantes / règles |
|---|---|
| Bouton | Primaire (plein), Secondaire (contour), Texte, Désactivé, Chargement ; pleine largeur sur mobile |
| Champ de saisie | Libellé au-dessus, aide, erreur sous le champ, préfixe +237, clavier adapté |
| Sélecteurs | Puces (équipements), commutateurs, stepper (quantités), curseur de budget |
| Carte annonce | Photo (ratio 4:3, carrousel), prix, quartier, chambres, note, badge « Vérifié », cœur favori |
| Badge | Vérifié, Nouveau, Réservation instantanée, Mis en avant |
| Barre de recherche | Quartier, dates, voyageurs, filtres |
| Calendrier | Sélection de plage, dates bloquées grisées, légende |
| Bandeau d'état | Succès, info, alerte, erreur |
| Feuille modale (bottom sheet) | Filtres, choix de paiement, actions |
| Squelettes de chargement | Pour listes et fiches |
| Barre d'onglets | 5 entrées, icône + libellé |
| Étapes (stepper) | Barre de progression pour la création d'annonce |
| Conversation | Bulles, modèles de réponse rapide, pièces jointes |
| Avis | Étoiles, critères, texte |

## 4. Écrans principaux (wireframes textuels)

### 4.1 Accueil / Explorer
```
┌──────────────────────────────┐
│ MeubléFacile          🔔      │
│ ┌──────────────────────────┐ │
│ │ 🔍 Où ? (ex. Bonamoussadi)│ │
│ │ 📅 Dates   👤 Voyageurs   │ │
│ └──────────────────────────┘ │
│ [Studio] [2 ch.] [Clim] [Wifi]│  ← puces rapides
│ Quartiers populaires          │
│ (Akwa)(Bonapriso)(Bonamoussadi)→│
│ ┌──────────────────────────┐ │
│ │ [  photo carrousel  ] ❤  │ │
│ │ ✔ Vérifié                │ │
│ │ Studio meublé · Akwa     │ │
│ │ 25 000 FCFA / nuit  ★4,8 │ │
│ └──────────────────────────┘ │
│ ┌──────────────────────────┐ │
│ │ …                        │ │
│ └──────────────────────────┘ │
│ [Liste | Carte]   [Filtres]  │
│ Explorer Favoris Réserv. Msg Profil │
└──────────────────────────────┘
```

### 4.2 Filtres (bottom sheet)
Budget (curseur) · Type · Chambres · Équipements essentiels (clim, groupe électrogène, eau permanente, wifi, parking, sécurité) · Durée · Vérifiés uniquement · bouton « Voir 128 logements ».

### 4.3 Fiche logement
```
┌──────────────────────────────┐
│ ←     [galerie plein large] ❤ ↗│
│ 1/12                         │
│ Studio meublé climatisé       │
│ Bonamoussadi · à 5 min de …   │
│ ★4,8 (23 avis)  ✔ Vérifié     │
│ ─────────────────────────────│
│ 25 000 FCFA/nuit · 450 000/mois│
│ Caution 100 000 · Ménage 5 000│
│ ─────────────────────────────│
│ 🛏 1 chambre  🛁 1 sdb  📐 28 m²│
│ Équipements (icônes + « Tout voir »)│
│ Règles · Annulation : Modérée │
│ Carte (zone approximative)    │
│ Propriétaire : Mme N. ✔ Vérifié│
│ Avis                          │
│ ─────────────────────────────│
│ [💬 Contacter] [Réserver]     │  ← barre fixe en bas
└──────────────────────────────┘
```

### 4.4 Résumé de réservation et paiement
- Récapitulatif des dates et voyageurs, détail du prix ligne par ligne, total en gras
- Choix du moyen : logos MTN MoMo, Orange Money, carte
- Champ numéro, bouton « Payer 77 500 FCFA »
- Texte de réassurance : « Votre argent est protégé jusqu'à votre arrivée »
- État d'attente : « Validez le paiement sur votre téléphone » + compte à rebours + « Je n'ai rien reçu »

### 4.5 Création d'annonce
- En-tête avec barre de progression (étape 3/9) et « Enregistrer et quitter »
- Un sujet par écran, gros boutons, exemples sous chaque champ
- Étape photos : grille 3 colonnes, conseils (« Photographiez chaque pièce, en pleine lumière »), indicateur de qualité
- Étape équipements : grandes puces à cocher groupées (Confort, Cuisine, Énergie/Eau, Sécurité, Extérieur)
- Dernier écran : aperçu identique à la fiche publique

### 4.6 Tableau de bord propriétaire
```
┌──────────────────────────────┐
│ Bonjour Anne 👋               │
│ Solde disponible 320 000 FCFA │ [Retirer]
│ ┌─────────┐ ┌─────────┐      │
│ │2 demandes│ │ 78 % occ.│      │
│ └─────────┘ └─────────┘      │
│ À faire : répondre à Paul (2 h)│
│ Mes annonces (carte par logement)│
│ [+ Nouvelle annonce]          │
└──────────────────────────────┘
```

### 4.7 Messagerie
Liste des conversations (avatar, dernier message, logement concerné) ; conversation avec bandeau du logement en haut, réponses rapides (« Est-il toujours disponible ? », « Puis-je visiter demain ? »), masquage automatique des numéros avant acceptation.

### 4.8 Back-office web
Navigation latérale (Modération, Identités, Litiges, Paiements, Utilisateurs, Paramètres) ; tableaux filtrables ; vue de détail à deux colonnes (données / actions) ; raccourcis clavier pour approuver/refuser ; indicateurs de délai (SLA).

## 5. Écrans complémentaires
Onboarding (3 écrans), choix de langue, saisie OTP (champ 6 cases, collage automatique du SMS), vérification d'identité, favoris, mes réservations (onglets À venir / En cours / Passées), détail de réservation, état des lieux photo, litige, avis, profil et paramètres, aide/FAQ, états vides, erreurs réseau, mise à jour obligatoire.

## 6. Microcopie (ton et exemples)

Ton : chaleureux, direct, rassurant, tutoiement évité, vouvoiement par défaut.

| Contexte | Exemple |
|---|---|
| Bouton principal | « Réserver », « Publier mon annonce », « Payer » |
| Réassurance | « Votre argent est protégé jusqu'à votre arrivée » |
| Erreur réseau | « Pas de connexion. Votre brouillon est sauvegardé. » |
| État vide favoris | « Vous n'avez pas encore de favoris. Touchez ❤ pour en ajouter. » |
| Prix | Toujours « 25 000 FCFA » (espace insécable) |

## 7. Accessibilité

- Contraste AA, ne jamais utiliser la couleur seule pour signifier un état
- Compatible lecteur d'écran (étiquettes pour icônes, ordre logique)
- Texte agrandissable jusqu'à 200 % sans casse
- Zones tactiles ≥ 48 px, espacement suffisant
- Animations discrètes, respect de « réduire les animations »
- Messages d'erreur explicites, jamais uniquement des codes

## 8. Performance perçue

- Squelettes de chargement, images floues puis nettes
- Résultats mis en cache pour consultation hors connexion
- Mode économie de données : vignettes réduites, pas de lecture automatique des vidéos
- Actions optimistes (favori) avec reprise en cas d'échec

## 9. Responsive web

| Largeur | Mise en page |
|---|---|
| < 640 px | Une colonne, navigation en bas |
| 640–1024 px | Grille 2 colonnes, filtres en panneau |
| > 1024 px | Liste + carte côte à côte, fiche logement en 2 colonnes avec encart de réservation collant |

## 10. Tests utilisateurs recommandés

- 8 à 10 propriétaires (dont peu à l'aise avec le numérique) testent la publication d'annonce
- 8 à 10 locataires testent recherche → réservation → paiement MoMo
- Mesures : temps de publication (< 7 min), taux d'abandon par étape, compréhension du prix total, confiance perçue
- Tests sur appareils Android d'entrée de gamme et connexion bridée

## 11. Livrables design à produire

1. Design system (Figma) : couleurs, typographies, composants
2. Maquettes haute fidélité des 15 écrans clés
3. Prototype cliquable des parcours publier / rechercher / réserver
4. Guide d'icônes d'équipements
5. Spécifications de remise aux développeurs (marges, états, animations)

## 12. Inspiration Booking.com et implémentation Tailwind (v2.0)

### 12.1 Schémas d'usage retenus

| Schéma | Application dans MeubléFacile |
|---|---|
| Barre de recherche principale (destination, dates, voyageurs) | En tête d'accueil et en bandeau sur les listes : quartier (liste suggérée), dates facultatives, budget. Bouton « Rechercher » bien visible |
| Page de résultats : filtres à gauche, liste à droite | ≥ 1024 px : colonne de filtres 280 px + liste ; < 1024 px : bouton « Filtres » ouvrant un panneau coulissant avec compteur « Voir 42 logements » |
| Carte résultat horizontale | ≥ 768 px : photo 280 px à gauche, informations au centre, prix et bouton à droite ; mobile : carte verticale |
| Barre de tri et bascule liste / carte | Tri : pertinence, prix croissant/décroissant, plus récent ; bouton « Afficher sur la carte » |
| Fiche : galerie en mosaïque (1 grande + 4 petites) | ≥ 768 px mosaïque avec « Voir toutes les photos » ; mobile : carrousel plein écran |
| Barre d'onglets ancrés sur la fiche | Aperçu · Équipements · Règles · Localisation · Avis (ancres de défilement) |
| Encart de prix collant | À droite sur grand écran ; barre fixe en bas sur mobile avec bouton **Contacter sur WhatsApp** |
| Badges de confiance | « Vérifié », « Mis à jour récemment », « Propriétaire répond vite » (uniquement si vrai) |
| Fil d'Ariane | Accueil › Douala › Bonamoussadi › Studio meublé (aussi en JSON-LD) |
| Message de rareté | « Plus que 2 logements dans ce quartier » **uniquement** s'il est réel ; jamais de fausse urgence |

À ne pas copier : couleurs et typographie de Booking, wording, programmes de fidélité, éléments de marque.

### 12.2 Tokens Tailwind (v4)

`app/globals.css` :

```css
@import "tailwindcss";

@theme {
  --font-sans: "Inter", ui-sans-serif, system-ui, sans-serif;

  --color-brand-50:  #f0fdfa;
  --color-brand-100: #ccfbf1;
  --color-brand-500: #14b8a6;
  --color-brand-600: #0d9488;
  --color-brand-700: #0f766e;   /* primaire */
  --color-brand-800: #115e59;

  --color-accent-500: #f59e0b;  /* ambre : mises en avant, étoiles */
  --color-ok:    #16a34a;
  --color-warn:  #d97706;
  --color-bad:   #dc2626;

  --radius-card: 0.75rem;
  --radius-field: 0.625rem;

  --breakpoint-xs: 22.5rem;
}

@layer base {
  html { font-size: 16px; }
  body { @apply bg-gray-50 text-gray-900 antialiased; }
  :focus-visible { @apply outline-2 outline-offset-2 outline-brand-700; }
}
```

Avec Tailwind v3 : mêmes valeurs dans `theme.extend.colors` de `tailwind.config.ts`.

### 12.3 Composants clés (exemples de classes)

**Barre de recherche**
```tsx
<form className="mx-auto grid max-w-5xl gap-2 rounded-2xl bg-white p-2 shadow-lg
                 md:grid-cols-[2fr_1fr_1fr_auto]">
  <input className="h-12 rounded-xl border border-gray-200 px-4" placeholder="Quartier (ex. Bonamoussadi)" />
  <input className="h-12 rounded-xl border border-gray-200 px-4" placeholder="Budget max (FCFA)" />
  <select className="h-12 rounded-xl border border-gray-200 px-4">…</select>
  <button className="h-12 rounded-xl bg-brand-700 px-6 font-semibold text-white hover:bg-brand-800">Rechercher</button>
</form>
```

**Carte annonce (horizontale ≥ md)**
```tsx
<article className="flex flex-col overflow-hidden rounded-[--radius-card] border border-gray-200 bg-white
                    md:flex-row">
  <div className="relative aspect-[4/3] md:aspect-auto md:w-72 md:shrink-0">
    <Image … fill sizes="(min-width:768px) 288px, 100vw" className="object-cover" />
    <button aria-label="Ajouter aux favoris" className="absolute right-2 top-2 size-10 rounded-full bg-white/90">♡</button>
  </div>
  <div className="flex flex-1 flex-col gap-2 p-4">
    <h2 className="text-lg font-semibold"><a href={url}>{title}</a></h2>
    <p className="text-sm text-gray-600">{neighborhood} · {bedrooms} ch. · {surface} m²</p>
    <ul className="flex flex-wrap gap-2">…badges équipements…</ul>
  </div>
  <div className="flex items-end justify-between gap-2 border-t p-4 md:w-48 md:flex-col md:border-l md:border-t-0">
    <p className="text-right"><span className="block text-xs text-gray-500">à partir de</span>
       <strong className="text-xl">25 000 FCFA</strong><span className="text-sm text-gray-500"> /nuit</span></p>
    <a className="rounded-lg bg-brand-700 px-4 py-2 text-white">Voir</a>
  </div>
</article>
```

**Badge**
```tsx
<span className="inline-flex items-center gap-1 rounded-full bg-brand-100 px-2.5 py-1 text-xs font-medium text-brand-800">✔ Vérifié</span>
```

**Barre de contact collante (mobile)**
```tsx
<div className="fixed inset-x-0 bottom-0 z-40 flex items-center justify-between gap-3 border-t bg-white p-3 lg:hidden">
  <div><strong>25 000 FCFA</strong><span className="text-sm text-gray-500"> /nuit</span></div>
  <a href={waLink} className="rounded-xl bg-[#25D366] px-5 py-3 font-semibold text-white">WhatsApp</a>
</div>
```

### 12.4 Bibliothèque de composants à créer

`SearchBar`, `FilterPanel` (desktop + drawer mobile), `ListingCard`, `ListingGrid`, `Gallery` (mosaïque + plein écran), `PriceBox`, `AmenityList`, `Breadcrumbs`, `Badge`, `MapView` (Leaflet chargé en différé), `FavoriteButton`, `Pagination` (liens réels pour le SEO), `Stepper` (dépôt d'annonce), `PhotoUploader` (compression + ordre), `JsonLd`, `EmptyState`, `Toast`.

### 12.5 Règles UI qui servent le SEO et la performance

- **HTML sémantique** : un `h1` par page, `nav`, `main`, `article`, `ul/li` pour les listes ; liens `<a href>` réels (pas de navigation uniquement en JavaScript).
- **Pagination par liens** (`?page=2`) avec `rel` géré par les métadonnées, pas de défilement infini seul.
- **Images** : `next/image`, `sizes` précis, `priority` sur la première image de la fiche, `alt` descriptif, dimensions fixes pour éviter le décalage de mise en page.
- **Carte** chargée à la demande (bouton « Afficher la carte »), pas au chargement initial.
- **Polices** : Inter via `next/font` (auto-hébergée), 2 graisses maximum.
- **Pas de contenu masqué par des onglets pour le texte important** : les équipements et la description restent dans le HTML.
- **Accessibilité** : focus visible, contrastes AA, zones tactiles ≥ 48 px, étiquettes de champs, `aria-label` sur les icônes.
- **Cible Lighthouse mobile** : performance ≥ 90, SEO 100, accessibilité ≥ 95.

### 12.6 Écrans à produire en priorité (MVP web)

1. Accueil (recherche + quartiers populaires + annonces récentes)
2. Page de liste (quartier/type) : filtres, tri, cartes, pagination
3. Fiche logement (mosaïque, équipements, carte, encart de contact)
4. Déposer une annonce (stepper en 9 étapes, brouillon automatique)
5. Mes annonces (statuts, confirmer la disponibilité, pause)
6. Connexion / inscription (email, Google)
7. Admin : file de modération et détail d'une annonce
8. Pages statiques : à propos, conditions, confidentialité, contact

