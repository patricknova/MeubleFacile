-- ============================================================
-- MeubléFacile — Données initiales (Seed avec lieux réels Douala)
-- À exécuter APRÈS 001_mvp_schema.sql dans : Supabase SQL Editor
-- 100% Idempotent : sécurisé contre les incohérences d'ID
-- ============================================================

-- ── 1. Ville : Douala ──
insert into public.cities (slug, name, active) values
  ('douala', 'Douala', true),
  ('yaounde', 'Yaoundé', false)
on conflict (slug) do update set
  name = excluded.name,
  active = excluded.active;

-- ── 2. Quartiers de Douala (Résolution dynamique du city_id) ──
insert into public.neighborhoods (city_id, slug, name, intro, lat, lng)
select c.id, n.slug, n.name, n.intro, n.lat, n.lng
from public.cities c
cross join (values
  ('akwa',          'Akwa',          'Akwa est le cœur commercial de Douala, quartier animé avec de nombreux commerces, hôtels et restaurants. Idéal pour les professionnels en déplacement et les consultants.', 4.0483::numeric(9,6), 9.6960::numeric(9,6)),
  ('bonanjo',       'Bonanjo',       'Bonanjo est le quartier des affaires de Douala, abritant les ambassades, banques et grandes entreprises. Très recherché pour les locations courte durée.', 4.0411::numeric(9,6), 9.6900::numeric(9,6)),
  ('bonapriso',     'Bonapriso',     'Bonapriso est un quartier résidentiel huppé de Douala, apprécié pour son calme, ses restaurants et sa proximité avec les zones d''affaires.', 4.0550::numeric(9,6), 9.6880::numeric(9,6)),
  ('bonamoussadi',  'Bonamoussadi',  'Bonamoussadi est un quartier résidentiel dynamique de Douala, avec de nombreux supermarchés, restaurants et accès facile aux grandes artères.', 4.0750::numeric(9,6), 9.7350::numeric(9,6)),
  ('makepe',        'Makepe',        'Makepe est un quartier en plein essor, offrant un bon rapport qualité-prix pour les logements meublés, proche des universités et grandes entreprises.', 4.0820::numeric(9,6), 9.7500::numeric(9,6)),
  ('deido',         'Deido',         'Deido est un quartier populaire et authentique de Douala, bien desservi par les transports en commun et proche du centre-ville.', 4.0560::numeric(9,6), 9.7100::numeric(9,6)),
  ('logbessou',     'Logbessou',     'Logbessou est un quartier résidentiel calme en expansion, apprécié pour ses logements spacieux et son environnement verdoyant.', 4.1000::numeric(9,6), 9.7600::numeric(9,6)),
  ('bepanda',       'Bepanda',       'Bepanda est un quartier populaire et vivant, accessible et bien connecté aux autres parties de la ville.', 4.0700::numeric(9,6), 9.7200::numeric(9,6)),
  ('kotto',         'Kotto',         'Kotto est un quartier résidentiel tranquille, apprécié pour ses logements modernes et sa proximité avec Bonamoussadi.', 4.0900::numeric(9,6), 9.7400::numeric(9,6)),
  ('logpom',        'Logpom',        'Logpom est un quartier en développement rapide, offrant des logements meublés à des prix abordables avec de bonnes connexions routières.', 4.0650::numeric(9,6), 9.7550::numeric(9,6)),
  ('ndokoti',       'Ndokoti',       'Ndokoti est un carrefour commercial incontournable de Douala, très animé et facilement accessible depuis toutes les parties de la ville.', 4.0600::numeric(9,6), 9.7150::numeric(9,6)),
  ('bali',          'Bali',          'Bali est un quartier mixte de Douala, offrant un bon équilibre entre commodités et tranquillité, apprécié des familles et jeunes professionnels.', 4.0480::numeric(9,6), 9.7050::numeric(9,6))
) as n(slug, name, intro, lat, lng)
where c.slug = 'douala'
on conflict (city_id, slug) do update set
  name = excluded.name,
  intro = excluded.intro,
  lat = excluded.lat,
  lng = excluded.lng;

