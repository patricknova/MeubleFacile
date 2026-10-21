# App Flow — Parcours et flux de MeubléFacile

Version 2.0 — 13 octobre 2026
Références : 01-PRD.md, 02-TRD.md, 08-SEO.md

---

## 0. Adaptations du MVP (v2.0)

Les parcours des sections 2 à 14 décrivent la cible. Le MVP web les applique ainsi :

| Parcours | Version MVP |
|---|---|
| 2. Inscription | Email (lien magique) ou Google. Numéro WhatsApp demandé au profil, vérifié par un appel de l'administrateur avant la première publication |
| 3. Vérification d'identité | Manuelle (appel ou échange WhatsApp) ; badge « Vérifié » attribué par l'administrateur |
| 4. Publier une annonce | Identique, en étapes, avec brouillon enregistré. Statuts : `draft → pending_review → published` ou `rejected`, plus `paused` |
| 5. Rechercher | Identique, avec URL propres et pages indexables (voir ci-dessous) |
| 6. Contacter / visiter | Bouton **WhatsApp** avec message pré-rempli (`wa.me/237…?text=…`), pas de messagerie interne |
| 7. Réserver et payer | **Absent**. Le locataire et le propriétaire s'arrangent directement. Message de prévention : « Ne payez jamais d'avance sans avoir visité » |
| 8. Gérer une réservation | Absent ; le propriétaire met son annonce en `paused` ou `rented` |
| 9. Annulation / 10. Litige | Absents ; remplacés par le bouton **Signaler cette annonce** |
| 11. Avis | Phase 2 |
| 12. Administration | Page `/admin` : file de modération, signalements, utilisateurs |

### Parcours MVP supplémentaire — Confirmation de disponibilité (fraîcheur SEO)

```
Jour 0   : annonce publiée (date de mise à jour affichée)
Jour 25  : message au propriétaire (email + lien WhatsApp à envoyer par vous au début)
           « Votre studio est-il toujours disponible ? » [Oui, toujours dispo] [Il est loué] [Modifier le prix]
Jour 30  : sans réponse ▶ annonce passée en `paused` (non indexée, retirée des listes)
Réponse « Oui »   ▶ date « mis à jour le » actualisée, `lastmod` du sitemap mis à jour
Réponse « Loué »  ▶ statut `rented` : page conservée avec « Plus disponible » + logements similaires
Après 90 jours en `rented` ▶ redirection 301 vers la page du quartier
```

### Parcours MVP supplémentaire — Arrivée par Google ou WhatsApp

```
Recherche Google « studio meublé Bonamoussadi » ▶ page quartier + type (liste)
  └─▶ fiche logement (galerie, prix, équipements, carte, propriétaire)
        └─▶ « Contacter sur WhatsApp » (message pré-rempli avec le titre et le lien)
Lien partagé sur WhatsApp/Facebook ▶ aperçu Open Graph (photo, titre, prix) ▶ fiche
```

### Navigation MVP (web)

```
En-tête : logo · recherche (quartier, budget) · Déposer une annonce · Connexion
Pages publiques : Accueil · Ville · Quartier · Type · Fiche · Blog · À propos · Conditions
Compte : Mes annonces · Favoris · Profil · Déconnexion
Admin : Modération · Signalements · Utilisateurs
```

## 1. Carte de navigation (cible)

### Application mobile (utilisateur connecté)

```
Barre d'onglets
├── Explorer      (recherche, liste/carte, filtres)
├── Favoris       (logements et recherches sauvegardées)
├── Réservations  (demandes, séjours à venir, historique)
├── Messages      (conversations)
└── Profil
     ├── Mes informations / vérification d'identité
     ├── Passer en mode Propriétaire
     ├── Paiements et retraits
     ├── Notifications / langue
     └── Aide, CGU, déconnexion
```

### Mode Propriétaire
```
├── Tableau de bord   (revenus, demandes, occupation)
├── Mes annonces      (brouillons, publiées, en pause, refusées)
├── Calendrier
├── Réservations reçues
├── Messages
└── Finances          (solde, retraits, historique)
```

## 2. Parcours 1 — Inscription et connexion

```
Ouverture app
  └─▶ Écran d'accueil (choix langue FR/EN, présentation en 3 écrans)
        └─▶ « Continuer avec mon numéro »
              └─▶ Saisie du numéro (+237…)
                    └─▶ Envoi OTP (SMS ; option WhatsApp)
                          ├─ code correct ─▶ Compte existant ? 
                          │                    ├─ oui ─▶ Accueil (Explorer)
                          │                    └─ non ─▶ Prénom/Nom, rôle principal
                          │                              (je cherche / je loue) ─▶ Accueil
                          ├─ code incorrect ─▶ Message d'erreur, 5 essais max
                          └─ code non reçu ─▶ Renvoyer après 60 s / changer de canal
```

