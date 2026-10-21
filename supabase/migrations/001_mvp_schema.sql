-- ============================================================
-- MeubléFacile — Schéma MVP Supabase
-- Version 2.0 — 13 octobre 2026
-- Référence : 05-Backend-Schemas.md §9
-- ============================================================
-- À exécuter dans : Supabase Dashboard → SQL Editor

-- Extensions
create extension if not exists pg_trgm;
create extension if not exists unaccent;

-- ============================================================
-- TYPES ENUM
-- ============================================================
create type listing_status as enum (
  'draft',
  'pending_review',
  'published',
  'paused',
  'rented',
  'rejected'
);

create type listing_type as enum (
  'studio',
  'apartment',
  'room',
  'duplex'
);

-- ============================================================
-- TABLE : profiles
-- Liée à auth.users (créée automatiquement par trigger)
-- ============================================================
create table public.profiles (
  id             uuid primary key references auth.users(id) on delete cascade,
  first_name     text,
  last_name      text,
  whatsapp_phone text,                        -- format E.164 ex. +2376...
  role           text not null default 'user'
                 check (role in ('user', 'admin')),
  is_verified    boolean not null default false,
  created_at     timestamptz not null default now()
);

-- Trigger : crée automatiquement un profil à l'inscription
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (id)
  values (new.id);
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- ============================================================
-- TABLE : cities
-- ============================================================
create table public.cities (
  id     serial primary key,
  slug   text unique not null,
  name   text not null,
  active boolean not null default true
);

-- ============================================================
-- TABLE : neighborhoods
-- ============================================================
create table public.neighborhoods (
  id      serial primary key,
  city_id int not null references public.cities(id) on delete cascade,
  slug    text not null,
  name    text not null,
  intro   text,                               -- texte SEO unique (150-300 mots)
  lat     numeric(9, 6),
  lng     numeric(9, 6),
  unique (city_id, slug)
);

-- ============================================================
-- TABLE : amenities (équipements)
-- ============================================================
create table public.amenities (
  id         serial primary key,
  code       text unique not null,
  category   text not null
             check (category in ('comfort', 'kitchen', 'power_water', 'security', 'outdoor')),
  label_fr   text not null,
  label_en   text,
  sort_order int not null default 0
);

-- ============================================================
-- TABLE : listings (annonces)
-- ============================================================
create table public.listings (
  id                  uuid primary key default gen_random_uuid(),
  owner_id            uuid not null references public.profiles(id) on delete cascade,
  slug                text unique not null,
  type                listing_type not null,
  status              listing_status not null default 'draft',
  title               text not null,
  description         text,
  city_id             int references public.cities(id),
  neighborhood_id     int references public.neighborhoods(id),
  landmark            text,
  lat                 numeric(9, 6),
  lng                 numeric(9, 6),
  bedrooms            smallint,
  bathrooms           smallint,
  max_guests          smallint,
  surface_m2          numeric(6, 1),
  price_night         int,                    -- XAF, entiers
  price_month         int,                    -- XAF, entiers
  deposit             int not null default 0,
  utilities_included  boolean not null default false,
  rules               jsonb not null default '{}',
  verified_badge      boolean not null default false,
  rejection_reason    text,
  published_at        timestamptz,
  last_confirmed_at   timestamptz,
  updated_content_at  timestamptz not null default now(),
  rented_at           timestamptz,
  created_at          timestamptz not null default now(),
  -- Recherche plein texte (calculée par trigger pour compatibilité unaccent)
  fts                 tsvector
);

-- Index de recherche
create index listings_status_idx on public.listings(status, city_id, neighborhood_id, type);
create index listings_price_idx  on public.listings(price_night);
create index listings_fts_idx    on public.listings using gin(fts);
create index listings_title_trgm on public.listings using gin(title gin_trgm_ops);
create index listings_owner_idx  on public.listings(owner_id, status);

-- Trigger FTS : calcule la recherche plein texte (FR + sans accents)
create or replace function public.listings_update_fts()
returns trigger language plpgsql as $$
begin
  new.fts := to_tsvector(
    'french',
    unaccent(
      coalesce(new.title, '') || ' ' ||
      coalesce(new.description, '') || ' ' ||
      coalesce(new.landmark, '')
    )
  );
  return new;
end;
$$;

create trigger trg_listings_fts
  before insert or update on public.listings
  for each row execute function public.listings_update_fts();

-- Trigger : met à jour updated_content_at quand le contenu change
create or replace function public.update_listing_content_date()
returns trigger language plpgsql as $$
begin
  if (
    old.title is distinct from new.title or
    old.description is distinct from new.description or
    old.price_night is distinct from new.price_night or
    old.price_month is distinct from new.price_month or
    old.status is distinct from new.status
  ) then
    new.updated_content_at = now();
  end if;
  return new;
end;
$$;

create trigger listings_update_content_date
  before update on public.listings
  for each row execute function public.update_listing_content_date();

-- ============================================================
-- TABLE : listing_amenities
-- ============================================================
create table public.listing_amenities (
  listing_id uuid references public.listings(id) on delete cascade,
  amenity_id int  references public.amenities(id) on delete cascade,
  quantity   smallint not null default 1,
  primary key (listing_id, amenity_id)
);

