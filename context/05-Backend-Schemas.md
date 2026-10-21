# Schémas Backend — MeubléFacile

Version 2.0 — 13 octobre 2026
Références : 01-PRD.md, 02-TRD.md, 08-SEO.md

> **Mise à jour v2.0** : la **section 9** donne le schéma réel du MVP sur **Supabase** (sous-ensemble du schéma cible, politiques RLS, stockage des photos, requêtes pour Next.js). Les sections 1 à 8 restent la cible de phase 2 (réservations, paiements, messagerie, litiges).

Base : PostgreSQL 16 + PostGIS. Montants en entiers (XAF). Identifiants UUID. Horodatages en UTC.

---

## 1. Vue d'ensemble du modèle

```
users ──< user_roles
users ──< identity_verifications
users ──< organization_members >── organizations
users ──< listings >──< listing_media
                    >──< listing_amenities >── amenities
                    >──< availability_blocks
                    >──< pricing_rules
listings ──< bookings >── users (locataire)
bookings ──< payments ──< ledger_entries
bookings ──< booking_events
bookings ──< reviews
bookings ──< disputes ──< dispute_evidence
users ──< conversations ──< messages
users ──< favorites, saved_searches
users ──< payouts
users ──< notifications, devices
```

## 2. Extensions et types

```sql
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE EXTENSION IF NOT EXISTS btree_gist;   -- contrainte d'exclusion
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
CREATE EXTENSION IF NOT EXISTS citext;       -- email insensible à la casse

CREATE TYPE listing_status   AS ENUM ('draft','pending_review','published','paused','rejected','archived');
CREATE TYPE listing_type     AS ENUM ('studio','apartment','room','duplex');
CREATE TYPE booking_status   AS ENUM ('requested','accepted','awaiting_payment','paid','checked_in','completed',
                                      'declined','expired','cancelled_by_guest','cancelled_by_host','disputed');
CREATE TYPE payment_status   AS ENUM ('initiated','pending','succeeded','failed','expired','held','released',
                                      'refunded_partial','refunded_full');
CREATE TYPE payment_method   AS ENUM ('mtn_momo','orange_money','card');
CREATE TYPE kyc_status       AS ENUM ('pending','approved','rejected');
CREATE TYPE cancel_policy    AS ENUM ('flexible','moderate','strict');
```

## 3. Tables

### 3.1 Utilisateurs et organisations

```sql
CREATE TABLE users (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  phone           VARCHAR(20) UNIQUE NOT NULL,          -- E.164 : +2376…
  phone_verified  BOOLEAN NOT NULL DEFAULT FALSE,
  email           CITEXT UNIQUE,
  password_hash   TEXT,                                  -- facultatif
  first_name      VARCHAR(80),
  last_name       VARCHAR(80),
  avatar_url      TEXT,
  language        CHAR(2) NOT NULL DEFAULT 'fr',
  is_host         BOOLEAN NOT NULL DEFAULT FALSE,
  kyc_status      kyc_status NOT NULL DEFAULT 'pending',
  status          VARCHAR(20) NOT NULL DEFAULT 'active', -- active | suspended | deleted
  rating_avg      NUMERIC(3,2) DEFAULT 0,
  rating_count    INT NOT NULL DEFAULT 0,
  last_login_at   TIMESTAMPTZ,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE user_roles (
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  role    VARCHAR(20) NOT NULL,                          -- guest | host | agency_admin | admin | moderator | support
  PRIMARY KEY (user_id, role)
);

CREATE TABLE identity_verifications (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id       UUID NOT NULL REFERENCES users(id),
  doc_type      VARCHAR(20) NOT NULL,                    -- cni | passport | license
  doc_number_enc BYTEA,                                  -- chiffré
  front_key     TEXT NOT NULL,                           -- clé objet stockage privé
  back_key      TEXT,
  selfie_key    TEXT NOT NULL,
  status        kyc_status NOT NULL DEFAULT 'pending',
  reviewed_by   UUID REFERENCES users(id),
  reject_reason TEXT,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
  reviewed_at   TIMESTAMPTZ
);

CREATE TABLE organizations (
  id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name       VARCHAR(160) NOT NULL,
  legal_id   VARCHAR(60),                                -- RCCM / NIU
  phone      VARCHAR(20),
  plan       VARCHAR(20) NOT NULL DEFAULT 'free',
  verified   BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE organization_members (
  organization_id UUID REFERENCES organizations(id) ON DELETE CASCADE,
  user_id         UUID REFERENCES users(id) ON DELETE CASCADE,
  role            VARCHAR(20) NOT NULL,                  -- owner | manager | agent
  PRIMARY KEY (organization_id, user_id)
);

CREATE TABLE devices (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id      UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  push_token   TEXT,
  platform     VARCHAR(10),
  app_version  VARCHAR(20),
  refresh_token_hash TEXT,
  last_seen_at TIMESTAMPTZ
);
```