Cas particuliers :
- Navigation en invité autorisée (explorer et voir les annonces) ; connexion exigée pour contacter, réserver, favoris, publier.
- Trop de tentatives : blocage temporaire 15 minutes.

## 3. Parcours 2 — Vérification d'identité

```
Profil ▶ « Vérifier mon identité »
  ├─ Choix du document (CNI / passeport / permis)
  ├─ Photo recto (et verso)
  ├─ Selfie guidé
  ├─ Envoi (téléversement avec reprise)
  └─ Statut : En cours ▶ Vérifié ✅ ou Refusé (motif + nouvel essai)
```
Obligatoire avant la publication d'une annonce et le premier retrait. Facultative pour réserver un séjour court (obligatoire au-dessus d'un montant à définir).

## 4. Parcours 3 — Publier une annonce (propriétaire)

```
Mode Propriétaire ▶ « + Nouvelle annonce »
 Étape 1  Type de logement (studio / appartement / chambre / duplex), meublé confirmé
 Étape 2  Localisation : ville ▶ quartier ▶ repère ▶ épingle sur la carte
 Étape 3  Description du logement : chambres, salons, salles de bain, surface, étage, ascenseur
 Étape 4  Équipements et mobilier (cases à cocher + quantités) : lit, clim, TV, frigo, cuisine,
          wifi, groupe électrogène, eau (réservoir/surpresseur), gardien, parking…
 Étape 5  Photos (min. 5) + vidéo facultative ; glisser pour ordonner ; conseils (lumière, pièces à montrer)
 Étape 6  Prix : nuit / semaine / mois, caution, frais de ménage, charges incluses ou non
 Étape 7  Règles : fumeurs, animaux, visiteurs, arrivée/départ, politique d'annulation
 Étape 8  Disponibilités : calendrier, séjour minimum, réservation instantanée oui/non
 Étape 9  Récapitulatif + aperçu de l'annonce
          └─▶ « Publier »
                ├─ Identité non vérifiée ▶ redirection parcours 2 puis retour au brouillon
                ├─ Contrôles auto (photos, contenu, doublons)
                │     ├─ OK ▶ En attente de modération (délai cible < 24 h)
                │     └─ Problème ▶ message précis, correction demandée
                └─ Modération manuelle
                      ├─ Approuvée ▶ Publiée (notification)
                      └─ Refusée ▶ motif + retour en brouillon
```
- Sauvegarde automatique à chaque étape ; reprise possible plus tard, même hors connexion (envoi différé).
- Possibilité de « Publier sans finir » : non, mais brouillon conservé.

## 5. Parcours 4 — Rechercher et consulter

```
Explorer
 ├─ Barre : « Où ? » (quartier) + dates + voyageurs
 ├─ Filtres : budget, chambres, équipements, durée, vérifiés uniquement
 ├─ Résultats : liste ⇄ carte, tri
 └─ Fiche logement
      ├─ Galerie photos/vidéo
      ├─ Prix, caution, frais, ce qui est inclus
      ├─ Équipements (inventaire)
      ├─ Carte (zone approximative)
      ├─ Règles et politique d'annulation
      ├─ Profil propriétaire (vérifié, note, ancienneté)
      ├─ Avis
      └─ Actions : ❤ Favori | 💬 Contacter | 📅 Demander une visite | Réserver
```

## 6. Parcours 5 — Contacter et visiter

```
Fiche ▶ « Contacter »  (connexion requise)
  └─ Conversation interne (modèles de questions rapides)
        ├─ Option « Continuer sur WhatsApp » (après acceptation du propriétaire)
        └─ « Demander une visite » ▶ choix de créneaux ▶ propriétaire accepte / propose autre
              └─ Rappels automatiques (push + SMS) la veille et 2 h avant
```

## 7. Parcours 6 — Réserver et payer (locataire)