-- ── 3. Équipements (~40 items) ──
insert into public.amenities (code, category, label_fr, label_en, sort_order) values
  -- Confort
  ('ac',           'comfort',     'Climatisation',            'Air conditioning',      1),
  ('fan',          'comfort',     'Ventilateur',              'Fan',                   2),
  ('bed_double',   'comfort',     'Lit double',               'Double bed',            3),
  ('bed_single',   'comfort',     'Lit simple',               'Single bed',            4),
  ('wardrobe',     'comfort',     'Armoire / Placard',        'Wardrobe',              5),
  ('tv',           'comfort',     'Télévision',               'TV',                    6),
  ('sofa',         'comfort',     'Canapé',                   'Sofa',                  7),
  ('wifi',         'comfort',     'Wifi',                     'WiFi',                  8),
  ('desk',         'comfort',     'Bureau de travail',        'Work desk',             9),
  ('iron',         'comfort',     'Fer à repasser',           'Iron',                  10),
  ('washing',      'comfort',     'Machine à laver',          'Washing machine',       11),

  -- Cuisine
  ('kitchen',      'kitchen',     'Cuisine équipée',          'Equipped kitchen',      1),
  ('fridge',       'kitchen',     'Réfrigérateur',            'Fridge',                2),
  ('microwave',    'kitchen',     'Micro-ondes',              'Microwave',             3),
  ('gas_stove',    'kitchen',     'Cuisinière à gaz',         'Gas stove',             4),
  ('electric_stove','kitchen',    'Plaque électrique',        'Electric stove',        5),
  ('dishes',       'kitchen',     'Vaisselle fournie',        'Dishes provided',       6),
  ('freezer',      'kitchen',     'Congélateur',              'Freezer',               7),
  ('kettle',       'kitchen',     'Bouilloire',               'Kettle',                8),

  -- Énergie & Eau
  ('generator',    'power_water', 'Groupe électrogène',       'Generator',             1),
  ('inverter',     'power_water', 'Onduleur / Inverter',      'Power inverter',        2),
  ('solar',        'power_water', 'Panneau solaire',          'Solar panel',           3),
  ('water_tank',   'power_water', 'Réservoir d''eau',         'Water tank',            4),
  ('water_pump',   'power_water', 'Surpresseur / Pompe',      'Water pump',            5),
  ('permanent_water','power_water','Eau permanente',          'Permanent water',       6),
  ('permanent_power','power_water','Courant permanent (pas de délestage)', 'Permanent electricity', 7),

  -- Sécurité
  ('guard',        'security',    'Gardien',                  'Security guard',        1),
  ('gated',        'security',    'Résidence sécurisée',      'Gated compound',        2),
  ('intercom',     'security',    'Interphone',               'Intercom',              3),
  ('cctv',         'security',    'Caméra de surveillance',   'CCTV',                  4),
  ('safe',         'security',    'Coffre-fort',              'Safe',                  5),

  -- Extérieur
  ('parking',      'outdoor',     'Parking inclus',           'Parking',               1),
  ('garden',       'outdoor',     'Jardin / Cour',            'Garden/Yard',           2),
  ('terrace',      'outdoor',     'Terrasse / Balcon',        'Terrace/Balcony',       3),
  ('pool',         'outdoor',     'Piscine',                  'Swimming pool',         4),
  ('elevator',     'outdoor',     'Ascenseur',                'Elevator',              5),
  ('gym',          'outdoor',     'Salle de sport',           'Gym',                   6)
on conflict (code) do nothing;

-- ── 4. Propriétaire Démo dans auth.users et public.profiles ──
do $$
declare
  demo_user_id uuid := '00000000-0000-0000-0000-000000000001'::uuid;
begin
  if not exists (select 1 from auth.users where id = demo_user_id) then
    insert into auth.users (id, email, raw_user_meta_data, role, aud)
    values (
      demo_user_id,
      'bailleur.douala@meublefacile.cm',
      '{"first_name":"Alexandre","last_name":"Kamga"}'::jsonb,
      'authenticated',
      'authenticated'
    );
  end if;

  insert into public.profiles (id, first_name, last_name, whatsapp_phone, role, is_verified)
  values (demo_user_id, 'Alexandre', 'Kamga', '+237699000001', 'admin', true)
  on conflict (id) do update set
    first_name = 'Alexandre',
    last_name = 'Kamga',
    whatsapp_phone = '+237699000001',
    is_verified = true,
    role = 'admin';