### 3.2 Référentiels géographiques et équipements

```sql
CREATE TABLE cities (
  id SERIAL PRIMARY KEY, name VARCHAR(80) NOT NULL, country CHAR(2) NOT NULL DEFAULT 'CM',
  active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE neighborhoods (
  id        SERIAL PRIMARY KEY,
  city_id   INT NOT NULL REFERENCES cities(id),
  name      VARCHAR(120) NOT NULL,                       -- Akwa, Bonapriso, Bonamoussadi…
  geom      geometry(MultiPolygon,4326),
  center    geometry(Point,4326)
);
CREATE INDEX ON neighborhoods USING gist (geom);

CREATE TABLE amenities (
  id        SERIAL PRIMARY KEY,
  code      VARCHAR(40) UNIQUE NOT NULL,                 -- ac, wifi, generator, water_tank, guard, parking…
  category  VARCHAR(30) NOT NULL,                        -- comfort | kitchen | power_water | security | outdoor
  label_fr  VARCHAR(80) NOT NULL,
  label_en  VARCHAR(80) NOT NULL,
  icon      VARCHAR(40),
  sort_order INT DEFAULT 0
);
```

### 3.3 Annonces

```sql
CREATE TABLE listings (
  id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  owner_id         UUID NOT NULL REFERENCES users(id),
  organization_id  UUID REFERENCES organizations(id),
  type             listing_type NOT NULL,
  status           listing_status NOT NULL DEFAULT 'draft',
  title            VARCHAR(140),
  description      TEXT,
  city_id          INT REFERENCES cities(id),
  neighborhood_id  INT REFERENCES neighborhoods(id),
  address_private  TEXT,                                 -- visible après réservation
  landmark         VARCHAR(200),                         -- repère public
  location         geometry(Point,4326),                 -- exacte (privée)
  location_public  geometry(Point,4326),                 -- floutée ±200 m
  bedrooms         SMALLINT, bathrooms SMALLINT, beds SMALLINT,
  max_guests       SMALLINT, surface_m2 NUMERIC(6,1), floor SMALLINT, has_elevator BOOLEAN,
  price_night      INT, price_week INT, price_month INT,  -- XAF
  deposit          INT NOT NULL DEFAULT 0,
  cleaning_fee     INT NOT NULL DEFAULT 0,
  utilities_included BOOLEAN NOT NULL DEFAULT FALSE,
  min_nights       SMALLINT NOT NULL DEFAULT 1,
  max_nights       SMALLINT,
  checkin_time     TIME, checkout_time TIME,
  instant_book     BOOLEAN NOT NULL DEFAULT FALSE,
  cancel_policy    cancel_policy NOT NULL DEFAULT 'moderate',
  rules            JSONB NOT NULL DEFAULT '{}',          -- fumeurs, animaux, visiteurs…
  verified_badge   BOOLEAN NOT NULL DEFAULT FALSE,
  rating_avg       NUMERIC(3,2) DEFAULT 0,
  rating_count     INT NOT NULL DEFAULT 0,
  views_count      INT NOT NULL DEFAULT 0,
  promoted_until   TIMESTAMPTZ,
  rejection_reason TEXT,
  published_at     TIMESTAMPTZ,
  created_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at       TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX listings_loc_gix   ON listings USING gist (location_public);
CREATE INDEX listings_search_ix ON listings (status, city_id, neighborhood_id, price_night);
CREATE INDEX listings_title_trgm ON listings USING gin (title gin_trgm_ops);

CREATE TABLE listing_amenities (
  listing_id UUID REFERENCES listings(id) ON DELETE CASCADE,
  amenity_id INT  REFERENCES amenities(id),
  quantity   SMALLINT NOT NULL DEFAULT 1,
  note       VARCHAR(120),
  PRIMARY KEY (listing_id, amenity_id)
);

CREATE TABLE listing_media (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  listing_id  UUID NOT NULL REFERENCES listings(id) ON DELETE CASCADE,
  kind        VARCHAR(10) NOT NULL,                      -- photo | video
  object_key  TEXT NOT NULL,
  width INT, height INT, bytes INT,
  phash       BIGINT,                                    -- détection de doublons
  position    SMALLINT NOT NULL DEFAULT 0,
  is_cover    BOOLEAN NOT NULL DEFAULT FALSE,
  moderation  VARCHAR(12) NOT NULL DEFAULT 'pending',    -- pending | ok | flagged
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE availability_blocks (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  listing_id  UUID NOT NULL REFERENCES listings(id) ON DELETE CASCADE,
  period      daterange NOT NULL,
  reason      VARCHAR(20) NOT NULL DEFAULT 'host_block', -- host_block | booking
  booking_id  UUID,
  EXCLUDE USING gist (listing_id WITH =, period WITH &&)
);

CREATE TABLE pricing_rules (                              -- tarifs saisonniers / week-end
  id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  listing_id UUID NOT NULL REFERENCES listings(id) ON DELETE CASCADE,
  period     daterange NOT NULL,
  price_night INT NOT NULL
);
```