```
Fiche ▶ « Réserver »
  1. Dates + voyageurs ▶ calcul du total détaillé (loyer, ménage, frais de service, caution)
  2. Récapitulatif + règles + annulation ▶ acceptation
  3. Selon le logement :
      ├─ Réservation instantanée ▶ aller au paiement
      └─ Sur demande ▶ « Demande envoyée » ▶ propriétaire a 24 h
            ├─ accepte ▶ notification « Payez pour confirmer » (valable 12 h)
            ├─ refuse ▶ notification + suggestions similaires
            └─ ne répond pas ▶ expiration, demande annulée
  4. Paiement : MTN MoMo / Orange Money / carte
        ├─ Saisie du numéro ▶ validation sur le téléphone (USSD/push)
        ├─ Succès ▶ Réservation confirmée, reçu PDF, coordonnées exactes dévoilées
        ├─ Échec ▶ message clair, réessayer ou changer de moyen
        └─ Délai dépassé (15 min) ▶ dates relâchées
  5. Avant l'arrivée : rappel J-2 et J-0 avec itinéraire et contact
  6. Arrivée : « Je suis arrivé » + état des lieux photo (24 h pour signaler un problème)
  7. Fin du séjour : état des lieux de sortie ▶ demande d'avis
```

## 8. Parcours 7 — Gérer une réservation (propriétaire)

```
Notification « Nouvelle demande »
  └─ Détail : profil du locataire, dates, montant net estimé
        ├─ Accepter ▶ le locataire reçoit la demande de paiement
        ├─ Refuser ▶ motif facultatif
        └─ Contre-proposition (autres dates/prix)
Après paiement : réservation confirmée, calendrier bloqué automatiquement
24 h après l'entrée (sans litige) : fonds libérés ▶ solde disponible ▶ « Retirer » (MoMo/OM)
```

## 9. Parcours 8 — Annulation et remboursement

```
Réservation ▶ « Annuler »
  ├─ Par le locataire : calcul du remboursement selon la politique
  │     (flexible / modérée / stricte) ▶ confirmation ▶ remboursement vers le moyen utilisé
  └─ Par le propriétaire : remboursement intégral au locataire + pénalité/avertissement
                           + proposition de logements alternatifs
```

## 10. Parcours 9 — Litige

```
Réservation ▶ « Signaler un problème » (pendant le séjour ou 24 h après l'entrée)
  ├─ Motif (non conforme, insalubre, pas d'accès, équipement manquant…)
  ├─ Preuves (photos/vidéo/messages)
  ├─ Fonds bloqués automatiquement
  ├─ Le propriétaire répond (48 h)
  └─ Arbitrage MeubléFacile ▶ décision : libération, remboursement partiel/total, relogement
```

## 11. Parcours 10 — Avis

Après la fin du séjour : invitation à noter (propreté, exactitude de l'annonce, communication, emplacement) + commentaire ; le propriétaire note aussi le locataire ; publication simultanée après 7 jours ou dès que les deux ont répondu.

## 12. Parcours 11 — Administration (back-office)

```
Connexion admin (email + double authentification)
 ├─ File de modération : annonce ▶ voir photos/données ▶ approuver / refuser (motif prédéfini) / demander correction
 ├─ Vérification d'identité : voir pièces ▶ valider / refuser
 ├─ Signalements et litiges : dossier, preuves, décision, historique
 ├─ Paiements : réconciliation, remboursements, retraits à valider (au-dessus d'un seuil)
 ├─ Utilisateurs : suspension, bannissement, rôles
 └─ Contenus et paramètres : quartiers, équipements, commissions, textes légaux
```

## 13. États d'erreur et cas limites à traiter dans l'interface

| Situation | Comportement attendu |
|---|---|
| Perte de connexion pendant la publication | Brouillon sauvegardé localement, reprise automatique à la reconnexion |
| Photos trop lourdes | Compression automatique, barre de progression, reprise |
| Double clic sur « Payer » | Idempotence, un seul paiement |
| Paiement débité mais webhook en retard | Statut « Vérification en cours », résolution automatique ou manuelle sous 24 h |
| Dates plus disponibles au moment du paiement | Message explicite, propositions alternatives |
| Propriétaire inactif | Rappels, puis annonce mise en pause automatiquement après 30 jours sans réponse |
| Annonce signalée plusieurs fois | Masquage préventif en attendant la revue |
| Version de l'app trop ancienne | Écran de mise à jour obligatoire |

## 14. Notifications déclenchées par les flux

| Événement | Destinataire | Canaux |
|---|---|---|
| OTP | Utilisateur | SMS / WhatsApp |
| Annonce approuvée/refusée | Propriétaire | Push, email |
| Nouvelle demande de réservation | Propriétaire | Push, SMS, WhatsApp |
| Demande acceptée / paiement requis | Locataire | Push, SMS |
| Paiement confirmé | Les deux | Push, email (reçu) |
| Rappel d'arrivée | Locataire | Push, SMS |
| Fonds libérés | Propriétaire | Push |
| Demande d'avis | Les deux | Push |
| Litige ouvert / décision | Les deux | Push, email |