end $$;

-- ── 5. Annonces Réelles avec Lieux Google Maps & Photos ──
do $$
declare
  demo_owner uuid := '00000000-0000-0000-0000-000000000001'::uuid;
  c_douala_id int;
  l1 uuid := '11111111-1111-1111-1111-111111111101'::uuid;
  l2 uuid := '11111111-1111-1111-1111-111111111102'::uuid;
  l3 uuid := '11111111-1111-1111-1111-111111111103'::uuid;
  l4 uuid := '11111111-1111-1111-1111-111111111104'::uuid;
  l5 uuid := '11111111-1111-1111-1111-111111111105'::uuid;
  l6 uuid := '11111111-1111-1111-1111-111111111106'::uuid;
begin
  -- Récupération dynamique de l'ID de la ville de Douala
  select id into c_douala_id from public.cities where slug = 'douala';

  -- Logement 1 : Studio VIP Bonapriso
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    l1, demo_owner, 'studio-meuble-vip-bonapriso-douala', 'studio', 'published',
    'Studio Meublé VIP avec Balcon — Bonapriso',
    'Magnifique studio grand standing situé au cœur du quartier résidentiel de Bonapriso. Climatisation silencieuse, Wi-Fi fibre optique illimité, groupe électrogène automatique et réserve d''eau avec surpresseur. Idéal pour séjours d''affaires ou vacances paisibles.',
    c_douala_id, (select id from public.neighborhoods where slug = 'bonapriso'),
    'À 250 m du supermarché SPAR et de la Clinique Mermoz',
    4.0152, 9.6924,
    1, 1, 2, 45,
    35000, 550000, 50000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true, now() - interval '2 days', now()
  ) on conflict (id) do nothing;

  -- Photos Logement 1
  insert into public.listing_media (id, listing_id, path_full, path_thumb, is_cover, position, alt) values
    ('22222222-0001-0000-0000-000000000001'::uuid, l1, 'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=1200&auto=format&fit=crop&q=80', 'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=600&auto=format&fit=crop&q=80', true, 0, 'Salon lumineux studio Bonapriso'),
    ('22222222-0001-0000-0000-000000000002'::uuid, l1, 'https://images.unsplash.com/photo-1540518614846-7ede433c4550?w=1200&auto=format&fit=crop&q=80', 'https://images.unsplash.com/photo-1540518614846-7ede433c4550?w=600&auto=format&fit=crop&q=80', false, 1, 'Chambre avec lit queen-size'),
    ('22222222-0001-0000-0000-000000000003'::uuid, l1, 'https://images.unsplash.com/photo-1556911220-e15b29be8c8f?w=1200&auto=format&fit=crop&q=80', 'https://images.unsplash.com/photo-1556911220-e15b29be8c8f?w=600&auto=format&fit=crop&q=80', false, 2, 'Cuisine américaine toute équipée')
  on conflict (id) do nothing;

  -- Logement 2 : Appartement Standing Akwa
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    l2, demo_owner, 'appartement-standing-liberte-akwa-douala', 'apartment', 'published',
    'Appartement Standing 3 Pièces — Boulevard de la Liberté, Akwa',
    'Spacieux appartement climatisé au cœur d''Akwa, centre des affaires de Douala. Deux chambres avec salles de bain privatives, grand salon moderne, cuisine aménagée, gardiennage 24/7 et parking sécurisé.',
    c_douala_id, (select id from public.neighborhoods where slug = 'akwa'),
    'Boulevard de la Liberté, face à l''Hôtel Akwa Palace',
    4.0495, 9.6980,
    2, 2, 4, 85,
    45000, 750000, 100000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true, now() - interval '5 days', now()
  ) on conflict (id) do nothing;

  -- Photos Logement 2
  insert into public.listing_media (id, listing_id, path_full, path_thumb, is_cover, position, alt) values
    ('22222222-0002-0000-0000-000000000001'::uuid, l2, 'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=1200&auto=format&fit=crop&q=80', 'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=600&auto=format&fit=crop&q=80', true, 0, 'Grand salon contemporain Akwa'),
    ('22222222-0002-0000-0000-000000000002'::uuid, l2, 'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?w=1200&auto=format&fit=crop&q=80', 'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?w=600&auto=format&fit=crop&q=80', false, 1, 'Chambre principale climatisée'),
    ('22222222-0002-0000-0000-000000000003'::uuid, l2, 'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=1200&auto=format&fit=crop&q=80', 'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=600&auto=format&fit=crop&q=80', false, 2, 'Salle de bain moderne')
  on conflict (id) do nothing;

  -- Logement 3 : Appartement Bonamoussadi
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    l3, demo_owner, 'appartement-cosy-carrefour-market-bonamoussadi-douala', 'apartment', 'published',
    'Appartement Cosy Familial — Proche Carrefour Market, Bonamoussadi',
    'Logement chaleureux idéal pour les familles ou séjours prolongés. Proche de tous les commerces, restaurants et transports de Bonamoussadi. Énergie garantie (groupe) et eau permanente.',
    c_douala_id, (select id from public.neighborhoods where slug = 'bonamoussadi'),
    'À 300 m du Carrefour Market Bonamoussadi',
    4.0760, 9.7345,
    2, 1, 4, 70,
    30000, 480000, 50000, true,
    '{"smoking": false, "pets": true, "visitors": true}'::jsonb,
    true, now() - interval '1 day', now()
  ) on conflict (id) do nothing;

  -- Photos Logement 3
  insert into public.listing_media (id, listing_id, path_full, path_thumb, is_cover, position, alt) values
    ('22222222-0003-0000-0000-000000000001'::uuid, l3, 'https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=1200&auto=format&fit=crop&q=80', 'https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=600&auto=format&fit=crop&q=80', true, 0, 'Salon cosy Bonamoussadi'),
    ('22222222-0003-0000-0000-000000000002'::uuid, l3, 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=1200&auto=format&fit=crop&q=80', 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=600&auto=format&fit=crop&q=80', false, 1, 'Chambre lumineuse')
  on conflict (id) do nothing;

  -- Logement 4 : Studio Makepe
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    l4, demo_owner, 'studio-lumineux-rhone-poulenc-makepe-douala', 'studio', 'published',
    'Studio Meublé Lumineux — Carrefour Rhône-Poulenc, Makepe',
    'Studio moderne, propre et très calme, situé à quelques minutes de l''Hôpital Général de Douala. Excellente ventilation, climatiseur neuf, bureau de travail avec connexion Wi-Fi rapide.',
    c_douala_id, (select id from public.neighborhoods where slug = 'makepe'),
    'Carrefour Rhône-Poulenc, proche Hôpital Général',
    4.0830, 9.7512,
    1, 1, 2, 38,
    22000, 320000, 40000, true,
    '{"smoking": false, "pets": false, "visitors": false}'::jsonb,
    true, now() - interval '3 days', now()
  ) on conflict (id) do nothing;

  -- Photos Logement 4
  insert into public.listing_media (id, listing_id, path_full, path_thumb, is_cover, position, alt) values
    ('22222222-0004-0000-0000-000000000001'::uuid, l4, 'https://images.unsplash.com/photo-1484154218962-a197022b5858?w=1200&auto=format&fit=crop&q=80', 'https://images.unsplash.com/photo-1484154218962-a197022b5858?w=600&auto=format&fit=crop&q=80', true, 0, 'Studio Makepe vue générale')
  on conflict (id) do nothing;

  -- Logement 5 : Duplex Prestige Denver (Kotto)
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    l5, demo_owner, 'duplex-prestige-jardin-denver-kotto-douala', 'duplex', 'published',
    'Duplex de Prestige avec Jardin Privé — Denver, Kotto',
    'Superbe duplex avec finitions luxueuses, jardin privé arboré, terrasse spacieuse et portail automatique. Sécurité renforcée avec caméras CCTV et gardien 24h/24. Calme absolu garanti.',
    c_douala_id, (select id from public.neighborhoods where slug = 'kotto'),
    'Denver Résidentiel, quartier calme et hautement sécurisé',
    4.0920, 9.7420,
    3, 3, 6, 160,
    65000, 1100000, 150000, true,
    '{"smoking": false, "pets": true, "visitors": true}'::jsonb,
    true, now() - interval '4 days', now()
  ) on conflict (id) do nothing;

  -- Photos Logement 5
  insert into public.listing_media (id, listing_id, path_full, path_thumb, is_cover, position, alt) values
    ('22222222-0005-0000-0000-000000000001'::uuid, l5, 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=1200&auto=format&fit=crop&q=80', 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=600&auto=format&fit=crop&q=80', true, 0, 'Façade et salon duplex Denver'),
    ('22222222-0005-0000-0000-000000000002'::uuid, l5, 'https://images.unsplash.com/photo-1600565193348-f74bd3c7ccdf?w=1200&auto=format&fit=crop&q=80', 'https://images.unsplash.com/photo-1600565193348-f74bd3c7ccdf?w=600&auto=format&fit=crop&q=80', false, 1, 'Suite parentale spacieuse')
  on conflict (id) do nothing;

  -- Logement 6 : Chambre Meublée Bonanjo
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    l6, demo_owner, 'chambre-affaires-place-gouvernement-bonanjo-douala', 'room', 'published',
    'Chambre Meublée d''Affaires — Place du Gouvernement, Bonanjo',
    'Chambre indépendante grand confort dans un immeuble de standing à Bonanjo. Parfait pour les consultants et voyageurs d''affaires ayant des rendez-vous au quartier administratif et au Port.',
    c_douala_id, (select id from public.neighborhoods where slug = 'bonanjo'),
    'Place du Gouvernement, à 5 min du Port de Douala',
    4.0415, 9.6910,
    1, 1, 2, 32,
    25000, 380000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true, now() - interval '6 days', now()
  ) on conflict (id) do nothing;

  -- Photos Logement 6
  insert into public.listing_media (id, listing_id, path_full, path_thumb, is_cover, position, alt) values
    ('22222222-0006-0000-0000-000000000001'::uuid, l6, 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=1200&auto=format&fit=crop&q=80', 'https://images.unsplash.com/photo-1590490360182-c33d57733427?w=600&auto=format&fit=crop&q=80', true, 0, 'Chambre moderne Bonanjo')
  on conflict (id) do nothing;

  -- Équipements associés aux annonces
  -- L1 (Studio Bonapriso) : Climatisation, Wifi, Groupe, Eau, Gardien, Cuisine, TV, Frigo
  insert into public.listing_amenities (listing_id, amenity_id, quantity)
  select l1, id, 1 from public.amenities where code in ('ac', 'wifi', 'generator', 'water_tank', 'guard', 'kitchen', 'tv', 'fridge')
  on conflict (listing_id, amenity_id) do nothing;

  -- L2 (Appartement Akwa) : Climatisation, Wifi, Groupe, Eau, Gardien, Parking, Machine à laver, Cuisine, TV
  insert into public.listing_amenities (listing_id, amenity_id, quantity)
  select l2, id, 1 from public.amenities where code in ('ac', 'wifi', 'generator', 'water_tank', 'guard', 'parking', 'washing', 'kitchen', 'tv')
  on conflict (listing_id, amenity_id) do nothing;

  -- L3 (Bonamoussadi) : Climatisation, Wifi, Groupe, Eau, Cuisine, Frigo
  insert into public.listing_amenities (listing_id, amenity_id, quantity)
  select l3, id, 1 from public.amenities where code in ('ac', 'wifi', 'generator', 'water_tank', 'kitchen', 'fridge')
  on conflict (listing_id, amenity_id) do nothing;

  -- L5 (Denver) : Climatisation, Wifi, Groupe, Eau, Gardien, Jardin, Parking, CCTV, Cuisine
  insert into public.listing_amenities (listing_id, amenity_id, quantity)
  select l5, id, 1 from public.amenities where code in ('ac', 'wifi', 'generator', 'water_tank', 'guard', 'garden', 'parking', 'cctv', 'kitchen')
  on conflict (listing_id, amenity_id) do nothing;

end $$;