### 3.4 Réservations

```sql
CREATE TABLE bookings (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  code            VARCHAR(10) UNIQUE NOT NULL,           -- référence lisible
  listing_id      UUID NOT NULL REFERENCES listings(id),
  guest_id        UUID NOT NULL REFERENCES users(id),
  host_id         UUID NOT NULL REFERENCES users(id),
  status          booking_status NOT NULL DEFAULT 'requested',
  check_in        DATE NOT NULL,
  check_out       DATE NOT NULL CHECK (check_out > check_in),
  guests_count    SMALLINT NOT NULL DEFAULT 1,
  rent_amount     INT NOT NULL,                          -- loyer total
  cleaning_fee    INT NOT NULL DEFAULT 0,
  service_fee     INT NOT NULL DEFAULT 0,                -- frais côté locataire
  deposit_amount  INT NOT NULL DEFAULT 0,
  commission      INT NOT NULL DEFAULT 0,                -- prélevée sur l'hôte
  total_amount    INT NOT NULL,
  host_net_amount INT NOT NULL,
  cancel_policy   cancel_policy NOT NULL,
  expires_at      TIMESTAMPTZ,                           -- demande ou paiement en attente
  message         TEXT,
  cancelled_at    TIMESTAMPTZ,
  cancel_reason   TEXT,
  checked_in_at   TIMESTAMPTZ,
  completed_at    TIMESTAMPTZ,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX ON bookings (guest_id, status);
CREATE INDEX ON bookings (host_id, status);
CREATE INDEX ON bookings (listing_id, check_in, check_out);

-- Anti double-réservation sur les statuts bloquants
CREATE TABLE booking_holds (
  booking_id UUID PRIMARY KEY REFERENCES bookings(id) ON DELETE CASCADE,
  listing_id UUID NOT NULL REFERENCES listings(id),
  period     daterange NOT NULL,
  EXCLUDE USING gist (listing_id WITH =, period WITH &&)
);

CREATE TABLE booking_events (                              -- historique des états
  id         BIGSERIAL PRIMARY KEY,
  booking_id UUID NOT NULL REFERENCES bookings(id) ON DELETE CASCADE,
  from_status booking_status, to_status booking_status NOT NULL,
  actor_id   UUID REFERENCES users(id),
  note       TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE visit_requests (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  listing_id  UUID NOT NULL REFERENCES listings(id),
  guest_id    UUID NOT NULL REFERENCES users(id),
  slots       JSONB NOT NULL,                            -- créneaux proposés
  chosen_slot TIMESTAMPTZ,
  status      VARCHAR(12) NOT NULL DEFAULT 'pending',    -- pending | accepted | declined | done
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE condition_reports (                           -- état des lieux
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  booking_id  UUID NOT NULL REFERENCES bookings(id),
  kind        VARCHAR(10) NOT NULL,                      -- check_in | check_out
  author_id   UUID NOT NULL REFERENCES users(id),
  notes       TEXT, photos JSONB NOT NULL DEFAULT '[]',
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

### 3.5 Paiements et comptabilité

```sql
CREATE TABLE payments (
  id             UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  booking_id     UUID NOT NULL REFERENCES bookings(id),
  payer_id       UUID NOT NULL REFERENCES users(id),
  method         payment_method NOT NULL,
  provider       VARCHAR(30) NOT NULL,                   -- agrégateur
  provider_ref   VARCHAR(120),
  idempotency_key VARCHAR(80) UNIQUE NOT NULL,
  amount         INT NOT NULL,
  currency       CHAR(3) NOT NULL DEFAULT 'XAF',
  status         payment_status NOT NULL DEFAULT 'initiated',
  phone_used     VARCHAR(20),
  failure_reason TEXT,
  raw_webhook    JSONB,
  held_until     TIMESTAMPTZ,
  created_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at     TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE refunds (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  payment_id  UUID NOT NULL REFERENCES payments(id),
  amount      INT NOT NULL,
  reason      VARCHAR(40) NOT NULL,
  status      VARCHAR(12) NOT NULL DEFAULT 'pending',
  provider_ref VARCHAR(120),
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Livre de comptes en partie double
CREATE TABLE ledger_accounts (
  id    SERIAL PRIMARY KEY,
  code  VARCHAR(30) UNIQUE NOT NULL,       -- escrow, platform_revenue, host:{uuid}, guest_refunds…
  owner_user_id UUID REFERENCES users(id)
);
CREATE TABLE ledger_entries (
  id          BIGSERIAL PRIMARY KEY,
  tx_id       UUID NOT NULL,               -- regroupe débit+crédit
  account_id  INT NOT NULL REFERENCES ledger_accounts(id),
  booking_id  UUID REFERENCES bookings(id),
  amount      INT NOT NULL,                -- positif = crédit, négatif = débit
  memo        VARCHAR(160),
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
-- Contrainte applicative : somme(amount) par tx_id = 0

CREATE TABLE payout_accounts (
  id        UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id   UUID NOT NULL REFERENCES users(id),
  method    payment_method NOT NULL,
  account_phone VARCHAR(20),
  account_name  VARCHAR(120),
  verified  BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE payouts (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id     UUID NOT NULL REFERENCES users(id),
  account_id  UUID NOT NULL REFERENCES payout_accounts(id),
  amount      INT NOT NULL CHECK (amount > 0),
  fee         INT NOT NULL DEFAULT 0,
  status      VARCHAR(12) NOT NULL DEFAULT 'pending',    -- pending | approved | paid | failed
  provider_ref VARCHAR(120),
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  paid_at     TIMESTAMPTZ
);
```

### 3.6 Messagerie, avis, favoris, notifications

```sql
CREATE TABLE conversations (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  listing_id  UUID REFERENCES listings(id),
  guest_id    UUID NOT NULL REFERENCES users(id),
  host_id     UUID NOT NULL REFERENCES users(id),
  booking_id  UUID REFERENCES bookings(id),
  contact_unlocked BOOLEAN NOT NULL DEFAULT FALSE,
  last_message_at TIMESTAMPTZ,
  UNIQUE (listing_id, guest_id)
);
CREATE TABLE messages (
  id          BIGSERIAL PRIMARY KEY,
  conversation_id UUID NOT NULL REFERENCES conversations(id) ON DELETE CASCADE,
  sender_id   UUID NOT NULL REFERENCES users(id),
  body        TEXT,
  attachments JSONB NOT NULL DEFAULT '[]',
  flagged     BOOLEAN NOT NULL DEFAULT FALSE,
  read_at     TIMESTAMPTZ,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE reviews (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  booking_id  UUID NOT NULL REFERENCES bookings(id),
  author_id   UUID NOT NULL REFERENCES users(id),
  target_type VARCHAR(10) NOT NULL,                      -- listing | user
  target_id   UUID NOT NULL,
  rating_overall SMALLINT NOT NULL CHECK (rating_overall BETWEEN 1 AND 5),
  rating_clean SMALLINT, rating_accuracy SMALLINT, rating_comm SMALLINT, rating_location SMALLINT,
  comment     TEXT,
  published_at TIMESTAMPTZ,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (booking_id, author_id, target_type)
);

CREATE TABLE favorites (
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  listing_id UUID REFERENCES listings(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  PRIMARY KEY (user_id, listing_id)
);

CREATE TABLE saved_searches (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  filters JSONB NOT NULL, alert_enabled BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE notifications (
  id BIGSERIAL PRIMARY KEY,
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  type VARCHAR(40) NOT NULL, payload JSONB NOT NULL DEFAULT '{}',
  channels VARCHAR(30)[] NOT NULL DEFAULT '{push}',
  read_at TIMESTAMPTZ, sent_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

### 3.7 Modération, litiges, audit

```sql
CREATE TABLE reports (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  reporter_id UUID NOT NULL REFERENCES users(id),
  target_type VARCHAR(12) NOT NULL, target_id UUID NOT NULL,
  reason VARCHAR(40) NOT NULL, details TEXT,
  status VARCHAR(12) NOT NULL DEFAULT 'open',
  handled_by UUID REFERENCES users(id),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE moderation_reviews (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  listing_id UUID NOT NULL REFERENCES listings(id),
  moderator_id UUID REFERENCES users(id),
  decision VARCHAR(12),                                  -- approved | rejected | changes
  reason_code VARCHAR(40), comment TEXT,
  auto_flags JSONB NOT NULL DEFAULT '[]',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(), decided_at TIMESTAMPTZ
);

CREATE TABLE disputes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  booking_id UUID NOT NULL REFERENCES bookings(id),
  opened_by UUID NOT NULL REFERENCES users(id),
  reason VARCHAR(40) NOT NULL, description TEXT,
  status VARCHAR(12) NOT NULL DEFAULT 'open',            -- open | host_replied | resolved
  resolution VARCHAR(30), refund_amount INT,
  resolved_by UUID REFERENCES users(id),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(), resolved_at TIMESTAMPTZ
);
CREATE TABLE dispute_evidence (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  dispute_id UUID NOT NULL REFERENCES disputes(id) ON DELETE CASCADE,
  author_id UUID NOT NULL REFERENCES users(id),
  object_key TEXT, note TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE audit_logs (
  id BIGSERIAL PRIMARY KEY,
  actor_id UUID, action VARCHAR(60) NOT NULL,
  entity VARCHAR(40), entity_id TEXT,
  meta JSONB, ip INET,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE app_settings (
  key VARCHAR(60) PRIMARY KEY, value JSONB NOT NULL, updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);  -- commission, frais de service, durées d'expiration…
```

## 4. Règles d'intégrité importantes

1. **Double réservation** : `booking_holds` insère `daterange(check_in, check_out)` ; la contrainte d'exclusion rejette tout chevauchement. Une ligne est créée à l'acceptation/paiement en attente et supprimée à l'expiration, au refus ou à l'annulation.
2. **Calendrier** : `availability_blocks` (blocages hôte) et `booking_holds` sont tous deux consultés pour calculer les disponibilités.
3. **Comptabilité** : à chaque mouvement, deux écritures minimum dont la somme est nulle.
   - Paiement réussi : crédit `escrow`, débit `guest_payment`.
   - Libération : débit `escrow`, crédit `host:{id}` (net) et `platform_revenue` (commission + frais).
   - Remboursement : débit `escrow`, crédit `guest_refunds`.
4. **Idempotence** : `payments.idempotency_key` unique ; les webhooks sont dédupliqués par `provider_ref`.
5. **Mises à jour de note** : recalcul de `rating_avg/count` par tâche après publication d'un avis.

## 5. API REST (extraits)

Base : `/api/v1`. Authentification : `Authorization: Bearer <JWT>`. Réponses JSON, erreurs : `{ "error": { "code": "...", "message": "..." } }`. Pagination par curseur.

### Auth
| Méthode | Route | Rôle |
|---|---|---|
| POST | `/auth/otp/request` | Envoie un OTP `{phone}` |
| POST | `/auth/otp/verify` | `{phone, code}` → tokens |
| POST | `/auth/refresh` | Renouvelle le jeton |
| POST | `/auth/logout` | Révoque l'appareil |

### Utilisateurs
| Méthode | Route |
|---|---|
| GET/PATCH | `/me` |
| POST | `/me/identity` (documents) |
| GET | `/me/identity` (statut) |
| POST | `/me/devices` (jeton push) |
| DELETE | `/me` (suppression de compte) |

### Annonces
| Méthode | Route | Notes |
|---|---|---|
| GET | `/listings` | Recherche : `q, neighborhood, lat, lng, radius, check_in, check_out, guests, price_min, price_max, bedrooms, amenities[], verified, sort, cursor` |
| GET | `/listings/:id` | Fiche publique |
| POST | `/listings` | Crée un brouillon |
| PATCH | `/listings/:id` | Mise à jour par étapes |
| POST | `/listings/:id/media/presign` | URL de téléversement |
| POST | `/listings/:id/media` | Enregistre un média |
| PATCH | `/listings/:id/media/order` | Ordre et couverture |
| PUT | `/listings/:id/amenities` | Liste des équipements |
| PUT | `/listings/:id/availability` | Blocages |
| GET | `/listings/:id/availability?from&to` | Calendrier |
| POST | `/listings/:id/submit` | Soumet à la modération |
| POST | `/listings/:id/pause` / `/resume` / `/duplicate` | |
| GET | `/me/listings` | Annonces du propriétaire |

### Réservations
| Méthode | Route |
|---|---|
| POST | `/bookings/quote` — calcule le détail du prix |
| POST | `/bookings` — crée une demande/réservation |
| GET | `/bookings/:id` |
| GET | `/me/bookings?role=guest|host&status=` |
| POST | `/bookings/:id/accept` · `/decline` · `/cancel` |
| POST | `/bookings/:id/check-in` · `/condition-report` |
| POST | `/visit-requests` · `/visit-requests/:id/respond` |

### Paiements
| Méthode | Route |
|---|---|
| POST | `/bookings/:id/pay` — `{method, phone}` + en-tête `Idempotency-Key` |
| GET | `/payments/:id` (statut, interrogation) |
| POST | `/webhooks/payments/:provider` (signé, public) |
| GET | `/me/wallet` |
| POST | `/me/payout-accounts` |
| POST | `/me/payouts` |

### Messagerie, avis, favoris
| Méthode | Route |
|---|---|
| GET/POST | `/conversations` · `/conversations/:id/messages` |
| WS | `/ws` (messages en temps réel) |
| POST | `/bookings/:id/reviews` · GET `/listings/:id/reviews` |
| PUT/DELETE | `/favorites/:listingId` |
| GET/POST/DELETE | `/saved-searches` |
| POST | `/reports` · `/bookings/:id/disputes` |

### Administration (`/admin/*`, rôle requis)
`GET /admin/moderation/queue`, `POST /admin/listings/:id/decision`, `GET/POST /admin/identities/:id`, `GET /admin/disputes`, `POST /admin/disputes/:id/resolve`, `GET /admin/payments`, `POST /admin/payouts/:id/approve`, `GET /admin/users`, `POST /admin/users/:id/suspend`, `GET/PUT /admin/settings`, `GET /admin/stats`.

## 6. Exemple de requête de recherche (SQL)

```sql
SELECT l.id, l.title, l.price_night, l.rating_avg,
       ST_Distance(l.location_public::geography, ST_SetSRID(ST_MakePoint(:lng,:lat),4326)::geography) AS dist_m
FROM listings l
WHERE l.status = 'published'
  AND l.neighborhood_id = ANY(:neighborhood_ids)
  AND l.price_night BETWEEN :pmin AND :pmax
  AND l.max_guests >= :guests
  AND NOT EXISTS (SELECT 1 FROM booking_holds h
                   WHERE h.listing_id = l.id AND h.period && daterange(:check_in, :check_out))
  AND NOT EXISTS (SELECT 1 FROM availability_blocks b
                   WHERE b.listing_id = l.id AND b.period && daterange(:check_in, :check_out))
  AND (SELECT COUNT(*) FROM listing_amenities la
        JOIN amenities a ON a.id = la.amenity_id
        WHERE la.listing_id = l.id AND a.code = ANY(:required_amenities)) = :required_count
ORDER BY (l.promoted_until > now()) DESC, l.rating_avg DESC, dist_m ASC
LIMIT 20;
```

## 7. Événements asynchrones (files de tâches)

| Événement | Traitement |
|---|---|
| `media.uploaded` | Redimensionnement, hash, modération de contenu |
| `listing.submitted` | Contrôles automatiques puis file de modération |
| `booking.requested` | Notifications, minuterie d'expiration |
| `payment.succeeded` | Écritures comptables, confirmation, ouverture des coordonnées |
| `booking.checked_in` | Planification de la libération des fonds (+24 h) |
| `funds.release_due` | Libération, mise à jour du solde propriétaire |
| `booking.completed` | Demande d'avis, calcul des notes |
| `search.alerts` | Envoi des alertes de recherches sauvegardées |
| `cron.expire_holds` | Libère les dates des réservations non payées |

## 8. Données de départ (seed)

- Villes : Douala (puis Yaoundé)
- Quartiers de Douala (Akwa, Bonanjo, Bonapriso, Bonamoussadi, Makepe, Deido, Logbessou, Bepanda, Kotto, Logpom…) avec polygones à compléter
- Équipements : 40 à 50 entrées classées par catégories (confort, cuisine, énergie/eau, sécurité, extérieur)
- Paramètres : commission, frais de service, durées d'expiration, seuils de retrait

---

## 9. Schéma MVP sur Supabase (v2.0)

Principe : mêmes noms que le schéma cible, mais seulement les tables utiles au MVP. On y ajoute les champs SEO (`slug`, dates de fraîcheur).

### 9.1 Tables

```sql
create extension if not exists pg_trgm;
create extension if not exists unaccent;

-- Profils (liés à l'authentification Supabase)
create table public.profiles (
  id             uuid primary key references auth.users(id) on delete cascade,
  first_name     text,
  last_name      text,
  whatsapp_phone text,                       -- format E.164, ex. +2376...
  role           text not null default 'user' check (role in ('user','admin')),
  is_verified    boolean not null default false,   -- badge « Vérifié » attribué à la main
  created_at     timestamptz not null default now()
);

create table public.cities (
  id serial primary key, slug text unique not null, name text not null, active boolean default true
);
create table public.neighborhoods (
  id serial primary key, city_id int not null references cities(id),
  slug text not null, name text not null, intro text,   -- texte unique pour le SEO
  lat numeric(9,6), lng numeric(9,6),
  unique (city_id, slug)
);
create table public.amenities (
  id serial primary key, code text unique not null, category text not null,
  label_fr text not null, label_en text, sort_order int default 0
);

create type listing_status as enum ('draft','pending_review','published','paused','rented','rejected');
create type listing_type   as enum ('studio','apartment','room','duplex');

create table public.listings (
  id                uuid primary key default gen_random_uuid(),
  owner_id          uuid not null references profiles(id),
  slug              text unique not null,                 -- titre-slugifié + 4 à 6 caractères
  type              listing_type not null,
  status            listing_status not null default 'draft',
  title             text not null,
  description       text,
  city_id           int references cities(id),
  neighborhood_id   int references neighborhoods(id),
  landmark          text,                                 -- repère public
  lat numeric(9,6), lng numeric(9,6),                     -- position approximative publique
  bedrooms smallint, bathrooms smallint, max_guests smallint, surface_m2 numeric(6,1),
  price_night int, price_month int,                       -- XAF, entiers
  deposit int not null default 0,
  utilities_included boolean not null default false,
  rules             jsonb not null default '{}',
  verified_badge    boolean not null default false,
  rejection_reason  text,
  published_at      timestamptz,
  last_confirmed_at timestamptz,                          -- dernière confirmation de disponibilité
  updated_content_at timestamptz not null default now(),  -- alimente « mis à jour le » et lastmod
  rented_at         timestamptz,
  created_at        timestamptz not null default now(),
  fts tsvector generated always as (
    to_tsvector('french', unaccent(coalesce(title,'') || ' ' || coalesce(description,'') || ' ' || coalesce(landmark,'')))
  ) stored
);
create index listings_status_idx on listings(status, city_id, neighborhood_id, type);
create index listings_price_idx  on listings(price_night);
create index listings_fts_idx    on listings using gin (fts);
create index listings_title_trgm on listings using gin (title gin_trgm_ops);

create table public.listing_amenities (
  listing_id uuid references listings(id) on delete cascade,
  amenity_id int  references amenities(id),
  quantity   smallint not null default 1,
  primary key (listing_id, amenity_id)
);

create table public.listing_media (
  id uuid primary key default gen_random_uuid(),
  listing_id uuid not null references listings(id) on delete cascade,
  path_full  text not null,      -- 1280 px WebP
  path_thumb text not null,      -- 480 px WebP
  alt        text,
  width int, height int,
  position   smallint not null default 0,
  is_cover   boolean not null default false
);

create table public.favorites (
  user_id uuid references profiles(id) on delete cascade,
  listing_id uuid references listings(id) on delete cascade,
  created_at timestamptz default now(),
  primary key (user_id, listing_id)
);

create table public.reports (
  id uuid primary key default gen_random_uuid(),
  listing_id uuid not null references listings(id) on delete cascade,
  reporter_id uuid references profiles(id),
  reason text not null, details text,
  status text not null default 'open',
  created_at timestamptz default now()
);

create table public.moderation_log (
  id bigserial primary key,
  listing_id uuid not null references listings(id) on delete cascade,
  admin_id uuid references profiles(id),
  decision text not null check (decision in ('approved','rejected','changes')),
  reason text, created_at timestamptz default now()
);
```

### 9.2 Création automatique du profil

```sql
create function public.handle_new_user() returns trigger
language plpgsql security definer set search_path = public as $$
begin
  insert into profiles(id) values (new.id);
  return new;
end $$;
create trigger on_auth_user_created after insert on auth.users
for each row execute function handle_new_user();
```

### 9.3 Politiques RLS (sécurité par ligne)

```sql
alter table profiles          enable row level security;
alter table listings          enable row level security;
alter table listing_amenities enable row level security;
alter table listing_media     enable row level security;
alter table favorites         enable row level security;
alter table reports           enable row level security;

-- Fonction utilitaire : l'utilisateur est-il administrateur ?
create function public.is_admin() returns boolean language sql stable security definer set search_path = public as $$
  select exists (select 1 from profiles where id = auth.uid() and role = 'admin')
$$;

-- Référentiels : lecture publique
alter table cities enable row level security;
alter table neighborhoods enable row level security;
alter table amenities enable row level security;
create policy "ref read" on cities        for select using (true);
create policy "ref read" on neighborhoods for select using (true);
create policy "ref read" on amenities     for select using (true);

-- Profils : chacun voit et modifie le sien ; le numéro WhatsApp n'est lu que via le serveur
create policy "own profile read"   on profiles for select using (id = auth.uid() or is_admin());
create policy "own profile update" on profiles for update using (id = auth.uid())
  with check (id = auth.uid() and role = 'user');   -- impossible de s'auto-promouvoir

-- Annonces
create policy "public read published" on listings for select
  using (status in ('published','rented') or owner_id = auth.uid() or is_admin());
create policy "owner insert" on listings for insert with check (owner_id = auth.uid());
create policy "owner update" on listings for update using (owner_id = auth.uid() or is_admin())
  with check (owner_id = auth.uid() or is_admin());
create policy "owner delete draft" on listings for delete
  using (owner_id = auth.uid() and status = 'draft');

-- Équipements et photos : suivent l'annonce
create policy "lm read" on listing_media for select using (
  exists (select 1 from listings l where l.id = listing_id
          and (l.status in ('published','rented') or l.owner_id = auth.uid() or is_admin())));
create policy "lm write" on listing_media for all using (
  exists (select 1 from listings l where l.id = listing_id and (l.owner_id = auth.uid() or is_admin())))
  with check (
  exists (select 1 from listings l where l.id = listing_id and (l.owner_id = auth.uid() or is_admin())));
-- (même schéma pour listing_amenities)

-- Favoris
create policy "own favorites" on favorites for all using (user_id = auth.uid()) with check (user_id = auth.uid());

-- Signalements : tout utilisateur connecté peut signaler ; seuls les admins lisent
create policy "report insert" on reports for insert with check (auth.uid() is not null);
create policy "report admin read" on reports for select using (is_admin());
```

### 9.4 Interdire au propriétaire de se publier lui-même

```sql
create function public.guard_listing_status() returns trigger
language plpgsql security definer set search_path = public as $$
begin
  if not (is_admin() or coalesce(auth.role(), '') = 'service_role') then
    -- un propriétaire ne peut jamais choisir published ni rejected
    if new.status in ('published','rejected') and new.status is distinct from old.status then
      raise exception 'Statut non autorisé';
    end if;
    -- une annonce publiée modifiée sur le fond repasse en validation (anti-abus)
    if old.status = 'published' and new.status = 'published'
       and (new.title is distinct from old.title or new.description is distinct from old.description) then
      new.status := 'pending_review';
    end if;
  end if;
  new.updated_content_at := case
    when new.title is distinct from old.title or new.description is distinct from old.description
      or new.price_night is distinct from old.price_night or new.price_month is distinct from old.price_month
    then now() else old.updated_content_at end;
  return new;
end $$;
create trigger listings_guard before update on listings
for each row execute function guard_listing_status();
```

### 9.5 Stockage des photos (Supabase Storage)

| Bucket | Accès | Contenu |
|---|---|---|
| `listing-photos` | Lecture publique, écriture réservée au propriétaire de l'annonce | `{listing_id}/{uuid}-full.webp` et `-thumb.webp` |
| `kyc-private` (phase 2) | Privé, URL signées | Pièces d'identité |

- Règle d'écriture : le chemin doit commencer par l'identifiant d'une annonce appartenant à l'utilisateur.
- Compression côté navigateur : WebP, 1280 px et 480 px, qualité ~0,78, ≈ 150 à 250 Ko par photo → environ 4 000 à 6 000 photos dans 1 Go.
- Supprimer les fichiers orphelins quand une annonce est supprimée (tâche planifiée gratuite via GitHub Actions ou fonction Supabase).

### 9.6 Requêtes principales (côté serveur Next.js)

```ts
// Liste d'un quartier + type (page indexable)
const { data } = await supabase
  .from('listings')
  .select(`id, slug, title, price_night, price_month, bedrooms, landmark, updated_content_at, verified_badge,
           neighborhoods(slug,name), cities(slug,name),
           listing_media(path_thumb, alt, is_cover, position),
           listing_amenities(amenities(code,label_fr))`)
  .eq('status', 'published')
  .eq('neighborhood_id', neighborhoodId)
  .eq('type', type)
  .order('verified_badge', { ascending: false })
  .order('updated_content_at', { ascending: false })
  .range(from, to);

// Recherche texte
.textSearch('fts', query, { type: 'websearch', config: 'french' })

// Fiche par slug (client anon + RLS : annonces publiées ou louées uniquement)
.from('listings').select('*, listing_media(*), listing_amenities(*, amenities(*))')
.eq('slug', slug).in('status', ['published','rented']).single();

// Contact du propriétaire : requête séparée, côté serveur uniquement, avec la clé service_role
// (la RLS de `profiles` empêche la lecture publique du numéro)
adminSupabase.from('profiles').select('first_name, whatsapp_phone, is_verified').eq('id', listing.owner_id).single();
```

Le numéro WhatsApp n'est lu que dans du code serveur, jamais dans une requête navigateur ; la colonne est donc masquée par une vue ou lue avec la clé `service_role` côté serveur uniquement.

### 9.7 Tâches planifiées (gratuites)

| Tâche | Fréquence | Outil |
|---|---|---|
| Rappel de confirmation de disponibilité à J+25 | Quotidienne | GitHub Actions + script, ou Supabase `pg_cron` |
| Passage en `paused` à J+30 sans réponse | Quotidienne | `pg_cron` |
| Redirection / archivage des annonces `rented` > 90 jours | Hebdomadaire | `pg_cron` |
| Régénération de pages et notification IndexNow | À chaque changement | `revalidatePath` + appel IndexNow |

### 9.7 bis Passage vers le schéma cible

Pour la phase 2, ajouter progressivement : `bookings`, `payments`, `ledger_entries`, `conversations`/`messages`, `reviews`, `disputes` (sections 3.4 à 3.7), sans renommer les tables du MVP.
