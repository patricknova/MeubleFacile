# Plan d'implémentation à 0 FCFA — MeubléFacile (MVP gratuit)

Version 2.0 — 13 octobre 2026
Plan de départ (développeur seul, Next.js + Tailwind + Supabase). Le plan 06 devient la phase 2. Les documents 01 à 05 et 08 (SEO) s'appliquent avec leurs sections « v2.0 / MVP ».

---

## 1. Objectif

En **6 semaines**, avec 0 FCFA : un site web mobile (PWA) où des propriétaires de Douala envoient leur appartement ou studio meublé, où vous validez les annonces, et où des locataires cherchent et contactent le propriétaire par WhatsApp.

**Critère de réussite** : 30 annonces validées et au moins 20 contacts de locataires en 4 semaines après la mise en ligne.

## 2. Ce que fait le MVP (et ce qu'il ne fait pas)

| Inclus | Reporté |
|---|---|
| Formulaire de dépôt d'annonce (photos, prix, quartier, équipements) | Paiement en ligne et séquestre |
| Validation manuelle par vous (statut : en attente / publiée / refusée) | Vérification d'identité automatique |
| Liste avec filtres (quartier, budget, chambres, équipements) | Application Android/iOS native |
| Fiche logement avec galerie et bouton WhatsApp | Messagerie interne |
| Connexion par email (lien magique ou Google) | SMS OTP |
| Favoris (stockés sur l'appareil) | Avis et notes |
| Page « Mes annonces » du propriétaire (modifier, mettre en pause) | Calendrier de réservation |
| Carte simple (OpenStreetMap) | Calcul automatique des commissions |

## 3. Outils gratuits

| Besoin | Outil | Limite gratuite (à vérifier) |
|---|---|---|
| Base de données, connexion, stockage des photos | **Supabase** | Base 500 Mo, stockage 1 Go, 50 000 utilisateurs actifs/mois |
| Hébergement du site | **Cloudflare Pages** (OpenNext) ou **Vercel** | Vercel Hobby est réservé à un usage non commercial : à vérifier avant de monétiser |
| Code | **GitHub** | Dépôts privés gratuits |
| Carte | **OpenStreetMap + Leaflet** | Gratuit |
| Compression des photos | Dans le navigateur (bibliothèque `browser-image-compression`) | Évite de saturer le 1 Go |
| Statistiques | **Plausible auto-hébergé** ou **Google Analytics** | Gratuit |
| Design | **Figma** (offre gratuite) ou directement en code | Gratuit |
| Adresse | `meublefacile.vercel.app` | Domaine .com plus tard (~10 USD/an) |

Les offres gratuites changent : vérifiez les limites avant de vous engager.

**Astuce stockage** : 1 Go de photos = environ 5 000 photos compressées à 200 Ko. Avec 8 photos par annonce, cela suffit pour 600 annonces.

## 4. Stack technique simplifiée

- **Next.js (App Router)** avec rendu serveur et ISR, indispensable pour le référencement ; site responsive installable en PWA (décision validée)
- **Supabase** : tables Postgres, authentification, stockage, règles de sécurité (Row Level Security)
- **Tailwind CSS** pour le design rapide
- **Leaflet** pour la carte
- Construction avec Claude, étape par étape

### Tables minimales

Le SQL de référence (noms anglais, RLS, triggers, stockage) est dans **05-Backend-Schemas.md §9**. La liste ci-dessous, en français, n'est qu'un aide-mémoire ; en cas de différence, §9 fait foi.

```sql
profiles(id, nom, telephone_whatsapp, role, created_at)
quartiers(id, nom, ville)
equipements(id, code, libelle)
annonces(id, proprietaire_id, titre, description, type, quartier_id, repere,
         latitude, longitude, chambres, prix_nuit, prix_mois, caution,
         statut, motif_refus, created_at)
annonce_equipements(annonce_id, equipement_id)
annonce_photos(id, annonce_id, chemin, position)
signalements(id, annonce_id, motif, created_at)
```

Statuts d'annonce : `brouillon → en_attente → publiee` ou `refusee`, plus `pause`.

## 5. Calendrier sur 6 semaines

### Semaine 1 — Préparation et terrain
- Valider le nom, le périmètre, les quartiers de départ (2 ou 3 quartiers de Douala)
- Créer les comptes : GitHub, Supabase, Vercel
- Préparer la liste des équipements et le texte des conditions d'utilisation (modèle simple)
- **Terrain** : contacter 10 propriétaires ou démarcheurs que vous connaissez ; prendre des photos de 5 logements pour avoir du contenu de démonstration
- **Technique** : initialiser Next.js + Tailwind (tokens du doc 04 §12.2), déployer une page vide, créer le projet Supabase, brancher Google Search Console et Bing Webmaster (doc 08)
- Livrable : liste de 10 contacts, 5 logements photographiés, site « squelette » en ligne

### Semaine 2 — Base et connexion
- Créer la base Supabase, les tables et les règles de sécurité
- Importer quartiers et équipements
- Connexion par email, page profil avec numéro WhatsApp
- Livrable : on peut créer un compte et se connecter

### Semaine 3 — Déposer une annonce
- Formulaire en étapes (type, quartier, prix, équipements, photos, règles)
- Compression des photos dans le navigateur, téléversement, ordre des photos
- Brouillon enregistré, bouton « Envoyer pour validation »
- Livrable : un propriétaire envoie une annonce complète en moins de 7 minutes

### Semaine 4 — Validation et recherche
- Page d'administration réservée à vous : liste des annonces en attente, boutons Approuver / Refuser (avec motif)
- Page d'accueil, liste des annonces publiées, filtres, tri
- Fiche logement avec galerie, équipements, carte, bouton WhatsApp avec message pré-rempli (`wa.me/237…?text=…`)
- **Interface** : cartes horizontales, filtres latéraux, fiche avec mosaïque et barre collante, inspirées des schémas d'usage de Booking.com (doc 04 §12)
- **SEO** : routes `/[ville]/[quartier]/[type]/[slug]`, `generateMetadata`, JSON-LD, `sitemap.ts`, `robots.ts`, fil d'Ariane, canonical (doc 08)
- Livrable : un locataire trouve une annonce publiée et contacte le propriétaire

### Semaine 5 — Finition et tests
- Favoris, « Mes annonces », pause/reprise, signalement d'une annonce
- Responsive et performance sur téléphone modeste et réseau lent
- Tests avec 5 propriétaires et 5 locataires réels ; corrections
- Pages : à propos, conditions d'utilisation, contact
- **SEO** : textes d'introduction des quartiers, 2 ou 3 articles de guide, flux de confirmation de disponibilité (J+25 / J+30), IndexNow, test Lighthouse mobile (performance ≥ 90, SEO 100), test du Rich Results Test sur 3 fiches
- Soumettre les sitemaps à Search Console avant le lancement
- Livrable : version stable

### Semaine 6 — Lancement
- Mise en ligne, partage dans les groupes Facebook et WhatsApp de quartiers
- Publication des annonces que vous avez collectées vous-même
- Suivi quotidien : annonces reçues, contacts, retours
- Livrable : site public, 30 annonces visées

## 6. Comment obtenir les premières annonces (le vrai défi)

1. **Vos propres contacts** : AJV AD et votre réseau à Douala, propriétaires que vous connaissez.
2. **Démarcheurs** : proposer qu'ils publient eux-mêmes leurs offres ; ils gagnent en visibilité et gardent leur commission directe.
3. **Collecte assistée** : vous visitez, photographiez au téléphone (lumière du jour, 6 à 8 photos) et publiez pour eux. Gratuit pour les 30 premiers.
4. **Groupes Facebook et WhatsApp** de location : poster vos annonces avec le lien du site.
5. **Offre de lancement** : « publication gratuite à vie pour les 50 premiers propriétaires ».

## 7. Comment gagner de l'argent sans paiement en ligne

| Étape | Source de revenu | Quand |
|---|---|---|
| 1 | Annonce mise en avant (ex. 2 000 à 5 000 FCFA/semaine, paiement manuel par Mobile Money) | Dès 50 annonces et du trafic |
| 2 | Pack agence (ex. forfait mensuel pour plus d'annonces et un badge) | Dès 3 ou 4 agences intéressées |
| 3 | Commission en cas de location confirmée, déclarée par le propriétaire | Après confiance établie |
| 4 | Paiement en ligne via agrégateur | Quand les revenus couvrent les frais et le temps juridique |

Les premiers revenus paient le domaine, puis un hébergement payant si nécessaire, puis un développeur.

## 8. Risques et réponses

| Risque | Réponse |
|---|---|
| Pas assez d'annonces | Collecte terrain, offre de lancement, partenariat démarcheurs |
| Annonces fausses ou déjà louées | Validation manuelle, bouton « Signaler », demande de confirmation tous les 30 jours |
| Limite gratuite dépassée | Compression des photos, 1 Go surveillé, passage à une offre payante financée par les premiers revenus |
| Vous manquez de temps | Limiter la validation à des créneaux fixes, recruter un bénévole ou stagiaire par AJV AD |
| Spam ou arnaques | Connexion obligatoire pour déposer, numéro WhatsApp vérifié par un appel, signalements |
| Litiges entre parties | Message clair : la plateforme met en relation, ne garantit pas la transaction (conditions d'utilisation) |

## 9. Responsabilité légale minimale

Même à 0 FCFA, prévoir : conditions d'utilisation simples, politique de confidentialité (photos, numéros), avertissement « ne payez jamais d'avance sans avoir visité ». Faites relire par un juriste dès que possible, ou par une personne de votre réseau.

## 10. Prochaines actions (cette semaine)

1. Créer les comptes GitHub, Supabase et Vercel
2. Choisir 2 ou 3 quartiers de départ à Douala
3. Lister 10 propriétaires ou démarcheurs à contacter
4. Photographier 3 à 5 logements pour la démonstration
5. Me demander de générer le projet de départ : tables Supabase, formulaire d'annonce, liste, fiche

## 11. Quand passer à l'étape suivante

| Signal | Action |
|---|---|
| 100+ annonces et 500 visites/semaine | Domaine personnalisé, hébergement renforcé |
| 20+ locations confirmées par mois | Commission, mise en avant payante |
| 3 agences utilisatrices régulières | Pack agence, tableau de bord |
| Revenus mensuels réguliers | Application mobile, paiement en ligne, équipe (retour aux documents 01 à 06) |