-- ============================================================
-- TABLE : listing_media (photos)
-- ============================================================
create table public.listing_media (
  id         uuid primary key default gen_random_uuid(),
  listing_id uuid not null references public.listings(id) on delete cascade,
  path_full  text not null,                   -- chemin Supabase Storage (1280px WebP)
  path_thumb text not null,                   -- chemin Supabase Storage (480px WebP)
  alt        text,
  width      int,
  height     int,
  position   smallint not null default 0,
  is_cover   boolean not null default false,
  created_at timestamptz not null default now()
);

create index listing_media_listing_idx on public.listing_media(listing_id, position);

-- ============================================================
-- TABLE : favorites
-- ============================================================
create table public.favorites (
  user_id    uuid references public.profiles(id) on delete cascade,
  listing_id uuid references public.listings(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (user_id, listing_id)
);

-- ============================================================
-- TABLE : reports (signalements)
-- ============================================================
create table public.reports (
  id          uuid primary key default gen_random_uuid(),
  listing_id  uuid not null references public.listings(id) on delete cascade,
  reporter_id uuid references public.profiles(id) on delete set null,
  reason      text not null,
  details     text,
  status      text not null default 'open'
              check (status in ('open', 'handled', 'dismissed')),
  created_at  timestamptz not null default now()
);

-- ============================================================
-- TABLE : moderation_log
-- ============================================================
create table public.moderation_log (
  id         bigserial primary key,
  listing_id uuid not null references public.listings(id) on delete cascade,
  admin_id   uuid references public.profiles(id) on delete set null,
  decision   text not null check (decision in ('approved', 'rejected', 'changes')),
  reason     text,
  created_at timestamptz not null default now()
);

-- ============================================================
-- ROW LEVEL SECURITY
-- ============================================================
alter table public.profiles          enable row level security;
alter table public.cities            enable row level security;
alter table public.neighborhoods     enable row level security;
alter table public.amenities         enable row level security;
alter table public.listings          enable row level security;
alter table public.listing_amenities enable row level security;
alter table public.listing_media     enable row level security;
alter table public.favorites         enable row level security;
alter table public.reports           enable row level security;
alter table public.moderation_log    enable row level security;

-- Fonction utilitaire : est-ce un admin ?
create or replace function public.is_admin()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1 from public.profiles
    where id = auth.uid() and role = 'admin'
  );
$$;

-- Référentiels : lecture publique anonyme
create policy "cities public read"        on public.cities        for select using (true);
create policy "neighborhoods public read" on public.neighborhoods for select using (true);
create policy "amenities public read"     on public.amenities     for select using (true);

-- Profils
create policy "profiles own read"   on public.profiles for select
  using (id = auth.uid() or is_admin());
create policy "profiles own update" on public.profiles for update
  using (id = auth.uid())
  with check (id = auth.uid() and role = 'user'); -- impossible de s'auto-promouvoir admin

-- Annonces : lecture publique pour published/rented, propriétaire voit ses brouillons
create policy "listings public read" on public.listings for select
  using (
    status in ('published', 'rented')
    or owner_id = auth.uid()
    or is_admin()
  );
create policy "listings owner insert" on public.listings for insert
  with check (owner_id = auth.uid());
create policy "listings owner update" on public.listings for update
  using (owner_id = auth.uid() or is_admin())
  with check (owner_id = auth.uid() or is_admin());
create policy "listings owner delete draft" on public.listings for delete
  using (owner_id = auth.uid() and status = 'draft');

-- Photos : suivent les droits de l'annonce
create policy "listing_media public read" on public.listing_media for select
  using (
    exists (
      select 1 from public.listings l
      where l.id = listing_id
        and (l.status in ('published', 'rented') or l.owner_id = auth.uid() or is_admin())
    )
  );
create policy "listing_media owner write" on public.listing_media for all
  using (
    exists (
      select 1 from public.listings l
      where l.id = listing_id and (l.owner_id = auth.uid() or is_admin())
    )
  )
  with check (
    exists (
      select 1 from public.listings l
      where l.id = listing_id and (l.owner_id = auth.uid() or is_admin())
    )
  );

-- Équipements : même logique
create policy "listing_amenities public read" on public.listing_amenities for select
  using (
    exists (
      select 1 from public.listings l
      where l.id = listing_id
        and (l.status in ('published', 'rented') or l.owner_id = auth.uid() or is_admin())
    )
  );
create policy "listing_amenities owner write" on public.listing_amenities for all
  using (
    exists (
      select 1 from public.listings l
      where l.id = listing_id and (l.owner_id = auth.uid() or is_admin())
    )
  )
  with check (
    exists (
      select 1 from public.listings l
      where l.id = listing_id and (l.owner_id = auth.uid() or is_admin())
    )
  );

-- Favoris : utilisateur voit et modifie les siens
create policy "favorites own" on public.favorites for all
  using (user_id = auth.uid())
  with check (user_id = auth.uid());

-- Signalements
create policy "reports insert" on public.reports for insert
  with check (auth.uid() is not null);
create policy "reports admin read" on public.reports for select
  using (is_admin());
create policy "reports admin update" on public.reports for update
  using (is_admin());

-- Journal de modération : admins uniquement
create policy "moderation_log admin" on public.moderation_log for all
  using (is_admin())
  with check (is_admin());
