# Plan d'implémentation — MeubléFacile

Version 2.0 — 13 octobre 2026
Références : 01-PRD.md à 05-Backend-Schemas.md, 08-SEO.md

> **Mise à jour v2.0** : ce plan décrit la **phase 2 (croissance, avec budget et équipe)**. Pour démarrer seul avec 0 FCFA, suivez **07-Plan-0-FCFA.md** (Next.js + Tailwind + Supabase). Quand les revenus le permettent, ce plan reprend : paiement en ligne, messagerie, avis, application mobile, équipe.

---

## 1. Stratégie

- **Lancer petit, apprendre vite** : un seul marché (Douala), un seul canal mobile prioritaire (Android) + web public.
- **MVP en environ 6 mois**, bêta fermée aux mois 5–6, lancement public au mois 7 (semaines 29–32).
- **Résoudre d'abord l'offre** (propriétaires) : sans annonces de qualité, pas de locataires.
- **Livraison par tranches verticales** : chaque sprint produit une fonctionnalité utilisable de bout en bout.

## 2. Équipe recommandée

| Rôle | Effectif | Phase |
|---|---|---|
| Chef de produit / porteur du projet | 1 | Toute la durée |
| Designer UI/UX | 1 | Mois 1–4, puis ponctuel |
| Développeur mobile (Flutter) | 2 | Mois 1–6 |
| Développeur backend (Node/NestJS) | 2 | Mois 1–6 |
| Développeur web / back-office | 1 | Mois 2–6 |
| QA / testeur | 1 | Mois 3–6 |
| DevOps (temps partiel) | 0,5 | Mois 1–6 |
| Responsable terrain (onboarding propriétaires, vérification) | 1–2 | Mois 3 en continu |
| Support client | 1 | Dès la bêta |
| Conseil juridique (ponctuel) | — | Mois 1 et 5 |

Version réduite possible (budget limité) : 1 mobile + 1 backend full-stack + 1 designer en temps partagé, MVP en 7 à 8 mois.

## 3. Phases et jalons

### Phase 0 — Cadrage (semaines 1–3)
- Valider PRD, périmètre MVP, modèle économique
- Entretiens avec 15 propriétaires et 15 locataires à Douala
- Choisir : agrégateur de paiement, fournisseur SMS/WhatsApp, cartographie, hébergeur
- Cadre juridique : CGU, mandat de collecte de paiements, protection des données, fiscalité
- Nommer le produit, réserver le nom de domaine et les comptes de stores
- **Jalon J0** : documents validés, contrats fournisseurs lancés

### Phase 1 — Fondations (semaines 4–8) · Sprints 1–2 *(2 semaines chacun + 1 sem. de mise en place)*
- Dépôts de code, CI/CD, environnements local/staging
- Design system et maquettes des écrans clés (publication, recherche, fiche)
- Backend : authentification OTP, utilisateurs, rôles, référentiels (villes, quartiers, équipements)
- App mobile : squelette, navigation, thème, i18n, connexion OTP
- Stockage médias et téléversement
- **Jalon J1** : on se connecte, le profil fonctionne, l'infrastructure est prête

### Phase 2 — Offre : publier une annonce (semaines 9–14) · Sprints 3–5
- Assistant de création d'annonce complet (9 étapes), brouillons hors-ligne
- Photos : compression, ordre, traitement serveur
- Calendrier de disponibilité, tarification
- Vérification d'identité + back-office de validation
- Modération des annonces + back-office
- Tableau de bord propriétaire (annonces)
- **Jalon J2** : un propriétaire publie une annonce vérifiée en moins de 7 minutes

### Phase 3 — Demande : rechercher et contacter (semaines 15–18) · Sprints 6–7
- Recherche, filtres, liste et carte, tri
- Fiche logement complète, favoris, recherches sauvegardées
- Messagerie, demandes de visite
- Version web publique (SEO) pour partage des annonces
- Notifications push/SMS de base
- **Jalon J3** : un locataire trouve et contacte un propriétaire

### Phase 4 — Réservation et paiement (semaines 19–24) · Sprints 8–10
- Devis de prix, demande/réservation instantanée, machine à états
- Intégration Mobile Money + carte (sandbox puis production)
- Séquestre, livre de comptes, réconciliation
- Annulations et remboursements
- Wallet propriétaire et retraits
- Reçus PDF, état des lieux photo
- **Jalon J4** : parcours complet recherche → paiement → arrivée en environnement de test

### Phase 5 — Confiance et durcissement (semaines 25–28) · Sprints 11–12
- Avis, signalements, litiges
- Back-office paiements et litiges
- Tests de charge, sécurité (revue + test d'intrusion), sauvegardes testées
- Tests sur appareils d'entrée de gamme et réseau lent
- Accessibilité, performance, finition
- **Jalon J5** : prêt pour la bêta

### Phase 6 — Bêta fermée (semaines 22–28, en parallèle de la phase 5 pour l'offre)
- Recrutement terrain de 50–100 propriétaires : publication assistée, photos de qualité
- 100 premiers locataires invités ; paiements réels à montants faibles
- Boucle de retour hebdomadaire, corrections prioritaires
- **Critères de sortie** : 150+ annonces vérifiées, 50+ réservations payées, taux de succès paiement > 95 %, aucun incident de sécurité majeur

### Phase 7 — Lancement public (semaines 29–32)
- Publication Play Store (puis App Store), site web public
- Campagne : partenariats avec agences, quartiers pilotes, réseaux sociaux, WhatsApp, ambassadeurs
- Support et supervision renforcés
- **Jalon J6** : lancement à Douala

### Phase 8 — Croissance (mois 8+)
- Yaoundé, abonnements agences, annonces mises en avant
- Import en lot, comparateur, contrats générés, services (ménage, photographe)
- Application iOS si non livrée au lancement
- Analyse du taux de conversion et optimisation continue

## 4. Calendrier synthétique

| Mois | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
|---|---|---|---|---|---|---|---|---|
| Cadrage | ██ | | | | | | | |
| Fondations | █ | ██ | | | | | | |
| Publication d'annonce | | █ | ██ | █ | | | | |
| Recherche & contact | | | | ██ | █ | | | |
| Réservation & paiement | | | | █ | ██ | █ | | |
| Confiance & durcissement | | | | | | ██ | | |
| Bêta fermée | | | | | █ | ██ | | |
| Lancement public | | | | | | | ██ | |
| Croissance | | | | | | | | ██ |

## 5. Périmètre MVP (à respecter)

**Inclus** : OTP, vérification d'identité, publication d'annonce, modération, recherche/filtres/carte, fiche, favoris, messagerie, demande de visite, réservation, paiement MoMo/OM/carte avec séquestre, annulation/remboursement, retraits, avis, signalement/litige simples, back-office, notifications push/SMS.

**Reporté** : import en lot, comparateur, vidéo (si retard), contrats générés, WhatsApp API (remplacé par lien wa.me au départ), multilingue au-delà de FR/EN, mode sombre, services additionnels, iOS si nécessaire.

## 6. Budget indicatif (ordre de grandeur, à affiner par devis)

| Poste | Hypothèse | Estimation (USD) |
|---|---|---|
| Développement (6 mois, équipe réduite à moyenne) | Tarifs locaux/régionaux | 40 000 – 110 000 |
| Design UI/UX | 3–4 mois | 4 000 – 10 000 |
| Infrastructure et outils (8 mois) | Voir TRD | 2 000 – 6 000 |
| Juridique | CGU, paiements, données | 1 500 – 5 000 |
| Terrain et lancement (acquisition propriétaires, photographes, marketing) | 6 mois | 8 000 – 25 000 |
| Comptes de stores, domaines, divers | | 500 – 1 000 |
| Réserve (15 %) | | 8 000 – 25 000 |
| **Total** | | **≈ 64 000 – 182 000** |

Les montants dépendent fortement du choix interne/externe, du nombre de développeurs et de la rémunération locale. À convertir en FCFA et à valider après appels d'offres.

## 7. Gestion des risques

| Risque | Probabilité | Impact | Réponse |
|---|---|---|---|
| Retard d'intégration paiement (agrément, contrat, tests) | Élevée | Élevé | Démarrer les démarches dès la semaine 1 ; plan B : second agrégateur ; paiement manuel assisté en bêta |
| Faible nombre d'annonces au lancement | Moyenne | Élevé | Équipe terrain, publication gratuite, photographe offert aux premiers inscrits |
| Fraude (faux logements, usurpation) | Moyenne | Élevé | KYC, modération, séquestre, signalements, blocage préventif |
| Délivrabilité des SMS OTP | Moyenne | Moyen | Plusieurs fournisseurs, OTP par WhatsApp en secours |
| Dépassement de périmètre | Élevée | Moyen | Backlog priorisé P0/P1/P2, comité de changement |
| Performances sur appareils modestes | Moyenne | Moyen | Tests réguliers sur appareils réels, budget de poids de l'APK |
| Contournement de la plateforme | Moyenne | Moyen | Séquestre, avis, assurance annulation, masquage des contacts |
| Dépendance à un développeur clé | Moyenne | Moyen | Documentation, revues de code, binômes |
| Conformité légale / fiscale | Moyenne | Élevé | Conseil juridique, CGU, déclarations, suivi réglementaire |

## 8. Indicateurs de pilotage par phase

| Phase | Indicateurs |
|---|---|
| Fondations | Pipeline CI vert, couverture de tests, temps de build |
| Publication | Temps de publication, taux d'abandon par étape, délai de modération |
| Recherche | Temps de réponse, taux de contact par fiche vue |
| Paiement | Taux de succès, délai de confirmation, écarts de réconciliation |
| Bêta | Annonces vérifiées, réservations payées, NPS, tickets support |
| Lancement | Installations, activation, réservations/mois, coût d'acquisition |

## 9. Organisation du travail

- Sprints de 2 semaines : planification, démonstration, rétrospective
- Revue de code obligatoire, branches courtes, déploiement continu en staging
- Point hebdomadaire produit/design/technique ; point mensuel avec les parties prenantes
- Outils : gestionnaire de tâches (Linear/Jira/Notion), dépôt Git, Figma, canal de discussion, base de connaissances
- Definition of Done : fonctionnalité testée, documentée, accessible, instrumentée (analytique), validée par le produit

## 10. Checklist de pré-lancement

- [ ] CGU, politique de confidentialité, politique d'annulation publiées
- [ ] Contrat et production de l'agrégateur de paiement validés
- [ ] Séquestre et retraits testés avec argent réel (montants faibles)
- [ ] Sauvegardes et restauration testées
- [ ] Test d'intrusion et corrections critiques terminés
- [ ] Tests de charge réussis
- [ ] Équipe support formée, modèles de réponse prêts
- [ ] Process de modération et de litige documentés
- [ ] 150+ annonces vérifiées publiées
- [ ] Fiches Play Store/App Store, captures d'écran, vidéo de démonstration
- [ ] Plan de communication et partenaires prêts
- [ ] Suivi des erreurs et alertes opérationnels

## 11. Prochaines actions (14 jours)

1. Valider le périmètre MVP et trancher les questions ouvertes du PRD
2. Lancer les entretiens utilisateurs (propriétaires et locataires)
3. Comparer 2–3 agrégateurs de paiement et lancer les démarches
4. Constituer ou contractualiser l'équipe (designer, 2 devs mobile, 2 backend)
5. Rédiger le brief de marque et choisir le nom
6. Consulter un juriste sur la collecte de paiements, le séquestre et les données personnelles
7. Créer les dépôts, l'environnement de développement et le tableau de suivi
