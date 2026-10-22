-- ============================================================
-- Données Réelles Scrapées sur Google Maps (Douala)
-- Généré automatiquement par scripts/import-scraped-to-supabase.mjs
-- ============================================================

do $$
declare
  demo_owner uuid := '00000000-0000-0000-0000-000000000001'::uuid;
  c_douala_id int;
  v_listing_id uuid;
begin
  select id into c_douala_id from public.cities where slug = 'douala';

  -- [1] Le Petit Cocon (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'le-petit-cocon-bonapriso',
    'apartment',
    'published',
    'Le Petit Cocon',
    'Le Petit Cocon
Adresse : Av. de l''Indépendance, Douala.
Contact / WhatsApp : +237 675 44 16 80.
Note Google Maps : 4.5/5 (2 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Av. de l''Indépendance, Douala',
    4.019951,
    9.7026,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfYeTscHjzQBPazT8VFfXwjDoZmMR9FGdd0_4h_-0OJxPnpzi6ecYPO-XUtUdLLG-piFTL-Q-KGt4_8HC8szgL9-MZv3V9cxn_UQ_lSyd3HdRdd1HAc_anNMaQOMmTmpawv425eOtkQ8E9y=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfYeTscHjzQBPazT8VFfXwjDoZmMR9FGdd0_4h_-0OJxPnpzi6ecYPO-XUtUdLLG-piFTL-Q-KGt4_8HC8szgL9-MZv3V9cxn_UQ_lSyd3HdRdd1HAc_anNMaQOMmTmpawv425eOtkQ8E9y=s1600', true, 0, 'Le Petit Cocon')
  on conflict do nothing;

  -- [2] HOTEL A8 CLOS (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'hotel-a8-clos-bonapriso',
    'apartment',
    'published',
    'HOTEL A8 CLOS',
    'HOTEL A8 CLOS
Adresse : 3P2M+G4F, Douala.
Contact / WhatsApp : +237 692 92 23 11.
Note Google Maps : 5/5 (1 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3P2M+G4F, Douala',
    4.051376,
    9.732719,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1QM6x1xJwWvYn_rHNu0b4_--BO7IYay1I4DGufcgr4eok4UyUa8sL_RfFlleDAAeVXopboxSy7cJQlMTR4Rpxb389AB_s-s15i5KLCqWM4CHH0DS-D0MmR6276cgKmfseBSfKHo6DvV4TXi-qc7MskvrbaeL4QrZOsLBR93e6whd6NJk4teCzz=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1QM6x1xJwWvYn_rHNu0b4_--BO7IYay1I4DGufcgr4eok4UyUa8sL_RfFlleDAAeVXopboxSy7cJQlMTR4Rpxb389AB_s-s15i5KLCqWM4CHH0DS-D0MmR6276cgKmfseBSfKHo6DvV4TXi-qc7MskvrbaeL4QrZOsLBR93e6whd6NJk4teCzz=s1600', true, 0, 'HOTEL A8 CLOS')
  on conflict do nothing;

  -- [3] Appartement Meublé VIP Douala Bonapriso (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-vip-douala-bonapriso-bonapriso',
    'apartment',
    'published',
    'Appartement Meublé VIP Douala Bonapriso',
    'Appartement Meublé VIP Douala Bonapriso
Adresse : 797 Rue UTA, Douala.
Contact / WhatsApp : +237 697 11 20 36.
Note Google Maps : 3.8/5 (6 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '797 Rue UTA, Douala',
    4.0248022,
    9.7002936,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfM4r_aUZ0Xs-JBkgIAibtu-WqJImJSamSQws0NNg00tK9wLzwSGqhCLew2oCByG1hqefcyn0AeFSWWHqGeHh244JdcwzEThGc4OSaDq1b7Tuo34pCKdvVT-g4HPyRkYtbQGZfS=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfM4r_aUZ0Xs-JBkgIAibtu-WqJImJSamSQws0NNg00tK9wLzwSGqhCLew2oCByG1hqefcyn0AeFSWWHqGeHh244JdcwzEThGc4OSaDq1b7Tuo34pCKdvVT-g4HPyRkYtbQGZfS=s1600', true, 0, 'Appartement Meublé VIP Douala Bonapriso')
  on conflict do nothing;

  -- [4] Comfy Home Apart - Appartement meublé Bonapriso - One-Bedroom Apartment (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'comfy-home-apart-appartement-meuble-bonapriso-one-bedroom-apartment-bonapri',
    'room',
    'published',
    'Comfy Home Apart - Appartement meublé Bonapriso - One-Bedroom Apartment',
    'Comfy Home Apart - Appartement meublé Bonapriso - One-Bedroom Apartment
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0247798,
    9.7002697,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1NUeh6MClL1a2yctAGovIfRKPkD6JHsNJe0QFd2F-SV5Q8_QbC2hjK-IE_j0X8D9F558sWY97mIqphIq3qPg1ok_tOifVwVuvfV7FtaJuBaLm5hmOS8Q3g1i7iX81GlflGzdUBLVmwIoWTu8sfvFE2NTKpGao5KPIOKckdBshzHsu0t1aCriCh9A=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1NUeh6MClL1a2yctAGovIfRKPkD6JHsNJe0QFd2F-SV5Q8_QbC2hjK-IE_j0X8D9F558sWY97mIqphIq3qPg1ok_tOifVwVuvfV7FtaJuBaLm5hmOS8Q3g1i7iX81GlflGzdUBLVmwIoWTu8sfvFE2NTKpGao5KPIOKckdBshzHsu0t1aCriCh9A=s1600', true, 0, 'Comfy Home Apart - Appartement meublé Bonapriso - One-Bedroom Apartment')
  on conflict do nothing;

  -- [5] Studio meublé à Douala, bonapriso (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'studio-meuble-a-douala-bonapriso-bonapriso',
    'studio',
    'published',
    'Studio meublé à Douala, bonapriso',
    'Studio meublé à Douala, bonapriso
Adresse : 18121, Douala.
Contact / WhatsApp : +237 694 93 19 50.
Note Google Maps : 5/5 (1 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '18121, Douala',
    4.0242302,
    9.7004998,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcpbIfwRJkxjwQihg8z-QBunGZ7bX-BNB9HovzpvcWq-EqXUgo7qWE8_8l-egyWGqALQWjzX22isdBT1cQd1M7QUq4sewZf0yrXtYbLTAMOseu1CkHHKAUdCHwpV2diRPpf89-wXepko_DN=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcpbIfwRJkxjwQihg8z-QBunGZ7bX-BNB9HovzpvcWq-EqXUgo7qWE8_8l-egyWGqALQWjzX22isdBT1cQd1M7QUq4sewZf0yrXtYbLTAMOseu1CkHHKAUdCHwpV2diRPpf89-wXepko_DN=s1600', true, 0, 'Studio meublé à Douala, bonapriso')
  on conflict do nothing;

  -- [6] Appartement meublé Bonapriso Chez Tigson (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-bonapriso-chez-tigson-bonapriso',
    'apartment',
    'published',
    'Appartement meublé Bonapriso Chez Tigson',
    'Appartement meublé Bonapriso Chez Tigson
Catégorie : Complexe d''appartements meublés.
Adresse : Douala.
Contact / WhatsApp : +237 693 99 38 46.
Note Google Maps : 5/5 (1 avis).

Avis clients récents :
- "" (Reine Ngamo, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0146124,
    9.7049566,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLca9vs-7NvJtFIPgFWbaizHuO5--LnbPf4OAjbVTtEsnvkoZMaAg-S7OFmjcHUk4glTDnio98zbvCzKSp-1axo_gXus49_DUGRah_otq4L_LpW0hb3LHgUJarQmAo9qRh-tPCZ2=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLca9vs-7NvJtFIPgFWbaizHuO5--LnbPf4OAjbVTtEsnvkoZMaAg-S7OFmjcHUk4glTDnio98zbvCzKSp-1axo_gXus49_DUGRah_otq4L_LpW0hb3LHgUJarQmAo9qRh-tPCZ2=s1600', true, 0, 'Appartement meublé Bonapriso Chez Tigson')
  on conflict do nothing;

  -- [7] Appartement meublé Douala Bonapriso Savio - One-Bedroom Apartment (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-douala-bonapriso-savio-one-bedroom-apartment-bonapriso',
    'room',
    'published',
    'Appartement meublé Douala Bonapriso Savio - One-Bedroom Apartment',
    'Appartement meublé Douala Bonapriso Savio - One-Bedroom Apartment
Adresse : Douala.
Note Google Maps : 2.5/5 (0 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0272102,
    9.6950998,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0X2Od9DNv7ouiTBG25MoeSvwppn5SDGIUf4zp_NuxFClSjJUvrb2B34xDvDYdgGNMp3kmnT-8CTGfm7tQxT_TFRAoe3OY_ZPAreu6KW_wC0jz0cm4HcfjUH47XdAmc0o9M6he8NeDBte4pJdRfXFoLS7au385AIO6utUc2pTtaAq8SebEyGrnH=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0X2Od9DNv7ouiTBG25MoeSvwppn5SDGIUf4zp_NuxFClSjJUvrb2B34xDvDYdgGNMp3kmnT-8CTGfm7tQxT_TFRAoe3OY_ZPAreu6KW_wC0jz0cm4HcfjUH47XdAmc0o9M6he8NeDBte4pJdRfXFoLS7au385AIO6utUc2pTtaAq8SebEyGrnH=s1600', true, 0, 'Appartement meublé Douala Bonapriso Savio - One-Bedroom Apartment')
  on conflict do nothing;

  -- [8] BONAPRISO APPART MEUBLE' nextel (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'bonapriso-appart-meuble-nextel-bonapriso',
    'apartment',
    'published',
    'BONAPRISO APPART MEUBLE'' nextel',
    'BONAPRISO APPART MEUBLE'' nextel
Adresse : 2PF2+W8J, Unnamed Road, Douala.
Contact / WhatsApp : +237 694 05 58 85.
Note Google Maps : 4/5 (4 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '2PF2+W8J, Unnamed Road, Douala',
    4.0248269,
    9.7007564,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLclLzO5pPBz2S1q2ZPKD9oBi1Tw-5hKVdgOiyA3Jnz_5HQ3_rCfew0_uoJGOyzOBtz6s8dSDHnjmgKJrE11fR4yl7-uUIqCzIVp5_3SZF-pmDHOk5VvlgXUvE07g4jFHTLsk96VfX83DwU=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLclLzO5pPBz2S1q2ZPKD9oBi1Tw-5hKVdgOiyA3Jnz_5HQ3_rCfew0_uoJGOyzOBtz6s8dSDHnjmgKJrE11fR4yl7-uUIqCzIVp5_3SZF-pmDHOk5VvlgXUvE07g4jFHTLsk96VfX83DwU=s1600', true, 0, 'BONAPRISO APPART MEUBLE'' nextel')
  on conflict do nothing;

  -- [9] Appartement meublé bonapriso - One-Bedroom Apartment (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-bonapriso-one-bedroom-apartment-bonapriso',
    'room',
    'published',
    'Appartement meublé bonapriso - One-Bedroom Apartment',
    'Appartement meublé bonapriso - One-Bedroom Apartment
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0156398,
    9.70543,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW35iKUZyBjmbdwzATD2dAcRWbH1-hftDWV77OTwsax8EWip94cfejY14ChX2jJ4Tfh3JPiQKg75vVVOreKkFaVS-C6xQbmzyUO0h0YZcB2WJLZwM6rHOCPgFCB0kmi6-CArljq-XdGZCtzpQRUJCProZWz8EO6ZCqzWS7EHEoxNIEOobo0dPoU=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW35iKUZyBjmbdwzATD2dAcRWbH1-hftDWV77OTwsax8EWip94cfejY14ChX2jJ4Tfh3JPiQKg75vVVOreKkFaVS-C6xQbmzyUO0h0YZcB2WJLZwM6rHOCPgFCB0kmi6-CArljq-XdGZCtzpQRUJCProZWz8EO6ZCqzWS7EHEoxNIEOobo0dPoU=s1600', true, 0, 'Appartement meublé bonapriso - One-Bedroom Apartment')
  on conflict do nothing;

  -- [10] Résidence Belmann Bonapriso (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-belmann-bonapriso-bonapriso',
    'apartment',
    'published',
    'Résidence Belmann Bonapriso',
    'Résidence Belmann Bonapriso
Adresse : Ancien dépôt Guinness, Douala.
Contact / WhatsApp : +237 653 89 43 92.
Note Google Maps : 5/5 (4 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Ancien dépôt Guinness, Douala',
    4.0213988,
    9.7039119,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdbSbw6JxPdn0SDb2EtFQxy5grm2epUXCrBq53JwFL_r9wUDODxv-x5-NRBg4UNWPn-hdKwYvZrWcBk5AZXXPgMrh0Cy12HNzPaK7iEROmntYSf0-Vu-f-B-rC75RTClcsAwZY05zJJorc=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdbSbw6JxPdn0SDb2EtFQxy5grm2epUXCrBq53JwFL_r9wUDODxv-x5-NRBg4UNWPn-hdKwYvZrWcBk5AZXXPgMrh0Cy12HNzPaK7iEROmntYSf0-Vu-f-B-rC75RTClcsAwZY05zJJorc=s1600', true, 0, 'Résidence Belmann Bonapriso')
  on conflict do nothing;

  -- [11] Studio Meuble a Bonapriso- Hydrocarbures ( Douala- Cameroun) (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'studio-meuble-a-bonapriso-hydrocarbures-douala-cameroun-bonapriso',
    'studio',
    'published',
    'Studio Meuble a Bonapriso- Hydrocarbures ( Douala- Cameroun)',
    'Studio Meuble a Bonapriso- Hydrocarbures ( Douala- Cameroun)
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0250001,
    9.6929999,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2jUmNmKjWBfLOafnuizjbICq5muLIATubrsOo5bY6_k2qrUVuYpjZGPHAr9KFpHN47tc3luUy15eB5hJRdG87tLxmvNr9HdwQsQfO14gkmW_r2SUxst03u3E93OmML7rvO7TtiN_9Ic1_wtuelwocJ1mr5kDPA43b7_2RiHruWMS44l4_XMRp6=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2jUmNmKjWBfLOafnuizjbICq5muLIATubrsOo5bY6_k2qrUVuYpjZGPHAr9KFpHN47tc3luUy15eB5hJRdG87tLxmvNr9HdwQsQfO14gkmW_r2SUxst03u3E93OmML7rvO7TtiN_9Ic1_wtuelwocJ1mr5kDPA43b7_2RiHruWMS44l4_XMRp6=s1600', true, 0, 'Studio Meuble a Bonapriso- Hydrocarbures ( Douala- Cameroun)')
  on conflict do nothing;

  -- [12] APPARTEMENT & STUDIO MEUBLÉ ET NIN MEUBLÉ (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-studio-meuble-et-nin-meuble-bonapriso',
    'studio',
    'published',
    'APPARTEMENT & STUDIO MEUBLÉ ET NIN MEUBLÉ',
    'APPARTEMENT & STUDIO MEUBLÉ ET NIN MEUBLÉ
Catégorie : Immeuble en copropriété.
Adresse : 2PF2+W46, Douala.
Contact / WhatsApp : +237 656 99 43 08.
Note Google Maps : 5/5 (1 avis).

Avis clients récents :
- "" (serge mba, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '2PF2+W46, Douala',
    4.0247797,
    9.7002788,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/a/ACg8ocIZrS9pWLGHDuoXgVXr3c1TBF_3eykLKU7EbVWxr3x4_clAQQ=s1600-p-rp-mo-br100', 'https://lh3.googleusercontent.com/a/ACg8ocIZrS9pWLGHDuoXgVXr3c1TBF_3eykLKU7EbVWxr3x4_clAQQ=s1600-p-rp-mo-br100', true, 0, 'APPARTEMENT & STUDIO MEUBLÉ ET NIN MEUBLÉ')
  on conflict do nothing;

  -- [13] Résidence M Akwa - Douala (Akwa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-m-akwa-douala-akwa',
    'apartment',
    'published',
    'Résidence M Akwa - Douala',
    'Résidence M Akwa - Douala
Adresse : Ave King Akwa, Douala.
Contact / WhatsApp : +237696501386.
Note Google Maps : 4.6/5 (25 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'akwa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Ave King Akwa, Douala',
    4.0532554,
    9.699813,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfp1RCJ9A4aRrPE6KORgZbpvjLjTgDpu1fg29kTxvHukmzPRzRWgaDQj4-Y9h-kEWDWsE8AZwwwxAbeO20wVoTrXccTaVv7_lvXzPyO9DInjgaI2pJNhZSEXg89KRbk5JlcXRioAQ6oqbKG=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfp1RCJ9A4aRrPE6KORgZbpvjLjTgDpu1fg29kTxvHukmzPRzRWgaDQj4-Y9h-kEWDWsE8AZwwwxAbeO20wVoTrXccTaVv7_lvXzPyO9DInjgaI2pJNhZSEXg89KRbk5JlcXRioAQ6oqbKG=s1600', true, 0, 'Résidence M Akwa - Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R6nvUf3Btba3SkIQtSvlm-v77GbhgFqeqmVzfiZq0vof9NjFD2tv-r4XNbf55KVv37DIXDqJ0B2RHE88yiZxz45WWtveGlLoHW-a3l0wlVVvlAzjJcxAEkH58nUB6FlWPKi-70d5gnboox=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R6nvUf3Btba3SkIQtSvlm-v77GbhgFqeqmVzfiZq0vof9NjFD2tv-r4XNbf55KVv37DIXDqJ0B2RHE88yiZxz45WWtveGlLoHW-a3l0wlVVvlAzjJcxAEkH58nUB6FlWPKi-70d5gnboox=s1600', false, 1, 'Résidence M Akwa - Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SnzZG_p5kwNLMZAOYvAhlqzuIyfPUQF_LRmTWrXWauFQT3cY_h1K70ioiyDaJQ9Ilw0gjwU1lJ4HwfDF3MnYi4YzZfovJk3iK-NySOv0kzbQuM-bW-BsrfWEbIR159rTswW1Mx-GZTMH8U=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SnzZG_p5kwNLMZAOYvAhlqzuIyfPUQF_LRmTWrXWauFQT3cY_h1K70ioiyDaJQ9Ilw0gjwU1lJ4HwfDF3MnYi4YzZfovJk3iK-NySOv0kzbQuM-bW-BsrfWEbIR159rTswW1Mx-GZTMH8U=s1600', false, 2, 'Résidence M Akwa - Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q3CwwXu--VAhSg5RNg7QFfmaTskfcybF9MuAxwDsh5kVgg3uTkmWXjVJ4g6PrOQhZsuzbtEQndb99YtpkiQtKuqkDCWNk9HgLCOEZ6LtD3swY0tDVUsWcV0gnCvlbxEiMdtE4N1A=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q3CwwXu--VAhSg5RNg7QFfmaTskfcybF9MuAxwDsh5kVgg3uTkmWXjVJ4g6PrOQhZsuzbtEQndb99YtpkiQtKuqkDCWNk9HgLCOEZ6LtD3swY0tDVUsWcV0gnCvlbxEiMdtE4N1A=s1600', false, 3, 'Résidence M Akwa - Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Ro-p-bqtTq7901TxUjYsz4TIUWZXp32ZnUj6OgnlMVmNlxiFf1t50zBqHdJ8nJZRABHUCWa7pI0z2OzE-dloj7w3ir5dK2c7EXhFGGWO0ohVbyua4-g3eXZce41IPXkxRQ2954=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Ro-p-bqtTq7901TxUjYsz4TIUWZXp32ZnUj6OgnlMVmNlxiFf1t50zBqHdJ8nJZRABHUCWa7pI0z2OzE-dloj7w3ir5dK2c7EXhFGGWO0ohVbyua4-g3eXZce41IPXkxRQ2954=s1600', false, 4, 'Résidence M Akwa - Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TP65yt-OUobhE1Ur1KSfHC567QdglmxkonHzoIm8wfIjJeJsscrQw6Ee4guikV5O5la7kEcCc9RItjLEAEABgCvPacub0ab1lOcDHVk2qwPcSMDe3EztiBS0LF-A9pRfVeCTmxQZjE7cQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TP65yt-OUobhE1Ur1KSfHC567QdglmxkonHzoIm8wfIjJeJsscrQw6Ee4guikV5O5la7kEcCc9RItjLEAEABgCvPacub0ab1lOcDHVk2qwPcSMDe3EztiBS0LF-A9pRfVeCTmxQZjE7cQ=s1600', false, 5, 'Résidence M Akwa - Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfp1RCJ9A4aRrPE6KORgZbpvjLjTgDpu1fg29kTxvHukmzPRzRWgaDQj4-Y9h-kEWDWsE8AZwwwxAbeO20wVoTrXccTaVv7_lvXzPyO9DInjgaI2pJNhZSEXg89KRbk5JlcXRioAQ6oqbKG=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfp1RCJ9A4aRrPE6KORgZbpvjLjTgDpu1fg29kTxvHukmzPRzRWgaDQj4-Y9h-kEWDWsE8AZwwwxAbeO20wVoTrXccTaVv7_lvXzPyO9DInjgaI2pJNhZSEXg89KRbk5JlcXRioAQ6oqbKG=s1600-p-k-no', false, 6, 'Résidence M Akwa - Douala')
  on conflict do nothing;

  -- [14] Bel Appartement Meuble en plein centre-ville (Akwa, Douala) (Akwa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'bel-appartement-meuble-en-plein-centre-ville-akwa-douala-akwa',
    'apartment',
    'published',
    'Bel Appartement Meuble en plein centre-ville (Akwa, Douala)',
    'Bel Appartement Meuble en plein centre-ville (Akwa, Douala)
Catégorie : Hébergement d''intérieur.
Adresse : 3M2V+HQM face Orca, Rue Joffre, Douala.
Note Google Maps : 4.1/5 (17 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Clement Enyegue, note 5/5)
- "Note sans commentaire écrit." (Rougayatou Hamadou, note 3/5)
- "Note sans commentaire écrit." (Alexia Tchami, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'akwa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3M2V+HQM face Orca, Rue Joffre, Douala',
    4.0514681,
    9.6944131,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/a-/ALV-UjUxKSLaBi35Ymk72pxZo8WfGj6PR2BdkannG72-1teGDgoxcUuDEA=s1600-p-rp-mo-br100', 'https://lh3.googleusercontent.com/a-/ALV-UjUxKSLaBi35Ymk72pxZo8WfGj6PR2BdkannG72-1teGDgoxcUuDEA=s1600-p-rp-mo-br100', true, 0, 'Bel Appartement Meuble en plein centre-ville (Akwa, Douala)')
  on conflict do nothing;

  -- [15] Appartement meublé à Douala Akwa - One-Bedroom Apartment (Akwa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-a-douala-akwa-one-bedroom-apartment-akwa',
    'room',
    'published',
    'Appartement meublé à Douala Akwa - One-Bedroom Apartment',
    'Appartement meublé à Douala Akwa - One-Bedroom Apartment
Adresse : Douala.
Note Google Maps : 2/5 (0 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'akwa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0531401,
    9.6995697,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3SyfGUJGokmv5TK1AkEv0kMATxFaL5MZ42A1vrCgwL57cg-nhixYLEpgzCpED5s-2YHkwylgv-Ei8Daj6RcDPwXJkEtFREZlam7xZBdoH9yilnrcDq6Ynw0apQOK6vgOAnIq1pPe_-Wmj7a3qFYVC0ItOBkjSUhDYs6GhUBET-jl9m0OddRLjvhg=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3SyfGUJGokmv5TK1AkEv0kMATxFaL5MZ42A1vrCgwL57cg-nhixYLEpgzCpED5s-2YHkwylgv-Ei8Daj6RcDPwXJkEtFREZlam7xZBdoH9yilnrcDq6Ynw0apQOK6vgOAnIq1pPe_-Wmj7a3qFYVC0ItOBkjSUhDYs6GhUBET-jl9m0OddRLjvhg=s1600', true, 0, 'Appartement meublé à Douala Akwa - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGx8yrMiZh-7WaJmwhcI0_M7vFGw1LKTVsCswLCwgAEYY7UGXYoH67P9xkb9QFGuQHhtU7aeQPdTt_KoAS0X3kEmrNuPZ-jk06M6kcvNCVo5pUA9fZrtav6TdiGgtyq-PYgzyN17k41i823Sqw8ONhKMCM-hSbJmMyKe5C1yWWOTiH3jztm3oDukg=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGx8yrMiZh-7WaJmwhcI0_M7vFGw1LKTVsCswLCwgAEYY7UGXYoH67P9xkb9QFGuQHhtU7aeQPdTt_KoAS0X3kEmrNuPZ-jk06M6kcvNCVo5pUA9fZrtav6TdiGgtyq-PYgzyN17k41i823Sqw8ONhKMCM-hSbJmMyKe5C1yWWOTiH3jztm3oDukg=s1600', false, 1, 'Appartement meublé à Douala Akwa - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG-Kjo8OibEwEV9wOL6ArcbG4U6eDw7o7zsFXPY-dIZ6hHtmAopvJvi8PGxJPg9rtNbeqANO4IsmQTfYBSDISScjDSAleAi1BwfcMlBMqgmmdwgAhM1ai43m_625T4mXWZOqcVi2viTwuHXdMjhFaZPq6owS2L5c3DbNBudlzfN80T3ug0VLIqD=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG-Kjo8OibEwEV9wOL6ArcbG4U6eDw7o7zsFXPY-dIZ6hHtmAopvJvi8PGxJPg9rtNbeqANO4IsmQTfYBSDISScjDSAleAi1BwfcMlBMqgmmdwgAhM1ai43m_625T4mXWZOqcVi2viTwuHXdMjhFaZPq6owS2L5c3DbNBudlzfN80T3ug0VLIqD=s1600', false, 2, 'Appartement meublé à Douala Akwa - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEjewKpXqCKGgFwQq8jffI4vk9HrmRb8JgbKTn-UCpA7yQp6DlW-ejvwooCkcho3qWyEMNdya95x9sEIia9ZrL0MTALBsH6u0vVHxrKBNIrzGhaG1l8AroYJqgXRsj0ZwcGUlPi5BJuumwn6tmPjiEsv3Q4AYZZZVhVK0_GrJHkRbrA1UBpDINU=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEjewKpXqCKGgFwQq8jffI4vk9HrmRb8JgbKTn-UCpA7yQp6DlW-ejvwooCkcho3qWyEMNdya95x9sEIia9ZrL0MTALBsH6u0vVHxrKBNIrzGhaG1l8AroYJqgXRsj0ZwcGUlPi5BJuumwn6tmPjiEsv3Q4AYZZZVhVK0_GrJHkRbrA1UBpDINU=s1600', false, 3, 'Appartement meublé à Douala Akwa - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3SyfGUJGokmv5TK1AkEv0kMATxFaL5MZ42A1vrCgwL57cg-nhixYLEpgzCpED5s-2YHkwylgv-Ei8Daj6RcDPwXJkEtFREZlam7xZBdoH9yilnrcDq6Ynw0apQOK6vgOAnIq1pPe_-Wmj7a3qFYVC0ItOBkjSUhDYs6GhUBET-jl9m0OddRLjvhg=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3SyfGUJGokmv5TK1AkEv0kMATxFaL5MZ42A1vrCgwL57cg-nhixYLEpgzCpED5s-2YHkwylgv-Ei8Daj6RcDPwXJkEtFREZlam7xZBdoH9yilnrcDq6Ynw0apQOK6vgOAnIq1pPe_-Wmj7a3qFYVC0ItOBkjSUhDYs6GhUBET-jl9m0OddRLjvhg=s1600-p-k-no', false, 4, 'Appartement meublé à Douala Akwa - One-Bedroom Apartment')
  on conflict do nothing;

  -- [16] EDEN Studio meublé (Akwa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'eden-studio-meuble-akwa',
    'studio',
    'published',
    'EDEN Studio meublé',
    'EDEN Studio meublé
Catégorie : Logement meublé.
Adresse : Douala.
Contact / WhatsApp : +237655918393.
Note Google Maps : 4.8/5 (5 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Dany Balla, note 4/5)
- "Note sans commentaire écrit." (Alfred Bruno ETOUBOU YOBO, note 5/5)
- "Note sans commentaire écrit." (Alban Tiki, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'akwa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0608965,
    9.7086385,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcFZQrDViz4oMyD1Hhbdh_Kz_VRk2llt0AxcV1M8PH__F-H8Hwd8zQdfMLTNeHQCuXp1em-CoM4CwGXZZTdrria7O_e3yI-tj9V0a5JvPmUW9zty3YgqSUIt3AusPgKhq5iy6_L=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcFZQrDViz4oMyD1Hhbdh_Kz_VRk2llt0AxcV1M8PH__F-H8Hwd8zQdfMLTNeHQCuXp1em-CoM4CwGXZZTdrria7O_e3yI-tj9V0a5JvPmUW9zty3YgqSUIt3AusPgKhq5iy6_L=s1600', true, 0, 'EDEN Studio meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcFZQrDViz4oMyD1Hhbdh_Kz_VRk2llt0AxcV1M8PH__F-H8Hwd8zQdfMLTNeHQCuXp1em-CoM4CwGXZZTdrria7O_e3yI-tj9V0a5JvPmUW9zty3YgqSUIt3AusPgKhq5iy6_L=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcFZQrDViz4oMyD1Hhbdh_Kz_VRk2llt0AxcV1M8PH__F-H8Hwd8zQdfMLTNeHQCuXp1em-CoM4CwGXZZTdrria7O_e3yI-tj9V0a5JvPmUW9zty3YgqSUIt3AusPgKhq5iy6_L=s1600-p-k-no', false, 1, 'EDEN Studio meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SUZpYSc6bu-t9GqKu4i8Ep3erfpyd8tzGaDJCBMegxrJ_kbl_4wyL-FvmNHJyicq5iCgj6kPbm88uf2aT0qeONWO6uGS5smrgZ5TFYhVC_PDXpfncxw7MmpDvpMsVZN2qbKd8XxA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SUZpYSc6bu-t9GqKu4i8Ep3erfpyd8tzGaDJCBMegxrJ_kbl_4wyL-FvmNHJyicq5iCgj6kPbm88uf2aT0qeONWO6uGS5smrgZ5TFYhVC_PDXpfncxw7MmpDvpMsVZN2qbKd8XxA=s1600', false, 2, 'EDEN Studio meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tv0cx-oRPBhT7HPm7Va1pB7VSLO3RSgG-d9F8IGuv--rJCP5VQcaouR71bkUKEU7XoPcB8WARcMRt5P2gdChlU2bjcZ6IX7tSRF3lPaclwrRhG-ft-EwFLLpdvZ6e00Q1r9RE=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tv0cx-oRPBhT7HPm7Va1pB7VSLO3RSgG-d9F8IGuv--rJCP5VQcaouR71bkUKEU7XoPcB8WARcMRt5P2gdChlU2bjcZ6IX7tSRF3lPaclwrRhG-ft-EwFLLpdvZ6e00Q1r9RE=s1600', false, 3, 'EDEN Studio meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QBdWgKGI9xohRU3PNZeI1jsxGhI8ojr9r3r6HWtdzpBkZYsaWq17LNoAFT8pmivxm6HIK0d3ScIkHsnkhzKYiTh4u5IWDqCXkYc35qXWsz7PqjCoz-eWVl-HPM4Kq8LhLbUn3qHw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QBdWgKGI9xohRU3PNZeI1jsxGhI8ojr9r3r6HWtdzpBkZYsaWq17LNoAFT8pmivxm6HIK0d3ScIkHsnkhzKYiTh4u5IWDqCXkYc35qXWsz7PqjCoz-eWVl-HPM4Kq8LhLbUn3qHw=s1600', false, 4, 'EDEN Studio meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SovK5i4nrJOIlFk3XC-Zb5n4YiomGOcfAJeyLCilpzvCSjY3mWeZnMETPsCMpTrrfjW9-FJS9IsfXCSFYPgH2NSKJamPz3IunBtHIGWI_i1CvxP1EB2EiGFbVEIUfbxu-iRSli=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SovK5i4nrJOIlFk3XC-Zb5n4YiomGOcfAJeyLCilpzvCSjY3mWeZnMETPsCMpTrrfjW9-FJS9IsfXCSFYPgH2NSKJamPz3IunBtHIGWI_i1CvxP1EB2EiGFbVEIUfbxu-iRSli=s1600', false, 5, 'EDEN Studio meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TvZHqCWvMntNu8qnXLKS8pJKVVkQ7oeo1vBHQO4IsAYRB89IblFFECwACOJGT1g56LwwQHGuRUPgsXZDlX3Wp2JgzRAS9EtADbjdxtnPhTnw6UGIM1DeGSXe7AZnSggmqWwYnG=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TvZHqCWvMntNu8qnXLKS8pJKVVkQ7oeo1vBHQO4IsAYRB89IblFFECwACOJGT1g56LwwQHGuRUPgsXZDlX3Wp2JgzRAS9EtADbjdxtnPhTnw6UGIM1DeGSXe7AZnSggmqWwYnG=s1600', false, 6, 'EDEN Studio meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q6rhk6iZyATE4HFJc2uH7MghFBcnU6QTJSqiRg0M2qOWwBOcbtro6z2b-YvPcdKIbTHNyXewABVP0O2kDCWmiqVCk2K4qdmQwQ6ikOVRjKLz09f7ecQmwIUC_BBUKnPQ-hir0F=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q6rhk6iZyATE4HFJc2uH7MghFBcnU6QTJSqiRg0M2qOWwBOcbtro6z2b-YvPcdKIbTHNyXewABVP0O2kDCWmiqVCk2K4qdmQwQ6ikOVRjKLz09f7ecQmwIUC_BBUKnPQ-hir0F=s1600', false, 7, 'EDEN Studio meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TUrhEEdVRkTVwF1Q62tVs-AC8B9_WPWJpS_Otl0vt7oS6wdPcmv8KN3w4GdPhH6AAsLnHPsnrX45zMH7AvkdscR8rMdqFZVcEkDz9RmcPwPf0WyB4sYrUm9ezZy3QQJ-WczOi8=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TUrhEEdVRkTVwF1Q62tVs-AC8B9_WPWJpS_Otl0vt7oS6wdPcmv8KN3w4GdPhH6AAsLnHPsnrX45zMH7AvkdscR8rMdqFZVcEkDz9RmcPwPf0WyB4sYrUm9ezZy3QQJ-WczOi8=s1600', false, 8, 'EDEN Studio meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9ROVU-aWZI82jtuUKbAKfM2oTD0W5poPwCmAnjYBtlXTdpJN6uhcFPH8Ju8uRbm-73aIxNdKFBiCTugWZs6a7otOETOBiy2ElFajIL12agnnlZao8QczvuPZYvBhMaRYx_9fzk8=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9ROVU-aWZI82jtuUKbAKfM2oTD0W5poPwCmAnjYBtlXTdpJN6uhcFPH8Ju8uRbm-73aIxNdKFBiCTugWZs6a7otOETOBiy2ElFajIL12agnnlZao8QczvuPZYvBhMaRYx_9fzk8=s1600', false, 9, 'EDEN Studio meublé')
  on conflict do nothing;

  -- [17] Appartement meuble douala akwa - Two-Bedroom Apartment (Akwa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-douala-akwa-two-bedroom-apartment-akwa',
    'room',
    'published',
    'Appartement meuble douala akwa - Two-Bedroom Apartment',
    'Appartement meuble douala akwa - Two-Bedroom Apartment
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'akwa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.05373,
    9.7047796,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2o1gaGwZxcCK2C4d554mbxPyIbBpsiyVYT0XDrJo80qPI7tM8HWqbu0WbHtMPMFyEoCUW2lxvUB3VrF167SToE2OOzhpcLLHxMMBB3E2GJJZ4oBFnh-Wvooi5yRo0Q6_j991veOripzk_m1g_UOLybJayqAlc7KB1LQkQE-pfsNlgpWxzMtaVQ=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2o1gaGwZxcCK2C4d554mbxPyIbBpsiyVYT0XDrJo80qPI7tM8HWqbu0WbHtMPMFyEoCUW2lxvUB3VrF167SToE2OOzhpcLLHxMMBB3E2GJJZ4oBFnh-Wvooi5yRo0Q6_j991veOripzk_m1g_UOLybJayqAlc7KB1LQkQE-pfsNlgpWxzMtaVQ=s1600', true, 0, 'Appartement meuble douala akwa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFlIWFyWL0ihIRqXfiJCjwSRlDV0abCWStMKS5PIimuk4wQM1u076_VQnO_xTt1_Mmtop2iC2adJoB1KCYjSd7bEvWaUBSj8PdjGufQreCbyxgvleiRPa29nkv4F-kDY3l05qZHrOgPbRK_Hr9vykxcHP6Px_6qzqw8bR_-L5BbYD5SUlrCmybi=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFlIWFyWL0ihIRqXfiJCjwSRlDV0abCWStMKS5PIimuk4wQM1u076_VQnO_xTt1_Mmtop2iC2adJoB1KCYjSd7bEvWaUBSj8PdjGufQreCbyxgvleiRPa29nkv4F-kDY3l05qZHrOgPbRK_Hr9vykxcHP6Px_6qzqw8bR_-L5BbYD5SUlrCmybi=s1600', false, 1, 'Appartement meuble douala akwa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEJL82C-RI-YlU27sS8-HkVc9dyEZ84fqHutOdDLBNXFro-O13ftVqo6G_puyV8A2nRYjjXpXOcE78OAinmmoAoH5IXrngMz7pLfnFWFs5M0OWeYiuUKF3hBuF6jXEhVH_h6QIRgpssQVBeKCI9-TswqTseFf3U_fi-Rbb642Cfn8NSULVkFwaZ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEJL82C-RI-YlU27sS8-HkVc9dyEZ84fqHutOdDLBNXFro-O13ftVqo6G_puyV8A2nRYjjXpXOcE78OAinmmoAoH5IXrngMz7pLfnFWFs5M0OWeYiuUKF3hBuF6jXEhVH_h6QIRgpssQVBeKCI9-TswqTseFf3U_fi-Rbb642Cfn8NSULVkFwaZ=s1600', false, 2, 'Appartement meuble douala akwa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFD01iJ_a0ApvpQfeMebOL-riJogL09ZRs6N5NEQ-gMSoxldWrgwfN5tMLCGsILf_g7etfoNpos0JdjdOIq0Styu2YfKKpyj3k8exIvMr-5ejXSTwDNfAUZOAP5rHvo5lnqdi4ClemsqtBSId8_LmwsOR4JolYI9JxYxnFqLVITAim0unIsumpK=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFD01iJ_a0ApvpQfeMebOL-riJogL09ZRs6N5NEQ-gMSoxldWrgwfN5tMLCGsILf_g7etfoNpos0JdjdOIq0Styu2YfKKpyj3k8exIvMr-5ejXSTwDNfAUZOAP5rHvo5lnqdi4ClemsqtBSId8_LmwsOR4JolYI9JxYxnFqLVITAim0unIsumpK=s1600', false, 3, 'Appartement meuble douala akwa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFubVaYFb9XZ845xsgqp5E09UmiywJzOLn2HnQRPhgGvficV54-NCbYX6SleQgoqHiOjOwXCxwlPBS5a3QwGfMDS36TqG6N4LNyz_0vw0DDxnHELvEVrDakAWyC0sR9k3oQ3gwEFdlRCuAPnU5tnn1X6eYEYiOX3HlT2ueGxoKkA4oCVMOKHHk33Q=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFubVaYFb9XZ845xsgqp5E09UmiywJzOLn2HnQRPhgGvficV54-NCbYX6SleQgoqHiOjOwXCxwlPBS5a3QwGfMDS36TqG6N4LNyz_0vw0DDxnHELvEVrDakAWyC0sR9k3oQ3gwEFdlRCuAPnU5tnn1X6eYEYiOX3HlT2ueGxoKkA4oCVMOKHHk33Q=s1600', false, 4, 'Appartement meuble douala akwa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHPiEOq3UcU7_99BWpdGh8vDfdYY7Rv_96H7lRCpMaOnv3sYzCw78EO5u5VXXwKAK1oKRk6g-vtq8XS6VTVmTaoZ7VIrYFyRChK_0lWfQcXJ5Rnhn-CZ8elNCWSobV_kiEeR5ffXVZ4H0UDjNsxxev1mgQxMZNJymLQHLZDEaDiUQL-gOzD8r4H=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHPiEOq3UcU7_99BWpdGh8vDfdYY7Rv_96H7lRCpMaOnv3sYzCw78EO5u5VXXwKAK1oKRk6g-vtq8XS6VTVmTaoZ7VIrYFyRChK_0lWfQcXJ5Rnhn-CZ8elNCWSobV_kiEeR5ffXVZ4H0UDjNsxxev1mgQxMZNJymLQHLZDEaDiUQL-gOzD8r4H=s1600', false, 5, 'Appartement meuble douala akwa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2o1gaGwZxcCK2C4d554mbxPyIbBpsiyVYT0XDrJo80qPI7tM8HWqbu0WbHtMPMFyEoCUW2lxvUB3VrF167SToE2OOzhpcLLHxMMBB3E2GJJZ4oBFnh-Wvooi5yRo0Q6_j991veOripzk_m1g_UOLybJayqAlc7KB1LQkQE-pfsNlgpWxzMtaVQ=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2o1gaGwZxcCK2C4d554mbxPyIbBpsiyVYT0XDrJo80qPI7tM8HWqbu0WbHtMPMFyEoCUW2lxvUB3VrF167SToE2OOzhpcLLHxMMBB3E2GJJZ4oBFnh-Wvooi5yRo0Q6_j991veOripzk_m1g_UOLybJayqAlc7KB1LQkQE-pfsNlgpWxzMtaVQ=s1600-p-k-no', false, 6, 'Appartement meuble douala akwa - Two-Bedroom Apartment')
  on conflict do nothing;

  -- [18] Appartement meublé Akwa chez Tigson (Akwa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-akwa-chez-tigson-akwa',
    'apartment',
    'published',
    'Appartement meublé Akwa chez Tigson',
    'Appartement meublé Akwa chez Tigson
Catégorie : Complexe d''appartements meublés.
Adresse : 237, Douala.
Contact / WhatsApp : +237693993846.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'akwa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '237, Douala',
    4.052015,
    9.6930477,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLf4xBlWNenAH9bvp5f1IUITH11Np6fPGQcdZFXMmUBG7NxM0HDP-gPvlmfwxVGufLPvwJhBJcVW4Y4dYcoKE40UYNYQ3NxeHn7TCKt-LHuR5Nr97XJQg84qg5nChXGhxFCf7qDCcQ=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLf4xBlWNenAH9bvp5f1IUITH11Np6fPGQcdZFXMmUBG7NxM0HDP-gPvlmfwxVGufLPvwJhBJcVW4Y4dYcoKE40UYNYQ3NxeHn7TCKt-LHuR5Nr97XJQg84qg5nChXGhxFCf7qDCcQ=s1600', true, 0, 'Appartement meublé Akwa chez Tigson')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLf4xBlWNenAH9bvp5f1IUITH11Np6fPGQcdZFXMmUBG7NxM0HDP-gPvlmfwxVGufLPvwJhBJcVW4Y4dYcoKE40UYNYQ3NxeHn7TCKt-LHuR5Nr97XJQg84qg5nChXGhxFCf7qDCcQ=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLf4xBlWNenAH9bvp5f1IUITH11Np6fPGQcdZFXMmUBG7NxM0HDP-gPvlmfwxVGufLPvwJhBJcVW4Y4dYcoKE40UYNYQ3NxeHn7TCKt-LHuR5Nr97XJQg84qg5nChXGhxFCf7qDCcQ=s1600-p-k-no', false, 1, 'Appartement meublé Akwa chez Tigson')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R4eTGhow2VRBDXMfV15tS2K--eiDRGE6jSfKYhBL4Tei7rIm1EP58PNfxCOOlkrCBMoQJg6gaEG73A_P1PqnwhkXVYE6oo0r__Qc9INEeNW3BaGzQj5IHfADzRmCH1mmb5yJWP0A=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R4eTGhow2VRBDXMfV15tS2K--eiDRGE6jSfKYhBL4Tei7rIm1EP58PNfxCOOlkrCBMoQJg6gaEG73A_P1PqnwhkXVYE6oo0r__Qc9INEeNW3BaGzQj5IHfADzRmCH1mmb5yJWP0A=s1600', false, 2, 'Appartement meublé Akwa chez Tigson')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TNgqQNsMPqk-0t9kuijcHnOZpSnajSpq5oZy2Uae49SK69_Aw0gWeVVipAfOqzIiu-38Sk2r-mwolpm6lAkArRM6xphFYXhSd8ulCJ2ZPa_igQotZjat6B-3pXmutESULwx9msUQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TNgqQNsMPqk-0t9kuijcHnOZpSnajSpq5oZy2Uae49SK69_Aw0gWeVVipAfOqzIiu-38Sk2r-mwolpm6lAkArRM6xphFYXhSd8ulCJ2ZPa_igQotZjat6B-3pXmutESULwx9msUQ=s1600', false, 3, 'Appartement meublé Akwa chez Tigson')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SUAl2G3NB8_T_YxjgKjPmM5FqQG2hNud1-bS6zQhu2tErWDW8Ni57XNwce-ck9FAQwQ7sJXTnyEPPyFsxgf36gb42hh8Ejnhhw8QmWCOgBJwPzk0l77RvkbTy0MClRa7mrcrtg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SUAl2G3NB8_T_YxjgKjPmM5FqQG2hNud1-bS6zQhu2tErWDW8Ni57XNwce-ck9FAQwQ7sJXTnyEPPyFsxgf36gb42hh8Ejnhhw8QmWCOgBJwPzk0l77RvkbTy0MClRa7mrcrtg=s1600', false, 4, 'Appartement meublé Akwa chez Tigson')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qy43Q2g8qdwnNuzDL7ogRggbrFGH-h13BqLnadCTvqmcjtzNfbLCx3kh1wioRkNEgB7V7rZ5H6JDNNAR2aaesSysKd7u3T6KC1lxa2DrI7IKkKEVwVrbPYyOuAhEgyxcDY4c5Vfg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qy43Q2g8qdwnNuzDL7ogRggbrFGH-h13BqLnadCTvqmcjtzNfbLCx3kh1wioRkNEgB7V7rZ5H6JDNNAR2aaesSysKd7u3T6KC1lxa2DrI7IKkKEVwVrbPYyOuAhEgyxcDY4c5Vfg=s1600', false, 5, 'Appartement meublé Akwa chez Tigson')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TADf2B4JbW7eRVwMSmVLc8IuH25qstXwFQedT3ElRBmY9vlw_M6TSpnUa5uJ6FsosjmvC10DObPx38E8NMv3WRIXV7fRxLXXbvtbudsk-RKdGPP4bOJucJ6cjziwcnGuMHSgU3yw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TADf2B4JbW7eRVwMSmVLc8IuH25qstXwFQedT3ElRBmY9vlw_M6TSpnUa5uJ6FsosjmvC10DObPx38E8NMv3WRIXV7fRxLXXbvtbudsk-RKdGPP4bOJucJ6cjziwcnGuMHSgU3yw=s1600', false, 6, 'Appartement meublé Akwa chez Tigson')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QGIiuFP0ZFVxYDkRCe4h0aWUomyR_9WBvUNEF3WsOwrJADzLDRlh5dsWQ8rF-yjSM_E1fevynxceWYRNddHJucxjhC3OsCVpwTb9FFwnXjeJNBCl5Z0W7L8CcrPmsSZOrGWFPO=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QGIiuFP0ZFVxYDkRCe4h0aWUomyR_9WBvUNEF3WsOwrJADzLDRlh5dsWQ8rF-yjSM_E1fevynxceWYRNddHJucxjhC3OsCVpwTb9FFwnXjeJNBCl5Z0W7L8CcrPmsSZOrGWFPO=s1600', false, 7, 'Appartement meublé Akwa chez Tigson')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QK2APQtWf-YgIYPtJnAC_gl1191QhOjxJtSvbd_b3PF-EAZsREmYXebuiEjZsnKGzxgsvTxjf75LlPXUXoDB9ps3U0FrMS-Vdp5kgD2lDa5qBub1tutpcOKxrZ2kpxzW_1Yglp=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QK2APQtWf-YgIYPtJnAC_gl1191QhOjxJtSvbd_b3PF-EAZsREmYXebuiEjZsnKGzxgsvTxjf75LlPXUXoDB9ps3U0FrMS-Vdp5kgD2lDa5qBub1tutpcOKxrZ2kpxzW_1Yglp=s1600', false, 8, 'Appartement meublé Akwa chez Tigson')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TP7uSxhJbPw0cv0pL2W1zE5Xvll_RjLrK4zRiaZ89LyDJbeHo1nXtcymCT6TNK8ZRq6hFW5Njb2YeAuBZqtYHUnuzT7k3Z8oG8_DRYyi99ifb3qxVjC9mnlw70ybDfYna4Ie4=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TP7uSxhJbPw0cv0pL2W1zE5Xvll_RjLrK4zRiaZ89LyDJbeHo1nXtcymCT6TNK8ZRq6hFW5Njb2YeAuBZqtYHUnuzT7k3Z8oG8_DRYyi99ifb3qxVjC9mnlw70ybDfYna4Ie4=s1600', false, 9, 'Appartement meublé Akwa chez Tigson')
  on conflict do nothing;

  -- [19] APPARTEMENT & STUDIO MEUBLES (Akwa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-studio-meubles-akwa',
    'studio',
    'published',
    'APPARTEMENT & STUDIO MEUBLES',
    'APPARTEMENT & STUDIO MEUBLES
Catégorie : Appartement de vacances.
Adresse : 2MHV+68C, Douala.
Contact / WhatsApp : +237653175758.
Note Google Maps : 4.1/5 (24 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Murtala mohamed Sani, note 5/5)
- "Note sans commentaire écrit." (Yann Toffessi, note 5/5)
- "Note sans commentaire écrit." (Raelle Mboudou, note 3/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'akwa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '2MHV+68C, Douala',
    4.0280579,
    9.6932545,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfqWtIDPz-JXmRm8rmOcLdc54E5b9d5_7zQieXDKKee43iZ5YtrfmIriuI-v0Nl4DsJd68N6FEzjVpmJDFjOMRLafAfZHbYW67TIPVtF9UllsfDB25DsthPkOpK8wK-ACILam_e=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfqWtIDPz-JXmRm8rmOcLdc54E5b9d5_7zQieXDKKee43iZ5YtrfmIriuI-v0Nl4DsJd68N6FEzjVpmJDFjOMRLafAfZHbYW67TIPVtF9UllsfDB25DsthPkOpK8wK-ACILam_e=s1600', true, 0, 'APPARTEMENT & STUDIO MEUBLES')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfqWtIDPz-JXmRm8rmOcLdc54E5b9d5_7zQieXDKKee43iZ5YtrfmIriuI-v0Nl4DsJd68N6FEzjVpmJDFjOMRLafAfZHbYW67TIPVtF9UllsfDB25DsthPkOpK8wK-ACILam_e=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfqWtIDPz-JXmRm8rmOcLdc54E5b9d5_7zQieXDKKee43iZ5YtrfmIriuI-v0Nl4DsJd68N6FEzjVpmJDFjOMRLafAfZHbYW67TIPVtF9UllsfDB25DsthPkOpK8wK-ACILam_e=s1600-p-k-no', false, 1, 'APPARTEMENT & STUDIO MEUBLES')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TZlPPdkFh2L7vt0GrtzkIbalA3hx8C-O7E8QQf1YDUWLCBhA1WWNnVFPwFhE9P8Oo3yBiDfJPsn-Eowz61BU1Im1XS7UYtU6olQm9S09LQNATdev1ycYaReTAsYwrUX9olPVfq=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TZlPPdkFh2L7vt0GrtzkIbalA3hx8C-O7E8QQf1YDUWLCBhA1WWNnVFPwFhE9P8Oo3yBiDfJPsn-Eowz61BU1Im1XS7UYtU6olQm9S09LQNATdev1ycYaReTAsYwrUX9olPVfq=s1600', false, 2, 'APPARTEMENT & STUDIO MEUBLES')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SPqlBSYkUNMs-tZwLWvpS2YTnUcixfIYVJ3o4QYijyfJs2BEOAWNthPZ84ewqumCvMfT_iiqdempgTmgtJyWGKzn2zFRc1rez_Epb2Pqxawc0LljonmNVN89LsfqudRmZhvYU=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SPqlBSYkUNMs-tZwLWvpS2YTnUcixfIYVJ3o4QYijyfJs2BEOAWNthPZ84ewqumCvMfT_iiqdempgTmgtJyWGKzn2zFRc1rez_Epb2Pqxawc0LljonmNVN89LsfqudRmZhvYU=s1600', false, 3, 'APPARTEMENT & STUDIO MEUBLES')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QLNWV1NlPhZYD2v2GroenhpmRp9XZ2ZaiJBMnORlnXlnBn1YFabhbs2yiyfqyPLWGQT2fsZDEEAAl1oPbjw8ckMIYDz0O2mwyvFDZaFy0LVS-PYQ5XyFY9EsMc9eI1d0_euKc=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QLNWV1NlPhZYD2v2GroenhpmRp9XZ2ZaiJBMnORlnXlnBn1YFabhbs2yiyfqyPLWGQT2fsZDEEAAl1oPbjw8ckMIYDz0O2mwyvFDZaFy0LVS-PYQ5XyFY9EsMc9eI1d0_euKc=s1600', false, 4, 'APPARTEMENT & STUDIO MEUBLES')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SWqO5qnngolBJOPyPO44E6jbdAT-hjGRlPpySPoqXH9orIkSmlxteCwfQUuJ8wPPj0dzxjOquekUA38zOR9rgFiJWZo81cEz4UyIStfM7GVlaLWGUyaz-dRFNIwJ6_bdN1zmckIg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SWqO5qnngolBJOPyPO44E6jbdAT-hjGRlPpySPoqXH9orIkSmlxteCwfQUuJ8wPPj0dzxjOquekUA38zOR9rgFiJWZo81cEz4UyIStfM7GVlaLWGUyaz-dRFNIwJ6_bdN1zmckIg=s1600', false, 5, 'APPARTEMENT & STUDIO MEUBLES')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a-/ALV-UjXMm6SiX_TLGRmmQKv4Egwo1Z2qnxoIuZTriC19ltmkM9OUwGKwrg=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a-/ALV-UjXMm6SiX_TLGRmmQKv4Egwo1Z2qnxoIuZTriC19ltmkM9OUwGKwrg=s1600-p-k-no-mo', false, 6, 'APPARTEMENT & STUDIO MEUBLES')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TvRlE-q3nbpq-xifu7_A_XLJw5MDO97lRIRKHA51Vcb6uQVma3MPBHs81e8ug-I8dpagMBMRxS23DxnG31vrGye72Q4v0kW1C1wopTVGtSthBxONP8IfD4Rd1uNzZ6zvyHz1eeeg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TvRlE-q3nbpq-xifu7_A_XLJw5MDO97lRIRKHA51Vcb6uQVma3MPBHs81e8ug-I8dpagMBMRxS23DxnG31vrGye72Q4v0kW1C1wopTVGtSthBxONP8IfD4Rd1uNzZ6zvyHz1eeeg=s1600', false, 7, 'APPARTEMENT & STUDIO MEUBLES')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QK6pdp5NNafzG7CXMu5v8nuenHIrseOeOulnngFJvpntt1B7LtqXk6gd_EDH34DsxdPfKE1-g6hVOrGduh2nTLIjgQjFCXPzyDJqgNfbkBCLIZBA53XS4JBUJTyUksR9cwesmUJg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QK6pdp5NNafzG7CXMu5v8nuenHIrseOeOulnngFJvpntt1B7LtqXk6gd_EDH34DsxdPfKE1-g6hVOrGduh2nTLIjgQjFCXPzyDJqgNfbkBCLIZBA53XS4JBUJTyUksR9cwesmUJg=s1600', false, 8, 'APPARTEMENT & STUDIO MEUBLES')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QWT9mD_T_NBFL-iZLzv-pI6gVJDckx9BYCh3IaDJ6QSkFFwBbbluPqFemv4nygWDDI_vvZkKypJFyp6mmTVp0lUjSbUzoFA9HnPyee1QuHlAuoQe12V0nnVUoFtaUsfIhgmort=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QWT9mD_T_NBFL-iZLzv-pI6gVJDckx9BYCh3IaDJ6QSkFFwBbbluPqFemv4nygWDDI_vvZkKypJFyp6mmTVp0lUjSbUzoFA9HnPyee1QuHlAuoQe12V0nnVUoFtaUsfIhgmort=s1600', false, 9, 'APPARTEMENT & STUDIO MEUBLES')
  on conflict do nothing;

  -- [20] Studio meublé akwa - One-Bedroom Apartment (Akwa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'studio-meuble-akwa-one-bedroom-apartment-akwa',
    'studio',
    'published',
    'Studio meublé akwa - One-Bedroom Apartment',
    'Studio meublé akwa - One-Bedroom Apartment
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'akwa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0473199,
    9.7114201,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0O4op_XxPD06tHYz9usBT_2vqEhKUXP6kt7e6OB4dqZRlMmKyE1GbQHx4Uh2msJ2C0IAHK1OkX9L-hOlIeinM2yXUjZbY6fziqAnAVOf_tvzfoWxyAayHFsddkruOd559VTcqqCXYRgDyH2TSRAUgv8PZhM0PNSUuvKEURh6ettJz9mnnep2hwmg=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0O4op_XxPD06tHYz9usBT_2vqEhKUXP6kt7e6OB4dqZRlMmKyE1GbQHx4Uh2msJ2C0IAHK1OkX9L-hOlIeinM2yXUjZbY6fziqAnAVOf_tvzfoWxyAayHFsddkruOd559VTcqqCXYRgDyH2TSRAUgv8PZhM0PNSUuvKEURh6ettJz9mnnep2hwmg=s1600', true, 0, 'Studio meublé akwa - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0O4op_XxPD06tHYz9usBT_2vqEhKUXP6kt7e6OB4dqZRlMmKyE1GbQHx4Uh2msJ2C0IAHK1OkX9L-hOlIeinM2yXUjZbY6fziqAnAVOf_tvzfoWxyAayHFsddkruOd559VTcqqCXYRgDyH2TSRAUgv8PZhM0PNSUuvKEURh6ettJz9mnnep2hwmg=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0O4op_XxPD06tHYz9usBT_2vqEhKUXP6kt7e6OB4dqZRlMmKyE1GbQHx4Uh2msJ2C0IAHK1OkX9L-hOlIeinM2yXUjZbY6fziqAnAVOf_tvzfoWxyAayHFsddkruOd559VTcqqCXYRgDyH2TSRAUgv8PZhM0PNSUuvKEURh6ettJz9mnnep2hwmg=s1600-p-k-no', false, 1, 'Studio meublé akwa - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGgnIxkPRvid0WeYkPj59wKTLLNE24zimj6wZT_8FVDLk_6zPO_l1JGafSTlCH8kx6HNRkw2Mh7pxiw4fJ2t7zn73o6g6MTB6Vm7zPe06y6mSOdVck3EnPeshUN6rJUJDqEZM7rzElnjmien5a841cj52-cz_9vCkoqbQby8bJpEL7WcX7mtvQtFA=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGgnIxkPRvid0WeYkPj59wKTLLNE24zimj6wZT_8FVDLk_6zPO_l1JGafSTlCH8kx6HNRkw2Mh7pxiw4fJ2t7zn73o6g6MTB6Vm7zPe06y6mSOdVck3EnPeshUN6rJUJDqEZM7rzElnjmien5a841cj52-cz_9vCkoqbQby8bJpEL7WcX7mtvQtFA=s1600', false, 2, 'Studio meublé akwa - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEG8USinp5Pr2JpjyYnxeT3nc4noCcjsq4ShjxAP-8utvl0N6m9y31gcDRhwduw_yxKttPIDDnS1Cqd61qeCwNIrlVIHuqAwwvAL-m0l5Qbq9W6v4EVXckwj27J5U02GmFSeYlfvRg1z5ReFa-ndSzRoh4vnwgdfOP2sYCu0TjhEeX_HpWApUlh=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEG8USinp5Pr2JpjyYnxeT3nc4noCcjsq4ShjxAP-8utvl0N6m9y31gcDRhwduw_yxKttPIDDnS1Cqd61qeCwNIrlVIHuqAwwvAL-m0l5Qbq9W6v4EVXckwj27J5U02GmFSeYlfvRg1z5ReFa-ndSzRoh4vnwgdfOP2sYCu0TjhEeX_HpWApUlh=s1600', false, 3, 'Studio meublé akwa - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHAdXrqGzQNbNAOUKmPdy3Yqq9kqkWy6X0ri9ur1RDKfTPYeSS_fmeSmf-wt3qSE5lBqjFfMIlEH1QeAwr4c0URZgezt6bE1u7fXwGYvW6RlB8nXsdAMZc-iRgUqixpMVUvuKX2ZNH--UkF_JyvWAmkFsJVnZZKdGGj2s2p8rXRdujTFUGBrMgh=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHAdXrqGzQNbNAOUKmPdy3Yqq9kqkWy6X0ri9ur1RDKfTPYeSS_fmeSmf-wt3qSE5lBqjFfMIlEH1QeAwr4c0URZgezt6bE1u7fXwGYvW6RlB8nXsdAMZc-iRgUqixpMVUvuKX2ZNH--UkF_JyvWAmkFsJVnZZKdGGj2s2p8rXRdujTFUGBrMgh=s1600', false, 4, 'Studio meublé akwa - One-Bedroom Apartment')
  on conflict do nothing;

  -- [21] Résidence Folépé (Akwa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-folepe-akwa',
    'apartment',
    'published',
    'Résidence Folépé',
    'Résidence Folépé
Catégorie : Location d''appartement de vacances.
Adresse : 186 Rue Dikoumé Bell, Douala.
Contact / WhatsApp : +237699688638.
Note Google Maps : 3.8/5 (124 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Darel Massoda, note 1/5)
- "Note sans commentaire écrit." (Virginie Moyo, note 4/5)
- "Note sans commentaire écrit." (Hermann KOUETCHO, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'akwa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '186 Rue Dikoumé Bell, Douala',
    4.0395855,
    9.6948314,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLen2xnLXqwmXlI6qWpfU7TvEWAJy7W6xwj8GlEx-8GaS3wRxEmim65bakTcaUdHAUp4ck7mYo8CR_d6imydsN-ZnY7ORTYpKwZvfRgaLVDvPa17ltySpCSZh8e6yLAeom3RFMfR=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLen2xnLXqwmXlI6qWpfU7TvEWAJy7W6xwj8GlEx-8GaS3wRxEmim65bakTcaUdHAUp4ck7mYo8CR_d6imydsN-ZnY7ORTYpKwZvfRgaLVDvPa17ltySpCSZh8e6yLAeom3RFMfR=s1600', true, 0, 'Résidence Folépé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLen2xnLXqwmXlI6qWpfU7TvEWAJy7W6xwj8GlEx-8GaS3wRxEmim65bakTcaUdHAUp4ck7mYo8CR_d6imydsN-ZnY7ORTYpKwZvfRgaLVDvPa17ltySpCSZh8e6yLAeom3RFMfR=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLen2xnLXqwmXlI6qWpfU7TvEWAJy7W6xwj8GlEx-8GaS3wRxEmim65bakTcaUdHAUp4ck7mYo8CR_d6imydsN-ZnY7ORTYpKwZvfRgaLVDvPa17ltySpCSZh8e6yLAeom3RFMfR=s1600-p-k-no', false, 1, 'Résidence Folépé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QrYPGyxY---LIh_AQGvHeMIBRVW2YSWMYmORRaouYv6EskImY0kLWhvR1RrA-ySbf7eDNaYt51QNNizXeBaksP8qw2Lvsa-F-bWRAjyYiBImEVukPEstvf83VSYJw30TO7_JHQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QrYPGyxY---LIh_AQGvHeMIBRVW2YSWMYmORRaouYv6EskImY0kLWhvR1RrA-ySbf7eDNaYt51QNNizXeBaksP8qw2Lvsa-F-bWRAjyYiBImEVukPEstvf83VSYJw30TO7_JHQ=s1600', false, 2, 'Résidence Folépé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QEFVz7sp1DJp-YjwjCWwbUx3gHrsM7V4efTpmNaFnDNTZ0hegVuz4BoEbQ4KTKwBBE1wSyfTppA3goMo6AJoREAYjvNCBuU5uNnca5cII5y_gMq9DqXE42szFi4qfz3C1MyTVo=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QEFVz7sp1DJp-YjwjCWwbUx3gHrsM7V4efTpmNaFnDNTZ0hegVuz4BoEbQ4KTKwBBE1wSyfTppA3goMo6AJoREAYjvNCBuU5uNnca5cII5y_gMq9DqXE42szFi4qfz3C1MyTVo=s1600', false, 3, 'Résidence Folépé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RHDyTdgjh__WJAEgEH0FoCw6ef3u0gtu9KMFVUFZaxpd3vty5Kuritol9xvrVu5wPpysjyAkwByhbMdQS5_-ac_2Nw2leEm9WvqemRP4xZlWwpzziNNmxSTznogQ0OvrhVSdoW=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RHDyTdgjh__WJAEgEH0FoCw6ef3u0gtu9KMFVUFZaxpd3vty5Kuritol9xvrVu5wPpysjyAkwByhbMdQS5_-ac_2Nw2leEm9WvqemRP4xZlWwpzziNNmxSTznogQ0OvrhVSdoW=s1600', false, 4, 'Résidence Folépé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qvczppc1K4h5oGZJOxaC0wHq0tmrd3F1yY7bFPjls9Nf20B8AprseRRPZBsU56htzd3fxr-AX9jTy2_o9L0zzNlN5uLdV-fX1jvB_byVqk64i3yb_bH90om8hGM-CyG-qOUlGR=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qvczppc1K4h5oGZJOxaC0wHq0tmrd3F1yY7bFPjls9Nf20B8AprseRRPZBsU56htzd3fxr-AX9jTy2_o9L0zzNlN5uLdV-fX1jvB_byVqk64i3yb_bH90om8hGM-CyG-qOUlGR=s1600', false, 5, 'Résidence Folépé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SSBbbaAqs6hilJ0pzOfViwciEzMiA56oN3xqj2wmnDFIC6dEKhC4qlYgupkuCs6RtoILYneD6lAb87plBrms2ypyVjzkt0gPPLR5QPnvB7HbVeHFbSItdwQbgB3VKOrXvtecBMDQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SSBbbaAqs6hilJ0pzOfViwciEzMiA56oN3xqj2wmnDFIC6dEKhC4qlYgupkuCs6RtoILYneD6lAb87plBrms2ypyVjzkt0gPPLR5QPnvB7HbVeHFbSItdwQbgB3VKOrXvtecBMDQ=s1600', false, 6, 'Résidence Folépé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9To7Y9IBJ3qJiHFcBbP0jajgNEjrJj5Oxw-Bw9hHjmxAKcJJiSlxNFYqG1a4-IaNYGy05RkU2Csu_d7Ok0YB5weQTlenZ1t-3dPaqXWj-JisI4VmLfZR9ta2wkN4IdMH1y0eId1=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9To7Y9IBJ3qJiHFcBbP0jajgNEjrJj5Oxw-Bw9hHjmxAKcJJiSlxNFYqG1a4-IaNYGy05RkU2Csu_d7Ok0YB5weQTlenZ1t-3dPaqXWj-JisI4VmLfZR9ta2wkN4IdMH1y0eId1=s1600', false, 7, 'Résidence Folépé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SfRGv1WaaIvn3P3R9_xG9AVht1zthdJZE97BChMvJpXi--MlNv5BLoxQ7HWtop9eLtRvJf83MSZuRsUO31gLTVP3BlVSq0zFPiWdagG__-7H24LGypumVfkUU588zrx4oc0n53=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SfRGv1WaaIvn3P3R9_xG9AVht1zthdJZE97BChMvJpXi--MlNv5BLoxQ7HWtop9eLtRvJf83MSZuRsUO31gLTVP3BlVSq0zFPiWdagG__-7H24LGypumVfkUU588zrx4oc0n53=s1600', false, 8, 'Résidence Folépé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S0CoxOb2PtawsgFOnB90Iix4vuyHsTdQdtsvDri308dgkaTrSi0pKBatCErG0xwp6NyjdIOFJ2u6si8qtk-kbsY8F5dZtx9I3HWYxEiLTJenHUWd5_WImHu6t07m2eaoPJ0A6Zng=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S0CoxOb2PtawsgFOnB90Iix4vuyHsTdQdtsvDri308dgkaTrSi0pKBatCErG0xwp6NyjdIOFJ2u6si8qtk-kbsY8F5dZtx9I3HWYxEiLTJenHUWd5_WImHu6t07m2eaoPJ0A6Zng=s1600', false, 9, 'Résidence Folépé')
  on conflict do nothing;

  -- [22] Residence Le CARAT (Akwa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-le-carat-akwa',
    'apartment',
    'published',
    'Residence Le CARAT',
    'Residence Le CARAT
Adresse : Carrefour salle des fêtes d''Akwa,, Douala.
Contact / WhatsApp : +237690482149.
Note Google Maps : 4/5 (320 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'akwa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Carrefour salle des fêtes d''Akwa,, Douala',
    4.0505691,
    9.7020717,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2aRShc2PC8zDmFxnv31ejI_IluRyGA69OlTZIxLm2lfkYOLsGuXF-EnH_gu-SyOXkzd7DmaKZhMvh3Ju_6ejL1OrUkxa1ZaAkPHAVWhIDO_D84IzMVyczUKveklmhk6d9_qUN5gPAePf3O67mzv2cmoNnHVxFlxG9qXKlwDsmTc-QDuKabmfV4=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2aRShc2PC8zDmFxnv31ejI_IluRyGA69OlTZIxLm2lfkYOLsGuXF-EnH_gu-SyOXkzd7DmaKZhMvh3Ju_6ejL1OrUkxa1ZaAkPHAVWhIDO_D84IzMVyczUKveklmhk6d9_qUN5gPAePf3O67mzv2cmoNnHVxFlxG9qXKlwDsmTc-QDuKabmfV4=s1600', true, 0, 'Residence Le CARAT')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2aRShc2PC8zDmFxnv31ejI_IluRyGA69OlTZIxLm2lfkYOLsGuXF-EnH_gu-SyOXkzd7DmaKZhMvh3Ju_6ejL1OrUkxa1ZaAkPHAVWhIDO_D84IzMVyczUKveklmhk6d9_qUN5gPAePf3O67mzv2cmoNnHVxFlxG9qXKlwDsmTc-QDuKabmfV4=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2aRShc2PC8zDmFxnv31ejI_IluRyGA69OlTZIxLm2lfkYOLsGuXF-EnH_gu-SyOXkzd7DmaKZhMvh3Ju_6ejL1OrUkxa1ZaAkPHAVWhIDO_D84IzMVyczUKveklmhk6d9_qUN5gPAePf3O67mzv2cmoNnHVxFlxG9qXKlwDsmTc-QDuKabmfV4=s1600-p-k-no', false, 1, 'Residence Le CARAT')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFFXqw_LivVXWmW7KrJMDXMLsLjyp0KlK9B1PIGkQjov0YfqS3oErI1k_qJKgQ4p7L6bUFfDaTpkb-8QGN-HoWy7m8dZ4fOGfkdGj37GNxdVS1YYlxePVADlgj2RmO5JHb7k-1n0KkCJB7fBepGm7g2Ir4SsJ62sYi0NPgDSWc7SSO6ZGN4tJAy=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFFXqw_LivVXWmW7KrJMDXMLsLjyp0KlK9B1PIGkQjov0YfqS3oErI1k_qJKgQ4p7L6bUFfDaTpkb-8QGN-HoWy7m8dZ4fOGfkdGj37GNxdVS1YYlxePVADlgj2RmO5JHb7k-1n0KkCJB7fBepGm7g2Ir4SsJ62sYi0NPgDSWc7SSO6ZGN4tJAy=s1600', false, 2, 'Residence Le CARAT')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhElNUVLv__fWpZQfX3ZTG83e6JHZ3C_TU7xt27llYjeIMOCJ-aUqvdenEFeYDTvkki-RH5y4YxGD6lXOak_tZ9ZWpkEnHDD5-WTrljnzgV4x7VsqSWkga9CYCDH2YY4n-LZoRKTn9Lg4lgxSWG4xZ_Jd0-yo8x6uZcLJNMR6gx9jRLbxVE1lnSZ3A=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhElNUVLv__fWpZQfX3ZTG83e6JHZ3C_TU7xt27llYjeIMOCJ-aUqvdenEFeYDTvkki-RH5y4YxGD6lXOak_tZ9ZWpkEnHDD5-WTrljnzgV4x7VsqSWkga9CYCDH2YY4n-LZoRKTn9Lg4lgxSWG4xZ_Jd0-yo8x6uZcLJNMR6gx9jRLbxVE1lnSZ3A=s1600', false, 3, 'Residence Le CARAT')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhE61maiK6kMthGOQ_cb4GCTuLvIGKsP89KiDsqZP7sLVi1d4lxL-egxzcHn7wMN9uU5w8UxBg0uJxDJqptPpTfmJujffkTG5of9zYGqkcyNcGMZRWaCZ6wdKUdViAe1QDZwJFt_mTFBohLPl1FfeUoeT_zoArKRPEulwxcF_SF9lfhFLsvohKVYqg=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhE61maiK6kMthGOQ_cb4GCTuLvIGKsP89KiDsqZP7sLVi1d4lxL-egxzcHn7wMN9uU5w8UxBg0uJxDJqptPpTfmJujffkTG5of9zYGqkcyNcGMZRWaCZ6wdKUdViAe1QDZwJFt_mTFBohLPl1FfeUoeT_zoArKRPEulwxcF_SF9lfhFLsvohKVYqg=s1600', false, 4, 'Residence Le CARAT')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGaqGJv-UAsENcEW2JZSQC0xm2O_fhz-e3zYJdizMPQpla3pWevkIdK9hDiDKAJxa0YXrFT-G7wcVQru2FOLdsLudWq606H0FdMaDaesee-TwaKdQMk3vd15iybhRpMw7is-1AwQtg7-aBBcxn1WK737eUMF-2kMVtQWvLipiysnAggQFfQFWyT3g=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGaqGJv-UAsENcEW2JZSQC0xm2O_fhz-e3zYJdizMPQpla3pWevkIdK9hDiDKAJxa0YXrFT-G7wcVQru2FOLdsLudWq606H0FdMaDaesee-TwaKdQMk3vd15iybhRpMw7is-1AwQtg7-aBBcxn1WK737eUMF-2kMVtQWvLipiysnAggQFfQFWyT3g=s1600', false, 5, 'Residence Le CARAT')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFEHloLoF8eCZ-rOVBksaeaWoM1LikZfcak2iv6LdPOFwtgwCMwMMM8bFKHTC5WE4I9N_lwZIjw1yjDMCDuwxYnSzVC-6uFzfckoGfhOeT_pabw5uC0B98z5NanwN27SncMeoaueW86j7b7Jt6lBmOZFf9b2V4zaLTqzrMFMMeMDw8WvroHCJw=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFEHloLoF8eCZ-rOVBksaeaWoM1LikZfcak2iv6LdPOFwtgwCMwMMM8bFKHTC5WE4I9N_lwZIjw1yjDMCDuwxYnSzVC-6uFzfckoGfhOeT_pabw5uC0B98z5NanwN27SncMeoaueW86j7b7Jt6lBmOZFf9b2V4zaLTqzrMFMMeMDw8WvroHCJw=s1600', false, 6, 'Residence Le CARAT')
  on conflict do nothing;

  -- [23] Appart duplex chic avec piscine à Bali (Bali)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appart-duplex-chic-avec-piscine-a-bali-bali',
    'duplex',
    'published',
    'Appart duplex chic avec piscine à Bali',
    'Appart duplex chic avec piscine à Bali
Catégorie : Appartement avec services.
Adresse : 2MPX+M5F, 226 Rue Koufrah, Douala.
Contact / WhatsApp : +41786238180.
Note Google Maps : 3.7/5 (6 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Haoua Djidda, note 4/5)
- "Note sans commentaire écrit." (Wilfried Lefoké, note 1/5)
- "Note sans commentaire écrit." (Emmanuel Patrice Bille, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bali'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '2MPX+M5F, 226 Rue Koufrah, Douala',
    4.0367092,
    9.6978122,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/a/ACg8ocI18ZIwaRPq85D6D7dZmDlxjn50-RqPSzSOdh8IoyErrRTlvA=s1600-p-rp-mo-ba12-br100', 'https://lh3.googleusercontent.com/a/ACg8ocI18ZIwaRPq85D6D7dZmDlxjn50-RqPSzSOdh8IoyErrRTlvA=s1600-p-rp-mo-ba12-br100', true, 0, 'Appart duplex chic avec piscine à Bali')
  on conflict do nothing;

  -- [24] Express Logement Cameroun (Akwa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'express-logement-cameroun-akwa',
    'apartment',
    'published',
    'Express Logement Cameroun',
    'Express Logement Cameroun
Catégorie : Complexe d''appartements meublés.
Adresse : 15185 Bd de la république Mobile, Douala.
Contact / WhatsApp : +237694931950.
Note Google Maps : 4.8/5 (8 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Claude Michel Ngounou, note 5/5)
- "Note sans commentaire écrit." (carelle AZEBAZE, note 5/5)
- "Note sans commentaire écrit." (Markup, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'akwa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '15185 Bd de la république Mobile, Douala',
    4.0537155,
    9.7047789,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdFnRuIhSBA-yo05cbGytlJKYHirp65360dAp6_i_QGFajMT_BR7dfeIzPqV2TsJ7BKqOqnOuy8adfytORZ7lIubIaXgUkIAKcPWVTWXOGhIPLP9BaPhZSHcpOqYdHHRYNH5WeO5A=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdFnRuIhSBA-yo05cbGytlJKYHirp65360dAp6_i_QGFajMT_BR7dfeIzPqV2TsJ7BKqOqnOuy8adfytORZ7lIubIaXgUkIAKcPWVTWXOGhIPLP9BaPhZSHcpOqYdHHRYNH5WeO5A=s1600', true, 0, 'Express Logement Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SwH6QsMhhfQxp3JqsSUm0v3SzxnRdpSrpZUxNB75NyS_sO7gxkIJqJ3Tn-M2EbWReZlIfjQ-MMxwsySOGvd8NiAep4O-PY_0P3BBdenECwf-qg_qwm4lHNYVAEjDfEIC7UwR8D-Q=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SwH6QsMhhfQxp3JqsSUm0v3SzxnRdpSrpZUxNB75NyS_sO7gxkIJqJ3Tn-M2EbWReZlIfjQ-MMxwsySOGvd8NiAep4O-PY_0P3BBdenECwf-qg_qwm4lHNYVAEjDfEIC7UwR8D-Q=s1600', false, 1, 'Express Logement Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R9i1IpSw2gkZQ7iea5Eq5cSp4epRslVdUqgkE1PiZ_Hhyzj0mXLg2hfkIq5SA_s-OF1Ew4m_Am_q3rvy4JMQL-yt95HnYvPnR7DxyvoixQHvDmdZ-7RObumxDzI0h9-jNXIP1y=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R9i1IpSw2gkZQ7iea5Eq5cSp4epRslVdUqgkE1PiZ_Hhyzj0mXLg2hfkIq5SA_s-OF1Ew4m_Am_q3rvy4JMQL-yt95HnYvPnR7DxyvoixQHvDmdZ-7RObumxDzI0h9-jNXIP1y=s1600', false, 2, 'Express Logement Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S4d5imDgWawciaZTCGFvBliZmQhW3OTGUpm1oareGQlc0En1eq9jH0BmoGVCpJZTd6W5kuHyHkiZ6ApMnUzkjLeGtIgsQ9aiCc44GcMvHvubhrRHoebdXAKjV5IM0IyoF2vcI=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S4d5imDgWawciaZTCGFvBliZmQhW3OTGUpm1oareGQlc0En1eq9jH0BmoGVCpJZTd6W5kuHyHkiZ6ApMnUzkjLeGtIgsQ9aiCc44GcMvHvubhrRHoebdXAKjV5IM0IyoF2vcI=s1600', false, 3, 'Express Logement Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qy1vw3kOMHXERayQ_Fxg5tIMOU5KfT3v6XIP3TVsOG056ai55EKyINAysghRkaaXwbIztpoMYx1GYzRbXP5kruaMxtUpCXnbY6zwOJp0RtkNqpQdES1fpGXyK_Ifc0nf9_5VA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qy1vw3kOMHXERayQ_Fxg5tIMOU5KfT3v6XIP3TVsOG056ai55EKyINAysghRkaaXwbIztpoMYx1GYzRbXP5kruaMxtUpCXnbY6zwOJp0RtkNqpQdES1fpGXyK_Ifc0nf9_5VA=s1600', false, 4, 'Express Logement Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9ToLRWI4G4QwPxf6dlPsU0YjUQqw8P2AaaBAP2D7sT0kaodl2rt2QmStBHE1dUxjlMnsxoxYvO45NG4KjOAr4PaHKmDwCV4-CPSMYCUk4spG9ongQqTUsZ1hzAfrq2-laFTuGLqsfryvEK8=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9ToLRWI4G4QwPxf6dlPsU0YjUQqw8P2AaaBAP2D7sT0kaodl2rt2QmStBHE1dUxjlMnsxoxYvO45NG4KjOAr4PaHKmDwCV4-CPSMYCUk4spG9ongQqTUsZ1hzAfrq2-laFTuGLqsfryvEK8=s1600', false, 5, 'Express Logement Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qx4Vfx4TLo0J095mxVJ1Kdqk2t-4F3wWpH1ms274_mHLvJQ1wHcNQt-bpkXj5BN-pUGpsrrAv5DEzGzgXItO0qmmSjfSnPmLtjx0ulYNUd8zXaWvu8oN3SdFJwVYYsho_9pn06y2_UlL5M=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qx4Vfx4TLo0J095mxVJ1Kdqk2t-4F3wWpH1ms274_mHLvJQ1wHcNQt-bpkXj5BN-pUGpsrrAv5DEzGzgXItO0qmmSjfSnPmLtjx0ulYNUd8zXaWvu8oN3SdFJwVYYsho_9pn06y2_UlL5M=s1600', false, 6, 'Express Logement Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TihBG_x7bb_SI_GxOWDtxXPhKC63m1H9yJb4a7nhdwuq8Bu_waj6f1FGnVCAWuNc0Vbm2rwSCHW7yjYuiBANlMWGCTSvueTxewf_JxXc8nXQylE8rhTLoxLLd4DhLUaoFbwK53=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TihBG_x7bb_SI_GxOWDtxXPhKC63m1H9yJb4a7nhdwuq8Bu_waj6f1FGnVCAWuNc0Vbm2rwSCHW7yjYuiBANlMWGCTSvueTxewf_JxXc8nXQylE8rhTLoxLLd4DhLUaoFbwK53=s1600', false, 7, 'Express Logement Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RDwS-HjdhZli4rUBYxosat9ZhHUAOgfMNn_mWTa50z_Hvvra9nnKdS-6LmxBlp1zJ4zTaSA5KQF_x6IEI5WFNKUNFDZch1q6Nn67QlAL4G3GTmCgaMo2Sv89eajund82HiGHznMvm7YmQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RDwS-HjdhZli4rUBYxosat9ZhHUAOgfMNn_mWTa50z_Hvvra9nnKdS-6LmxBlp1zJ4zTaSA5KQF_x6IEI5WFNKUNFDZch1q6Nn67QlAL4G3GTmCgaMo2Sv89eajund82HiGHznMvm7YmQ=s1600', false, 8, 'Express Logement Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sz2vW6BtkqFZhUl3lbYSH-LUgMRdrxdgWVlFNzS1XR4M0iS8HGm0I9Qf2_1nsUijM3ohZmt-UVceYmUoKMPFYFWOlnNNkz87_DCOKiDS7yLGshiOYNtMllotp5vJBr7wApJY1d=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sz2vW6BtkqFZhUl3lbYSH-LUgMRdrxdgWVlFNzS1XR4M0iS8HGm0I9Qf2_1nsUijM3ohZmt-UVceYmUoKMPFYFWOlnNNkz87_DCOKiDS7yLGshiOYNtMllotp5vJBr7wApJY1d=s1600', false, 9, 'Express Logement Cameroun')
  on conflict do nothing;

  -- [25] KasaStay (Akwa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'kasastay-akwa',
    'apartment',
    'published',
    'KasaStay',
    'KasaStay
Catégorie : Location d''appartement de vacances.
Adresse : Grand Moulin, Douala.
Contact / WhatsApp : +237686152222.
Note Google Maps : 4.8/5 (26 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Marthe Kiliane NGO KONDGA, note 5/5)
- "Note sans commentaire écrit." (William Mouaha, note 5/5)
- "Note sans commentaire écrit." (ariane linda, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'akwa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Grand Moulin, Douala',
    4.0629653,
    9.7198542,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeQSJSmPPl6rQlKlDM5WhFCDbZJQbMDqkcEqtTpu7Ur7y1daIcWXBBm9DDH3h3lRBN0yTe48Kq9ddLhTC71KVUVDRl_QYBATayb2btHI1cFwOGLa1rmdb6vcpD7qPZ9Dug7CXYvrfhXehuy=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeQSJSmPPl6rQlKlDM5WhFCDbZJQbMDqkcEqtTpu7Ur7y1daIcWXBBm9DDH3h3lRBN0yTe48Kq9ddLhTC71KVUVDRl_QYBATayb2btHI1cFwOGLa1rmdb6vcpD7qPZ9Dug7CXYvrfhXehuy=s1600', true, 0, 'KasaStay')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T6TC0dU43TVBrQGWqdQ3I7Qh6gAUv7-AyDBw2uyl0I-gyQh0PB6wFKUsUflc3Ruy4kWnYuZHiwrqVPUpG2NHzTEsxvubh4mTVKUsA8iAYMmxCyayP6bfUq0aIlHYIMzz3LLIBpLYp9zyCK=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T6TC0dU43TVBrQGWqdQ3I7Qh6gAUv7-AyDBw2uyl0I-gyQh0PB6wFKUsUflc3Ruy4kWnYuZHiwrqVPUpG2NHzTEsxvubh4mTVKUsA8iAYMmxCyayP6bfUq0aIlHYIMzz3LLIBpLYp9zyCK=s1600', false, 1, 'KasaStay')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QrDZo5aw89sySR62FKK8Ems3zs_Geq5VGEKOF-PVx0ckj7BctIAb8AH0mKy3gfcvbhtV1Elw5UsrLQ-c8qdCXGqQVv6Evx3PlZxNNIt9hlLBitLMP5sTzzsIj_h2JBR28bfNugfdlJJX6J=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QrDZo5aw89sySR62FKK8Ems3zs_Geq5VGEKOF-PVx0ckj7BctIAb8AH0mKy3gfcvbhtV1Elw5UsrLQ-c8qdCXGqQVv6Evx3PlZxNNIt9hlLBitLMP5sTzzsIj_h2JBR28bfNugfdlJJX6J=s1600', false, 2, 'KasaStay')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QQzFvnU3R8R4sTBzu2EbKEquGd_rahhWc8Wz7Qw3uDhuKxjdrbxBCT_y-l_vioD0hIZTyzcSMUlQIZOfapID8iPLElFgHxoZvp_QG3C2tKKbNB1GRZer0Y7sNLWKEqDycFQeYcH4Cg7Fg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QQzFvnU3R8R4sTBzu2EbKEquGd_rahhWc8Wz7Qw3uDhuKxjdrbxBCT_y-l_vioD0hIZTyzcSMUlQIZOfapID8iPLElFgHxoZvp_QG3C2tKKbNB1GRZer0Y7sNLWKEqDycFQeYcH4Cg7Fg=s1600', false, 3, 'KasaStay')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeQSJSmPPl6rQlKlDM5WhFCDbZJQbMDqkcEqtTpu7Ur7y1daIcWXBBm9DDH3h3lRBN0yTe48Kq9ddLhTC71KVUVDRl_QYBATayb2btHI1cFwOGLa1rmdb6vcpD7qPZ9Dug7CXYvrfhXehuy=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeQSJSmPPl6rQlKlDM5WhFCDbZJQbMDqkcEqtTpu7Ur7y1daIcWXBBm9DDH3h3lRBN0yTe48Kq9ddLhTC71KVUVDRl_QYBATayb2btHI1cFwOGLa1rmdb6vcpD7qPZ9Dug7CXYvrfhXehuy=s1600-p-k-no', false, 4, 'KasaStay')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SNex9bfl0EMFMyPvYBn3YGNOExptkFU1GMKF_5C9bGRyjgv3GhDXhWZVs8jmE3L0HOK4l7gornX2guN4Rb-w8HGLKaD2Fm4rLlfJSlYQeW9K8gytNsVTFzOp2-19MQwcprmcFBRk-NjSY=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SNex9bfl0EMFMyPvYBn3YGNOExptkFU1GMKF_5C9bGRyjgv3GhDXhWZVs8jmE3L0HOK4l7gornX2guN4Rb-w8HGLKaD2Fm4rLlfJSlYQeW9K8gytNsVTFzOp2-19MQwcprmcFBRk-NjSY=s1600', false, 5, 'KasaStay')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TlL0d4cuRMqMGfd0leRqgtz7vxP-2pWt_HCR5bHXGXll4dtbXX0dcRhjR0nDS_WPsvtet2cbTIze4OmYYXHQ-UNMnIvFszGWUYfIWeTlSDQz66yb6qIMRsmcBFa2u88MyU8MfjsYoo7uOA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TlL0d4cuRMqMGfd0leRqgtz7vxP-2pWt_HCR5bHXGXll4dtbXX0dcRhjR0nDS_WPsvtet2cbTIze4OmYYXHQ-UNMnIvFszGWUYfIWeTlSDQz66yb6qIMRsmcBFa2u88MyU8MfjsYoo7uOA=s1600', false, 6, 'KasaStay')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a-/ALV-UjU_v4aYct0K8eD-pcGqpWNcslQCpuHnpiwNXEcwOPQskXfmmAQ=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a-/ALV-UjU_v4aYct0K8eD-pcGqpWNcslQCpuHnpiwNXEcwOPQskXfmmAQ=s1600-p-k-no-mo', false, 7, 'KasaStay')
  on conflict do nothing;

  -- [26] Résidence AMAR (Akwa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-amar-akwa',
    'apartment',
    'published',
    'Résidence AMAR',
    'Résidence AMAR
Adresse : mboppi, Douala.
Contact / WhatsApp : +237659977198.
Note Google Maps : 4.1/5 (123 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'akwa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'mboppi, Douala',
    4.0412172,
    9.717055,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdtvnjD-l_6vB_hwPmIsyni3zYql6Hrs8-sNZdPf0-iRGFD32ggoU1QyPqVhHBTycHqSUAyOvsVSgkiTbwa3VdzO-FQSm4eKKUD50MUhJtw0K9gF7kpcaIB4AYVzGrcIh7D2jibHQ=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdtvnjD-l_6vB_hwPmIsyni3zYql6Hrs8-sNZdPf0-iRGFD32ggoU1QyPqVhHBTycHqSUAyOvsVSgkiTbwa3VdzO-FQSm4eKKUD50MUhJtw0K9gF7kpcaIB4AYVzGrcIh7D2jibHQ=s1600', true, 0, 'Résidence AMAR')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QHae_uhO3VxBvqtRxP3sQGAFgyAy92KXXWKUEYffQEnbVFa8WuEiD2PjkgwpJBtvE6UmidimQBB9z850vWJAYcGuJc7oR8i-mKBWhN_XGOn-zKK3Muwlu-jfDUAzqjGkGlTnschw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QHae_uhO3VxBvqtRxP3sQGAFgyAy92KXXWKUEYffQEnbVFa8WuEiD2PjkgwpJBtvE6UmidimQBB9z850vWJAYcGuJc7oR8i-mKBWhN_XGOn-zKK3Muwlu-jfDUAzqjGkGlTnschw=s1600', false, 1, 'Résidence AMAR')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SMcunVi4hqv69fGB3ieXUKzakiASLbwubnXpLHSqERm3lHT6DxOcfwrOOHSaX62tAAu7qCt-fqNUViVeCdiiUVqw4OFnhdCzInijSQwTLfKoZxL26W1mztDBn2KygPDoa1J2QOkg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SMcunVi4hqv69fGB3ieXUKzakiASLbwubnXpLHSqERm3lHT6DxOcfwrOOHSaX62tAAu7qCt-fqNUViVeCdiiUVqw4OFnhdCzInijSQwTLfKoZxL26W1mztDBn2KygPDoa1J2QOkg=s1600', false, 2, 'Résidence AMAR')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qar8IJQDVGnRUUILzaRmow8b1fSLpxQEF9f1QueRvGPDKGn3CkaT-5ug3ubdT9LhHO_IgSyAXJPjPiJ4Oe1TDpd4Ihfn1V_mu5LFYkEtPVnpzS_leksBccBDDC_sIE3z6jLIch=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qar8IJQDVGnRUUILzaRmow8b1fSLpxQEF9f1QueRvGPDKGn3CkaT-5ug3ubdT9LhHO_IgSyAXJPjPiJ4Oe1TDpd4Ihfn1V_mu5LFYkEtPVnpzS_leksBccBDDC_sIE3z6jLIch=s1600', false, 3, 'Résidence AMAR')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TDDpKlVVJKn8VArX3RXXk7FRUzhw1ThFg4HXqRcgfg2-rqqnwQl6PYgMy3o2zu_gBPF2-H8GA8J_Zwwq5mfIsABYARCJTsXa1kRGPoVSJYiHmPSfTnorD6lMDdF2jnJsLRGh0=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TDDpKlVVJKn8VArX3RXXk7FRUzhw1ThFg4HXqRcgfg2-rqqnwQl6PYgMy3o2zu_gBPF2-H8GA8J_Zwwq5mfIsABYARCJTsXa1kRGPoVSJYiHmPSfTnorD6lMDdF2jnJsLRGh0=s1600', false, 4, 'Résidence AMAR')
  on conflict do nothing;

  -- [27] Résidence Princesse Bali (Bali)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-princesse-bali-bali',
    'apartment',
    'published',
    'Résidence Princesse Bali',
    'Résidence Princesse Bali
Catégorie : Appartement de vacances.
Adresse : 2MQV+JG6, Rue Prince Bell, Douala.
Contact / WhatsApp : +237650746114.
Note Google Maps : 4.3/5 (28 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Jacky Gueguang Tematio, note 4/5)
- "Note sans commentaire écrit." (Minette, note 4/5)
- "Note sans commentaire écrit." (Gilchrist Baha, note 3/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bali'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '2MQV+JG6, Rue Prince Bell, Douala',
    4.0390453,
    9.6937736,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcATX416AYGaq4zZaYf-QnvMlAno6P5Xt6VkSYvZ7slrnz7dqe5vTcU7FaisyvStFNAl8Rhvp0TpgEqRnXY-sYOxABqr9XbWEna6U27sD6dwrBS_0h6kNdJYmGswvNm_A-UvAUB1w=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcATX416AYGaq4zZaYf-QnvMlAno6P5Xt6VkSYvZ7slrnz7dqe5vTcU7FaisyvStFNAl8Rhvp0TpgEqRnXY-sYOxABqr9XbWEna6U27sD6dwrBS_0h6kNdJYmGswvNm_A-UvAUB1w=s1600', true, 0, 'Résidence Princesse Bali')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcATX416AYGaq4zZaYf-QnvMlAno6P5Xt6VkSYvZ7slrnz7dqe5vTcU7FaisyvStFNAl8Rhvp0TpgEqRnXY-sYOxABqr9XbWEna6U27sD6dwrBS_0h6kNdJYmGswvNm_A-UvAUB1w=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcATX416AYGaq4zZaYf-QnvMlAno6P5Xt6VkSYvZ7slrnz7dqe5vTcU7FaisyvStFNAl8Rhvp0TpgEqRnXY-sYOxABqr9XbWEna6U27sD6dwrBS_0h6kNdJYmGswvNm_A-UvAUB1w=s1600-p-k-no', false, 1, 'Résidence Princesse Bali')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R9CHNBdK7IizrNfTWzQxL1Dnd1qFcOiC-N9r7qKh-Oy9Fjy8FYH24kdmUfwZ1TQ9ICqNzoqw2FDGUI3b1k1mJKVlODlYBDTt1yJk-5LtuSu48uzDWwPpyJeYgzcr-rQ3t9Ti-s-Q=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R9CHNBdK7IizrNfTWzQxL1Dnd1qFcOiC-N9r7qKh-Oy9Fjy8FYH24kdmUfwZ1TQ9ICqNzoqw2FDGUI3b1k1mJKVlODlYBDTt1yJk-5LtuSu48uzDWwPpyJeYgzcr-rQ3t9Ti-s-Q=s1600', false, 2, 'Résidence Princesse Bali')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RnN8JWX4WY8Wex6Ev0jkXV5_7m4q78D8k0-oCrGwXozycanl8HkK3aS_jCEkvuUghS_RpgcISl6S_FsK6TWi2hgt88s7xkoxVVuoqp1WJGIBu7acgw82TWO5naoTaf6FFcQgSg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RnN8JWX4WY8Wex6Ev0jkXV5_7m4q78D8k0-oCrGwXozycanl8HkK3aS_jCEkvuUghS_RpgcISl6S_FsK6TWi2hgt88s7xkoxVVuoqp1WJGIBu7acgw82TWO5naoTaf6FFcQgSg=s1600', false, 3, 'Résidence Princesse Bali')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QD2Ev6EE8EtjWNmKVTCJti4mCxAz46bPX0HOkU_Xn9RpguKzEN2i5v2sLbfforF5gCotYXqaO0puTbJ-uCHPszsk9DND-QAD1mGfmdtEvTulOi3f8AKYfypCdxtmdwSE46XjM=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QD2Ev6EE8EtjWNmKVTCJti4mCxAz46bPX0HOkU_Xn9RpguKzEN2i5v2sLbfforF5gCotYXqaO0puTbJ-uCHPszsk9DND-QAD1mGfmdtEvTulOi3f8AKYfypCdxtmdwSE46XjM=s1600', false, 4, 'Résidence Princesse Bali')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TfxDQRXDTmBTysvmNll_WhUqBrAZF_TLasedPC3H4zf00pGw0ddQlasGES_OY-YmMOma-NyAC89TDhmfu1yHnjb_A20WpxORdnFQreSfjfruW617gfyLWr4ImUUD71euv89bPB=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TfxDQRXDTmBTysvmNll_WhUqBrAZF_TLasedPC3H4zf00pGw0ddQlasGES_OY-YmMOma-NyAC89TDhmfu1yHnjb_A20WpxORdnFQreSfjfruW617gfyLWr4ImUUD71euv89bPB=s1600', false, 5, 'Résidence Princesse Bali')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RvyszL8gLuhjwhJLUqDQQyHYvz_C7hsndfKm5PmJZi1TVvbmkODu6gNL2h0XJbVMLYpM68XSneHyWYwY8hohKyTH6am7JFeSKjMR3eBpBwMPqVcbyOJVfFxaeHF2_QRsmeKQPO=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RvyszL8gLuhjwhJLUqDQQyHYvz_C7hsndfKm5PmJZi1TVvbmkODu6gNL2h0XJbVMLYpM68XSneHyWYwY8hohKyTH6am7JFeSKjMR3eBpBwMPqVcbyOJVfFxaeHF2_QRsmeKQPO=s1600', false, 6, 'Résidence Princesse Bali')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RQZtDRQfUXpbZKy1mCcZbvw8sDPIPUpL1-ONmd3RfY6Q30y1BDxyoCFjEjtaAkaf8S8FjzvLpkpP3OBvcffhTePQcTyGGTlmV_1hCDyB14PSQdx1fxkTqK8bDS6B3twUFpmFL_QA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RQZtDRQfUXpbZKy1mCcZbvw8sDPIPUpL1-ONmd3RfY6Q30y1BDxyoCFjEjtaAkaf8S8FjzvLpkpP3OBvcffhTePQcTyGGTlmV_1hCDyB14PSQdx1fxkTqK8bDS6B3twUFpmFL_QA=s1600', false, 7, 'Résidence Princesse Bali')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a-/ALV-UjUrbg0B8_OAwczqV7oFtipw2Fzh08JmPpNQm3bva17zT4-rbMlKvQ=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a-/ALV-UjUrbg0B8_OAwczqV7oFtipw2Fzh08JmPpNQm3bva17zT4-rbMlKvQ=s1600-p-k-no-mo', false, 8, 'Résidence Princesse Bali')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RQGFY9RQZV7nCiABqJTq0XzvyBQpCceAliRwrHuSa1LEPlT1pb3rv4OQpjjq0elmnk1M2De4DpR1szUdYGYux5RjMQVMULOBrjs0yNXdk63MJDxBCcN-Zeqsy1L4pPnfR_Px_YVw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RQGFY9RQZV7nCiABqJTq0XzvyBQpCceAliRwrHuSa1LEPlT1pb3rv4OQpjjq0elmnk1M2De4DpR1szUdYGYux5RjMQVMULOBrjs0yNXdk63MJDxBCcN-Zeqsy1L4pPnfR_Px_YVw=s1600', false, 9, 'Résidence Princesse Bali')
  on conflict do nothing;

  -- [28] Appart meublé (Akwa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appart-meuble-akwa',
    'apartment',
    'published',
    'Appart meublé',
    'Appart meublé
Adresse : 3PM9+HVP, Unnamed Road, Douala.
Note Google Maps : 5/5 (1 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'akwa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3PM9+HVP, Unnamed Road, Douala',
    4.0839662,
    9.7197017,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW20DPEWwEkTiGEsuOVSSim-51_AU_vkPIFPmh0PQDF5mFsr8PWyF1kRUP1UyR80xjnBCcR22250u2UDOdYjeDyKp6YKlsHkXsIQojbYhfDCrIeHrmp-PiE4cF-r8WaRTU_2k-2DtUJiOcNMYOrhZwV6BR7enrs6Os_o_Xy4ur9lyy5Cn8IyHzPZ=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW20DPEWwEkTiGEsuOVSSim-51_AU_vkPIFPmh0PQDF5mFsr8PWyF1kRUP1UyR80xjnBCcR22250u2UDOdYjeDyKp6YKlsHkXsIQojbYhfDCrIeHrmp-PiE4cF-r8WaRTU_2k-2DtUJiOcNMYOrhZwV6BR7enrs6Os_o_Xy4ur9lyy5Cn8IyHzPZ=s1600', true, 0, 'Appart meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW20DPEWwEkTiGEsuOVSSim-51_AU_vkPIFPmh0PQDF5mFsr8PWyF1kRUP1UyR80xjnBCcR22250u2UDOdYjeDyKp6YKlsHkXsIQojbYhfDCrIeHrmp-PiE4cF-r8WaRTU_2k-2DtUJiOcNMYOrhZwV6BR7enrs6Os_o_Xy4ur9lyy5Cn8IyHzPZ=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW20DPEWwEkTiGEsuOVSSim-51_AU_vkPIFPmh0PQDF5mFsr8PWyF1kRUP1UyR80xjnBCcR22250u2UDOdYjeDyKp6YKlsHkXsIQojbYhfDCrIeHrmp-PiE4cF-r8WaRTU_2k-2DtUJiOcNMYOrhZwV6BR7enrs6Os_o_Xy4ur9lyy5Cn8IyHzPZ=s1600-p-k-no', false, 1, 'Appart meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEUFWi82lk__l2F3UZmArULAz3bnfsKwKyfvKOjvMQmTdU1o-vSt6vSTqQ89UxPoSBweuNtwgpFNvN_e2Q826q3TP6ceL2p--3_MiU8Kzag01XM1UtBGgBlL9Fwi_-1Dn_xFI023VGG5zD66ms2WLbioCASiBRNDDkqqxD3S2JpYyFt-6Dh1k-S=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEUFWi82lk__l2F3UZmArULAz3bnfsKwKyfvKOjvMQmTdU1o-vSt6vSTqQ89UxPoSBweuNtwgpFNvN_e2Q826q3TP6ceL2p--3_MiU8Kzag01XM1UtBGgBlL9Fwi_-1Dn_xFI023VGG5zD66ms2WLbioCASiBRNDDkqqxD3S2JpYyFt-6Dh1k-S=s1600', false, 2, 'Appart meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEf4GQHE1D6xTJ7kevGYaUV8CkHy7YD8_k92lTda2cAocQTLZ-GO_MiKgbSxJoTpHtpbOzcjzkNdi70rvfefu7HiKJS-_v3rAwkbB4Te7xZbzOLvtzvjtd9PHOt7c2ZbMmBOXrVnzyndSEeEjJnyLZsDwQ7liUC1TUK7HzgquCjhMlqjIeTvDq9=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEf4GQHE1D6xTJ7kevGYaUV8CkHy7YD8_k92lTda2cAocQTLZ-GO_MiKgbSxJoTpHtpbOzcjzkNdi70rvfefu7HiKJS-_v3rAwkbB4Te7xZbzOLvtzvjtd9PHOt7c2ZbMmBOXrVnzyndSEeEjJnyLZsDwQ7liUC1TUK7HzgquCjhMlqjIeTvDq9=s1600', false, 3, 'Appart meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhF_dBdseBeJKUn5kuGTiLYHgYx908a6vsGnTiN5eu8uzQHVUDGdUoeNwH6nwKlf5fo7RclzNWiEOvGHBzrWjGcYuMtaw6X3ycBtNBkiYVl5mXqmIa2P77U4DItqQBv7c-Eif_TStyAS6hrZJQNli3aK_ZvF4Wy7uomcufmqpA_OyqEUwthuqr6u8Q=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhF_dBdseBeJKUn5kuGTiLYHgYx908a6vsGnTiN5eu8uzQHVUDGdUoeNwH6nwKlf5fo7RclzNWiEOvGHBzrWjGcYuMtaw6X3ycBtNBkiYVl5mXqmIa2P77U4DItqQBv7c-Eif_TStyAS6hrZJQNli3aK_ZvF4Wy7uomcufmqpA_OyqEUwthuqr6u8Q=s1600', false, 4, 'Appart meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHk4QYojVSkHdn4qiC_LLMecerweyFUDdYI7aebpjRb4R7YwHdDiFrveXAMhGKgO1szWaHQzkyhHKspg1bt8vYwH5nHIYwILhLlRXu9Jx9_vvLwPsw7cthP9jeVfBMafHurLjBzkaibP2v6GGhZJjS1U_NiUj8T3WwsiHh_BPCNq6F73c1nyQE1=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHk4QYojVSkHdn4qiC_LLMecerweyFUDdYI7aebpjRb4R7YwHdDiFrveXAMhGKgO1szWaHQzkyhHKspg1bt8vYwH5nHIYwILhLlRXu9Jx9_vvLwPsw7cthP9jeVfBMafHurLjBzkaibP2v6GGhZJjS1U_NiUj8T3WwsiHh_BPCNq6F73c1nyQE1=s1600', false, 5, 'Appart meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFDYX02Gq2Coq8LMT6vykc1iBZrRoxTDt0usy5nU5ClDCuVRGyoMyyNwgue7MwRYEML_RciPaDIcC8UhAZS8dkkrCmSBG7kNYN7vHVhcPtP7qXYqXrJA-JFiwUug_hrieZrJX7v39ZvjBM1Lv0dxxWMUFK-Oo4HKSbamniGAwiPzUSQ6JKDRo31=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFDYX02Gq2Coq8LMT6vykc1iBZrRoxTDt0usy5nU5ClDCuVRGyoMyyNwgue7MwRYEML_RciPaDIcC8UhAZS8dkkrCmSBG7kNYN7vHVhcPtP7qXYqXrJA-JFiwUug_hrieZrJX7v39ZvjBM1Lv0dxxWMUFK-Oo4HKSbamniGAwiPzUSQ6JKDRo31=s1600', false, 6, 'Appart meublé')
  on conflict do nothing;

  -- [29] Résidence mon Bel Ange Akwa. (Appartement meublé) (Akwa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-mon-bel-ange-akwa-appartement-meuble-akwa',
    'apartment',
    'published',
    'Résidence mon Bel Ange Akwa. (Appartement meublé)',
    'Résidence mon Bel Ange Akwa. (Appartement meublé)
Catégorie : Immeuble en copropriété.
Adresse : Douala.
Contact / WhatsApp : +237699806095.
Note Google Maps : 4.5/5 (11 avis).

Avis clients récents :
- "Note sans commentaire écrit." (rita bonny, note 5/5)
- "Note sans commentaire écrit." (Anne M Elong, note 5/5)
- "Note sans commentaire écrit." (cora sonke, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'akwa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0540625,
    9.7046875,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdGmaxX6q4_Z1sWx35PxJ-7lQmchFD8X52yz2lwblaejXWgKsB2aAJuDJMjKM2AloWALnFHwScvARlqpT8e8xs4_DWd_LO7-Z5rXgoByb0WLOqF8KjIMSfnCfcpBRrGKC-CFqM4=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdGmaxX6q4_Z1sWx35PxJ-7lQmchFD8X52yz2lwblaejXWgKsB2aAJuDJMjKM2AloWALnFHwScvARlqpT8e8xs4_DWd_LO7-Z5rXgoByb0WLOqF8KjIMSfnCfcpBRrGKC-CFqM4=s1600', true, 0, 'Résidence mon Bel Ange Akwa. (Appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdGmaxX6q4_Z1sWx35PxJ-7lQmchFD8X52yz2lwblaejXWgKsB2aAJuDJMjKM2AloWALnFHwScvARlqpT8e8xs4_DWd_LO7-Z5rXgoByb0WLOqF8KjIMSfnCfcpBRrGKC-CFqM4=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdGmaxX6q4_Z1sWx35PxJ-7lQmchFD8X52yz2lwblaejXWgKsB2aAJuDJMjKM2AloWALnFHwScvARlqpT8e8xs4_DWd_LO7-Z5rXgoByb0WLOqF8KjIMSfnCfcpBRrGKC-CFqM4=s1600-p-k-no', false, 1, 'Résidence mon Bel Ange Akwa. (Appartement meublé)')
  on conflict do nothing;

  -- [30] Reina Appartement Meublé (Akwa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'reina-appartement-meuble-akwa',
    'apartment',
    'published',
    'Reina Appartement Meublé',
    'Reina Appartement Meublé
Catégorie : Location d''appartement de vacances.
Adresse : Rue 1.376(Alias, Nouvelle Rue, Douala.
Contact / WhatsApp : +237699799842.
Note Google Maps : 4/5 (1 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Dorette Jack, note 4/5)
- "Note sans commentaire écrit." (Dorette Jack, note 4/5)
- "Note sans commentaire écrit." (Dorette Jack, note 4/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'akwa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Rue 1.376(Alias, Nouvelle Rue, Douala',
    4.0517542,
    9.7071154,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeuBTy-W9SVkxLh37vzbWNrwAN9DML4yMlr4Um6v1bTLs0RvbvgsGfiEgN4oePuUtgvAIHOZVCDGntOG_DT24ZkoQAyv3i8A91hraW61o9NzJxXnm-nIJpLyWWQ6A51MCkIBtbZ7t7Nu-8=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeuBTy-W9SVkxLh37vzbWNrwAN9DML4yMlr4Um6v1bTLs0RvbvgsGfiEgN4oePuUtgvAIHOZVCDGntOG_DT24ZkoQAyv3i8A91hraW61o9NzJxXnm-nIJpLyWWQ6A51MCkIBtbZ7t7Nu-8=s1600', true, 0, 'Reina Appartement Meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RYAxH64Czz6hscoHSfixUkuoNkRT1tTHDB8z77HIYt8XTZZKuhnwtWaCNP75MoyXVRGVoVuINrYU19QcByVljxTQNd5cZjv2_a9cqdl6ttbhlj31-8uj5ZVJkUnCyMJs5RU4u0c7eSCVo=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RYAxH64Czz6hscoHSfixUkuoNkRT1tTHDB8z77HIYt8XTZZKuhnwtWaCNP75MoyXVRGVoVuINrYU19QcByVljxTQNd5cZjv2_a9cqdl6ttbhlj31-8uj5ZVJkUnCyMJs5RU4u0c7eSCVo=s1600', false, 1, 'Reina Appartement Meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SndN_Akq9KTvlVHPj1ZdIQ6LyzylMXdLi9IrTBZlW0THGkRQB01d1KPEZB2ee-SwCs82cb11CFJHCycmnRTf1gqOGg9XiNbmzPukWsqAfnBhjY0mWdUEtnSpLFp19iJfL8JETWrTS9-5V_=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SndN_Akq9KTvlVHPj1ZdIQ6LyzylMXdLi9IrTBZlW0THGkRQB01d1KPEZB2ee-SwCs82cb11CFJHCycmnRTf1gqOGg9XiNbmzPukWsqAfnBhjY0mWdUEtnSpLFp19iJfL8JETWrTS9-5V_=s1600', false, 2, 'Reina Appartement Meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SC-jPuid-Lc6o-aQr8UGjDMEVgP3qZoztidP4JtsfkhfuKst4fFkVWke7N4tHHGu1mJRcPvRHvDanVq4USHl9dXrv1LGy28QVeM_KZLuWakoiehwuDe8_wbe30f3b8oSJNHBdKUPGYUS6w=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SC-jPuid-Lc6o-aQr8UGjDMEVgP3qZoztidP4JtsfkhfuKst4fFkVWke7N4tHHGu1mJRcPvRHvDanVq4USHl9dXrv1LGy28QVeM_KZLuWakoiehwuDe8_wbe30f3b8oSJNHBdKUPGYUS6w=s1600', false, 3, 'Reina Appartement Meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T1hUPZKPCdKcOLUTGWD0qtH_h8U75T8RINanZGy_yhSWDv6rjktBmwUBzf6UQd1UlYnqsBrOE-Y2i9tdCAxhZFcevx6SO8vn1fCL7Bt4Jp6H8dQPbXzUbsQ5yWCmG2nBqmMND8NNiq3x9I=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T1hUPZKPCdKcOLUTGWD0qtH_h8U75T8RINanZGy_yhSWDv6rjktBmwUBzf6UQd1UlYnqsBrOE-Y2i9tdCAxhZFcevx6SO8vn1fCL7Bt4Jp6H8dQPbXzUbsQ5yWCmG2nBqmMND8NNiq3x9I=s1600', false, 4, 'Reina Appartement Meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QWVAIqLBY6jiNXOuqIkXQs1vOLSAdUMSXMX3u0K_GtsfKsJF05uGsSeFosVzyHbwA1TgEWIKSAeymgQzXDRTBETlxOwOCopUUUL4Vtc0LjNJEn5OZnCLg-pKpOFIs-8vKZfe0rv5HyLJE=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QWVAIqLBY6jiNXOuqIkXQs1vOLSAdUMSXMX3u0K_GtsfKsJF05uGsSeFosVzyHbwA1TgEWIKSAeymgQzXDRTBETlxOwOCopUUUL4Vtc0LjNJEn5OZnCLg-pKpOFIs-8vKZfe0rv5HyLJE=s1600', false, 5, 'Reina Appartement Meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TiGaq6J8r1UY_oAmGtXVnsxxMm6cNALOI4wntjRdOGPsVqVof4d2DmkgmbbU3dM_k0MQfP6lQdDuvldB_R7L-6ygmdy4noUMiA9lbrqvInCY8PG2JwQwn62zAX8vAT6pJSyG-UQi9UtcOW=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TiGaq6J8r1UY_oAmGtXVnsxxMm6cNALOI4wntjRdOGPsVqVof4d2DmkgmbbU3dM_k0MQfP6lQdDuvldB_R7L-6ygmdy4noUMiA9lbrqvInCY8PG2JwQwn62zAX8vAT6pJSyG-UQi9UtcOW=s1600', false, 6, 'Reina Appartement Meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGi3tkWF2OHioE6_qD8QgxSQXhPXFLGRGMxZxGDqZ1g1OfCj9oYxioR7eTjYfQNU5hCO0cP6C7xvOUjGbE8cM7m7XUopPzJ9ZlN7jhBkuYtYYp8L8y-23Elxs9Ge8i1uLVsFjXtfCQeGGbG8h38HNPXKXHrgDkJEmnpYsLvXJrR9Ts8I8FiqX1b=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGi3tkWF2OHioE6_qD8QgxSQXhPXFLGRGMxZxGDqZ1g1OfCj9oYxioR7eTjYfQNU5hCO0cP6C7xvOUjGbE8cM7m7XUopPzJ9ZlN7jhBkuYtYYp8L8y-23Elxs9Ge8i1uLVsFjXtfCQeGGbG8h38HNPXKXHrgDkJEmnpYsLvXJrR9Ts8I8FiqX1b=s1600', false, 7, 'Reina Appartement Meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QiqnOsGv1rUoaqeoFC2bkcQExB225CK__KxBVVh8OLbSMo6Pry__YMzGAzKmecVWd-fUuPhH21AMEFle0HiU4qEP9KmksqSWIkhnMFnfG9yCOsSgLdOBBy2udDZezfe5HR9NpW3lHakeX1=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QiqnOsGv1rUoaqeoFC2bkcQExB225CK__KxBVVh8OLbSMo6Pry__YMzGAzKmecVWd-fUuPhH21AMEFle0HiU4qEP9KmksqSWIkhnMFnfG9yCOsSgLdOBBy2udDZezfe5HR9NpW3lHakeX1=s1600', false, 8, 'Reina Appartement Meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9STuZiyeAp28tDcEMaZQs5MrF6mrJPx76zBpowkUmdoRvWJKRZobw99l_UXPDMLOs4YC_5urbXmHQm6Mih89bL_awiqSqKT0c0vuxLwmc4moKYyDTx2fycGRxjKWd_k_nETuo9lIck0miJe=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9STuZiyeAp28tDcEMaZQs5MrF6mrJPx76zBpowkUmdoRvWJKRZobw99l_UXPDMLOs4YC_5urbXmHQm6Mih89bL_awiqSqKT0c0vuxLwmc4moKYyDTx2fycGRxjKWd_k_nETuo9lIck0miJe=s1600', false, 9, 'Reina Appartement Meublé')
  on conflict do nothing;

  -- [31] Hôtel Résidence la Falaise - AKWA (Akwa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'hotel-residence-la-falaise-akwa-akwa',
    'apartment',
    'published',
    'Hôtel Résidence la Falaise - AKWA',
    'Hôtel Résidence la Falaise - AKWA
Adresse : 5300, Bd de la Liberté, Douala.
Contact / WhatsApp : +237233432832.
Note Google Maps : 4/5 (1753 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'akwa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '5300, Bd de la Liberté, Douala',
    4.0470714,
    9.6936279,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2_H8n3GZl69FG4ThaT-lp1RusECBsgn_yldmPG60LolCtzKBC_sKpRyhDAgsVdh4j-zFTj2vf5WKKIua9a3iCVPYaYVMCj-zB1HhIih9FNrS_3v_QlPNvPXu14KXhrYTqMjLEESlMI6JozfCsNKIOWsaZZ78DY9ahMjh4OZ_6KUG46NvYIVEAT6Q=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2_H8n3GZl69FG4ThaT-lp1RusECBsgn_yldmPG60LolCtzKBC_sKpRyhDAgsVdh4j-zFTj2vf5WKKIua9a3iCVPYaYVMCj-zB1HhIih9FNrS_3v_QlPNvPXu14KXhrYTqMjLEESlMI6JozfCsNKIOWsaZZ78DY9ahMjh4OZ_6KUG46NvYIVEAT6Q=s1600', true, 0, 'Hôtel Résidence la Falaise - AKWA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2_H8n3GZl69FG4ThaT-lp1RusECBsgn_yldmPG60LolCtzKBC_sKpRyhDAgsVdh4j-zFTj2vf5WKKIua9a3iCVPYaYVMCj-zB1HhIih9FNrS_3v_QlPNvPXu14KXhrYTqMjLEESlMI6JozfCsNKIOWsaZZ78DY9ahMjh4OZ_6KUG46NvYIVEAT6Q=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2_H8n3GZl69FG4ThaT-lp1RusECBsgn_yldmPG60LolCtzKBC_sKpRyhDAgsVdh4j-zFTj2vf5WKKIua9a3iCVPYaYVMCj-zB1HhIih9FNrS_3v_QlPNvPXu14KXhrYTqMjLEESlMI6JozfCsNKIOWsaZZ78DY9ahMjh4OZ_6KUG46NvYIVEAT6Q=s1600-p-k-no', false, 1, 'Hôtel Résidence la Falaise - AKWA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhETwdj9fRkqSaSOAaTKngH9K0Orm8oVQGfX8KtSZjt9i1duc59AIAoWLM7d3c0in8UIwI0ZMSJVKMcwGJSn6fXSb9itih1aiiPni0pnyZrvq32UQDIRin2Ahzdqp-K3i3UWnu1sAExWKRa6v2RRRlEez21_LkfLHBYeyPAXD0DaYyd4OkQlcPOXdA=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhETwdj9fRkqSaSOAaTKngH9K0Orm8oVQGfX8KtSZjt9i1duc59AIAoWLM7d3c0in8UIwI0ZMSJVKMcwGJSn6fXSb9itih1aiiPni0pnyZrvq32UQDIRin2Ahzdqp-K3i3UWnu1sAExWKRa6v2RRRlEez21_LkfLHBYeyPAXD0DaYyd4OkQlcPOXdA=s1600', false, 2, 'Hôtel Résidence la Falaise - AKWA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TeelG5zE3KZ8JSim0y-aksFetKbfjLPSP5GSZfXYgFzrDGLWlObKfQuIo-kaliz82aAnMnAvESddafAKRiWQF0MpFEqDY2lY6hQlVimy1pq79ximyrXDpm_RYe9j8uZBZJCtSv=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TeelG5zE3KZ8JSim0y-aksFetKbfjLPSP5GSZfXYgFzrDGLWlObKfQuIo-kaliz82aAnMnAvESddafAKRiWQF0MpFEqDY2lY6hQlVimy1pq79ximyrXDpm_RYe9j8uZBZJCtSv=s1600', false, 3, 'Hôtel Résidence la Falaise - AKWA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T2xGvPs5PyPAfQPPOsESNoVjNGYfuvb1IfEYvcld5cm3fS2ahiU9QRHHX8Huz__KTB7J4wepg5CmoZzhuKg80iPzW-vc3CO8CRMGY-LB5BPN_8j9rrX1NH6aX6WLemx8dEubU=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T2xGvPs5PyPAfQPPOsESNoVjNGYfuvb1IfEYvcld5cm3fS2ahiU9QRHHX8Huz__KTB7J4wepg5CmoZzhuKg80iPzW-vc3CO8CRMGY-LB5BPN_8j9rrX1NH6aX6WLemx8dEubU=s1600', false, 4, 'Hôtel Résidence la Falaise - AKWA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RWms2tQS2G-OxiSaT_1dbzMt-VUVzRVLvSDUxXw9tOEUbTu2bww0IVQblBdq-7R0HCNbXVggEXKElSaFwDZlmY9LEFhKjgBln9w5WkBHjrthPxTt-4jqoJ_ZkfZokq5iopXQFx6A=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RWms2tQS2G-OxiSaT_1dbzMt-VUVzRVLvSDUxXw9tOEUbTu2bww0IVQblBdq-7R0HCNbXVggEXKElSaFwDZlmY9LEFhKjgBln9w5WkBHjrthPxTt-4jqoJ_ZkfZokq5iopXQFx6A=s1600', false, 5, 'Hôtel Résidence la Falaise - AKWA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QlaSWFqgvFD2SOdIf3L5zJt7Nk4cwiiymJJsN06qDEkbke5xRQPePqes33VqUZqfuRi6eXvMlo4Rw1hUsoDLM_MPYcY6amH0DC90Gf-hBvjBgtBKkECQ5LzWM6gx14steZUlVr=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QlaSWFqgvFD2SOdIf3L5zJt7Nk4cwiiymJJsN06qDEkbke5xRQPePqes33VqUZqfuRi6eXvMlo4Rw1hUsoDLM_MPYcY6amH0DC90Gf-hBvjBgtBKkECQ5LzWM6gx14steZUlVr=s1600', false, 6, 'Hôtel Résidence la Falaise - AKWA')
  on conflict do nothing;

  -- [32] Appartement meublé Akwa- kristal palace hotel - One-Bedroom Apartment (Akwa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-akwa-kristal-palace-hotel-one-bedroom-apartment-akwa',
    'room',
    'published',
    'Appartement meublé Akwa- kristal palace hotel - One-Bedroom Apartment',
    'Appartement meublé Akwa- kristal palace hotel - One-Bedroom Apartment
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'akwa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0565701,
    9.6993198,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3JHxw_ahfRLJH2KvO1MDP1F8TGW4DjPH5wxqWnb6MiG_-JGp2maKNpTK5_TgViAXakSbLjNZmmSylTobz3RclZwiKJ0J0uRR_SWJ_A722cf0-vuy32iw7Yb3yb2eyWGBHC4P2sErH0qltUevgklgFMw3rB6Pvp5ND64Prglio_QXLNSQCqaOUZ=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3JHxw_ahfRLJH2KvO1MDP1F8TGW4DjPH5wxqWnb6MiG_-JGp2maKNpTK5_TgViAXakSbLjNZmmSylTobz3RclZwiKJ0J0uRR_SWJ_A722cf0-vuy32iw7Yb3yb2eyWGBHC4P2sErH0qltUevgklgFMw3rB6Pvp5ND64Prglio_QXLNSQCqaOUZ=s1600', true, 0, 'Appartement meublé Akwa- kristal palace hotel - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3JHxw_ahfRLJH2KvO1MDP1F8TGW4DjPH5wxqWnb6MiG_-JGp2maKNpTK5_TgViAXakSbLjNZmmSylTobz3RclZwiKJ0J0uRR_SWJ_A722cf0-vuy32iw7Yb3yb2eyWGBHC4P2sErH0qltUevgklgFMw3rB6Pvp5ND64Prglio_QXLNSQCqaOUZ=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3JHxw_ahfRLJH2KvO1MDP1F8TGW4DjPH5wxqWnb6MiG_-JGp2maKNpTK5_TgViAXakSbLjNZmmSylTobz3RclZwiKJ0J0uRR_SWJ_A722cf0-vuy32iw7Yb3yb2eyWGBHC4P2sErH0qltUevgklgFMw3rB6Pvp5ND64Prglio_QXLNSQCqaOUZ=s1600-p-k-no', false, 1, 'Appartement meublé Akwa- kristal palace hotel - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHFEqocm07ZHZ9COR3DiTR-_lZiZ3pnoKQEC7hssza07qPIYuacG46sddMg3nnT5oCzciIFUTmPUoPFTkk_ETU1G-MniP4NjvrGYhn5ZnBE6UxFbZPO-S8l8n_XdrImfyLS3up8HxnCVmZIMKO7jEgdEeKMHgVlYItlk5Rj-eCb6zQ9SPvBSxN2=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHFEqocm07ZHZ9COR3DiTR-_lZiZ3pnoKQEC7hssza07qPIYuacG46sddMg3nnT5oCzciIFUTmPUoPFTkk_ETU1G-MniP4NjvrGYhn5ZnBE6UxFbZPO-S8l8n_XdrImfyLS3up8HxnCVmZIMKO7jEgdEeKMHgVlYItlk5Rj-eCb6zQ9SPvBSxN2=s1600', false, 2, 'Appartement meublé Akwa- kristal palace hotel - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHRi-UFllUXKWO7sYf0LsG0dE6xpLmKazHM8Zt3edev9nm_KAwMLI11U74-TCxoinnZFViNltsv2DUkMeSXbo0dww_QstEVehtlL6jD28jRAzmGROpt4z4N2V3pszUDKhKSfcL6C9u71zh9riMU0ktEFrXJaUsQACO9VhF0az9Ywo8KM_Qf0s69eA=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHRi-UFllUXKWO7sYf0LsG0dE6xpLmKazHM8Zt3edev9nm_KAwMLI11U74-TCxoinnZFViNltsv2DUkMeSXbo0dww_QstEVehtlL6jD28jRAzmGROpt4z4N2V3pszUDKhKSfcL6C9u71zh9riMU0ktEFrXJaUsQACO9VhF0az9Ywo8KM_Qf0s69eA=s1600', false, 3, 'Appartement meublé Akwa- kristal palace hotel - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGDUmeFNPrJErvHUTHVThzisZEHynBJ78s52dyNxOWZe6Qhpj441ccHdvRnbp421ke78OUbvAVfObN28m-vTIt9iqasFA4btAEKRGlODhb10XR4s9F2PfIuBd0eMD-x4n1jxIkAlM5alPpFdf0Hn09xvS-x0IhsIqQqcWp2Tt-8amkuWmmCxsA0qw=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGDUmeFNPrJErvHUTHVThzisZEHynBJ78s52dyNxOWZe6Qhpj441ccHdvRnbp421ke78OUbvAVfObN28m-vTIt9iqasFA4btAEKRGlODhb10XR4s9F2PfIuBd0eMD-x4n1jxIkAlM5alPpFdf0Hn09xvS-x0IhsIqQqcWp2Tt-8amkuWmmCxsA0qw=s1600', false, 4, 'Appartement meublé Akwa- kristal palace hotel - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGT8HbmQs4BQAhRpxy_neaEE16RAS0EOxl4y3KcfTgK-DUqPnT_0zyV_xQxT8gQmQbh5arQvvfn_4TUboqfgKsJqzE5lHzmLApL2wGVNZu5gPwculygWdCV_u7tanCHEU091YFt62Zk68NplRwAZNt1LVQQGvUsOdJuSDqtwjVwzlkGy-mqWjxpBA=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGT8HbmQs4BQAhRpxy_neaEE16RAS0EOxl4y3KcfTgK-DUqPnT_0zyV_xQxT8gQmQbh5arQvvfn_4TUboqfgKsJqzE5lHzmLApL2wGVNZu5gPwculygWdCV_u7tanCHEU091YFt62Zk68NplRwAZNt1LVQQGvUsOdJuSDqtwjVwzlkGy-mqWjxpBA=s1600', false, 5, 'Appartement meublé Akwa- kristal palace hotel - One-Bedroom Apartment')
  on conflict do nothing;

  -- [33] Appartement meublé spacieux Bonapriso Douala - Two-Bedroom Apartment (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-spacieux-bonapriso-douala-two-bedroom-apartment-bonapris',
    'room',
    'published',
    'Appartement meublé spacieux Bonapriso Douala - Two-Bedroom Apartment',
    'Appartement meublé spacieux Bonapriso Douala - Two-Bedroom Apartment
Adresse : Douala.
Note Google Maps : 2.7/5 (0 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0202298,
    9.7024698,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2-Mhlf-I40k-oYU8imhTScHs3iGS3_ibTo3llzq63vZ0XbQ2TyFHalj9nejWAp3CD9xqR2cLxokfZiE7ShvdZEaWToemoWPZy4p0zCHOG78F-9VA57SAj3F9OHS277X69spu9GEANfxjCLD7w6zhs2OZDlh5q0-XbBiQzRFbgN1AIy7hTJQ9VF=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2-Mhlf-I40k-oYU8imhTScHs3iGS3_ibTo3llzq63vZ0XbQ2TyFHalj9nejWAp3CD9xqR2cLxokfZiE7ShvdZEaWToemoWPZy4p0zCHOG78F-9VA57SAj3F9OHS277X69spu9GEANfxjCLD7w6zhs2OZDlh5q0-XbBiQzRFbgN1AIy7hTJQ9VF=s1600', true, 0, 'Appartement meublé spacieux Bonapriso Douala - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2-Mhlf-I40k-oYU8imhTScHs3iGS3_ibTo3llzq63vZ0XbQ2TyFHalj9nejWAp3CD9xqR2cLxokfZiE7ShvdZEaWToemoWPZy4p0zCHOG78F-9VA57SAj3F9OHS277X69spu9GEANfxjCLD7w6zhs2OZDlh5q0-XbBiQzRFbgN1AIy7hTJQ9VF=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2-Mhlf-I40k-oYU8imhTScHs3iGS3_ibTo3llzq63vZ0XbQ2TyFHalj9nejWAp3CD9xqR2cLxokfZiE7ShvdZEaWToemoWPZy4p0zCHOG78F-9VA57SAj3F9OHS277X69spu9GEANfxjCLD7w6zhs2OZDlh5q0-XbBiQzRFbgN1AIy7hTJQ9VF=s1600-p-k-no', false, 1, 'Appartement meublé spacieux Bonapriso Douala - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1vEItQDzVOr7l8DKQw2Kju169ZaZ891N0fD5GBWe4kS-CEH_PK-fKpeFgwMUPDkfnoLpJ2pyfER6cflfHokVB8oNZFuFj-PgIyg9LuDRmsKUYm-FvWCuDmwyg2knhAUvXvTdEgCT8Vb0gRFlRoyfdLNqg7DyAanEcwEGih4CsjSG-mTR_btvBl=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1vEItQDzVOr7l8DKQw2Kju169ZaZ891N0fD5GBWe4kS-CEH_PK-fKpeFgwMUPDkfnoLpJ2pyfER6cflfHokVB8oNZFuFj-PgIyg9LuDRmsKUYm-FvWCuDmwyg2knhAUvXvTdEgCT8Vb0gRFlRoyfdLNqg7DyAanEcwEGih4CsjSG-mTR_btvBl=s1600', false, 2, 'Appartement meublé spacieux Bonapriso Douala - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2D1GXv4vlp2snq9XoIGDqg4SAXBPltOHSfgZqxHZlezThOny7eHhJPy8-yRBrrgYG8Wl5liThN9XBQ7UorQHJZsLIJZUGG0rRbg42GE6gXU-hz82cB2P0YTcYQnYBU4WygMixJLUeRNqz2HyOwG8boC_JfYL3CxO16fSglZkxg8BKpqxcYTw=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2D1GXv4vlp2snq9XoIGDqg4SAXBPltOHSfgZqxHZlezThOny7eHhJPy8-yRBrrgYG8Wl5liThN9XBQ7UorQHJZsLIJZUGG0rRbg42GE6gXU-hz82cB2P0YTcYQnYBU4WygMixJLUeRNqz2HyOwG8boC_JfYL3CxO16fSglZkxg8BKpqxcYTw=s1600-p-k-no', false, 3, 'Appartement meublé spacieux Bonapriso Douala - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3JVKUSlMDds25MG5D6zL8bdQgTmcOrSIE1Pw8J7tb44n0aiMnpDaChctsWd7G4_sFnLYxps0CQkIvp_V4yXQCINVVRdYP2hTkw-NFZyEzaql83g8aDW-N862zNjehV5galVsiiDwTysUBTvLldgLYd8oCUMVpWDDN692kAeoW4F2gKDQu0Rg0=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3JVKUSlMDds25MG5D6zL8bdQgTmcOrSIE1Pw8J7tb44n0aiMnpDaChctsWd7G4_sFnLYxps0CQkIvp_V4yXQCINVVRdYP2hTkw-NFZyEzaql83g8aDW-N862zNjehV5galVsiiDwTysUBTvLldgLYd8oCUMVpWDDN692kAeoW4F2gKDQu0Rg0=s1600-p-k-no', false, 4, 'Appartement meublé spacieux Bonapriso Douala - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2IeigQiAdSvjqOwzZnORwVDtPf2ygsuLucC6zfl5cdxmk6bdoye02bPqSiIz4h8mROplLrFGiQzBMCsPjhdPYFzAKiVqFjUov8wWLUx7e3PismvO-NTILvN8KDr7ItnoxsG1e0YlGYSWCF-5LMilv0MW9TN3RMy8Sb9l_URKdyPbBl0vTifPGyNA=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2IeigQiAdSvjqOwzZnORwVDtPf2ygsuLucC6zfl5cdxmk6bdoye02bPqSiIz4h8mROplLrFGiQzBMCsPjhdPYFzAKiVqFjUov8wWLUx7e3PismvO-NTILvN8KDr7ItnoxsG1e0YlGYSWCF-5LMilv0MW9TN3RMy8Sb9l_URKdyPbBl0vTifPGyNA=s1600-p-k-no', false, 5, 'Appartement meublé spacieux Bonapriso Douala - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0MBGd3NZso22VgKcgeTfis5uRBOrx1nUBQAjBri4IA8hdiLERUraPEqXdRA834fp4GMndkMB_rXmgF-CPI6P7tpZDqddEi_5oNeJA1bd6ct639zGZNIU8OO8qW0p67zGqsG1gTyVzhQMGgg8kjCx_qAMrO4XjwwU8fuS3UCDGKq3IuEns6QXqn=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0MBGd3NZso22VgKcgeTfis5uRBOrx1nUBQAjBri4IA8hdiLERUraPEqXdRA834fp4GMndkMB_rXmgF-CPI6P7tpZDqddEi_5oNeJA1bd6ct639zGZNIU8OO8qW0p67zGqsG1gTyVzhQMGgg8kjCx_qAMrO4XjwwU8fuS3UCDGKq3IuEns6QXqn=s1600-p-k-no', false, 6, 'Appartement meublé spacieux Bonapriso Douala - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW37trwZp9e5pUqqm5dl2wLGozzkgBQNYUMm9sxS1UIQ49Rd8DmIkpwLDwhFpBiFJ8RG7hJ05CGvppEnz_N4BNFvWfCewpe6Y4b-afT92sLUacW1dY7VB6DGrv0sq57yJuea80MXE2T6rLOOu8u5TdjIqULcdoT4YkDBLZ2qVVYzptmlX4TLp3eP4A=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW37trwZp9e5pUqqm5dl2wLGozzkgBQNYUMm9sxS1UIQ49Rd8DmIkpwLDwhFpBiFJ8RG7hJ05CGvppEnz_N4BNFvWfCewpe6Y4b-afT92sLUacW1dY7VB6DGrv0sq57yJuea80MXE2T6rLOOu8u5TdjIqULcdoT4YkDBLZ2qVVYzptmlX4TLp3eP4A=s1600-p-k-no', false, 7, 'Appartement meublé spacieux Bonapriso Douala - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1aeiPglmJ8JeVMhKptJ9CIyXfDm8THP79j1lmru9mw79m3jBKutIWQQ-stluR71rjmXGKPS5bURB8saNQeuGePN6R3jPHCINQ5URJ7aRUmZRljW1kwXQJFAbc6D7t2LF1G8wUB4XAeA19nOnSRF_yA2kdrnW-oUUEBrKl0rKxTE3vn9FarEj4u=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1aeiPglmJ8JeVMhKptJ9CIyXfDm8THP79j1lmru9mw79m3jBKutIWQQ-stluR71rjmXGKPS5bURB8saNQeuGePN6R3jPHCINQ5URJ7aRUmZRljW1kwXQJFAbc6D7t2LF1G8wUB4XAeA19nOnSRF_yA2kdrnW-oUUEBrKl0rKxTE3vn9FarEj4u=s1600-p-k-no', false, 8, 'Appartement meublé spacieux Bonapriso Douala - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW18lqDMzlvXnUN8V-rZQjE9y9H_RebjqcUlLAjoIkDnMZtGJeC3DEVV52qxdMafp1lFVZhSkjAKxXHOvoYRhJZ2f1He0AZOywMJFMlJYjF5aJZGzAqM5P7ctyNX8QzEKsJNNHRCEBXt9d_bJRWilQU5W1v1cbC3jRK_vCPIldEHUx2FX2Gik3YyVw=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW18lqDMzlvXnUN8V-rZQjE9y9H_RebjqcUlLAjoIkDnMZtGJeC3DEVV52qxdMafp1lFVZhSkjAKxXHOvoYRhJZ2f1He0AZOywMJFMlJYjF5aJZGzAqM5P7ctyNX8QzEKsJNNHRCEBXt9d_bJRWilQU5W1v1cbC3jRK_vCPIldEHUx2FX2Gik3YyVw=s1600-p-k-no', false, 9, 'Appartement meublé spacieux Bonapriso Douala - Two-Bedroom Apartment')
  on conflict do nothing;

  -- [34] Chambre meublée à Douala Bonapriso (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'chambre-meublee-a-douala-bonapriso-bonapriso',
    'room',
    'published',
    'Chambre meublée à Douala Bonapriso',
    'Chambre meublée à Douala Bonapriso
Catégorie : Chambre d''hôtes.
Adresse : armée de l''air, 15185, Douala.
Contact / WhatsApp : +237694931950.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'armée de l''air, 15185, Douala',
    4.0247797,
    9.7002788,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfSBIIvECie83uQtea6fMrz48ROri_2huSqscbVT_DpH0DtSNCS0Tk0bM_cwBneORxi7OgIGbfBU8BJcBRIiXx-dpC6BvKHHencvBF52nunSC1ef-4VtGmB4uSCitmPb5tcM7KObMKFQCY=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfSBIIvECie83uQtea6fMrz48ROri_2huSqscbVT_DpH0DtSNCS0Tk0bM_cwBneORxi7OgIGbfBU8BJcBRIiXx-dpC6BvKHHencvBF52nunSC1ef-4VtGmB4uSCitmPb5tcM7KObMKFQCY=s1600', true, 0, 'Chambre meublée à Douala Bonapriso')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T5w_9RjyEO4JRFfIDZMzxrGYZBA3dkasJ4GV5aZh5pAQh2yADNgSRt30QOxGJshKRKv_v9w7hOsXoakxg3HJyt1nyG-_W3UMzDOMuWaCAy4mauvJumajRn1-3B3J8UTDOe928hb8Wj9Mw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T5w_9RjyEO4JRFfIDZMzxrGYZBA3dkasJ4GV5aZh5pAQh2yADNgSRt30QOxGJshKRKv_v9w7hOsXoakxg3HJyt1nyG-_W3UMzDOMuWaCAy4mauvJumajRn1-3B3J8UTDOe928hb8Wj9Mw=s1600', false, 1, 'Chambre meublée à Douala Bonapriso')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RlAA13VLNAaADoWzfgAAPcG_Q4t_58saSXCDUSK7BiUuaxRX5VTtttENC6Qq5XKQOZNMwXfaQ6ulelFUj4K15yzE6IVXte102142yvSDUmU8nHhjkHxU_Hg051mA9aGAXlrx38dDpluviQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RlAA13VLNAaADoWzfgAAPcG_Q4t_58saSXCDUSK7BiUuaxRX5VTtttENC6Qq5XKQOZNMwXfaQ6ulelFUj4K15yzE6IVXte102142yvSDUmU8nHhjkHxU_Hg051mA9aGAXlrx38dDpluviQ=s1600', false, 2, 'Chambre meublée à Douala Bonapriso')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RyNTP5iDyTwtpQ2VYTjCtQUqBqgxqNTGfXDKR0oD6tnx4mgeofczmissMP_u-zmZBMP6akSA23rmJh98BRrV3QGwBtktKCsOXW-x8NBHYGiuYJby-1G8ynkx9-4plK0w5sk5pfgY6Tz2ID=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RyNTP5iDyTwtpQ2VYTjCtQUqBqgxqNTGfXDKR0oD6tnx4mgeofczmissMP_u-zmZBMP6akSA23rmJh98BRrV3QGwBtktKCsOXW-x8NBHYGiuYJby-1G8ynkx9-4plK0w5sk5pfgY6Tz2ID=s1600', false, 3, 'Chambre meublée à Douala Bonapriso')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SsLd23XXNYdVsLPP8xZq-rP5oP3PO7IULcSdnbbfe2OO5XjQrdeDL-64l3GKfsI6OjbT68PsSwAGJScP8Nei1PAUFQygwE2PbmR5mwTJ_JaJr0hiIwM6p5C0A5Nh47rXCqEoMc4l5Jh-g=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SsLd23XXNYdVsLPP8xZq-rP5oP3PO7IULcSdnbbfe2OO5XjQrdeDL-64l3GKfsI6OjbT68PsSwAGJScP8Nei1PAUFQygwE2PbmR5mwTJ_JaJr0hiIwM6p5C0A5Nh47rXCqEoMc4l5Jh-g=s1600', false, 4, 'Chambre meublée à Douala Bonapriso')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SrwmZmaAPqxVnWDpAVPXjSK6lKWyZcO6hdFmveBBOwLhJ5kqT971Fi8mV3Khih7sJDQRTTAVnlpTEoiWvPJ1A6xpzldAREv1H4Ou4aPf2kEqhdunwS_eVuvIK7eQpQfF7ZevTCkW_R8F4v=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SrwmZmaAPqxVnWDpAVPXjSK6lKWyZcO6hdFmveBBOwLhJ5kqT971Fi8mV3Khih7sJDQRTTAVnlpTEoiWvPJ1A6xpzldAREv1H4Ou4aPf2kEqhdunwS_eVuvIK7eQpQfF7ZevTCkW_R8F4v=s1600', false, 5, 'Chambre meublée à Douala Bonapriso')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TV9PE7UXO1i9flwk8Jsda3N-sinwsbhMhDn4l63S_BVe45qBgFEsha3_s1A6GFq8ifCTZtA4uK0UDA54t0U4aICQo3t5_IjsDgOSAeARmu0MnSzkIdkJdp9dVb1gAawJiW3V8MX_X6PB3q=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TV9PE7UXO1i9flwk8Jsda3N-sinwsbhMhDn4l63S_BVe45qBgFEsha3_s1A6GFq8ifCTZtA4uK0UDA54t0U4aICQo3t5_IjsDgOSAeARmu0MnSzkIdkJdp9dVb1gAawJiW3V8MX_X6PB3q=s1600', false, 6, 'Chambre meublée à Douala Bonapriso')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfSBIIvECie83uQtea6fMrz48ROri_2huSqscbVT_DpH0DtSNCS0Tk0bM_cwBneORxi7OgIGbfBU8BJcBRIiXx-dpC6BvKHHencvBF52nunSC1ef-4VtGmB4uSCitmPb5tcM7KObMKFQCY=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfSBIIvECie83uQtea6fMrz48ROri_2huSqscbVT_DpH0DtSNCS0Tk0bM_cwBneORxi7OgIGbfBU8BJcBRIiXx-dpC6BvKHHencvBF52nunSC1ef-4VtGmB4uSCitmPb5tcM7KObMKFQCY=s1600-p-k-no', false, 7, 'Chambre meublée à Douala Bonapriso')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a-/ALV-UjU-lcbMBQoUXxa2xhCkCfnUFZyvizxsy4uvF1vPkrF0edj84LE=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a-/ALV-UjU-lcbMBQoUXxa2xhCkCfnUFZyvizxsy4uvF1vPkrF0edj84LE=s1600-p-k-no-mo', false, 8, 'Chambre meublée à Douala Bonapriso')
  on conflict do nothing;

  -- [35] Appartement meublé d'Artémis (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-d-artemis-bonapriso',
    'apartment',
    'published',
    'Appartement meublé d''Artémis',
    'Appartement meublé d''Artémis
Catégorie : Complexe d''appartements meublés.
Adresse : 4864, Douala.
Contact / WhatsApp : +237691922481.
Note Google Maps : 4.1/5 (11 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Florence ÉPÉE NGASSÈ, note 5/5)
- "Note sans commentaire écrit." (Rougayatou Hamadou, note 4/5)
- "Note sans commentaire écrit." (Mamadou Djigué, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '4864, Douala',
    4.0154585,
    9.7039504,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcHf6Fgq3tjZHfaSjy42-KChhUfKgHLSKY16s1fgIv1mBNXMeS3mRboRG0DpvOykIEgePjyhFZ4rGQpPH3PRsh3KYqKqwySZaPwfOc_8X1iW3apd0f9uhaOM8u9js44iMgjqtuI0ub8GCRL=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcHf6Fgq3tjZHfaSjy42-KChhUfKgHLSKY16s1fgIv1mBNXMeS3mRboRG0DpvOykIEgePjyhFZ4rGQpPH3PRsh3KYqKqwySZaPwfOc_8X1iW3apd0f9uhaOM8u9js44iMgjqtuI0ub8GCRL=s1600', true, 0, 'Appartement meublé d''Artémis')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tj7mGQp33piikSo4uKHyUycVTBzQJujJcaeqtccP-K0eS47WUqXHvZ0V9Mv22irqFoqWGSQLMUQL4JQT84GJX5_ccJppy6tW4b7X6np9D6o1OuIffDqI-Bi8maKp_m-PxSvPhGYMTlArcv=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tj7mGQp33piikSo4uKHyUycVTBzQJujJcaeqtccP-K0eS47WUqXHvZ0V9Mv22irqFoqWGSQLMUQL4JQT84GJX5_ccJppy6tW4b7X6np9D6o1OuIffDqI-Bi8maKp_m-PxSvPhGYMTlArcv=s1600', false, 1, 'Appartement meublé d''Artémis')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RCjyTEk8YCSDdCBJOnhVv_FtRcPrffVXr0AcqJFe6ir-KDyRmMaLj8aExCBusdteKib5YaBD_O-5ZFRXIRCzSOBnpBmw2xajB8eYjtdRt6vi9gb_bjptsjCEzH0nbkZx5c9_M7xuE_7gVV=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RCjyTEk8YCSDdCBJOnhVv_FtRcPrffVXr0AcqJFe6ir-KDyRmMaLj8aExCBusdteKib5YaBD_O-5ZFRXIRCzSOBnpBmw2xajB8eYjtdRt6vi9gb_bjptsjCEzH0nbkZx5c9_M7xuE_7gVV=s1600', false, 2, 'Appartement meublé d''Artémis')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q-JRPHtEKb1MoHDfCmP04tZQsbeWXqGIpyf6xpvq1i2buMG9DpkKJZcpE0UIEgTYAZxXMXgFrBG69tDVHqH7jzgImnyfSGXlQeTLRNDsUY8t1nyRZimdWdhQ04gR4GA28Tv0kh=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q-JRPHtEKb1MoHDfCmP04tZQsbeWXqGIpyf6xpvq1i2buMG9DpkKJZcpE0UIEgTYAZxXMXgFrBG69tDVHqH7jzgImnyfSGXlQeTLRNDsUY8t1nyRZimdWdhQ04gR4GA28Tv0kh=s1600', false, 3, 'Appartement meublé d''Artémis')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QQzRk90Zy5JabNruFULEMaQssa83uUMWySKjv5o7HYrwGMEPqTR0CvQx14KhqG1HJdwQuXmKtkla_Slm3WTB0WSnnMSgXZaaUBL9yhXJiC6EMB8nLuKobvn39hqOusldjK0188Mg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QQzRk90Zy5JabNruFULEMaQssa83uUMWySKjv5o7HYrwGMEPqTR0CvQx14KhqG1HJdwQuXmKtkla_Slm3WTB0WSnnMSgXZaaUBL9yhXJiC6EMB8nLuKobvn39hqOusldjK0188Mg=s1600', false, 4, 'Appartement meublé d''Artémis')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S5-DWli1nDmylpWTrHLnQI1es__v5yMWsf_QbuqSUHPgM7uVL8EgGUB5lNJPF3RcJ0uUwiXJ4Wsgc5oVs82Sdv0kliur_GEAQjHIu5wVfjvupxNZtwhdhfCP7A9ZVtReM5TWywfUAVJMI=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S5-DWli1nDmylpWTrHLnQI1es__v5yMWsf_QbuqSUHPgM7uVL8EgGUB5lNJPF3RcJ0uUwiXJ4Wsgc5oVs82Sdv0kliur_GEAQjHIu5wVfjvupxNZtwhdhfCP7A9ZVtReM5TWywfUAVJMI=s1600', false, 5, 'Appartement meublé d''Artémis')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T9RHVRt8NRKzkutsU44odxSRa4FGNtHqt9o0ZHpS0Oq6OFvJzQLBkLOzFfumDi6Y7hMMk8MnWDhASB1COhtSu8WJwKS3_rJU1y3BIXcXgJ_rHi8CZZW7dj-ZcP4DpRPtbLIjw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T9RHVRt8NRKzkutsU44odxSRa4FGNtHqt9o0ZHpS0Oq6OFvJzQLBkLOzFfumDi6Y7hMMk8MnWDhASB1COhtSu8WJwKS3_rJU1y3BIXcXgJ_rHi8CZZW7dj-ZcP4DpRPtbLIjw=s1600', false, 6, 'Appartement meublé d''Artémis')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QvydsMoFqjLpgFb9lA2GjrRZKakiprxK24hq0HkN3UzDHGB-gROms8UaNyGeTQ_bgOO6vjRQcLVLRbXgbDskW2zbbLLegmKYK_YVo54X9DWWVFRa33BCUdZXt2-vNDt77Uqk4gQEXe8TzP=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QvydsMoFqjLpgFb9lA2GjrRZKakiprxK24hq0HkN3UzDHGB-gROms8UaNyGeTQ_bgOO6vjRQcLVLRbXgbDskW2zbbLLegmKYK_YVo54X9DWWVFRa33BCUdZXt2-vNDt77Uqk4gQEXe8TzP=s1600', false, 7, 'Appartement meublé d''Artémis')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TFK57KlKmJfS0oL5JK8_wPaNPsAdkwCR80cTmUU1sAYyeQUbUQ-pY4XP92VlcTOWQl840AtdZrA_FQ8cGI2t1UYQS-bZyd5W2DtFSEjB4ft0U3m3Pv0h7sMjOPBKf164kP4XvQiLWG8uE=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TFK57KlKmJfS0oL5JK8_wPaNPsAdkwCR80cTmUU1sAYyeQUbUQ-pY4XP92VlcTOWQl840AtdZrA_FQ8cGI2t1UYQS-bZyd5W2DtFSEjB4ft0U3m3Pv0h7sMjOPBKf164kP4XvQiLWG8uE=s1600', false, 8, 'Appartement meublé d''Artémis')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QfOXZnMo7bLKGSHHr7DhCkQR5sCIw4AUrrKPkMRd8BZiKgHZ0JJWWDTSc69hDM_HIrGzzkeqljkyCOAnu-6XgqLLUx7OnCFW_KAErcZ3ZEFYpL_UKooBFl3S-YGWOloG52WSMWbw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QfOXZnMo7bLKGSHHr7DhCkQR5sCIw4AUrrKPkMRd8BZiKgHZ0JJWWDTSc69hDM_HIrGzzkeqljkyCOAnu-6XgqLLUx7OnCFW_KAErcZ3ZEFYpL_UKooBFl3S-YGWOloG52WSMWbw=s1600', false, 9, 'Appartement meublé d''Artémis')
  on conflict do nothing;

  -- [36] Appartement Serenety (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-serenety-bonapriso',
    'apartment',
    'published',
    'Appartement Serenety',
    'Appartement Serenety
Catégorie : Logement meublé.
Adresse : 4.021290, 9, 703404, Douala.
Contact / WhatsApp : +237640353148.
Note Google Maps : 4.6/5 (15 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '4.021290, 9, 703404, Douala',
    4.0212403,
    9.7033445,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcLAP95elb8fIuzfHumYdi600LX0nzBOtJT_x7qv8JNlXuMBRDiSL1o72UjFqI5_B0FlwrgBehZOUOrnnLcLhzrXyecdd33kQmdb8qiy6qIdq1rjnsOu8i8gT2uShw8uiwOs1g9=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcLAP95elb8fIuzfHumYdi600LX0nzBOtJT_x7qv8JNlXuMBRDiSL1o72UjFqI5_B0FlwrgBehZOUOrnnLcLhzrXyecdd33kQmdb8qiy6qIdq1rjnsOu8i8gT2uShw8uiwOs1g9=s1600', true, 0, 'Appartement Serenety')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfqLjwyb1FShNRQp-Trof1lsl8Ba3tbYEEb3nNxMSo_FgxkjK2kRjUvlYwPRd6DF2Da_51Gr__9jZhgI2QUnYf9oLRN7omY5AY8tMK0B2xU6kXpvgtjwPvHYKb0sygoZaocOXyR=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfqLjwyb1FShNRQp-Trof1lsl8Ba3tbYEEb3nNxMSo_FgxkjK2kRjUvlYwPRd6DF2Da_51Gr__9jZhgI2QUnYf9oLRN7omY5AY8tMK0B2xU6kXpvgtjwPvHYKb0sygoZaocOXyR=s1600', false, 1, 'Appartement Serenety')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/a-/ALV-UjXMpgi_FBG5pBFgr0K3siLo86F4VcKJ9BJhI2phgeGitXkDdvZb9Q=s1600-p-rp-mo-ba12-br100', 'https://lh3.googleusercontent.com/a-/ALV-UjXMpgi_FBG5pBFgr0K3siLo86F4VcKJ9BJhI2phgeGitXkDdvZb9Q=s1600-p-rp-mo-ba12-br100', false, 2, 'Appartement Serenety')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/a/ACg8ocLGJ6x8QRnJ4Xu2MLTgbgwKK3F7snRBb_N5iceCw4WXNDJPpQ=s1600-p-rp-mo-br100', 'https://lh3.googleusercontent.com/a/ACg8ocLGJ6x8QRnJ4Xu2MLTgbgwKK3F7snRBb_N5iceCw4WXNDJPpQ=s1600-p-rp-mo-br100', false, 3, 'Appartement Serenety')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/a/ACg8ocLK9ek3F91GEB-_MvVfACd-eu-oSyw_ltEPIqJrP0HdaFNGGA=s1600-p-rp-mo-br100', 'https://lh3.googleusercontent.com/a/ACg8ocLK9ek3F91GEB-_MvVfACd-eu-oSyw_ltEPIqJrP0HdaFNGGA=s1600-p-rp-mo-br100', false, 4, 'Appartement Serenety')
  on conflict do nothing;

  -- [37] Appart meublé Kir 2 chambres bonapriso - Two-Bedroom Apartment (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appart-meuble-kir-2-chambres-bonapriso-two-bedroom-apartment-bonapriso',
    'room',
    'published',
    'Appart meublé Kir 2 chambres bonapriso - Two-Bedroom Apartment',
    'Appart meublé Kir 2 chambres bonapriso - Two-Bedroom Apartment
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.01543,
    9.7039299,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHaOpb9AHWrrGdh-hJ2AR9w__bl5q1He7Ib8wXVR7DESN8D3gEtqo9h8QYfgTEXMaZSEN26I1j3IaFuszPmhYYC6_UMIFypGBHB9rsMP4B684364ArC4R3YgGCTpe3FTdIMD099aJe6ltXpX4u4jQLfDMM67pS2elYnYX2ojRAavhv55BHEKV6O=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHaOpb9AHWrrGdh-hJ2AR9w__bl5q1He7Ib8wXVR7DESN8D3gEtqo9h8QYfgTEXMaZSEN26I1j3IaFuszPmhYYC6_UMIFypGBHB9rsMP4B684364ArC4R3YgGCTpe3FTdIMD099aJe6ltXpX4u4jQLfDMM67pS2elYnYX2ojRAavhv55BHEKV6O=s1600', true, 0, 'Appart meublé Kir 2 chambres bonapriso - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEqPt4-BmcLTOeKw6TU7G1oPOVeOwsmYGFS-Py-muczAA_Zi8gK_SaoQfkqx6s91CJjo0M9X-Df1Vuco62yD8x1FySORLxRqRl4NxNPTaisydm0ql9w5EPb3Md7fpNLzbBTPAJ48qil-bgp_-nTuxUCxcZFA622BVxcCqW7hNY4lyoXfRUEh2bD=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEqPt4-BmcLTOeKw6TU7G1oPOVeOwsmYGFS-Py-muczAA_Zi8gK_SaoQfkqx6s91CJjo0M9X-Df1Vuco62yD8x1FySORLxRqRl4NxNPTaisydm0ql9w5EPb3Md7fpNLzbBTPAJ48qil-bgp_-nTuxUCxcZFA622BVxcCqW7hNY4lyoXfRUEh2bD=s1600', false, 1, 'Appart meublé Kir 2 chambres bonapriso - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFA4Es4qpcdBNLfkBHm7aTPGvPtZYIz0RooO3PG8LUqwbO9WELLHdGgppbhfBDq2KGzXp6JX6WZcAYJeaYpQQmsz0NAX-NoRsQzy_dN1CvIt_6hy-eutd0eSL81JeJpyjgMD03DXBJz3TyIRVYe_tyKUTInz--2xrhQuU9WZE6ghXB0DVFzuO-dXg=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFA4Es4qpcdBNLfkBHm7aTPGvPtZYIz0RooO3PG8LUqwbO9WELLHdGgppbhfBDq2KGzXp6JX6WZcAYJeaYpQQmsz0NAX-NoRsQzy_dN1CvIt_6hy-eutd0eSL81JeJpyjgMD03DXBJz3TyIRVYe_tyKUTInz--2xrhQuU9WZE6ghXB0DVFzuO-dXg=s1600', false, 2, 'Appart meublé Kir 2 chambres bonapriso - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhH1J1TCvYpczUVG3_ot0rnBnWOfpld2xFZjcRV9bT8PYArn6wJb1HkB6izLJzMOYTc1Ti3otnuq8WE0xo20BSllOzLw0EfRsJlh9_-VAO33mvee19H_GVyb9QRWyK6T8UHRqt0Mp6zUhrggaefjzeL-ykgaonvCQU1IaxocOyseRWveedUqEmsmeQ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhH1J1TCvYpczUVG3_ot0rnBnWOfpld2xFZjcRV9bT8PYArn6wJb1HkB6izLJzMOYTc1Ti3otnuq8WE0xo20BSllOzLw0EfRsJlh9_-VAO33mvee19H_GVyb9QRWyK6T8UHRqt0Mp6zUhrggaefjzeL-ykgaonvCQU1IaxocOyseRWveedUqEmsmeQ=s1600', false, 3, 'Appart meublé Kir 2 chambres bonapriso - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhF4B8Wgf4uHDqrxIOae_eQMkpzfwV3ENbT7iJFYF_TjB6q9KveGogVCcXgMVQ2WxZyQVRBPBNOaDaSOnBNAJutuy7Ee8ThYL1Ok0fQvqurAOH-knhT_mIDo5OkMucAZG_qYXr5Y6W9LAdXff6Kb32AnHRDPbtzBK6e-GVq5epcTFaSK6987Z1nh=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhF4B8Wgf4uHDqrxIOae_eQMkpzfwV3ENbT7iJFYF_TjB6q9KveGogVCcXgMVQ2WxZyQVRBPBNOaDaSOnBNAJutuy7Ee8ThYL1Ok0fQvqurAOH-knhT_mIDo5OkMucAZG_qYXr5Y6W9LAdXff6Kb32AnHRDPbtzBK6e-GVq5epcTFaSK6987Z1nh=s1600', false, 4, 'Appart meublé Kir 2 chambres bonapriso - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2e7_WqHYt5NrbJZmTkQ70txSC2BldG8AcWnS-YZFPpiAJrVBjFoy2nHhlrCPRIpXdHddtnMkrXTYRTbEytG9Rzulu8cDiG5UnR6xoYuTq8h1lDPZKMmCY9LeMEuxaJPZ0v0zo_8_xSmQ1489JWEnJGQRUSs5OEfgNpQeacfLrbpdrmiGuOWcJF=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2e7_WqHYt5NrbJZmTkQ70txSC2BldG8AcWnS-YZFPpiAJrVBjFoy2nHhlrCPRIpXdHddtnMkrXTYRTbEytG9Rzulu8cDiG5UnR6xoYuTq8h1lDPZKMmCY9LeMEuxaJPZ0v0zo_8_xSmQ1489JWEnJGQRUSs5OEfgNpQeacfLrbpdrmiGuOWcJF=s1600-p-k-no', false, 5, 'Appart meublé Kir 2 chambres bonapriso - Two-Bedroom Apartment')
  on conflict do nothing;

  -- [38] Homely Priskette, mini maison meublée Bonapriso - One-Bedroom Apartment (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'homely-priskette-mini-maison-meublee-bonapriso-one-bedroom-apartment-bonapr',
    'room',
    'published',
    'Homely Priskette, mini maison meublée Bonapriso - One-Bedroom Apartment',
    'Homely Priskette, mini maison meublée Bonapriso - One-Bedroom Apartment
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0187402,
    9.7053404,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW05frTgdv6spagml6uRWbk4GjZ-nbKkry7zfSm7nkCeC7Wk10B5RAnX22o0bdnnOj8hC5vuPRunjRLX_0o7DR9GvG7-B4yrH45zX_h5rNucgqSFN0od6AhKdGkB_pCwBzzJMQIQv9iX8qxQ2CZ4CeoOxGAvmPx3Q9JgUj6eCd31hW5Iiotay8cbhA=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW05frTgdv6spagml6uRWbk4GjZ-nbKkry7zfSm7nkCeC7Wk10B5RAnX22o0bdnnOj8hC5vuPRunjRLX_0o7DR9GvG7-B4yrH45zX_h5rNucgqSFN0od6AhKdGkB_pCwBzzJMQIQv9iX8qxQ2CZ4CeoOxGAvmPx3Q9JgUj6eCd31hW5Iiotay8cbhA=s1600', true, 0, 'Homely Priskette, mini maison meublée Bonapriso - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhE4SoFZJWZytiAFPMnIRQdbX8CfDuNOJWcmt9J17BwU9eLJw3a6eAIIFsQC89eKKNxkKraaP8Kf-7JP9DwASEjovccIgUhuXM9uALGYa3EGWLzvktg-uNcVwEqt0DRVoNkfrbvXxvssNOJ_RuCbvmjwGocN0WhkYvS-9mjLmX9uluBF1BUNPGU6kQ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhE4SoFZJWZytiAFPMnIRQdbX8CfDuNOJWcmt9J17BwU9eLJw3a6eAIIFsQC89eKKNxkKraaP8Kf-7JP9DwASEjovccIgUhuXM9uALGYa3EGWLzvktg-uNcVwEqt0DRVoNkfrbvXxvssNOJ_RuCbvmjwGocN0WhkYvS-9mjLmX9uluBF1BUNPGU6kQ=s1600', false, 1, 'Homely Priskette, mini maison meublée Bonapriso - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFyfsLTwDk1Vmlyfk-HnqEkdf0EPHXHp6CYMVa2Ttn4kLV49ngnRdMcCyhiFn29oUR49Ezz95XPpvSdfaIw3nhe-ngQP3ij5MZLgzAcwripotOKEInihhCAzS0dvo9gtddTvVphZ2xPhvDvl7yfin8jWdnUchMnrG56nkq3DHDwDJo1NwHW9bZTeQ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFyfsLTwDk1Vmlyfk-HnqEkdf0EPHXHp6CYMVa2Ttn4kLV49ngnRdMcCyhiFn29oUR49Ezz95XPpvSdfaIw3nhe-ngQP3ij5MZLgzAcwripotOKEInihhCAzS0dvo9gtddTvVphZ2xPhvDvl7yfin8jWdnUchMnrG56nkq3DHDwDJo1NwHW9bZTeQ=s1600', false, 2, 'Homely Priskette, mini maison meublée Bonapriso - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFO95rGYfjDZKSqKyK361hILabNP6U_mirn8dj2uTvKz1iL_ukmghRnAgNhoStV5UqkSffkzdqZb3uX8ddFthQ2OrIRx5Dppo-TAYT2vQXg8Vebpd29p4acAiiChsFvmex6WntfWW9Hd_z5n4xi66TnjYHBoRI4ZEuNOwbQH3ObgoHk-0IlgDXCJw=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFO95rGYfjDZKSqKyK361hILabNP6U_mirn8dj2uTvKz1iL_ukmghRnAgNhoStV5UqkSffkzdqZb3uX8ddFthQ2OrIRx5Dppo-TAYT2vQXg8Vebpd29p4acAiiChsFvmex6WntfWW9Hd_z5n4xi66TnjYHBoRI4ZEuNOwbQH3ObgoHk-0IlgDXCJw=s1600', false, 3, 'Homely Priskette, mini maison meublée Bonapriso - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFEfrz72CQmttKQatO_HkJuwcG2Lv_tYrCxCIdm_7Zono_YzltIbhl2bppCOQt_pU98uxjbqXoZdIkZXioMA2m3s6PKodYQwSisVaArObKl2XCLnQLb6fE8HS3hXFYd7d3IP9KWQpMbWmxJYxCOU-47ekySQbs6OU7sx32oz94aduR-s8ElobqJ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFEfrz72CQmttKQatO_HkJuwcG2Lv_tYrCxCIdm_7Zono_YzltIbhl2bppCOQt_pU98uxjbqXoZdIkZXioMA2m3s6PKodYQwSisVaArObKl2XCLnQLb6fE8HS3hXFYd7d3IP9KWQpMbWmxJYxCOU-47ekySQbs6OU7sx32oz94aduR-s8ElobqJ=s1600', false, 4, 'Homely Priskette, mini maison meublée Bonapriso - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW05frTgdv6spagml6uRWbk4GjZ-nbKkry7zfSm7nkCeC7Wk10B5RAnX22o0bdnnOj8hC5vuPRunjRLX_0o7DR9GvG7-B4yrH45zX_h5rNucgqSFN0od6AhKdGkB_pCwBzzJMQIQv9iX8qxQ2CZ4CeoOxGAvmPx3Q9JgUj6eCd31hW5Iiotay8cbhA=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW05frTgdv6spagml6uRWbk4GjZ-nbKkry7zfSm7nkCeC7Wk10B5RAnX22o0bdnnOj8hC5vuPRunjRLX_0o7DR9GvG7-B4yrH45zX_h5rNucgqSFN0od6AhKdGkB_pCwBzzJMQIQv9iX8qxQ2CZ4CeoOxGAvmPx3Q9JgUj6eCd31hW5Iiotay8cbhA=s1600-p-k-no', false, 5, 'Homely Priskette, mini maison meublée Bonapriso - One-Bedroom Apartment')
  on conflict do nothing;

  -- [39] Studio Meublé à Douala (Aude's Home) (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'studio-meuble-a-douala-aude-s-home-bonapriso',
    'studio',
    'published',
    'Studio Meublé à Douala (Aude''s Home)',
    'Studio Meublé à Douala (Aude''s Home)
Catégorie : Édifice à appartements.
Adresse : bp-douala, Douala.
Contact / WhatsApp : +237674379532.
Note Google Maps : 4.5/5 (2 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Arlette Tchatchou, note 5/5)
- "Note sans commentaire écrit." (Said Khanou, note 4/5)
- "Note sans commentaire écrit." (Arlette Tchatchou, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'bp-douala, Douala',
    4.0096999,
    9.7002573,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLelBGJkxzrhpPVlAIQr5xiuX7prYuftRs5t534Ll8QQ4XH6IYBL3QzSaMETd8DnCkvr__hViTlXb9D-ULSs6s26YddqtfPrD1acHa4TTsBxtxt0BjN6Pn_pELs6z2mQu1PEjz_e=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLelBGJkxzrhpPVlAIQr5xiuX7prYuftRs5t534Ll8QQ4XH6IYBL3QzSaMETd8DnCkvr__hViTlXb9D-ULSs6s26YddqtfPrD1acHa4TTsBxtxt0BjN6Pn_pELs6z2mQu1PEjz_e=s1600', true, 0, 'Studio Meublé à Douala (Aude''s Home)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLelBGJkxzrhpPVlAIQr5xiuX7prYuftRs5t534Ll8QQ4XH6IYBL3QzSaMETd8DnCkvr__hViTlXb9D-ULSs6s26YddqtfPrD1acHa4TTsBxtxt0BjN6Pn_pELs6z2mQu1PEjz_e=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLelBGJkxzrhpPVlAIQr5xiuX7prYuftRs5t534Ll8QQ4XH6IYBL3QzSaMETd8DnCkvr__hViTlXb9D-ULSs6s26YddqtfPrD1acHa4TTsBxtxt0BjN6Pn_pELs6z2mQu1PEjz_e=s1600-p-k-no', false, 1, 'Studio Meublé à Douala (Aude''s Home)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfb6sYBSS2oHIZz0egoPUhM5XBP5CcR2pPWZeWRK2ZeZ8MEfoUeSY4NGLcqscOOA22CUJaJOzWUFg2HQe4fFmlrvcq0dR8XUjRXY_zmFFUoe6igX1tz74Sxx85LLVctuhvJH2xt=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfb6sYBSS2oHIZz0egoPUhM5XBP5CcR2pPWZeWRK2ZeZ8MEfoUeSY4NGLcqscOOA22CUJaJOzWUFg2HQe4fFmlrvcq0dR8XUjRXY_zmFFUoe6igX1tz74Sxx85LLVctuhvJH2xt=s1600', false, 2, 'Studio Meublé à Douala (Aude''s Home)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/a/ACg8ocLZSCh3TZ6RJEGmcWW-9wcER8K3PA_Jx2c55TLI5ZuQWs0_Aw=s1600-p-rp-mo-br100', 'https://lh3.googleusercontent.com/a/ACg8ocLZSCh3TZ6RJEGmcWW-9wcER8K3PA_Jx2c55TLI5ZuQWs0_Aw=s1600-p-rp-mo-br100', false, 3, 'Studio Meublé à Douala (Aude''s Home)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/a-/ALV-UjVRXW9yeWXh5u3cXAXAEMl00Jb1HGT-uawVEB6Te0a3GjRkNWy0=s1600-p-rp-mo-br100', 'https://lh3.googleusercontent.com/a-/ALV-UjVRXW9yeWXh5u3cXAXAEMl00Jb1HGT-uawVEB6Te0a3GjRkNWy0=s1600-p-rp-mo-br100', false, 4, 'Studio Meublé à Douala (Aude''s Home)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rxw0LNncm-me7KxqC-sj4Eater8vK2O5L86uRdYNBXB8PQ8Z4g_mfT275EfaGNJSrsmn9eznghz6x6uMxdEbRc0zeTTUEYUUGhGTIR_0yizwvG1sQt_WKKpYQmbRUH7Y-8RG_R=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rxw0LNncm-me7KxqC-sj4Eater8vK2O5L86uRdYNBXB8PQ8Z4g_mfT275EfaGNJSrsmn9eznghz6x6uMxdEbRc0zeTTUEYUUGhGTIR_0yizwvG1sQt_WKKpYQmbRUH7Y-8RG_R=s1600', false, 5, 'Studio Meublé à Douala (Aude''s Home)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R-15vgzMN3njjQbAufQ98qa1grzbgf2j9T-fGXf7Za7IFCvYOQpFsO1B3tPh_oOstaPe4aHkqvnNz1M_kvCunMdM155j6EDvD8LH63H7841ZsSjZyEEd4r7FWqRGRjEIl-zxZJ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R-15vgzMN3njjQbAufQ98qa1grzbgf2j9T-fGXf7Za7IFCvYOQpFsO1B3tPh_oOstaPe4aHkqvnNz1M_kvCunMdM155j6EDvD8LH63H7841ZsSjZyEEd4r7FWqRGRjEIl-zxZJ=s1600', false, 6, 'Studio Meublé à Douala (Aude''s Home)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QAj8s6xCZcETO7QKKll5NCoxAGl0xQTl-sozQdJCHeProHxOU4CePDAakEaV9SLyXuwwAy5qo5lC04gMcNlowCAFShvjjnAKVYVlRs-lV0bazboyL54wmXxaZliEOEZ3A-XNg8EQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QAj8s6xCZcETO7QKKll5NCoxAGl0xQTl-sozQdJCHeProHxOU4CePDAakEaV9SLyXuwwAy5qo5lC04gMcNlowCAFShvjjnAKVYVlRs-lV0bazboyL54wmXxaZliEOEZ3A-XNg8EQ=s1600', false, 7, 'Studio Meublé à Douala (Aude''s Home)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RACA6E-nZFMdN4lbz6G1v25YrN7glAInlQrkfYSdHP8gPVHprqgPrMbeoEX-ENMLuwTxNxtKLT-YF6Gq7PSwNYT7Pdu7_fbcopmxfVZud_KMJ-OeCgcDoR5hoKsVZE9nh6UZqD=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RACA6E-nZFMdN4lbz6G1v25YrN7glAInlQrkfYSdHP8gPVHprqgPrMbeoEX-ENMLuwTxNxtKLT-YF6Gq7PSwNYT7Pdu7_fbcopmxfVZud_KMJ-OeCgcDoR5hoKsVZE9nh6UZqD=s1600', false, 8, 'Studio Meublé à Douala (Aude''s Home)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QqEK0jskiHLg7Jo6Cs9wCf0aJpu4zchaSMh-MuqZ6lVEJx4OJhSsOrxu6PqeJFuyZNy6OxHBqsfTtDjRGvdw-ozDhvA9xc8TYBGsTzOQBJR5FiwVRuhmjEpoUASYHnxHalRJTrzQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QqEK0jskiHLg7Jo6Cs9wCf0aJpu4zchaSMh-MuqZ6lVEJx4OJhSsOrxu6PqeJFuyZNy6OxHBqsfTtDjRGvdw-ozDhvA9xc8TYBGsTzOQBJR5FiwVRuhmjEpoUASYHnxHalRJTrzQ=s1600', false, 9, 'Studio Meublé à Douala (Aude''s Home)')
  on conflict do nothing;

  -- [40] SCI Résidence Princesse (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'sci-residence-princesse-bonapriso',
    'apartment',
    'published',
    'SCI Résidence Princesse',
    'SCI Résidence Princesse
Catégorie : Agence de location d''appartements.
Adresse : 32 Carrefour armée de l''air, Douala.
Contact / WhatsApp : +237697748618.
Note Google Maps : 3.8/5 (32 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '32 Carrefour armée de l''air, Douala',
    4.0190983,
    9.704114,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLc6Fe34tMTIUoa49aBWY-70lAy_gKgXRs7ZpTK3THTbf638gQ4BL0ndd19bZnX6_vt7V1_BVCCk6hK9CNgJxZ5n6Z-Xkil_kelqmi9e2o9WI3_OCFXz7PaoDb4QwR5RkYth1Trb=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLc6Fe34tMTIUoa49aBWY-70lAy_gKgXRs7ZpTK3THTbf638gQ4BL0ndd19bZnX6_vt7V1_BVCCk6hK9CNgJxZ5n6Z-Xkil_kelqmi9e2o9WI3_OCFXz7PaoDb4QwR5RkYth1Trb=s1600', true, 0, 'SCI Résidence Princesse')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SzCOzcB4QWuDey5aXOVPxfL5x8WGwI5VxdqOFMax9JB11s-0jEI2SgcnSmlSxA-M0-yrd4uke6yo_UEWW_ON3pL5JS877po5qhnpjpKhOgwythvFjwg-5b3i5TxtJgTzDZNMeq=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SzCOzcB4QWuDey5aXOVPxfL5x8WGwI5VxdqOFMax9JB11s-0jEI2SgcnSmlSxA-M0-yrd4uke6yo_UEWW_ON3pL5JS877po5qhnpjpKhOgwythvFjwg-5b3i5TxtJgTzDZNMeq=s1600', false, 1, 'SCI Résidence Princesse')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG7Ha7K7pxOs00gEnCqidCsrsUrNpMOJ2QXezWmFsz4vgjMb7Um2VdK8T5H8y9y_VyxFxbR4p1B7xcfRQavua9eAda8U62SXypho8zku-V-Ad5WNPrL192fMiOq4RM5v6RwKzjdvoY1LLVTGQwwnetYR0mOpnvOYQdntEd6-9tGx2L80p4mfvfXtw=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG7Ha7K7pxOs00gEnCqidCsrsUrNpMOJ2QXezWmFsz4vgjMb7Um2VdK8T5H8y9y_VyxFxbR4p1B7xcfRQavua9eAda8U62SXypho8zku-V-Ad5WNPrL192fMiOq4RM5v6RwKzjdvoY1LLVTGQwwnetYR0mOpnvOYQdntEd6-9tGx2L80p4mfvfXtw=s1600', false, 2, 'SCI Résidence Princesse')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q0oj2lU_H4zEDiSM6PabCGXPyL_sPDcgLVknDEWSFxfJR3m6OJTaDtC4Hk-gioSDzEJg4qWrRVm2E58CDRY2S0qo50fd7-r_ysVjHFUxG77rs1jEZXgDkT_swksw5wGhZq1-YJug=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q0oj2lU_H4zEDiSM6PabCGXPyL_sPDcgLVknDEWSFxfJR3m6OJTaDtC4Hk-gioSDzEJg4qWrRVm2E58CDRY2S0qo50fd7-r_ysVjHFUxG77rs1jEZXgDkT_swksw5wGhZq1-YJug=s1600', false, 3, 'SCI Résidence Princesse')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHthpZKZf0RlXO2e115h-WLwB0FD1WH9x0UR-Coh3L9n61k1kt-rcU7esZ2FIb1GqvyXu8sr_4aZ5M4gvUoevHslssb5f2Aj0ZnwzGhWS9TvyFzmEEUf8ZFQPk3EztoOG4CT_0FlgidzukZrTdrO5qq6XZYo7sWxFJHdMv4KhnO_CtqyY68L6A=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHthpZKZf0RlXO2e115h-WLwB0FD1WH9x0UR-Coh3L9n61k1kt-rcU7esZ2FIb1GqvyXu8sr_4aZ5M4gvUoevHslssb5f2Aj0ZnwzGhWS9TvyFzmEEUf8ZFQPk3EztoOG4CT_0FlgidzukZrTdrO5qq6XZYo7sWxFJHdMv4KhnO_CtqyY68L6A=s1600', false, 4, 'SCI Résidence Princesse')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QC-cHSqgOOb6cYunGlGbB0XwET06f80B913YWOrxRN-9Lvsaa275FmWLiJE27caqkAmv0o9qgyTM6G4v2f88QNB8AiOj1AmYiKpqrTFGqbq4SmoROJjvVVBuk690rpBkhuDobd=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QC-cHSqgOOb6cYunGlGbB0XwET06f80B913YWOrxRN-9Lvsaa275FmWLiJE27caqkAmv0o9qgyTM6G4v2f88QNB8AiOj1AmYiKpqrTFGqbq4SmoROJjvVVBuk690rpBkhuDobd=s1600', false, 5, 'SCI Résidence Princesse')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SMCuw4AA7OAp-2Gr9MpBB4cuS6HfL_5RSkE_L7shLHYGEfqU0Ah123ZJtdvhFxGwIolBv4ghdhOMEPYJa43sFN0yxlJQJgS2aCX7qKELEFcAohhNgCYQF1knhxRQHH4LXU_MYS=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SMCuw4AA7OAp-2Gr9MpBB4cuS6HfL_5RSkE_L7shLHYGEfqU0Ah123ZJtdvhFxGwIolBv4ghdhOMEPYJa43sFN0yxlJQJgS2aCX7qKELEFcAohhNgCYQF1knhxRQHH4LXU_MYS=s1600', false, 6, 'SCI Résidence Princesse')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T6vbSic9enHp0EvbtrFr728t6R0p2ZE6hgIJ6InjadQ9FtUuXojRzdroKMpdROadBGrLoMHVWd9_rvntV9rCdCcVIuthznklP-u9HUcN4AgpbCLVYhR91x5bzzZB-gpsM49y_W=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T6vbSic9enHp0EvbtrFr728t6R0p2ZE6hgIJ6InjadQ9FtUuXojRzdroKMpdROadBGrLoMHVWd9_rvntV9rCdCcVIuthznklP-u9HUcN4AgpbCLVYhR91x5bzzZB-gpsM49y_W=s1600', false, 7, 'SCI Résidence Princesse')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGsImea1YzojgHi3YG98Uc-gQ0_aKKVfXXJrBN41gSi98hhXz4vr923O5bkUH7uS3R6Vg7Q8KW6AoeQmSp2j6VI97ZU3Kr-hguRSMDtGqZUwxmuyMBCkvQ-vmm7xFXHf820X6TU2QzDAHR2MKH2TXmNTQH1pVmQvpKbUGgvVxW59livTxYxSytExw=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGsImea1YzojgHi3YG98Uc-gQ0_aKKVfXXJrBN41gSi98hhXz4vr923O5bkUH7uS3R6Vg7Q8KW6AoeQmSp2j6VI97ZU3Kr-hguRSMDtGqZUwxmuyMBCkvQ-vmm7xFXHf820X6TU2QzDAHR2MKH2TXmNTQH1pVmQvpKbUGgvVxW59livTxYxSytExw=s1600', false, 8, 'SCI Résidence Princesse')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SMOvWsVPAX6WHfhppWBzHFbGtihMrBfI1DyAmOo3jufkEdk_ARTlaQVVNzi3nbie8rsgtvODGT0AWqJfSXFGhDQ7F75lrGtirFFXBupYXZwOdqARC0-aPwO08-QBpmvjnqUFf5=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SMOvWsVPAX6WHfhppWBzHFbGtihMrBfI1DyAmOo3jufkEdk_ARTlaQVVNzi3nbie8rsgtvODGT0AWqJfSXFGhDQ7F75lrGtirFFXBupYXZwOdqARC0-aPwO08-QBpmvjnqUFf5=s1600', false, 9, 'SCI Résidence Princesse')
  on conflict do nothing;

  -- [41] Résidence Clos d'Anthony (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-clos-d-anthony-bonapriso',
    'apartment',
    'published',
    'Résidence Clos d''Anthony',
    'Résidence Clos d''Anthony
Adresse : Vallée des Généraux, Av. du Général de Gaulle, Douala.
Contact / WhatsApp : +237699981337.
Note Google Maps : 4.3/5 (27 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Vallée des Généraux, Av. du Général de Gaulle, Douala',
    4.0242688,
    9.691376,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeI-a1nKYlZTH57JqF0Pv-P0fY_d-DvsSmDZZVwie469mH1ar4mrbtAry_2aABeNvGQj7LohdzzomWWfb_7IlUIWzC_OgiAA3opn-WmqJxelHFUIcrVs0W7pUlUl7OFByip8Co=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeI-a1nKYlZTH57JqF0Pv-P0fY_d-DvsSmDZZVwie469mH1ar4mrbtAry_2aABeNvGQj7LohdzzomWWfb_7IlUIWzC_OgiAA3opn-WmqJxelHFUIcrVs0W7pUlUl7OFByip8Co=s1600', true, 0, 'Résidence Clos d''Anthony')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeI-a1nKYlZTH57JqF0Pv-P0fY_d-DvsSmDZZVwie469mH1ar4mrbtAry_2aABeNvGQj7LohdzzomWWfb_7IlUIWzC_OgiAA3opn-WmqJxelHFUIcrVs0W7pUlUl7OFByip8Co=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeI-a1nKYlZTH57JqF0Pv-P0fY_d-DvsSmDZZVwie469mH1ar4mrbtAry_2aABeNvGQj7LohdzzomWWfb_7IlUIWzC_OgiAA3opn-WmqJxelHFUIcrVs0W7pUlUl7OFByip8Co=s1600-p-k-no', false, 1, 'Résidence Clos d''Anthony')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1nE7BY8u-4uJkNKsXA0nebA-JwiiY8tw8F39xADKE9UjpQvfCgmlDElIg314_BM8b1TmLl0ZT1-sTQ3BgyeTN4KbwtoO3lKFyIVrVET62xVis1rCVxWG1gHEgzXDla9x9xh8k2o_EYiCh8ziU14YCF-iVLDCHqMUvIzq9ecg7RIO7RjZsVJtYhrw=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1nE7BY8u-4uJkNKsXA0nebA-JwiiY8tw8F39xADKE9UjpQvfCgmlDElIg314_BM8b1TmLl0ZT1-sTQ3BgyeTN4KbwtoO3lKFyIVrVET62xVis1rCVxWG1gHEgzXDla9x9xh8k2o_EYiCh8ziU14YCF-iVLDCHqMUvIzq9ecg7RIO7RjZsVJtYhrw=s1600-p-k-no', false, 2, 'Résidence Clos d''Anthony')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfANO5dJBdFS_-ZZD20uP7242F5SZBeX5mVT7569CDJF8TQa331jRS54gLNwCNrdaS4JLfyy1bJRC1YFYFXFpF-u_XAoZUcMl1jTK8zBV6FEN6ostBaQJq2oR4j8mZH-wLyp30-=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfANO5dJBdFS_-ZZD20uP7242F5SZBeX5mVT7569CDJF8TQa331jRS54gLNwCNrdaS4JLfyy1bJRC1YFYFXFpF-u_XAoZUcMl1jTK8zBV6FEN6ostBaQJq2oR4j8mZH-wLyp30-=s1600-p-k-no', false, 3, 'Résidence Clos d''Anthony')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcwcZttPZtRhtqhANm5Y-FeFNCj5Nq-spHryXW9aoH-AHhQZoI8KH6RNPhyDyVtYmZstwnJLxIEVE3T0HCpLqnBsC6Dy9_9iGbjcw3ZRkvkzY-tZFbQrnNmqgbn35bAlDONJHXz=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcwcZttPZtRhtqhANm5Y-FeFNCj5Nq-spHryXW9aoH-AHhQZoI8KH6RNPhyDyVtYmZstwnJLxIEVE3T0HCpLqnBsC6Dy9_9iGbjcw3ZRkvkzY-tZFbQrnNmqgbn35bAlDONJHXz=s1600-p-k-no', false, 4, 'Résidence Clos d''Anthony')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLe30ttZNgf9EHt-XFyso2igaKGRfAnyMWqzDtt_j1xZY6e7iylhBoa8Zf7rT0pCYxbveNf1JDKumzTOI5vOn1pvrTzmH6oErWPy44yBZSY39ok7JvHQ_cAAY9q8GGO_ta1VGPne=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLe30ttZNgf9EHt-XFyso2igaKGRfAnyMWqzDtt_j1xZY6e7iylhBoa8Zf7rT0pCYxbveNf1JDKumzTOI5vOn1pvrTzmH6oErWPy44yBZSY39ok7JvHQ_cAAY9q8GGO_ta1VGPne=s1600-p-k-no', false, 5, 'Résidence Clos d''Anthony')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcGZE7CmlXJ7cUUW92zqhkhx4mmH0hH0fZuLXG7y74qZGlM1aPVwtfZ2B8SNdk3Zk1LaBTOqZNFjOevIk3l_Q9ch4z0r7IOoVSL-G7ZnsEhA886KA0wPCQcQ2ZjL5mWADwnOric=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcGZE7CmlXJ7cUUW92zqhkhx4mmH0hH0fZuLXG7y74qZGlM1aPVwtfZ2B8SNdk3Zk1LaBTOqZNFjOevIk3l_Q9ch4z0r7IOoVSL-G7ZnsEhA886KA0wPCQcQ2ZjL5mWADwnOric=s1600-p-k-no', false, 6, 'Résidence Clos d''Anthony')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfM4r_aUZ0Xs-JBkgIAibtu-WqJImJSamSQws0NNg00tK9wLzwSGqhCLew2oCByG1hqefcyn0AeFSWWHqGeHh244JdcwzEThGc4OSaDq1b7Tuo34pCKdvVT-g4HPyRkYtbQGZfS=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfM4r_aUZ0Xs-JBkgIAibtu-WqJImJSamSQws0NNg00tK9wLzwSGqhCLew2oCByG1hqefcyn0AeFSWWHqGeHh244JdcwzEThGc4OSaDq1b7Tuo34pCKdvVT-g4HPyRkYtbQGZfS=s1600-p-k-no', false, 7, 'Résidence Clos d''Anthony')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLf0zxF3LoBo24o_AHUuSdmgyQne26IulzUt9XsBbcez4aUivhbeDYoT5q7KrkHTansgKpUpvmGkjR28gkD-mEtlfdeCtelBWDM9QQ_vhaFT6v38o2QvLDq7rkA5bU42iON5pBzHovC2hhU=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLf0zxF3LoBo24o_AHUuSdmgyQne26IulzUt9XsBbcez4aUivhbeDYoT5q7KrkHTansgKpUpvmGkjR28gkD-mEtlfdeCtelBWDM9QQ_vhaFT6v38o2QvLDq7rkA5bU42iON5pBzHovC2hhU=s1600-p-k-no', false, 8, 'Résidence Clos d''Anthony')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfXk72ldDPdFYBqOc4KkFjC1nz_BeDy8NPEHk4zvy2AiiV6ls4dyGNYr8sbzMQft8MPAMkvYvaHN0a0cP9qt80MnIer-RA9X4lB8kTUqZocVumDsDrC0xmxavaR4hc8HiUrLmaU=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfXk72ldDPdFYBqOc4KkFjC1nz_BeDy8NPEHk4zvy2AiiV6ls4dyGNYr8sbzMQft8MPAMkvYvaHN0a0cP9qt80MnIer-RA9X4lB8kTUqZocVumDsDrC0xmxavaR4hc8HiUrLmaU=s1600', false, 9, 'Résidence Clos d''Anthony')
  on conflict do nothing;

  -- [42] Bonapriso: Paisible Appart meublé Tigson - Two-Bedroom Apartment (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'bonapriso-paisible-appart-meuble-tigson-two-bedroom-apartment-bonapriso',
    'room',
    'published',
    'Bonapriso: Paisible Appart meublé Tigson - Two-Bedroom Apartment',
    'Bonapriso: Paisible Appart meublé Tigson - Two-Bedroom Apartment
Adresse : Douala.
Note Google Maps : 4.5/5 (0 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.01474,
    9.7049703,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1QVYCk4x3Tak5feUjuM9LmbHMKBcpRzTxZ3zGX-fLYhDfxc-AVbR599Gh4FcB45YyG0VyU7cNP-W6rCPIDN8vMq9j1oANzJTckHYm69CCmaKr6kyE3SUseyzURl3rETJiJMRiwHSc6yhJoSJ5OOOuAFigN1VMP6qjQxmGwXQW-SizYFEevJNLuOQ=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1QVYCk4x3Tak5feUjuM9LmbHMKBcpRzTxZ3zGX-fLYhDfxc-AVbR599Gh4FcB45YyG0VyU7cNP-W6rCPIDN8vMq9j1oANzJTckHYm69CCmaKr6kyE3SUseyzURl3rETJiJMRiwHSc6yhJoSJ5OOOuAFigN1VMP6qjQxmGwXQW-SizYFEevJNLuOQ=s1600', true, 0, 'Bonapriso: Paisible Appart meublé Tigson - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHiRZw_zBX_EzTiqkffCY4PMYCU2wM5ISia5WLPXsOelEMZ8kA3k7XoaOeEuw-agVgWly_Sc2huNRJ1hbNxMHz4Qol_bcUF7sQXWyc6al5XyMpuz7zuJl_wfhT0tksb4t4jOsZAynIdQBEXwZVwnMVbyleEdN_sYNKSCmIXYbTJ4jDonsP3cYYlGg=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHiRZw_zBX_EzTiqkffCY4PMYCU2wM5ISia5WLPXsOelEMZ8kA3k7XoaOeEuw-agVgWly_Sc2huNRJ1hbNxMHz4Qol_bcUF7sQXWyc6al5XyMpuz7zuJl_wfhT0tksb4t4jOsZAynIdQBEXwZVwnMVbyleEdN_sYNKSCmIXYbTJ4jDonsP3cYYlGg=s1600', false, 1, 'Bonapriso: Paisible Appart meublé Tigson - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEP_WiS9uKpCMpQzw2wTJcOGgkiQA1dmPdpIEfeYA5D6x1qlYuGJ-wTfVqjV_u2ACDvsBa5rYd13Hm9-59jThLA9oKeId75FYOGH9d83yT94JgdG1ncEpjLt8eJM95slwlaILM9dZYuuIX6Ib25XjRznxgjervN7x7EBgh3Y2umCRJ2qVaBA-ufmw=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEP_WiS9uKpCMpQzw2wTJcOGgkiQA1dmPdpIEfeYA5D6x1qlYuGJ-wTfVqjV_u2ACDvsBa5rYd13Hm9-59jThLA9oKeId75FYOGH9d83yT94JgdG1ncEpjLt8eJM95slwlaILM9dZYuuIX6Ib25XjRznxgjervN7x7EBgh3Y2umCRJ2qVaBA-ufmw=s1600', false, 2, 'Bonapriso: Paisible Appart meublé Tigson - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEjLJBnCzmyN9srEa8zpLHES7fIOeQ4NOnuyeJk-C_JY7h8uvRtNb6AQQ3Uow3p8IkyfaOCjU1UX55Qh0Dm6cbVDXBSs-RhYC7r05QRXGKDiXPB3U7_So_zs7KVpX0Xdqgeg7TI8glN8uV05w5gci5RgjCfjqd69av0t-AjcQ60C3j6kj6fT9DW=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEjLJBnCzmyN9srEa8zpLHES7fIOeQ4NOnuyeJk-C_JY7h8uvRtNb6AQQ3Uow3p8IkyfaOCjU1UX55Qh0Dm6cbVDXBSs-RhYC7r05QRXGKDiXPB3U7_So_zs7KVpX0Xdqgeg7TI8glN8uV05w5gci5RgjCfjqd69av0t-AjcQ60C3j6kj6fT9DW=s1600', false, 3, 'Bonapriso: Paisible Appart meublé Tigson - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEtDqQs52IQNsgsbRiIRR1cWNq1Fomu4Sp0rsX27pkM6P1a8mB5D5w1ta-PQtzMwd5pzhddQOfU4N7I7rTwsyMS82AWLj4TcvORNaapTyXJftjy5gjF1Fi4axsNXYptgXA1is6hP3v-89W6_PWZknsao6FQzlFjoPn720jRlhBKpWSipCqEUFBI7w=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEtDqQs52IQNsgsbRiIRR1cWNq1Fomu4Sp0rsX27pkM6P1a8mB5D5w1ta-PQtzMwd5pzhddQOfU4N7I7rTwsyMS82AWLj4TcvORNaapTyXJftjy5gjF1Fi4axsNXYptgXA1is6hP3v-89W6_PWZknsao6FQzlFjoPn720jRlhBKpWSipCqEUFBI7w=s1600', false, 4, 'Bonapriso: Paisible Appart meublé Tigson - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1QVYCk4x3Tak5feUjuM9LmbHMKBcpRzTxZ3zGX-fLYhDfxc-AVbR599Gh4FcB45YyG0VyU7cNP-W6rCPIDN8vMq9j1oANzJTckHYm69CCmaKr6kyE3SUseyzURl3rETJiJMRiwHSc6yhJoSJ5OOOuAFigN1VMP6qjQxmGwXQW-SizYFEevJNLuOQ=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1QVYCk4x3Tak5feUjuM9LmbHMKBcpRzTxZ3zGX-fLYhDfxc-AVbR599Gh4FcB45YyG0VyU7cNP-W6rCPIDN8vMq9j1oANzJTckHYm69CCmaKr6kyE3SUseyzURl3rETJiJMRiwHSc6yhJoSJ5OOOuAFigN1VMP6qjQxmGwXQW-SizYFEevJNLuOQ=s1600-p-k-no', false, 5, 'Bonapriso: Paisible Appart meublé Tigson - Two-Bedroom Apartment')
  on conflict do nothing;

  -- [43] Loumia Premium Residency (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'loumia-premium-residency-bonapriso',
    'apartment',
    'published',
    'Loumia Premium Residency',
    'Loumia Premium Residency
Catégorie : Appartement avec services.
Adresse : 2MGW+GJM, Douala.
Contact / WhatsApp : +237674927789.
Note Google Maps : 4.7/5 (117 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Paul Armel Amayene, note 4/5)
- "Note sans commentaire écrit." (suzy n, note 1/5)
- "Note sans commentaire écrit." (Stephane Takodjou, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '2MGW+GJM, Douala',
    4.0263484,
    9.6965433,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLe6pkoy1fzWm7xdmiyk3z6ezu6i4EUqgm_HLzxeJxTi1C-ZBBMzBLtgAt34AxGCUmL7ex5Bd_WuNf0pbVTZvFPgNsSnpDZznNv8ba3wij-qGnWP9SfDLJIF2LZgaEBxhe8Sr2cd=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLe6pkoy1fzWm7xdmiyk3z6ezu6i4EUqgm_HLzxeJxTi1C-ZBBMzBLtgAt34AxGCUmL7ex5Bd_WuNf0pbVTZvFPgNsSnpDZznNv8ba3wij-qGnWP9SfDLJIF2LZgaEBxhe8Sr2cd=s1600', true, 0, 'Loumia Premium Residency')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLe6pkoy1fzWm7xdmiyk3z6ezu6i4EUqgm_HLzxeJxTi1C-ZBBMzBLtgAt34AxGCUmL7ex5Bd_WuNf0pbVTZvFPgNsSnpDZznNv8ba3wij-qGnWP9SfDLJIF2LZgaEBxhe8Sr2cd=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLe6pkoy1fzWm7xdmiyk3z6ezu6i4EUqgm_HLzxeJxTi1C-ZBBMzBLtgAt34AxGCUmL7ex5Bd_WuNf0pbVTZvFPgNsSnpDZznNv8ba3wij-qGnWP9SfDLJIF2LZgaEBxhe8Sr2cd=s1600-p-k-no', false, 1, 'Loumia Premium Residency')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T09X55C2I09Bhk2h7_6cXyFHWTzFFadGsdPSwZN3_8URC3U1rL6UvhvCMEe8aGr27CUeQp2e1Dxy-nbNtnziYkEVjRrsJEK4LOkgzryk6ld4WtK7LgeGfAhQXuFA2tZpMPV-vg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T09X55C2I09Bhk2h7_6cXyFHWTzFFadGsdPSwZN3_8URC3U1rL6UvhvCMEe8aGr27CUeQp2e1Dxy-nbNtnziYkEVjRrsJEK4LOkgzryk6ld4WtK7LgeGfAhQXuFA2tZpMPV-vg=s1600', false, 2, 'Loumia Premium Residency')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TOFl0BP3AhCLvpKnIK5V9sYz_B4onDozq-ltI14zK9vyWP1ZPvydNHFcpP9oN4e0zlAJY6gLRzvlygAPujsiq3pR6e2Sn0AU9aARlfAgAAKCTMheKiZ7KiibxMehFPGOghXZYe=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TOFl0BP3AhCLvpKnIK5V9sYz_B4onDozq-ltI14zK9vyWP1ZPvydNHFcpP9oN4e0zlAJY6gLRzvlygAPujsiq3pR6e2Sn0AU9aARlfAgAAKCTMheKiZ7KiibxMehFPGOghXZYe=s1600', false, 3, 'Loumia Premium Residency')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGIT-eTFv-1I943E16g64RaWLp-q1te_gq2GdTKtwM66ZOlsNYGeu5rqeDN4GgJJvCii8eaWSWvj0EjMGQ4NEkAZ_uI_aYFKOrzflP9JHuzhVaXK2XUaFE3p8Jg88cuLNk-iP0w-nZ2jxwr1dUY1vVgBAjaMYwq_Cgkx2T9r_7FTqefSXSVkG6l=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGIT-eTFv-1I943E16g64RaWLp-q1te_gq2GdTKtwM66ZOlsNYGeu5rqeDN4GgJJvCii8eaWSWvj0EjMGQ4NEkAZ_uI_aYFKOrzflP9JHuzhVaXK2XUaFE3p8Jg88cuLNk-iP0w-nZ2jxwr1dUY1vVgBAjaMYwq_Cgkx2T9r_7FTqefSXSVkG6l=s1600', false, 4, 'Loumia Premium Residency')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGtlDLs-08RCedrNB0R_xN8kvD51eoE1E320hu7fUqefQ9YokHqSwATByN3bspjolrFQWuDz8QUQQLSJHXhLx-uIhAxvMGuSpm10_b7MMIqWSYIuhxz8qWg6mHl7dwxjBZ9Xefoi4OPsEuzaf6eGVYQuIEX8fWW4RLKYnidNhCergTi5EsWTpYM=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGtlDLs-08RCedrNB0R_xN8kvD51eoE1E320hu7fUqefQ9YokHqSwATByN3bspjolrFQWuDz8QUQQLSJHXhLx-uIhAxvMGuSpm10_b7MMIqWSYIuhxz8qWg6mHl7dwxjBZ9Xefoi4OPsEuzaf6eGVYQuIEX8fWW4RLKYnidNhCergTi5EsWTpYM=s1600', false, 5, 'Loumia Premium Residency')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHOkWATXs0v3NP_SHtkCKq9KhcMMTwyHJ5ldIpWUygG5nMhvqQZITmkTIxoQ4QhF2WcszYtmvS4Rh1pc0szeZPXUsaIvrDHM6yesMkJjD2b6pNqZ_m5WZRVYkTyaN0zK-6g2vhDpyqTvBXVvBqqVnbzC_5b3W77GukWUTIBWTBkBN0HtkUwDNo=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHOkWATXs0v3NP_SHtkCKq9KhcMMTwyHJ5ldIpWUygG5nMhvqQZITmkTIxoQ4QhF2WcszYtmvS4Rh1pc0szeZPXUsaIvrDHM6yesMkJjD2b6pNqZ_m5WZRVYkTyaN0zK-6g2vhDpyqTvBXVvBqqVnbzC_5b3W77GukWUTIBWTBkBN0HtkUwDNo=s1600', false, 6, 'Loumia Premium Residency')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEqDhQvhvA28KPPMPe1DJMwT0rmgilCB5GyE4D_W5_ztdob2RHWlKUf7pAAkvi6UGiNJJtUdyLcUP1W-VRUHmvpdegDoJ2aXwPOUjFPRVwGjsgq25y8NZ2Ed4s6QFq9gBf4U8Vq9DYDnKMWPvjr1DBev3E-h6Qsd9JDmxWReSpuENVCmuGYmvNTKQ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEqDhQvhvA28KPPMPe1DJMwT0rmgilCB5GyE4D_W5_ztdob2RHWlKUf7pAAkvi6UGiNJJtUdyLcUP1W-VRUHmvpdegDoJ2aXwPOUjFPRVwGjsgq25y8NZ2Ed4s6QFq9gBf4U8Vq9DYDnKMWPvjr1DBev3E-h6Qsd9JDmxWReSpuENVCmuGYmvNTKQ=s1600', false, 7, 'Loumia Premium Residency')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG4DoxboGgLlsOlyKbwI6ncwmNODvcvS9r5QRCotPv9-6f-LwcOW21m1m3imfi6ckRtcRR6uEsV8am2tQGM2ol5iq8S_Zq4VU4hx2nU1c6EeUZmaQ_qrMZK-HpTpzW8iRke0JmR1c5x1GW41r7XmuXHwRupkGcQo3XQxFrxY2Oji31FGL7opQ3P=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG4DoxboGgLlsOlyKbwI6ncwmNODvcvS9r5QRCotPv9-6f-LwcOW21m1m3imfi6ckRtcRR6uEsV8am2tQGM2ol5iq8S_Zq4VU4hx2nU1c6EeUZmaQ_qrMZK-HpTpzW8iRke0JmR1c5x1GW41r7XmuXHwRupkGcQo3XQxFrxY2Oji31FGL7opQ3P=s1600', false, 8, 'Loumia Premium Residency')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEBdWRk4ILXP3Yq270yXJ8yhvCjQHt074ijbkKPkWWBca6B-NONvkE7rf-KVebKRmB4xT7bpngnOMiimuYSOeVBTQpuWy8ObfvQf17Tld-eXrJNdb7wXupQVoaFkbfvFSy62W_uSsy1NH-xz4-rFk1D-BD8p3URWkxmmGkALo2KPHRPNBF4TqVP=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEBdWRk4ILXP3Yq270yXJ8yhvCjQHt074ijbkKPkWWBca6B-NONvkE7rf-KVebKRmB4xT7bpngnOMiimuYSOeVBTQpuWy8ObfvQf17Tld-eXrJNdb7wXupQVoaFkbfvFSy62W_uSsy1NH-xz4-rFk1D-BD8p3URWkxmmGkALo2KPHRPNBF4TqVP=s1600', false, 9, 'Loumia Premium Residency')
  on conflict do nothing;

  -- [44] Appartement meublé 3 Chambres BONAPRISO (104). RÉSIDENCE PRESTIGE KGV (DOUALA) (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-3-chambres-bonapriso-104-residence-prestige-kgv-douala-b',
    'room',
    'published',
    'Appartement meublé 3 Chambres BONAPRISO (104). RÉSIDENCE PRESTIGE KGV (DOUALA)',
    'Appartement meublé 3 Chambres BONAPRISO (104). RÉSIDENCE PRESTIGE KGV (DOUALA)
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0325699,
    9.7734442,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW04d95nVVSPV0VwGMwbDCAyZUdTkZaNyJgiE8MYUWiFChhHVVwXdDP6qFjNIyktEhzbY2YSbUBuRzGDs0MQ06QHnIl6QzKquUqk7jd-GRelvzf1IEGbr0L6JEXsPavl76FUwtYeU3-EK6Tqa26DdnhBG2mp_hrJGu1DG34_I95xgjDlDFnmqmvgXA=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW04d95nVVSPV0VwGMwbDCAyZUdTkZaNyJgiE8MYUWiFChhHVVwXdDP6qFjNIyktEhzbY2YSbUBuRzGDs0MQ06QHnIl6QzKquUqk7jd-GRelvzf1IEGbr0L6JEXsPavl76FUwtYeU3-EK6Tqa26DdnhBG2mp_hrJGu1DG34_I95xgjDlDFnmqmvgXA=s1600', true, 0, 'Appartement meublé 3 Chambres BONAPRISO (104). RÉSIDENCE PRESTIGE KGV (DOUALA)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhExz_NvV2SCMNcHzvb2YqtYJA8DZQCTe--BWqrSD56BBQeDbHDMGcpYUTyCFeKG51w23PEY8TppmTIhm-TIVmB9lQwHtXorLJdc1R4wVePC1a45-RXECMDGMX3ZfpXqHttrdxK4wxOTXfh-kwAP132QqCmVlwCDU18Jkujzwz1MqDHBYVV_UqcX=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhExz_NvV2SCMNcHzvb2YqtYJA8DZQCTe--BWqrSD56BBQeDbHDMGcpYUTyCFeKG51w23PEY8TppmTIhm-TIVmB9lQwHtXorLJdc1R4wVePC1a45-RXECMDGMX3ZfpXqHttrdxK4wxOTXfh-kwAP132QqCmVlwCDU18Jkujzwz1MqDHBYVV_UqcX=s1600', false, 1, 'Appartement meublé 3 Chambres BONAPRISO (104). RÉSIDENCE PRESTIGE KGV (DOUALA)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGbx1f804WolugWQGko0JR5KaazRaA51pG93MjZrK-GnM7omqcJCkGfhD65fh7DfZ5wvBNeFknK87dhAeZffCOq1DvWmw7MFdoQCKlz3BiG_p4GUchIGI4gb28WSNZT3OyLcMr1_GTn-rEmccmfa-1Z8GJ1IuQ_K8yK4YvF8depf1G22giz1f0K=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGbx1f804WolugWQGko0JR5KaazRaA51pG93MjZrK-GnM7omqcJCkGfhD65fh7DfZ5wvBNeFknK87dhAeZffCOq1DvWmw7MFdoQCKlz3BiG_p4GUchIGI4gb28WSNZT3OyLcMr1_GTn-rEmccmfa-1Z8GJ1IuQ_K8yK4YvF8depf1G22giz1f0K=s1600', false, 2, 'Appartement meublé 3 Chambres BONAPRISO (104). RÉSIDENCE PRESTIGE KGV (DOUALA)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFQtp2xPBIjNw4TERGY07jIRSQmXCSWeKex73eTe_fhJw2EGYMd-GwUtdbvbZntXFgMHmQD4zLZN2tEfu6FeTqIwUPSjhtMAFAuyEj-XMdYXim9qxW9-4m0VQ7I3-dYWQIRmylku3cCVcNs3OqvWEMCY-9X60yCnLI-eoQnFxm3nAZ4MuaGOwbO=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFQtp2xPBIjNw4TERGY07jIRSQmXCSWeKex73eTe_fhJw2EGYMd-GwUtdbvbZntXFgMHmQD4zLZN2tEfu6FeTqIwUPSjhtMAFAuyEj-XMdYXim9qxW9-4m0VQ7I3-dYWQIRmylku3cCVcNs3OqvWEMCY-9X60yCnLI-eoQnFxm3nAZ4MuaGOwbO=s1600', false, 3, 'Appartement meublé 3 Chambres BONAPRISO (104). RÉSIDENCE PRESTIGE KGV (DOUALA)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFFsMJyaPauQk6SkxfzorrlW0K7SnatC3fqwf_M8lpU5iLbadUcxL8Q8NNN8ObQH7u13zrVkoes8d0xJTXlBxT0Q1YdzPaZX7EOjPHnJZw1To5ZPsiexKqifToWQgP7GrVKez29RJRDTegQqfHYl-O9aFDBG-disagBFIpRyOF40Zr3Ol6yNHk=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFFsMJyaPauQk6SkxfzorrlW0K7SnatC3fqwf_M8lpU5iLbadUcxL8Q8NNN8ObQH7u13zrVkoes8d0xJTXlBxT0Q1YdzPaZX7EOjPHnJZw1To5ZPsiexKqifToWQgP7GrVKez29RJRDTegQqfHYl-O9aFDBG-disagBFIpRyOF40Zr3Ol6yNHk=s1600', false, 4, 'Appartement meublé 3 Chambres BONAPRISO (104). RÉSIDENCE PRESTIGE KGV (DOUALA)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHYQZVHACdcK_VuuFyP1KDizc6_wzxcEkzWYYYjTyQk1WoVoP3PS-7pQ3t9erUMfNrgdcBj7HsuqtKpGQ9LdHwpn5FnnKjQBC3EX7IcsTwFb7KYFnRhcVLZkn33H96U9sXE8D89MY-kjtyyY9tBJc4hjA70oDxDcekHy1ecfNemHpwSyWOXSWO6kg=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHYQZVHACdcK_VuuFyP1KDizc6_wzxcEkzWYYYjTyQk1WoVoP3PS-7pQ3t9erUMfNrgdcBj7HsuqtKpGQ9LdHwpn5FnnKjQBC3EX7IcsTwFb7KYFnRhcVLZkn33H96U9sXE8D89MY-kjtyyY9tBJc4hjA70oDxDcekHy1ecfNemHpwSyWOXSWO6kg=s1600', false, 5, 'Appartement meublé 3 Chambres BONAPRISO (104). RÉSIDENCE PRESTIGE KGV (DOUALA)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW04d95nVVSPV0VwGMwbDCAyZUdTkZaNyJgiE8MYUWiFChhHVVwXdDP6qFjNIyktEhzbY2YSbUBuRzGDs0MQ06QHnIl6QzKquUqk7jd-GRelvzf1IEGbr0L6JEXsPavl76FUwtYeU3-EK6Tqa26DdnhBG2mp_hrJGu1DG34_I95xgjDlDFnmqmvgXA=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW04d95nVVSPV0VwGMwbDCAyZUdTkZaNyJgiE8MYUWiFChhHVVwXdDP6qFjNIyktEhzbY2YSbUBuRzGDs0MQ06QHnIl6QzKquUqk7jd-GRelvzf1IEGbr0L6JEXsPavl76FUwtYeU3-EK6Tqa26DdnhBG2mp_hrJGu1DG34_I95xgjDlDFnmqmvgXA=s1600-p-k-no', false, 6, 'Appartement meublé 3 Chambres BONAPRISO (104). RÉSIDENCE PRESTIGE KGV (DOUALA)')
  on conflict do nothing;

  -- [45] Apparts meublés ymj bonapriso (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'apparts-meubles-ymj-bonapriso-bonapriso',
    'apartment',
    'published',
    'Apparts meublés ymj bonapriso',
    'Apparts meublés ymj bonapriso
Adresse : Rue Koloko, Douala.
Contact / WhatsApp : +237694605098.
Note Google Maps : 5/5 (2 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Rue Koloko, Douala',
    4.0316323,
    9.701772,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfi4IG8kicUYZbcRWfcwNkbcF8GkbzVYTJPJVEXlHWZVAShRKGNHT9RAB77cjo0ra2HUBHRfzf0LVlIpBNc0CTAujy3uEwOnbEcY2RNvnJ8HeAghXFzIjp4EfbnNeRJVCkrYRSfH_yrkqY=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfi4IG8kicUYZbcRWfcwNkbcF8GkbzVYTJPJVEXlHWZVAShRKGNHT9RAB77cjo0ra2HUBHRfzf0LVlIpBNc0CTAujy3uEwOnbEcY2RNvnJ8HeAghXFzIjp4EfbnNeRJVCkrYRSfH_yrkqY=s1600-p-k-no', true, 0, 'Apparts meublés ymj bonapriso')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Stww-QafBvxf5Q7l7zarvT_hwudY4aa4VqQKyl87o2GkkPMg3RruDfIEmQ27pj-mTBQ1SF_Fnew0soSneG1dX7dvOTT2ryTwNbiA5PFx7GGs1fmUru3sC2MOIzTdiHhKblR_qn4QRwr0U=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Stww-QafBvxf5Q7l7zarvT_hwudY4aa4VqQKyl87o2GkkPMg3RruDfIEmQ27pj-mTBQ1SF_Fnew0soSneG1dX7dvOTT2ryTwNbiA5PFx7GGs1fmUru3sC2MOIzTdiHhKblR_qn4QRwr0U=s1600', false, 1, 'Apparts meublés ymj bonapriso')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SXrqSbjNm0bkGkpUeaH6jeBlRv_BfAVwPgaDneFmxjjO1qD0kzhG3YAjVl_Rk8gXInDskEHrCN71r2GViZNiN6-kkFSzB1c4MgVaippBx0hK8EuZ1TLSk8VKhYXz6QMA-lkb2BxFA2klHE=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SXrqSbjNm0bkGkpUeaH6jeBlRv_BfAVwPgaDneFmxjjO1qD0kzhG3YAjVl_Rk8gXInDskEHrCN71r2GViZNiN6-kkFSzB1c4MgVaippBx0hK8EuZ1TLSk8VKhYXz6QMA-lkb2BxFA2klHE=s1600', false, 2, 'Apparts meublés ymj bonapriso')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RFvWeG4SBBqXmFBJ1T4e7aibzy1LfSQttQvLVgILAazUMR4QKK3SdJb9TlABqzFWIdUIjKy1D7IOAVkp_cQWB3na7Y1HnED5b3VlQq999Sl1zDUyvx4tKNi12bLBTIRlzclk7RQV-0UvdY=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RFvWeG4SBBqXmFBJ1T4e7aibzy1LfSQttQvLVgILAazUMR4QKK3SdJb9TlABqzFWIdUIjKy1D7IOAVkp_cQWB3na7Y1HnED5b3VlQq999Sl1zDUyvx4tKNi12bLBTIRlzclk7RQV-0UvdY=s1600', false, 3, 'Apparts meublés ymj bonapriso')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TAHC_jAJL6sqQdcC8HxSrJ-oVYpt-nL1CwuVOpADndsJFtRs4jDeTkscpoav1LZ82dLO2IICdFP-oLxvZf59CnD0kd7VT2VN7nKLpQpbh8LYaswWqGXcRNeW1BJYn8ZwsmsMEp-TCjD38=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TAHC_jAJL6sqQdcC8HxSrJ-oVYpt-nL1CwuVOpADndsJFtRs4jDeTkscpoav1LZ82dLO2IICdFP-oLxvZf59CnD0kd7VT2VN7nKLpQpbh8LYaswWqGXcRNeW1BJYn8ZwsmsMEp-TCjD38=s1600', false, 4, 'Apparts meublés ymj bonapriso')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QLbaa3DL1DNSlv3-6jU_Ntuz_5m5nBqFFOp-f0irELFvukAvYjaKN1V4hvWG-7bRfcH4jn2J5poUj48DjsshldC9SVHx-i6o-ZDRrdTbi7zp9WAQbhNy_zTXe0Z-sV8MtFF3zxomkOmh9L=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QLbaa3DL1DNSlv3-6jU_Ntuz_5m5nBqFFOp-f0irELFvukAvYjaKN1V4hvWG-7bRfcH4jn2J5poUj48DjsshldC9SVHx-i6o-ZDRrdTbi7zp9WAQbhNy_zTXe0Z-sV8MtFF3zxomkOmh9L=s1600', false, 5, 'Apparts meublés ymj bonapriso')
  on conflict do nothing;

  -- [46] Easy Home - Cameroun (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'easy-home-cameroun-bonapriso',
    'apartment',
    'published',
    'Easy Home - Cameroun',
    'Easy Home - Cameroun
Catégorie : Logement meublé.
Adresse : Glacier Moderne, Rue chococho En face, Douala.
Contact / WhatsApp : +237691738253.
Note Google Maps : 5/5 (2 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Murtala mohamed Sani, note 5/5)
- "Note sans commentaire écrit." (Amabo Louis Che, note 5/5)
- "Note sans commentaire écrit." (Murtala mohamed Sani, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Glacier Moderne, Rue chococho En face, Douala',
    4.0271567,
    9.6970954,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLe9Acf2KxZIfyYw1cnq2c1m5LQO-V9dVuqvm9TOoLNUywjhDRYaU2jRvW_3r6t2g0w9ok3bpvuQrIZlcLXtOF7Ics9AfpWE6LnPf_FmWpiTN-rlAqpEQBbPJsgiJm4QOtoseZz9Dg=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLe9Acf2KxZIfyYw1cnq2c1m5LQO-V9dVuqvm9TOoLNUywjhDRYaU2jRvW_3r6t2g0w9ok3bpvuQrIZlcLXtOF7Ics9AfpWE6LnPf_FmWpiTN-rlAqpEQBbPJsgiJm4QOtoseZz9Dg=s1600', true, 0, 'Easy Home - Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QRyEjWh6HbdSDqX7Wy0FF7lJVw3j7bZ2BQGCy5tdjBsq-XVuTnuC3o_rnDaYf4x2OeoqWzxWJAVC6BhWnwy0o9eTsGXYrHKZMZXSzuCgoGjzTX612VAo4othr0XYASrxdDnBUUVg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QRyEjWh6HbdSDqX7Wy0FF7lJVw3j7bZ2BQGCy5tdjBsq-XVuTnuC3o_rnDaYf4x2OeoqWzxWJAVC6BhWnwy0o9eTsGXYrHKZMZXSzuCgoGjzTX612VAo4othr0XYASrxdDnBUUVg=s1600', false, 1, 'Easy Home - Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SwiVqnmd9ZJh0-4YVlq8x4PoFo_a_NLMjqjzTb-9__tR83QvO_E_qAICXv5rhiVtW7_lPISOsbSB96ll8eR-ggVSWA4syNCxlLByo-Xvl0cNUlAP8K8Fq27W36V26Sb3JgYPxb=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SwiVqnmd9ZJh0-4YVlq8x4PoFo_a_NLMjqjzTb-9__tR83QvO_E_qAICXv5rhiVtW7_lPISOsbSB96ll8eR-ggVSWA4syNCxlLByo-Xvl0cNUlAP8K8Fq27W36V26Sb3JgYPxb=s1600', false, 2, 'Easy Home - Cameroun')
  on conflict do nothing;

  -- [47] Appartement et studio haut de gamme meublé et non meublé (Bonapriso)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-et-studio-haut-de-gamme-meuble-et-non-meuble-bonapriso',
    'studio',
    'published',
    'Appartement et studio haut de gamme meublé et non meublé',
    'Appartement et studio haut de gamme meublé et non meublé
Catégorie : Immeuble en copropriété.
Adresse : 2MGX+5JP, Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonapriso'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '2MGX+5JP, Douala',
    4.0254597,
    9.6990756,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  -- [48] Appartements Meublés Douala "Terminus Bonamoussadi" (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartements-meubles-douala-terminus-bonamoussadi-bonamoussadi',
    'apartment',
    'published',
    'Appartements Meublés Douala "Terminus Bonamoussadi"',
    'Appartements Meublés Douala "Terminus Bonamoussadi"
Catégorie : Complexe d''appartements meublés.
Adresse : Terminus, Douala.
Contact / WhatsApp : +237695170405.
Note Google Maps : 2.8/5 (4 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Terminus, Douala',
    4.0987569,
    9.7369339,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcNsTmon2wzeETwzkayPpe6ntXJezt0dwUsjLZJqe6IaTFG-2VhZ6i0C2YAMVedlfbxLnjxhxNKEdfnP03vaCO5pbTK4azQCbhvMV94U1ZCAp3h6XV5g9560hsq4WIJtx5N1E7oJc5nKovy=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcNsTmon2wzeETwzkayPpe6ntXJezt0dwUsjLZJqe6IaTFG-2VhZ6i0C2YAMVedlfbxLnjxhxNKEdfnP03vaCO5pbTK4azQCbhvMV94U1ZCAp3h6XV5g9560hsq4WIJtx5N1E7oJc5nKovy=s1600', true, 0, 'Appartements Meublés Douala "Terminus Bonamoussadi"')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SRiwEJaABFPmB5Rn_Pk64s27sMage8JL76OPmN7MDG0e68e64A7hkqBsvimgaqJPY_RDMYZLW0Hp6UxXDeteLVwNewN3xryY1Gktk_NvrzHFzrVZx6wgRldo3iBHq5WuDUlW9KVWmZgDHE=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SRiwEJaABFPmB5Rn_Pk64s27sMage8JL76OPmN7MDG0e68e64A7hkqBsvimgaqJPY_RDMYZLW0Hp6UxXDeteLVwNewN3xryY1Gktk_NvrzHFzrVZx6wgRldo3iBHq5WuDUlW9KVWmZgDHE=s1600', false, 1, 'Appartements Meublés Douala "Terminus Bonamoussadi"')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RnoVM0QaolEbPVg7NfOf9B2PGQfBb0RNHenzoG_z2BQsHDMRPQWWEzMugF6ksC9vjWVhmUh404TJsXUPbrnPwixozoJS7uEgdIMCUCinAsYSqExK7bXpzSQ_7CrOxlvJnXTpM=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RnoVM0QaolEbPVg7NfOf9B2PGQfBb0RNHenzoG_z2BQsHDMRPQWWEzMugF6ksC9vjWVhmUh404TJsXUPbrnPwixozoJS7uEgdIMCUCinAsYSqExK7bXpzSQ_7CrOxlvJnXTpM=s1600', false, 2, 'Appartements Meublés Douala "Terminus Bonamoussadi"')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SmF4VWKCpuils1XGXcCNwXtbZquB9cGnHSP6Ua8mHNYOGKVL6SCebO_X4owS7TCf1NHOTCe5uIlSU1SjgGN23V_oIlciQhm8EA-l46qcdJbzvHyzQ35E7n7DNEtjCKhx1RpoEd=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SmF4VWKCpuils1XGXcCNwXtbZquB9cGnHSP6Ua8mHNYOGKVL6SCebO_X4owS7TCf1NHOTCe5uIlSU1SjgGN23V_oIlciQhm8EA-l46qcdJbzvHyzQ35E7n7DNEtjCKhx1RpoEd=s1600', false, 3, 'Appartements Meublés Douala "Terminus Bonamoussadi"')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SmPAzfQh-LFeTRPXNgv0yCPkPs_kM-drVlKi4i_lbbwtImMMFCKL_IUGsQeb8EXjK8nzti-m2K1UqIGDrWx2IpZ1YvwmGqRBUijj8HZaRV3yrAN5kk1_xOhjeQiAkBFapJTZsCpQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SmPAzfQh-LFeTRPXNgv0yCPkPs_kM-drVlKi4i_lbbwtImMMFCKL_IUGsQeb8EXjK8nzti-m2K1UqIGDrWx2IpZ1YvwmGqRBUijj8HZaRV3yrAN5kk1_xOhjeQiAkBFapJTZsCpQ=s1600', false, 4, 'Appartements Meublés Douala "Terminus Bonamoussadi"')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QEzpzdwUVgwibu8M4Cp5uvVqtUKypiMnsb0rvsHKqq_shXgNORan4lZo6V_iruLJqkydOadzOuriIFCuHYy88A54MulQaGs7lzlPemqRssoaGb_syCR7wIykn2cFGjaneRrDh7=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QEzpzdwUVgwibu8M4Cp5uvVqtUKypiMnsb0rvsHKqq_shXgNORan4lZo6V_iruLJqkydOadzOuriIFCuHYy88A54MulQaGs7lzlPemqRssoaGb_syCR7wIykn2cFGjaneRrDh7=s1600', false, 5, 'Appartements Meublés Douala "Terminus Bonamoussadi"')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QmMALvO774sGZuN-OdkephiQaflOYjg71a-A9Q7f1EwaIVDTi3ctxUsGfx5_KJiQU4zZpjBsEbUx1tu7rbxUfxhkvnzBsQAB0FxGJkVJAaNjIMg2UBOYkoauY4JxK_s77bO9qj=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QmMALvO774sGZuN-OdkephiQaflOYjg71a-A9Q7f1EwaIVDTi3ctxUsGfx5_KJiQU4zZpjBsEbUx1tu7rbxUfxhkvnzBsQAB0FxGJkVJAaNjIMg2UBOYkoauY4JxK_s77bO9qj=s1600', false, 6, 'Appartements Meublés Douala "Terminus Bonamoussadi"')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QDXYyIkUAv6FiE7LYbIdJRgnQarFwXXHng6j2z4FXgGyYv_SQVRdUnWNMs6KTDhzJIhtg8i3-EKwru_NWjW3S5bS0Q3RlWQCwwZolf8SGq4sXApBI4UUEQ13aB7p-_R_J8YTR2gA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QDXYyIkUAv6FiE7LYbIdJRgnQarFwXXHng6j2z4FXgGyYv_SQVRdUnWNMs6KTDhzJIhtg8i3-EKwru_NWjW3S5bS0Q3RlWQCwwZolf8SGq4sXApBI4UUEQ13aB7p-_R_J8YTR2gA=s1600', false, 7, 'Appartements Meublés Douala "Terminus Bonamoussadi"')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S5qob7apou57hzx9Rx5l1bEZ769Dy25dFbfyCYCS3JN4ThXu54sSdJm3nyFEEhEyYi9252j6zfM-a_1JDU5_n278Ka75fq8o-6h6SJEWlPO_5Ll7Eot70zOHXKb4glvlrmHQeTJA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S5qob7apou57hzx9Rx5l1bEZ769Dy25dFbfyCYCS3JN4ThXu54sSdJm3nyFEEhEyYi9252j6zfM-a_1JDU5_n278Ka75fq8o-6h6SJEWlPO_5Ll7Eot70zOHXKb4glvlrmHQeTJA=s1600', false, 8, 'Appartements Meublés Douala "Terminus Bonamoussadi"')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R-fe1avlLFBg49K5afXBSRaoE4whHxzDLB1_vDNsrUjiXnIVSymeLkOQ3Esjc5Nd3tEj1Jak5HUeBDSVv8cRL5r1bnnTBCnV2AiDlk1WP1wYC4SAeaHik7d7GMfoE4VdBym-LJMQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R-fe1avlLFBg49K5afXBSRaoE4whHxzDLB1_vDNsrUjiXnIVSymeLkOQ3Esjc5Nd3tEj1Jak5HUeBDSVv8cRL5r1bnnTBCnV2AiDlk1WP1wYC4SAeaHik7d7GMfoE4VdBym-LJMQ=s1600', false, 9, 'Appartements Meublés Douala "Terminus Bonamoussadi"')
  on conflict do nothing;

  -- [49] MEL HOUSE BONAMOUSSADI DENVER, APPARTEMENT MEUBLÉ (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'mel-house-bonamoussadi-denver-appartement-meuble-bonamoussadi',
    'apartment',
    'published',
    'MEL HOUSE BONAMOUSSADI DENVER, APPARTEMENT MEUBLÉ',
    'MEL HOUSE BONAMOUSSADI DENVER, APPARTEMENT MEUBLÉ
Catégorie : Complexe d''appartements meublés.
Adresse : Derrière la résidence de Samuel Eto''o, Bonamoussadi, Douala.
Contact / WhatsApp : +237687034224.
Note Google Maps : 5/5 (1 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Ahissia Nanou, note 5/5)
- "Note sans commentaire écrit." (Ahissia Nanou, note 5/5)
- "Note sans commentaire écrit." (Ahissia Nanou, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Derrière la résidence de Samuel Eto''o, Bonamoussadi, Douala',
    4.0898445,
    9.7289058,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLf7LFCJxJvRLRPurW99F6O_PYzHF7N4fUKyrNmvcJNLM9n23DslYxzv3NgwXPBKECcwJKNq5Afh0R-S-iLJUfA8mRz_6J_o2GqlN_l3tgK5opWvw3FXI-g6G6Om6cTfzO06C0FWsEsJjT6p=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLf7LFCJxJvRLRPurW99F6O_PYzHF7N4fUKyrNmvcJNLM9n23DslYxzv3NgwXPBKECcwJKNq5Afh0R-S-iLJUfA8mRz_6J_o2GqlN_l3tgK5opWvw3FXI-g6G6Om6cTfzO06C0FWsEsJjT6p=s1600', true, 0, 'MEL HOUSE BONAMOUSSADI DENVER, APPARTEMENT MEUBLÉ')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLf7LFCJxJvRLRPurW99F6O_PYzHF7N4fUKyrNmvcJNLM9n23DslYxzv3NgwXPBKECcwJKNq5Afh0R-S-iLJUfA8mRz_6J_o2GqlN_l3tgK5opWvw3FXI-g6G6Om6cTfzO06C0FWsEsJjT6p=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLf7LFCJxJvRLRPurW99F6O_PYzHF7N4fUKyrNmvcJNLM9n23DslYxzv3NgwXPBKECcwJKNq5Afh0R-S-iLJUfA8mRz_6J_o2GqlN_l3tgK5opWvw3FXI-g6G6Om6cTfzO06C0FWsEsJjT6p=s1600-p-k-no', false, 1, 'MEL HOUSE BONAMOUSSADI DENVER, APPARTEMENT MEUBLÉ')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QS6cKBbjyWEKchY_VmiMEpZey8r_2R9OTOQ42y7glniIV-GwJ3989OTeOUlWJFNIF8LjVUxq5GiJZeIHTC_1kEzUZ00BnaB0msTKTpOV3ma6mPegr3xzSazVYkncAt_nRuxzmVoUPiN-nA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QS6cKBbjyWEKchY_VmiMEpZey8r_2R9OTOQ42y7glniIV-GwJ3989OTeOUlWJFNIF8LjVUxq5GiJZeIHTC_1kEzUZ00BnaB0msTKTpOV3ma6mPegr3xzSazVYkncAt_nRuxzmVoUPiN-nA=s1600', false, 2, 'MEL HOUSE BONAMOUSSADI DENVER, APPARTEMENT MEUBLÉ')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QPHTUdL9jz0j2lVmeO0Do3I4kML5FmQr_UkQLNHQytNMz-kt7xNEOOilqexMpVy-LCbcixz4Zj8CHpnHY2hW_Xk7jmJYso__NcwRnxBpSltVpP__pDm9BfA1_KBPTNOkVVWCSTWl_QZxA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QPHTUdL9jz0j2lVmeO0Do3I4kML5FmQr_UkQLNHQytNMz-kt7xNEOOilqexMpVy-LCbcixz4Zj8CHpnHY2hW_Xk7jmJYso__NcwRnxBpSltVpP__pDm9BfA1_KBPTNOkVVWCSTWl_QZxA=s1600', false, 3, 'MEL HOUSE BONAMOUSSADI DENVER, APPARTEMENT MEUBLÉ')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q6hwVZjBwrxIWMQuGZC3ZucNp2KXn4sHFuXc3XJ3D95DQe6wuyt8PAnmH-uyIR_tWxQ07UFQvXU_lKTFXS9wScuJM5_h4nxRZsZa2j-ikTwg9_klVSkLwpyp_-PCCbzMuQOIifXwx8sHQE=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q6hwVZjBwrxIWMQuGZC3ZucNp2KXn4sHFuXc3XJ3D95DQe6wuyt8PAnmH-uyIR_tWxQ07UFQvXU_lKTFXS9wScuJM5_h4nxRZsZa2j-ikTwg9_klVSkLwpyp_-PCCbzMuQOIifXwx8sHQE=s1600', false, 4, 'MEL HOUSE BONAMOUSSADI DENVER, APPARTEMENT MEUBLÉ')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T05T5DFryk7B4hz-7Rjc75O9b4be6n1vTOz38gNMDK8-T13Hkv247f7NqXwoxZaCBG5ZfEyoA7GpntkWmLA2Vgus8Qz4gcSCT9QpYrmglwF3GCKwrjtEUwgmLBKZHtrKUXOWdl_MX0XlZN=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T05T5DFryk7B4hz-7Rjc75O9b4be6n1vTOz38gNMDK8-T13Hkv247f7NqXwoxZaCBG5ZfEyoA7GpntkWmLA2Vgus8Qz4gcSCT9QpYrmglwF3GCKwrjtEUwgmLBKZHtrKUXOWdl_MX0XlZN=s1600', false, 5, 'MEL HOUSE BONAMOUSSADI DENVER, APPARTEMENT MEUBLÉ')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S7g8_DyQnayYR6lRDsCF4IFsYVxIMIF3tHlyog1UfVj71mOsf6oFxz8Y9IRpTR2XBeV4gc5PFwqBU3wQiKg00W5nNGIRwdux_Pg3hp1w4uUHXM-jFrDDxsiZtbu9SgpYlMLr_nRauq7Ptu=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S7g8_DyQnayYR6lRDsCF4IFsYVxIMIF3tHlyog1UfVj71mOsf6oFxz8Y9IRpTR2XBeV4gc5PFwqBU3wQiKg00W5nNGIRwdux_Pg3hp1w4uUHXM-jFrDDxsiZtbu9SgpYlMLr_nRauq7Ptu=s1600', false, 6, 'MEL HOUSE BONAMOUSSADI DENVER, APPARTEMENT MEUBLÉ')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q_9KxiiCO-PtXFsigXBf8yZwpGpsu2SGxjpsIVA0UR16cbGaSe1hs-2UR9y9v9vXHkZ9jmJIJIa-iyngN-dRV3RBjeeJszD9CCf3Lo3KhtyVdmqGrq1zuaBt-_qH1X6OkAQt7kIanfe85o=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q_9KxiiCO-PtXFsigXBf8yZwpGpsu2SGxjpsIVA0UR16cbGaSe1hs-2UR9y9v9vXHkZ9jmJIJIa-iyngN-dRV3RBjeeJszD9CCf3Lo3KhtyVdmqGrq1zuaBt-_qH1X6OkAQt7kIanfe85o=s1600', false, 7, 'MEL HOUSE BONAMOUSSADI DENVER, APPARTEMENT MEUBLÉ')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QG8JPuqLThXS31oo-TWOnhBNzzAHZHFzgz09L1KCV8eiLkxobmMH1AuqH4yafS99yO5s6tSo5R_OXtecMVSJTkeMjpVpc46PakjdXje7lOpa81ONptTxDrC6GSR1wzrgVQqedExVdhZt9-=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QG8JPuqLThXS31oo-TWOnhBNzzAHZHFzgz09L1KCV8eiLkxobmMH1AuqH4yafS99yO5s6tSo5R_OXtecMVSJTkeMjpVpc46PakjdXje7lOpa81ONptTxDrC6GSR1wzrgVQqedExVdhZt9-=s1600', false, 8, 'MEL HOUSE BONAMOUSSADI DENVER, APPARTEMENT MEUBLÉ')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S1mZL80Fw9ApYZmVdB0uhJZM4KkKRhpMPTKPqh6HVnmmIjrXpzlP2e3l2-6WtVyuJ14PC68dMSxlZdxJsDbuo7us1v96k0_s1YnKSJCmJ58TkxgLo6fX_l1s3uQJxfkvie6SHo3nifj5QG=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S1mZL80Fw9ApYZmVdB0uhJZM4KkKRhpMPTKPqh6HVnmmIjrXpzlP2e3l2-6WtVyuJ14PC68dMSxlZdxJsDbuo7us1v96k0_s1YnKSJCmJ58TkxgLo6fX_l1s3uQJxfkvie6SHo3nifj5QG=s1600', false, 9, 'MEL HOUSE BONAMOUSSADI DENVER, APPARTEMENT MEUBLÉ')
  on conflict do nothing;

  -- [50] Appartements Meublés – Douala Bonamoussadi - Residence Prestige (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartements-meubles-douala-bonamoussadi-residence-prestige-bonamoussadi',
    'apartment',
    'published',
    'Appartements Meublés – Douala Bonamoussadi - Residence Prestige',
    'Appartements Meublés – Douala Bonamoussadi - Residence Prestige
Catégorie : Location d''appartement de vacances.
Adresse : Douala.
Contact / WhatsApp : +237657846601.
Note Google Maps : 5/5 (3 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Oriadanie Larissa, note 5/5)
- "Note sans commentaire écrit." (Baptiste Marcon, note 5/5)
- "Note sans commentaire écrit." (Fraumi, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0982139,
    9.737341,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdM0EHRlr-L8Kt360nToVcPPeXzw27ZelBE9EU758_4ez3IAImeFzDovS-WjHmErQceVu-qQlvgnpJVCMwXT3QGglPYslTFhObol6Hqrt48YTv1RJPoa9e4okPELbSw4sV7KvCJc8aBk23T=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdM0EHRlr-L8Kt360nToVcPPeXzw27ZelBE9EU758_4ez3IAImeFzDovS-WjHmErQceVu-qQlvgnpJVCMwXT3QGglPYslTFhObol6Hqrt48YTv1RJPoa9e4okPELbSw4sV7KvCJc8aBk23T=s1600', true, 0, 'Appartements Meublés – Douala Bonamoussadi - Residence Prestige')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S4bsgeRk-dTfcbpe55dsF5YZYqtQ93w5sLdzUBB0NYx8L7oDdUtHCON2VxINVwFwwbXG8cnp6ZW5ZaP9w9nshB18nzfC-QiV1cRWcN8YGA8Whk0znPR3RAtVkXSsFEyKiP8lHojDeQyndx=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S4bsgeRk-dTfcbpe55dsF5YZYqtQ93w5sLdzUBB0NYx8L7oDdUtHCON2VxINVwFwwbXG8cnp6ZW5ZaP9w9nshB18nzfC-QiV1cRWcN8YGA8Whk0znPR3RAtVkXSsFEyKiP8lHojDeQyndx=s1600', false, 1, 'Appartements Meublés – Douala Bonamoussadi - Residence Prestige')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TRbZqXxjC1L5P7f-1pW4ezzH_Cpjxd5mVAz78Ksl1CCpIwZvSLKLxYHe6QwFXyV3OoDwKbR2Z4dQ2M5aOfBweg6ubPTX2qSjcpDlwtMtJ2joI5LZXdELeNEC-a6w4daiDJow9lmRIMqYvr=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TRbZqXxjC1L5P7f-1pW4ezzH_Cpjxd5mVAz78Ksl1CCpIwZvSLKLxYHe6QwFXyV3OoDwKbR2Z4dQ2M5aOfBweg6ubPTX2qSjcpDlwtMtJ2joI5LZXdELeNEC-a6w4daiDJow9lmRIMqYvr=s1600', false, 2, 'Appartements Meublés – Douala Bonamoussadi - Residence Prestige')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SMxCpkGHErXlrNpSomNxw5YMfauaxP_0MZyXNHrnzctBdD1wUO_d5RRJz-kCc36C0_K6OcdG1I4akCCxR5TeyAOeP8G7a-HmZQSmSoGgs25otMaRKlR-KRIgDZRDGcHd5FUkNiLktCdFQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SMxCpkGHErXlrNpSomNxw5YMfauaxP_0MZyXNHrnzctBdD1wUO_d5RRJz-kCc36C0_K6OcdG1I4akCCxR5TeyAOeP8G7a-HmZQSmSoGgs25otMaRKlR-KRIgDZRDGcHd5FUkNiLktCdFQ=s1600', false, 3, 'Appartements Meublés – Douala Bonamoussadi - Residence Prestige')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S6u-GCT_C3ZtwkD0wxEoaEveO2UIidIkHOINHB8UH2aehIQptH3yDpf9epj0da-KH9HGUEheaHsGqP4rNikK_N4aUoF1WIPu389uPj2amB4u8Ujl8JDUtzdF9hA154U91oASgc3TJ0j1VZ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S6u-GCT_C3ZtwkD0wxEoaEveO2UIidIkHOINHB8UH2aehIQptH3yDpf9epj0da-KH9HGUEheaHsGqP4rNikK_N4aUoF1WIPu389uPj2amB4u8Ujl8JDUtzdF9hA154U91oASgc3TJ0j1VZ=s1600', false, 4, 'Appartements Meublés – Douala Bonamoussadi - Residence Prestige')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdM0EHRlr-L8Kt360nToVcPPeXzw27ZelBE9EU758_4ez3IAImeFzDovS-WjHmErQceVu-qQlvgnpJVCMwXT3QGglPYslTFhObol6Hqrt48YTv1RJPoa9e4okPELbSw4sV7KvCJc8aBk23T=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdM0EHRlr-L8Kt360nToVcPPeXzw27ZelBE9EU758_4ez3IAImeFzDovS-WjHmErQceVu-qQlvgnpJVCMwXT3QGglPYslTFhObol6Hqrt48YTv1RJPoa9e4okPELbSw4sV7KvCJc8aBk23T=s1600-p-k-no', false, 5, 'Appartements Meublés – Douala Bonamoussadi - Residence Prestige')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RdXFmffHLw810-N4PSAxjYImKMCq0SyQsX_NbCv4Cis4aiCwF10NfJ-CNuy2CfsUGbuAzub1HLSeSZdDrHpXrXz19WVGpxrMIadxoGhzepyDkji4fN3lJyiQUcEwtzac7LBxrWh3IyHpe4=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RdXFmffHLw810-N4PSAxjYImKMCq0SyQsX_NbCv4Cis4aiCwF10NfJ-CNuy2CfsUGbuAzub1HLSeSZdDrHpXrXz19WVGpxrMIadxoGhzepyDkji4fN3lJyiQUcEwtzac7LBxrWh3IyHpe4=s1600', false, 6, 'Appartements Meublés – Douala Bonamoussadi - Residence Prestige')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RTgNdcnMnOLOmQpg1i0Nu33GWPcObv1rmDWwhzHpcKxXmktHANuOKK8PPq6_1YVU3G5RmtEhZohPEZ2aHXLnwgdMb1Pp8tDiuap8LYph_xuRw0kIdbOyomfwIV7YWJBFZ2eH0QNaA4YMpP=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RTgNdcnMnOLOmQpg1i0Nu33GWPcObv1rmDWwhzHpcKxXmktHANuOKK8PPq6_1YVU3G5RmtEhZohPEZ2aHXLnwgdMb1Pp8tDiuap8LYph_xuRw0kIdbOyomfwIV7YWJBFZ2eH0QNaA4YMpP=s1600', false, 7, 'Appartements Meublés – Douala Bonamoussadi - Residence Prestige')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a-/ALV-UjV4PywfZoIxeJMoAqzqtdmwrp-1lBTH5QcPSO8O4iMAp36r_Yo=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a-/ALV-UjV4PywfZoIxeJMoAqzqtdmwrp-1lBTH5QcPSO8O4iMAp36r_Yo=s1600-p-k-no-mo', false, 8, 'Appartements Meublés – Douala Bonamoussadi - Residence Prestige')
  on conflict do nothing;

  -- [51] Appartement meublé (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-bonamoussadi',
    'apartment',
    'published',
    'Appartement meublé',
    'Appartement meublé
Catégorie : Location d''appartement de vacances.
Adresse : g19 face ecole public bonamoussadi, Douala.
Note Google Maps : 4/5 (4 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Félix Digansia Hlamma, note 4/5)
- "Note sans commentaire écrit." (Jacques .kenmoe, note 5/5)
- "Note sans commentaire écrit." (Koller Denis, note 4/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'g19 face ecole public bonamoussadi, Douala',
    4.0954742,
    9.742244,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfwVJPP3QOpY7NBu7scFjX4feCn0-V9esacVHuopyp87-l4wmU14Jsmr9wwReGAZGEzyJ-0huN1gSwQzzseTogQbbGQJIT32k7hPN-qWoyt5lajDxldeM1ONVbLlPCi7N6GcGsm6Kx2Tyie=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfwVJPP3QOpY7NBu7scFjX4feCn0-V9esacVHuopyp87-l4wmU14Jsmr9wwReGAZGEzyJ-0huN1gSwQzzseTogQbbGQJIT32k7hPN-qWoyt5lajDxldeM1ONVbLlPCi7N6GcGsm6Kx2Tyie=s1600', true, 0, 'Appartement meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RiTNxh75OvwwYM6f4nqWHGcjO9PQvK8-YuH0-g_E31VDELxL0GgIc9OJRD1QKT8cbfMEt36lymVki5z1DVUvoLhKFXI_22W7pVfYC83AcIz4WxusgrUCBcXI9huWUGFGlaxb4GQSVZBk_x=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RiTNxh75OvwwYM6f4nqWHGcjO9PQvK8-YuH0-g_E31VDELxL0GgIc9OJRD1QKT8cbfMEt36lymVki5z1DVUvoLhKFXI_22W7pVfYC83AcIz4WxusgrUCBcXI9huWUGFGlaxb4GQSVZBk_x=s1600', false, 1, 'Appartement meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QMoNNJWyvnNeaWUjubWe6dkEdMAdnWdxNinSce9FyCadSe0HQ9RbSKQkl3fG-xJYHwLGDNnknHngsJ_uizNZoJk211vGnBLs90KSHVR3J3RxeYndnHND3TelYRM2ZN_mg3ltg8O-p8boM=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QMoNNJWyvnNeaWUjubWe6dkEdMAdnWdxNinSce9FyCadSe0HQ9RbSKQkl3fG-xJYHwLGDNnknHngsJ_uizNZoJk211vGnBLs90KSHVR3J3RxeYndnHND3TelYRM2ZN_mg3ltg8O-p8boM=s1600', false, 2, 'Appartement meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RpG7JdM2hjQ1RoSRKUlkvKLwDW0KC-CEfitHdQx8U-J0dUtZXoDpukTj8j1m1i-XFhvq8nw7vtns97cG9yY9mnhtkrkjSpo9kINGvj9R8MyDohjIF_nJvpgT9uBOfeYVzY1mwERMEeGRdX=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RpG7JdM2hjQ1RoSRKUlkvKLwDW0KC-CEfitHdQx8U-J0dUtZXoDpukTj8j1m1i-XFhvq8nw7vtns97cG9yY9mnhtkrkjSpo9kINGvj9R8MyDohjIF_nJvpgT9uBOfeYVzY1mwERMEeGRdX=s1600', false, 3, 'Appartement meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SJBAh-PtVLfnNAB4RkQI6-8_X7bG7mVvCTQlPeF3HwrVvb9hs2MNHpwqY0uUxjgOeHuDTVX4QkZGraZh7TkMISMnA7t3BtfXQAfZds7DL0FDZtb7mZ9_bvf5z5hwgg6Dpb8oW_jtWjW8Q=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SJBAh-PtVLfnNAB4RkQI6-8_X7bG7mVvCTQlPeF3HwrVvb9hs2MNHpwqY0uUxjgOeHuDTVX4QkZGraZh7TkMISMnA7t3BtfXQAfZds7DL0FDZtb7mZ9_bvf5z5hwgg6Dpb8oW_jtWjW8Q=s1600', false, 4, 'Appartement meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Re57gtsSGNSg5gyoIDeklXuqckfzjNCke_jjk3Q_pFxlgMrLtYjmYrOKZ5WllUtwcWb-4FCsqlW1h8tCauur-gfJ1g9AAHL8dPcvfiiCUT9ex2cdiRVH94Im7Zy6vaz0Piy4rFke7U2CJE=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Re57gtsSGNSg5gyoIDeklXuqckfzjNCke_jjk3Q_pFxlgMrLtYjmYrOKZ5WllUtwcWb-4FCsqlW1h8tCauur-gfJ1g9AAHL8dPcvfiiCUT9ex2cdiRVH94Im7Zy6vaz0Piy4rFke7U2CJE=s1600', false, 5, 'Appartement meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T2dmUTkaxluXpsnxnpH5iucL_4hKEYfqeLVb_AQC8_qD-lFQdjwpz5Hkhj4uqKwlkKVTC8bc51VvWAgzrWHXYuxaoQx_le_ugA87AHYMqa-bPgvgpZB9fv6ANUJBlhnSi2MqRCiwQebt8=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T2dmUTkaxluXpsnxnpH5iucL_4hKEYfqeLVb_AQC8_qD-lFQdjwpz5Hkhj4uqKwlkKVTC8bc51VvWAgzrWHXYuxaoQx_le_ugA87AHYMqa-bPgvgpZB9fv6ANUJBlhnSi2MqRCiwQebt8=s1600', false, 6, 'Appartement meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SilWfdlmeifPNCj25YcmCzKSDzAX3zTAS3KegPHgFIyjw5BDrK-JWaS64ExRBzz0x7MIVam5Dad02nO0Pp5rF1ln8uoXeHPAgv5GcnTCxK9tTdslodRuGDJj7gSG8xUDTq2WmrOl0ZQgg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SilWfdlmeifPNCj25YcmCzKSDzAX3zTAS3KegPHgFIyjw5BDrK-JWaS64ExRBzz0x7MIVam5Dad02nO0Pp5rF1ln8uoXeHPAgv5GcnTCxK9tTdslodRuGDJj7gSG8xUDTq2WmrOl0ZQgg=s1600', false, 7, 'Appartement meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfwVJPP3QOpY7NBu7scFjX4feCn0-V9esacVHuopyp87-l4wmU14Jsmr9wwReGAZGEzyJ-0huN1gSwQzzseTogQbbGQJIT32k7hPN-qWoyt5lajDxldeM1ONVbLlPCi7N6GcGsm6Kx2Tyie=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfwVJPP3QOpY7NBu7scFjX4feCn0-V9esacVHuopyp87-l4wmU14Jsmr9wwReGAZGEzyJ-0huN1gSwQzzseTogQbbGQJIT32k7hPN-qWoyt5lajDxldeM1ONVbLlPCi7N6GcGsm6Kx2Tyie=s1600-p-k-no', false, 8, 'Appartement meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S63y8rBOD5Ea8AYodyzxK70PRynmCal8bX5nT4T55gYBpNo3eKWi6G0oHbNyELDi9pvvJpY9bLaT4-P6LAARaXanBFwfjY4sWPdY0jpilACJuUe7ztxjcqV9mVwFKj8y6pra1lIWdYHyI=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S63y8rBOD5Ea8AYodyzxK70PRynmCal8bX5nT4T55gYBpNo3eKWi6G0oHbNyELDi9pvvJpY9bLaT4-P6LAARaXanBFwfjY4sWPdY0jpilACJuUe7ztxjcqV9mVwFKj8y6pra1lIWdYHyI=s1600', false, 9, 'Appartement meublé')
  on conflict do nothing;

  -- [52] Appartements Meublés Douala - Mieux Se Loger (Makepe)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartements-meubles-douala-mieux-se-loger-makepe',
    'apartment',
    'published',
    'Appartements Meublés Douala - Mieux Se Loger',
    'Appartements Meublés Douala - Mieux Se Loger
Catégorie : Maison d''hôtes.
Adresse : Makepe Bloc L Kotto Neptune, Douala.
Contact / WhatsApp : +237696128589.
Note Google Maps : 4.7/5 (7 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Pulcherie Ngo Tigyo, note 4/5)
- "Note sans commentaire écrit." (Thierry MEUNEU, note 5/5)
- "Note sans commentaire écrit." (Prince Omans, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'makepe'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Makepe Bloc L Kotto Neptune, Douala',
    4.0867685,
    9.7523018,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeUAhyXv4uXqDOx-ObQW-6YpW5cMceO_MMkr0ve70z9YuHzxkspekh7PWIBKM30SlwEfvg6c40XohaviJw-kZIUKQZPtAMtJOCHF-hjxhikYHRKc_MCJx0MAkJQbUt0C7RaTW9U=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeUAhyXv4uXqDOx-ObQW-6YpW5cMceO_MMkr0ve70z9YuHzxkspekh7PWIBKM30SlwEfvg6c40XohaviJw-kZIUKQZPtAMtJOCHF-hjxhikYHRKc_MCJx0MAkJQbUt0C7RaTW9U=s1600', true, 0, 'Appartements Meublés Douala - Mieux Se Loger')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SHxk7SEr1N_BjxxB2519BvoI_0Rkqw1PkRZWU9k8I-QeB7JrufLjvF2nw6fYvEhM5ZcgyfhDXoyI7C6xDOiuT7iisJ0--uJEulZVeEskRniSUWEkgoqtsXiVLEUZzYg5QpgSR7=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SHxk7SEr1N_BjxxB2519BvoI_0Rkqw1PkRZWU9k8I-QeB7JrufLjvF2nw6fYvEhM5ZcgyfhDXoyI7C6xDOiuT7iisJ0--uJEulZVeEskRniSUWEkgoqtsXiVLEUZzYg5QpgSR7=s1600', false, 1, 'Appartements Meublés Douala - Mieux Se Loger')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QqoferT4Xx4LivbS3nH-6-SZQw6ea-MAa3O5cOqJpcIjRoFqQbYlY675LG-wKiVTyl8Ta9zsXTZ66_XybAiDkWGSejVpXV3LtFl353Jp2uV38NulMwITbNGOozz8CkYL4Z0GwbG2Kx4Og=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QqoferT4Xx4LivbS3nH-6-SZQw6ea-MAa3O5cOqJpcIjRoFqQbYlY675LG-wKiVTyl8Ta9zsXTZ66_XybAiDkWGSejVpXV3LtFl353Jp2uV38NulMwITbNGOozz8CkYL4Z0GwbG2Kx4Og=s1600', false, 2, 'Appartements Meublés Douala - Mieux Se Loger')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Suhgf3dZ_r9RxcYNxsuGoTFvwkByWLuXmWvkeqpwbpNhkcpaaNTIH1XDCVVnaQenyrNj-XDsLC4upA3skP3fgP31hxeR-q3Ox0JZaE_EviDhnootmGOZTBGK7ib9lnUNzJM9V7NtRlNFce=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Suhgf3dZ_r9RxcYNxsuGoTFvwkByWLuXmWvkeqpwbpNhkcpaaNTIH1XDCVVnaQenyrNj-XDsLC4upA3skP3fgP31hxeR-q3Ox0JZaE_EviDhnootmGOZTBGK7ib9lnUNzJM9V7NtRlNFce=s1600', false, 3, 'Appartements Meublés Douala - Mieux Se Loger')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QUscTxLAVLzixdb8FaLmJuXVcLW6OGSbUWr7AG5gWZ6crlc1ImikZzt4j7r1ZI1cwL4H3ISiIgpmGuIl-RlGsgQ9Pf6FmE5CtoLsipVdRy9ICjz7mkcAefoaw0Nsb97cPejP40D5r3yEhv=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QUscTxLAVLzixdb8FaLmJuXVcLW6OGSbUWr7AG5gWZ6crlc1ImikZzt4j7r1ZI1cwL4H3ISiIgpmGuIl-RlGsgQ9Pf6FmE5CtoLsipVdRy9ICjz7mkcAefoaw0Nsb97cPejP40D5r3yEhv=s1600', false, 4, 'Appartements Meublés Douala - Mieux Se Loger')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SFEYnScDUcFJhDedxE-mDKdteWL6uBwv9YX8OOak4rZ2HO5HSya-oP4HKtjhru3dnzPljHkyL5kmq0t1fmp7lqfwKbg1vbd3cp6HHcSrZHRnuK1VQjEedlGPrcrdKXqMcvxVRfmcQ42Xw9=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SFEYnScDUcFJhDedxE-mDKdteWL6uBwv9YX8OOak4rZ2HO5HSya-oP4HKtjhru3dnzPljHkyL5kmq0t1fmp7lqfwKbg1vbd3cp6HHcSrZHRnuK1VQjEedlGPrcrdKXqMcvxVRfmcQ42Xw9=s1600', false, 5, 'Appartements Meublés Douala - Mieux Se Loger')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RMqdom8xJYX37A2pr6MLvIvA4kkOtrGbL5nMSXLy9wH1BCrE0aMKbo5ANekkooOIhlTauKfjswRGBDhgYTtB9UsVeWxY-kplwfgPNMtZYFVHNIk0xeHwSC53DlDpw5vhDDE42EiUpywK8=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RMqdom8xJYX37A2pr6MLvIvA4kkOtrGbL5nMSXLy9wH1BCrE0aMKbo5ANekkooOIhlTauKfjswRGBDhgYTtB9UsVeWxY-kplwfgPNMtZYFVHNIk0xeHwSC53DlDpw5vhDDE42EiUpywK8=s1600', false, 6, 'Appartements Meublés Douala - Mieux Se Loger')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S-Jmsiol8VgvfrtI5Gw7AYBysEMP_vNvHRb35UUnnoCFmuSyhx5h8jSPsCsWPMswQfVsd9exvbe8SBZqq-O9OlQWaEc_tbvy2cok6HHoA5r0JXUaJTCAHd6C4MKKqJJZrAJIDOloWow9Y=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S-Jmsiol8VgvfrtI5Gw7AYBysEMP_vNvHRb35UUnnoCFmuSyhx5h8jSPsCsWPMswQfVsd9exvbe8SBZqq-O9OlQWaEc_tbvy2cok6HHoA5r0JXUaJTCAHd6C4MKKqJJZrAJIDOloWow9Y=s1600', false, 7, 'Appartements Meublés Douala - Mieux Se Loger')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S8f0HQ5F841dz8B-zcRdglTVL660haTpyWKJI7T5-JRJXLKOkv_f8M6WHuvrZ02jgKSoCCnoIYzoXNZ5bfD-5dfo3cUKTc7P75KiEkiICAkPH1dauNmYgTzwajlmGzzhPjGSzobhux4x6f=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S8f0HQ5F841dz8B-zcRdglTVL660haTpyWKJI7T5-JRJXLKOkv_f8M6WHuvrZ02jgKSoCCnoIYzoXNZ5bfD-5dfo3cUKTc7P75KiEkiICAkPH1dauNmYgTzwajlmGzzhPjGSzobhux4x6f=s1600', false, 8, 'Appartements Meublés Douala - Mieux Se Loger')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RIs2Pr6OUGUudvUfRj-kE1SGvaV1GLpYW-AmDJLhXJYTt7J9MoPV11XLf7YmZeN01UcMIMb0_CHQIYp-MPVz_jxxgP8GXtBOLphvecT94mVeXfP3cj88U_tBx1Zdfx16IisASdqi5-f-i0=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RIs2Pr6OUGUudvUfRj-kE1SGvaV1GLpYW-AmDJLhXJYTt7J9MoPV11XLf7YmZeN01UcMIMb0_CHQIYp-MPVz_jxxgP8GXtBOLphvecT94mVeXfP3cj88U_tBx1Zdfx16IisASdqi5-f-i0=s1600', false, 9, 'Appartements Meublés Douala - Mieux Se Loger')
  on conflict do nothing;

  -- [53] Appartement Meublé Bonamoussadi Douala - Apartment with Terrace (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-bonamoussadi-douala-apartment-with-terrace-bonamoussadi',
    'apartment',
    'published',
    'Appartement Meublé Bonamoussadi Douala - Apartment with Terrace',
    'Appartement Meublé Bonamoussadi Douala - Apartment with Terrace
Adresse : Douala.
Note Google Maps : 4.5/5 (0 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0903902,
    9.7456798,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW34kiHOjP7OHgrlMEXm_o-M0Dnw2qhWDv13gXlAJQSF1bXDBbTgD24HsLYCUY8DLqf4881oYg07zYfUF5z1dNjYiH7IJDHpeUbDHyC4MwAfmC2eZR0q0XIgA7-DYXj9jq8IJvG85MHG3xIHauaPKN-CAL65kSmHLw0qUHWjFdNmjz_V6PME12UJ=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW34kiHOjP7OHgrlMEXm_o-M0Dnw2qhWDv13gXlAJQSF1bXDBbTgD24HsLYCUY8DLqf4881oYg07zYfUF5z1dNjYiH7IJDHpeUbDHyC4MwAfmC2eZR0q0XIgA7-DYXj9jq8IJvG85MHG3xIHauaPKN-CAL65kSmHLw0qUHWjFdNmjz_V6PME12UJ=s1600', true, 0, 'Appartement Meublé Bonamoussadi Douala - Apartment with Terrace')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGWkj6VQg9daW8up12bMtUt0qftAL7pQlkxZG8l64C62OX8IxWySbCgQhROYdOkBbT4kJhoQcYRKZ7ioLseKpTi1etV7XBMkKlrsuWQmpxVlLSa7qAu_WhA1ZUtWoDOCoD1WjBPRZ1Af6XfbzVsrdVsSqLP03RrD0qzcoZazcdXIudMOaW59lMa=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGWkj6VQg9daW8up12bMtUt0qftAL7pQlkxZG8l64C62OX8IxWySbCgQhROYdOkBbT4kJhoQcYRKZ7ioLseKpTi1etV7XBMkKlrsuWQmpxVlLSa7qAu_WhA1ZUtWoDOCoD1WjBPRZ1Af6XfbzVsrdVsSqLP03RrD0qzcoZazcdXIudMOaW59lMa=s1600', false, 1, 'Appartement Meublé Bonamoussadi Douala - Apartment with Terrace')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHldVUqb_Wqqbfy61t0utTihIkBlza3MbZdIdX58QzAkkbGn5eSOD1fXkzRJlSMhoZZrf924DvX_Uop3KMPMUTfFhfAVCsdCLXilSTQBY3rufiB-t6_K-jVJLXVfA0872dRTC2uporpcojwFsAr7Ktn5Az-fQyIBUn3sw4iwhc3CIh0YTW7g64=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHldVUqb_Wqqbfy61t0utTihIkBlza3MbZdIdX58QzAkkbGn5eSOD1fXkzRJlSMhoZZrf924DvX_Uop3KMPMUTfFhfAVCsdCLXilSTQBY3rufiB-t6_K-jVJLXVfA0872dRTC2uporpcojwFsAr7Ktn5Az-fQyIBUn3sw4iwhc3CIh0YTW7g64=s1600', false, 2, 'Appartement Meublé Bonamoussadi Douala - Apartment with Terrace')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGsA_5Oeqtsksbbz4OMj4pfoLrL5t2pbqAxnR9uhvnOMcIR5q0TQ-ztajprMKKh-eYvakiOoB8UfgJR_siv1JWRzFQW3vB45VbG8jVqbpKXnKajgpAJYAB5EGpF0Vych9D6MitaJ_rgrgQ7UXTIdB9abyq9bI6lB0_Sp_1ldCAZPLH7v6SfVbvq=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGsA_5Oeqtsksbbz4OMj4pfoLrL5t2pbqAxnR9uhvnOMcIR5q0TQ-ztajprMKKh-eYvakiOoB8UfgJR_siv1JWRzFQW3vB45VbG8jVqbpKXnKajgpAJYAB5EGpF0Vych9D6MitaJ_rgrgQ7UXTIdB9abyq9bI6lB0_Sp_1ldCAZPLH7v6SfVbvq=s1600', false, 3, 'Appartement Meublé Bonamoussadi Douala - Apartment with Terrace')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW34kiHOjP7OHgrlMEXm_o-M0Dnw2qhWDv13gXlAJQSF1bXDBbTgD24HsLYCUY8DLqf4881oYg07zYfUF5z1dNjYiH7IJDHpeUbDHyC4MwAfmC2eZR0q0XIgA7-DYXj9jq8IJvG85MHG3xIHauaPKN-CAL65kSmHLw0qUHWjFdNmjz_V6PME12UJ=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW34kiHOjP7OHgrlMEXm_o-M0Dnw2qhWDv13gXlAJQSF1bXDBbTgD24HsLYCUY8DLqf4881oYg07zYfUF5z1dNjYiH7IJDHpeUbDHyC4MwAfmC2eZR0q0XIgA7-DYXj9jq8IJvG85MHG3xIHauaPKN-CAL65kSmHLw0qUHWjFdNmjz_V6PME12UJ=s1600-p-k-no', false, 4, 'Appartement Meublé Bonamoussadi Douala - Apartment with Terrace')
  on conflict do nothing;

  -- [54] Meuble de Bonamoussadi (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'meuble-de-bonamoussadi-bonamoussadi',
    'apartment',
    'published',
    'Meuble de Bonamoussadi',
    'Meuble de Bonamoussadi
Catégorie : Appartement avec services.
Adresse : 3PRW+VM8, Douala.
Contact / WhatsApp : +237696287153.
Note Google Maps : 3.6/5 (9 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Sim, note 3/5)
- "Note sans commentaire écrit." (Rodrigue FONGANG, note 2/5)
- "Note sans commentaire écrit." (Aicha Guebediang, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3PRW+VM8, Douala',
    4.0921617,
    9.7466903,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/a-/ALV-UjX-ASdlj8sAK2IASOWxZcbGwvTj5yds-QDm9lRVeP6smn7ThVY=s1600-p-rp-mo-ba12-br100', 'https://lh3.googleusercontent.com/a-/ALV-UjX-ASdlj8sAK2IASOWxZcbGwvTj5yds-QDm9lRVeP6smn7ThVY=s1600-p-rp-mo-ba12-br100', true, 0, 'Meuble de Bonamoussadi')
  on conflict do nothing;

  -- [55] appartement meublé maison blanche bonamoussadi (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-maison-blanche-bonamoussadi-bonamoussadi',
    'room',
    'published',
    'appartement meublé maison blanche bonamoussadi',
    'appartement meublé maison blanche bonamoussadi
Catégorie : Chambre d''hôtes.
Adresse : Douala.
Contact / WhatsApp : +237693611241.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0900682,
    9.743785,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcjUTa8iMcDhofCUALCuoPQOhM-Gb-EU5lOQA2pYsG-3mKGstkNmVibv96Is_BK81SCAdi3tsM_Xpw_x5rMzKZD-_xCpG-iNU2_sP0Rr6KoaDgMqRvYcVkgvIh-Op5wyYbwOJhzn-rxHz-D=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcjUTa8iMcDhofCUALCuoPQOhM-Gb-EU5lOQA2pYsG-3mKGstkNmVibv96Is_BK81SCAdi3tsM_Xpw_x5rMzKZD-_xCpG-iNU2_sP0Rr6KoaDgMqRvYcVkgvIh-Op5wyYbwOJhzn-rxHz-D=s1600', true, 0, 'appartement meublé maison blanche bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcjUTa8iMcDhofCUALCuoPQOhM-Gb-EU5lOQA2pYsG-3mKGstkNmVibv96Is_BK81SCAdi3tsM_Xpw_x5rMzKZD-_xCpG-iNU2_sP0Rr6KoaDgMqRvYcVkgvIh-Op5wyYbwOJhzn-rxHz-D=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcjUTa8iMcDhofCUALCuoPQOhM-Gb-EU5lOQA2pYsG-3mKGstkNmVibv96Is_BK81SCAdi3tsM_Xpw_x5rMzKZD-_xCpG-iNU2_sP0Rr6KoaDgMqRvYcVkgvIh-Op5wyYbwOJhzn-rxHz-D=s1600-p-k-no', false, 1, 'appartement meublé maison blanche bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tq37WI8zsbLIlDWcYTewL81NughwN4OtYF6qqp6ppE1KcjiJ1JasujJIKVmLu2OrvMqZDy64BvXG1WgrnuT3KCy9FvI0SEZMtc6YbxULoQVmTWobgD6jjL6F3pfAPQpUtubJtbpAMcJZAy=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tq37WI8zsbLIlDWcYTewL81NughwN4OtYF6qqp6ppE1KcjiJ1JasujJIKVmLu2OrvMqZDy64BvXG1WgrnuT3KCy9FvI0SEZMtc6YbxULoQVmTWobgD6jjL6F3pfAPQpUtubJtbpAMcJZAy=s1600', false, 2, 'appartement meublé maison blanche bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qu0hG2SG_rZ67u3pvgMJ8sMscB4FHTG-YdbJu_9u0OoTs2e_uJLuY6EiSONxGbQKsxCA-bAe3fpSgsfUxYuMZsR5Kaq7OguhlxKNTuCIq0_5OhsmrZRScPSSd8uZp7Xmp5YvsQpHzhmYS3=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qu0hG2SG_rZ67u3pvgMJ8sMscB4FHTG-YdbJu_9u0OoTs2e_uJLuY6EiSONxGbQKsxCA-bAe3fpSgsfUxYuMZsR5Kaq7OguhlxKNTuCIq0_5OhsmrZRScPSSd8uZp7Xmp5YvsQpHzhmYS3=s1600', false, 3, 'appartement meublé maison blanche bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tm8JbNe7subxEcdgPatIik3LJ6FJd9gS3dZSTP2Sf-Cfsg9AP6yoKcwnNNBDYxlCo5-qtaSd8Fr_Xv254II69hxg-EaW9Qg9slE8cwQNP1vk1EDcfUicUussPhvSUo5XynZtUJpdPQ1VI=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tm8JbNe7subxEcdgPatIik3LJ6FJd9gS3dZSTP2Sf-Cfsg9AP6yoKcwnNNBDYxlCo5-qtaSd8Fr_Xv254II69hxg-EaW9Qg9slE8cwQNP1vk1EDcfUicUussPhvSUo5XynZtUJpdPQ1VI=s1600', false, 4, 'appartement meublé maison blanche bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SZgeBJtJNSzrii4QiWa5QikeDHcD3K5pqIUBJjkU0K_wTmhfFgOlIx2e6n6kJot8FEk7gK0_mDN7svNpjqPPF2bL0e_Voce6amegves52YZO3MgbGyQPs5SyuB5_8D-3ilLHAHzKppgAE=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SZgeBJtJNSzrii4QiWa5QikeDHcD3K5pqIUBJjkU0K_wTmhfFgOlIx2e6n6kJot8FEk7gK0_mDN7svNpjqPPF2bL0e_Voce6amegves52YZO3MgbGyQPs5SyuB5_8D-3ilLHAHzKppgAE=s1600', false, 5, 'appartement meublé maison blanche bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SOZYBWHOHZtGGEuHI8QrdcOGf-haXdc-L4TU2mrcN9eyxg9VP27L3x8TZ41KQnHB781r8e_4JMkEPRkeBsxFUXPHsEpIm_ZheHHssx7mhQql6LkgcrXJx-onc0Md0V1D5gpdgjBVI8Qd9j=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SOZYBWHOHZtGGEuHI8QrdcOGf-haXdc-L4TU2mrcN9eyxg9VP27L3x8TZ41KQnHB781r8e_4JMkEPRkeBsxFUXPHsEpIm_ZheHHssx7mhQql6LkgcrXJx-onc0Md0V1D5gpdgjBVI8Qd9j=s1600', false, 6, 'appartement meublé maison blanche bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R8mzG0D6yH4_h_e1t8dvPSepjxL41r5kXbUPQc3Y6D-JCKgqe7_0LUbp5QPO0plLFvxqNUj0agrVDat4O-ix1MW5935tTx_awQ25fGIh5gKLy2X9uH4sAxa7GWbJ8p_1vAS0964eBnYOpJ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R8mzG0D6yH4_h_e1t8dvPSepjxL41r5kXbUPQc3Y6D-JCKgqe7_0LUbp5QPO0plLFvxqNUj0agrVDat4O-ix1MW5935tTx_awQ25fGIh5gKLy2X9uH4sAxa7GWbJ8p_1vAS0964eBnYOpJ=s1600', false, 7, 'appartement meublé maison blanche bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RWDaWNtN4zP1utFbSm-3cYQ0Fex48ddKxwIudoY6WaEV038qA2lbno6M_NKt9YfAX1K590cfFcy1UhP72g424GNwjoYSPPjbUVkXvMQSY1eiCWEAj162OafURhvkanB7xENPn_iI1I6xeg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RWDaWNtN4zP1utFbSm-3cYQ0Fex48ddKxwIudoY6WaEV038qA2lbno6M_NKt9YfAX1K590cfFcy1UhP72g424GNwjoYSPPjbUVkXvMQSY1eiCWEAj162OafURhvkanB7xENPn_iI1I6xeg=s1600', false, 8, 'appartement meublé maison blanche bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RufFj8zYAicYDJlzVmr0Fa0mIJ7-2Yy_qm6ckMxQQ3uVhx_mbhd6a62g6SkAAJs-dpzys50fGXb4JgnkSepvrEOmdz9kp40staNGVs4eaZ9urYTQYyLsQdZUat45hvvkwFkwNqoHasnNuD=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RufFj8zYAicYDJlzVmr0Fa0mIJ7-2Yy_qm6ckMxQQ3uVhx_mbhd6a62g6SkAAJs-dpzys50fGXb4JgnkSepvrEOmdz9kp40staNGVs4eaZ9urYTQYyLsQdZUat45hvvkwFkwNqoHasnNuD=s1600', false, 9, 'appartement meublé maison blanche bonamoussadi')
  on conflict do nothing;

  -- [56] Soft Résidence bonamoussadi (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'soft-residence-bonamoussadi-bonamoussadi',
    'apartment',
    'published',
    'Soft Résidence bonamoussadi',
    'Soft Résidence bonamoussadi
Catégorie : Complexe d''appartements meublés.
Adresse : 3PXP+QVW, Unnamed Road, Douala.
Contact / WhatsApp : +237697795259.
Note Google Maps : 4.6/5 (5 avis).

Avis clients récents :
- "Note sans commentaire écrit." (dany fangseu, note 4/5)
- "Note sans commentaire écrit." (Frank Bonheur, note 5/5)
- "Note sans commentaire écrit." (Tse Ernest Chi, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3PXP+QVW, Unnamed Road, Douala',
    4.099493,
    9.737192,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdX0S-p2UncMVrFzpQ3GtfBxOWwo-SbyEAfGwAvZSUWLAbTOaJUvwIgK5xGDAzFEgboVpeA_yPL0l9Ukq_-04zaFS00lB4YDFV-JO88xSQdH8_IFcpeNr_RDZ-TlYEHtmwrw2qO=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdX0S-p2UncMVrFzpQ3GtfBxOWwo-SbyEAfGwAvZSUWLAbTOaJUvwIgK5xGDAzFEgboVpeA_yPL0l9Ukq_-04zaFS00lB4YDFV-JO88xSQdH8_IFcpeNr_RDZ-TlYEHtmwrw2qO=s1600', true, 0, 'Soft Résidence bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdX0S-p2UncMVrFzpQ3GtfBxOWwo-SbyEAfGwAvZSUWLAbTOaJUvwIgK5xGDAzFEgboVpeA_yPL0l9Ukq_-04zaFS00lB4YDFV-JO88xSQdH8_IFcpeNr_RDZ-TlYEHtmwrw2qO=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdX0S-p2UncMVrFzpQ3GtfBxOWwo-SbyEAfGwAvZSUWLAbTOaJUvwIgK5xGDAzFEgboVpeA_yPL0l9Ukq_-04zaFS00lB4YDFV-JO88xSQdH8_IFcpeNr_RDZ-TlYEHtmwrw2qO=s1600-p-k-no', false, 1, 'Soft Résidence bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tjom9OJqg6PhLy9QfDCWI7yl56APm3E-471vmM9uQhPtIAP30ifMpl60d9IlG58RcQPgxfjrMBekfssIE-nigQkhBY4OKiEx-VxiSZIioTngpttLKXXQL3LqKfHlEUTFLWulON=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tjom9OJqg6PhLy9QfDCWI7yl56APm3E-471vmM9uQhPtIAP30ifMpl60d9IlG58RcQPgxfjrMBekfssIE-nigQkhBY4OKiEx-VxiSZIioTngpttLKXXQL3LqKfHlEUTFLWulON=s1600', false, 2, 'Soft Résidence bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S70l0DVAOTwK2LZNGVl6lL2SM1Pvmt3gvfchQL8oHnc500Ppu_k8Ido3rExF5jJLFncb2Chunm2fDAD8TgqUgfjrpu6ppRiK66PAmKqRO0288lMGh3TTXvrKV-SZiJtl0p6pTP1R50xzju=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S70l0DVAOTwK2LZNGVl6lL2SM1Pvmt3gvfchQL8oHnc500Ppu_k8Ido3rExF5jJLFncb2Chunm2fDAD8TgqUgfjrpu6ppRiK66PAmKqRO0288lMGh3TTXvrKV-SZiJtl0p6pTP1R50xzju=s1600', false, 3, 'Soft Résidence bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QJ312rxJ1HSKZV0JfOmOagrfEnBA78_j5OqamEx5QQBdEfr0M3hc_s8jx8OLOXrBeYxaK3lsHsMjHW5obj_IuIJuLh-lwAu2e2d7dHm5hk6ijc5j1XZUH4AmhtxwuZ4EHAVCPyXHEFgWBn=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QJ312rxJ1HSKZV0JfOmOagrfEnBA78_j5OqamEx5QQBdEfr0M3hc_s8jx8OLOXrBeYxaK3lsHsMjHW5obj_IuIJuLh-lwAu2e2d7dHm5hk6ijc5j1XZUH4AmhtxwuZ4EHAVCPyXHEFgWBn=s1600', false, 4, 'Soft Résidence bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QtigjEVF8rzHWf1ltotSqbdGk9c6MOUyWNGZ4T1fSVflV2AR3t0P10Rt1TH6ArJq228e0Z4ePUGu7OdXD9zGGhZGvqcGCX55fOjf0o5aGRznPK9Z6nHMNFpPF8kFCWWe1wUZv0=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QtigjEVF8rzHWf1ltotSqbdGk9c6MOUyWNGZ4T1fSVflV2AR3t0P10Rt1TH6ArJq228e0Z4ePUGu7OdXD9zGGhZGvqcGCX55fOjf0o5aGRznPK9Z6nHMNFpPF8kFCWWe1wUZv0=s1600', false, 5, 'Soft Résidence bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qg-9a670WYKkzD15lhxNftf5JTYt3I9gaydk7rGosFVDempece7qGDO8B0AHmIhTzS0cVt6TthA3waTcw3FkkVppnmB3dQnjmcRU6LBYSgamf2w171Cz-DgavjyRGuv-B8290=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qg-9a670WYKkzD15lhxNftf5JTYt3I9gaydk7rGosFVDempece7qGDO8B0AHmIhTzS0cVt6TthA3waTcw3FkkVppnmB3dQnjmcRU6LBYSgamf2w171Cz-DgavjyRGuv-B8290=s1600', false, 6, 'Soft Résidence bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SY0_43sAfPG00hj_pK0wWlf4Ng_-or_riheERnFrxaCWkh0bWr7FvmuQoPBHWrC3LpTiCHTu8QvTsodaHVc7KF_JXSPAwqfdXCLp6EeW2Y6mo2Aw8ph9xiGEiEyq1nRpBYOVmRrNFeG_MW=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SY0_43sAfPG00hj_pK0wWlf4Ng_-or_riheERnFrxaCWkh0bWr7FvmuQoPBHWrC3LpTiCHTu8QvTsodaHVc7KF_JXSPAwqfdXCLp6EeW2Y6mo2Aw8ph9xiGEiEyq1nRpBYOVmRrNFeG_MW=s1600', false, 7, 'Soft Résidence bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RBg6PqXsuYlVjyqDkMd63GKs8IOl5Rms4g7vjETOzXjgTCEDLF7fnjvKBDGcop9QovQC1FXsGWw-DAjPNwPkkcEmgeQpkvR2CIHbtOqTIA_d8wzSl1jRa7hn55m0ggm_xSFvi0RA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RBg6PqXsuYlVjyqDkMd63GKs8IOl5Rms4g7vjETOzXjgTCEDLF7fnjvKBDGcop9QovQC1FXsGWw-DAjPNwPkkcEmgeQpkvR2CIHbtOqTIA_d8wzSl1jRa7hn55m0ggm_xSFvi0RA=s1600', false, 8, 'Soft Résidence bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9ThDvq-BacISRKbIK61bapRWFQngBMWDliNvM0VSuIxzqi_udEMLT0OwXP_BrH8aGu8l2WwAeomAgSAzea-W2XvkGW1l8JHiRef9Gn9ypF-sO7ylVSmT2FhmoO_ZoQv6R-7F40fJk880Rc=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9ThDvq-BacISRKbIK61bapRWFQngBMWDliNvM0VSuIxzqi_udEMLT0OwXP_BrH8aGu8l2WwAeomAgSAzea-W2XvkGW1l8JHiRef9Gn9ypF-sO7ylVSmT2FhmoO_ZoQv6R-7F40fJk880Rc=s1600', false, 9, 'Soft Résidence bonamoussadi')
  on conflict do nothing;

  -- [57] DREAMS HOUSE BONAMOUSSADI (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'dreams-house-bonamoussadi-bonamoussadi',
    'apartment',
    'published',
    'DREAMS HOUSE BONAMOUSSADI',
    'DREAMS HOUSE BONAMOUSSADI
Catégorie : Résidence.
Adresse : Unnamed Road, Douala.
Note Google Maps : 3.5/5 (50 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Anny-laure A. AMANG (Laurey ann), note 4/5)
- "Note sans commentaire écrit." (MOUGANG TANKWA Alain, note 3/5)
- "Note sans commentaire écrit." (Yves Akpeubi, note 2/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Unnamed Road, Douala',
    4.098988,
    9.7475499,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdbEACMLymajsTbQZsY9sgX0GYZOUipRwAGn5ejU3q40bksoxJa5EtZhZeNjpAE1x0FE54LG7fNKrwM4dji7WF1LxKMqvrix_XZbh1enDwk_dRPqrRJ96lAEn_pC2wT--_V-vw=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdbEACMLymajsTbQZsY9sgX0GYZOUipRwAGn5ejU3q40bksoxJa5EtZhZeNjpAE1x0FE54LG7fNKrwM4dji7WF1LxKMqvrix_XZbh1enDwk_dRPqrRJ96lAEn_pC2wT--_V-vw=s1600', true, 0, 'DREAMS HOUSE BONAMOUSSADI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdbEACMLymajsTbQZsY9sgX0GYZOUipRwAGn5ejU3q40bksoxJa5EtZhZeNjpAE1x0FE54LG7fNKrwM4dji7WF1LxKMqvrix_XZbh1enDwk_dRPqrRJ96lAEn_pC2wT--_V-vw=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdbEACMLymajsTbQZsY9sgX0GYZOUipRwAGn5ejU3q40bksoxJa5EtZhZeNjpAE1x0FE54LG7fNKrwM4dji7WF1LxKMqvrix_XZbh1enDwk_dRPqrRJ96lAEn_pC2wT--_V-vw=s1600-p-k-no', false, 1, 'DREAMS HOUSE BONAMOUSSADI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QEmVlQ6qfGJemzFxlhOWKaIPd5_6YQT2UQ7ocwqhxywpLARI81N_3JpIL2QaUbmlQ2rvZbT7VNTPNELjYuVi1OgoeKt5W-RTyyS-PKWdK9JKWFwc746Lj6e8znS9PMakwqhtw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QEmVlQ6qfGJemzFxlhOWKaIPd5_6YQT2UQ7ocwqhxywpLARI81N_3JpIL2QaUbmlQ2rvZbT7VNTPNELjYuVi1OgoeKt5W-RTyyS-PKWdK9JKWFwc746Lj6e8znS9PMakwqhtw=s1600', false, 2, 'DREAMS HOUSE BONAMOUSSADI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SeWTd8qrEaM6L4rxursQVB0c0JkNggnRhbRoZkQHVCL7pVMX93dHgEJNIPxqvAk0-pvVwLOq5tMHoVun51U125EVQ3IzRWBCTQsk-_p_3rzfk4P9Y3xwCnGI4nZnuPa0nTkdTGhQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SeWTd8qrEaM6L4rxursQVB0c0JkNggnRhbRoZkQHVCL7pVMX93dHgEJNIPxqvAk0-pvVwLOq5tMHoVun51U125EVQ3IzRWBCTQsk-_p_3rzfk4P9Y3xwCnGI4nZnuPa0nTkdTGhQ=s1600', false, 3, 'DREAMS HOUSE BONAMOUSSADI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S__o8dI1hJDH7wUz1IxIgLgSGPC9l62cgQIKUMOIajrHlGKxGSUJBf3ogzbU7-42tHjdPHazRxNbB8Jv3QxoFa8AB0Q9l54Uc8tbOZPXqO7wBWhB4FhTgn91AOQCmYa4xvcp52Rw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S__o8dI1hJDH7wUz1IxIgLgSGPC9l62cgQIKUMOIajrHlGKxGSUJBf3ogzbU7-42tHjdPHazRxNbB8Jv3QxoFa8AB0Q9l54Uc8tbOZPXqO7wBWhB4FhTgn91AOQCmYa4xvcp52Rw=s1600', false, 4, 'DREAMS HOUSE BONAMOUSSADI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RQoYcL2DXbWyY3-Jno49pfEXZM5PZ5KtJTrdZ8xAfV-zM56RMZfEx2d_hMaevUNxGUtoqU2argO4Avu6osAe-buiCmXzlquUBtDs9souMZlAAxdw36zIgQGeM5_t_5n1ft77R8=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RQoYcL2DXbWyY3-Jno49pfEXZM5PZ5KtJTrdZ8xAfV-zM56RMZfEx2d_hMaevUNxGUtoqU2argO4Avu6osAe-buiCmXzlquUBtDs9souMZlAAxdw36zIgQGeM5_t_5n1ft77R8=s1600', false, 5, 'DREAMS HOUSE BONAMOUSSADI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QgID1-D-Xz37GFVAnu55eqahYEGlGs7gy0p_viQiIpSp9_gTc_hhKwbEQUSYz8iBlUh7CwcSfu3dbMb-Q4XiQ-opkFYoHnH3N6P7fxlDmOgKLMrfyRCFppChKlzSGFNeFI6U6B=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QgID1-D-Xz37GFVAnu55eqahYEGlGs7gy0p_viQiIpSp9_gTc_hhKwbEQUSYz8iBlUh7CwcSfu3dbMb-Q4XiQ-opkFYoHnH3N6P7fxlDmOgKLMrfyRCFppChKlzSGFNeFI6U6B=s1600', false, 6, 'DREAMS HOUSE BONAMOUSSADI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q7lbNoFUGPEOiTnI32r9CAt4saata7Kp3s-Jh9qCSU54WQmHdiIUtJy2Tz8GIIYmLXNfZtpORXmhTzYelHbZMuVrIzfWYFKcmShUHWWgfiOOEm5KAQe5snZ0pPanbBoJ7LTjWyZQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q7lbNoFUGPEOiTnI32r9CAt4saata7Kp3s-Jh9qCSU54WQmHdiIUtJy2Tz8GIIYmLXNfZtpORXmhTzYelHbZMuVrIzfWYFKcmShUHWWgfiOOEm5KAQe5snZ0pPanbBoJ7LTjWyZQ=s1600', false, 7, 'DREAMS HOUSE BONAMOUSSADI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S40ut7X2eVKKNS0XQFc1HcgWWCC2lh6Li5O-pqeK1NQlVVTHE3Zurpdxn8eB9m4FxweUSsLygCTIGDA_2rcMiunisl7E1fZlLFIpdP1Bq4n2zXw9VXnYQNtka8qHtbKxnu1I0=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S40ut7X2eVKKNS0XQFc1HcgWWCC2lh6Li5O-pqeK1NQlVVTHE3Zurpdxn8eB9m4FxweUSsLygCTIGDA_2rcMiunisl7E1fZlLFIpdP1Bq4n2zXw9VXnYQNtka8qHtbKxnu1I0=s1600', false, 8, 'DREAMS HOUSE BONAMOUSSADI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RhSKH0lqXejZRDAa6jH-dnOVJX33xubKZh1EsgoWA3S50AWF1tVNRbIzbv5egySQGqHcsvsSbxEtVEO9FEEL7L3c1BSlMO2KstwWa0mcXGUO4HunZDTBSM3mGzowtHsBF1NAi7=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RhSKH0lqXejZRDAa6jH-dnOVJX33xubKZh1EsgoWA3S50AWF1tVNRbIzbv5egySQGqHcsvsSbxEtVEO9FEEL7L3c1BSlMO2KstwWa0mcXGUO4HunZDTBSM3mGzowtHsBF1NAi7=s1600', false, 9, 'DREAMS HOUSE BONAMOUSSADI')
  on conflict do nothing;

  -- [58] Appartement Meublé BOBAM (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-bobam-bonamoussadi',
    'apartment',
    'published',
    'Appartement Meublé BOBAM',
    'Appartement Meublé BOBAM
Catégorie : Complexe d''appartements meublés.
Adresse : Rond-point Maetur, Douala.
Contact / WhatsApp : +237653165244.
Note Google Maps : 5/5 (4 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Julien Rim, note 5/5)
- "Note sans commentaire écrit." (Anne Bak, note 5/5)
- "Note sans commentaire écrit." (Milene Laminsu, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Rond-point Maetur, Douala',
    4.084485,
    9.7340114,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdYtVrtfarY77GkT5hbbFzTgvs9mXb4ShJ6wwyxg3NA0-Uuo-hHqcH2k4DpUbslHjoe2M_a6-mL-p4ojuJaX3qVfzzTBnboO_MISe2P6Ceq3F8sNWrsMA3ktCc0wmQSb59RPEsRzwf2_2J5=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdYtVrtfarY77GkT5hbbFzTgvs9mXb4ShJ6wwyxg3NA0-Uuo-hHqcH2k4DpUbslHjoe2M_a6-mL-p4ojuJaX3qVfzzTBnboO_MISe2P6Ceq3F8sNWrsMA3ktCc0wmQSb59RPEsRzwf2_2J5=s1600', true, 0, 'Appartement Meublé BOBAM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RV2nMeMcb498nJmY0cHFxYOTbVXMqtnM5xoxkkpxHl_O-e1HYPOb1iIrDOIuhx1qWLyruYBnUbOX-I8VQbw4eAzlNeP53NI3QLH0byOommmvuA1LlIfhUQTtKHwD8g19yN_Sztyg-8kV9i=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RV2nMeMcb498nJmY0cHFxYOTbVXMqtnM5xoxkkpxHl_O-e1HYPOb1iIrDOIuhx1qWLyruYBnUbOX-I8VQbw4eAzlNeP53NI3QLH0byOommmvuA1LlIfhUQTtKHwD8g19yN_Sztyg-8kV9i=s1600', false, 1, 'Appartement Meublé BOBAM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SfLyyDZxbQB0DJz1uCAXINC9cq-PqRRzhlxUQ-Xa0j-y80IAK2uqj02M-4hoppj232U1bPDF1QgEZNxfV2WT9CH3rgaxJsL7SysoOnpwiGJ6zKH7_3-S1DL1wIJpamaz02APEiqqnBmec=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SfLyyDZxbQB0DJz1uCAXINC9cq-PqRRzhlxUQ-Xa0j-y80IAK2uqj02M-4hoppj232U1bPDF1QgEZNxfV2WT9CH3rgaxJsL7SysoOnpwiGJ6zKH7_3-S1DL1wIJpamaz02APEiqqnBmec=s1600', false, 2, 'Appartement Meublé BOBAM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TKtkCrF7XGOTbjkyJ3M_jRiRySUcoww1AuDmbXGgW481Pw4WuzwY8uFAnq7d5Tjh0djC01zmN5Pr21foHj0zOl-aP8BI0a8KjaxWSfpBjSAku-VWFolQ7wcW84lu4yTKi0pwyWkxzGqiUp=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TKtkCrF7XGOTbjkyJ3M_jRiRySUcoww1AuDmbXGgW481Pw4WuzwY8uFAnq7d5Tjh0djC01zmN5Pr21foHj0zOl-aP8BI0a8KjaxWSfpBjSAku-VWFolQ7wcW84lu4yTKi0pwyWkxzGqiUp=s1600', false, 3, 'Appartement Meublé BOBAM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TwJAhRmBB95YApWHq-RuUYQvf2YIMSn2M--IFKO8Pnpg7x8JcBReMspMUfLIvKG8GkMZ0mBrGwZy5V4Ri4HfvP64a5SoGK49MRhKWWPy1EZOX70nCRnDLBqEh2zOL5p52uazLN0D_9X2rw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TwJAhRmBB95YApWHq-RuUYQvf2YIMSn2M--IFKO8Pnpg7x8JcBReMspMUfLIvKG8GkMZ0mBrGwZy5V4Ri4HfvP64a5SoGK49MRhKWWPy1EZOX70nCRnDLBqEh2zOL5p52uazLN0D_9X2rw=s1600', false, 4, 'Appartement Meublé BOBAM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SjScfHO5cYR-n1jnzvAluL2Qbp1SlkEGUnZ-H4PoJ6SF0epOCRBK5BDEWaQQtq8egeJOVidZGW7OrhGIixuZCjdXJMIWGJusgyny8bfXdFol7vgPoQ2ty3tWAFRkxaZMEpxPnEIUPYsQPb=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SjScfHO5cYR-n1jnzvAluL2Qbp1SlkEGUnZ-H4PoJ6SF0epOCRBK5BDEWaQQtq8egeJOVidZGW7OrhGIixuZCjdXJMIWGJusgyny8bfXdFol7vgPoQ2ty3tWAFRkxaZMEpxPnEIUPYsQPb=s1600', false, 5, 'Appartement Meublé BOBAM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RqH6_OyeP9u661sstAQ6pWniOkKc2zn5Ej-Hu9H74OgAAwD-GNHo1V629xYENnUkgYi0fdy5Z-vocqB9nsrGUinpVJpswSVCUxpuzhDcIUgEAygxUkxemXotnzBUH2wCijq1owtpIUXD6I=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RqH6_OyeP9u661sstAQ6pWniOkKc2zn5Ej-Hu9H74OgAAwD-GNHo1V629xYENnUkgYi0fdy5Z-vocqB9nsrGUinpVJpswSVCUxpuzhDcIUgEAygxUkxemXotnzBUH2wCijq1owtpIUXD6I=s1600', false, 6, 'Appartement Meublé BOBAM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rbrg2gM61CuZazLNFxTrue2Epmvdkv0jk4pvZQhFvE8bagGyGrQuJP_3OZl34H5Jv3Ga0xsqum7MYyqRUM0K9dIuI8cMRZZR-4rtF5CLBZoXElFAxX5nKZcjeUZz48Ycuomk1LcFCTsII=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rbrg2gM61CuZazLNFxTrue2Epmvdkv0jk4pvZQhFvE8bagGyGrQuJP_3OZl34H5Jv3Ga0xsqum7MYyqRUM0K9dIuI8cMRZZR-4rtF5CLBZoXElFAxX5nKZcjeUZz48Ycuomk1LcFCTsII=s1600', false, 7, 'Appartement Meublé BOBAM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SYgpyCAWdAIYyG4T41ML3HvUlpSiMbg8aCWvI_MOkkNlRxv5H_iNeaaBTiyROCPsK4Cxue1vwhXdwlGOuv6Q299lp4ANgUX3tIvLUi_Qv4Oxahe94p9fQau0wYyUBFaPgbHEeR_UaHVQKp=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SYgpyCAWdAIYyG4T41ML3HvUlpSiMbg8aCWvI_MOkkNlRxv5H_iNeaaBTiyROCPsK4Cxue1vwhXdwlGOuv6Q299lp4ANgUX3tIvLUi_Qv4Oxahe94p9fQau0wYyUBFaPgbHEeR_UaHVQKp=s1600', false, 8, 'Appartement Meublé BOBAM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TSkTGPFpLkQXTZHebX_-rVof-X4KiY23UCs5Kl-zO6Z84Ze9_KY8YgX-uT2zxrdrh3NS1-v009B84Rpn1rAx6oQfJmcrWH4wa6iGeaL6ht2TK798_cCntXENnsF455fDkXZIJ2eR1KvzA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TSkTGPFpLkQXTZHebX_-rVof-X4KiY23UCs5Kl-zO6Z84Ze9_KY8YgX-uT2zxrdrh3NS1-v009B84Rpn1rAx6oQfJmcrWH4wa6iGeaL6ht2TK798_cCntXENnsF455fDkXZIJ2eR1KvzA=s1600', false, 9, 'Appartement Meublé BOBAM')
  on conflict do nothing;

  -- [59] APPARTEMENT CHLESEA & BELGARDE - Denver (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-chlesea-belgarde-denver-bonamoussadi',
    'apartment',
    'published',
    'APPARTEMENT CHLESEA & BELGARDE - Denver',
    'APPARTEMENT CHLESEA & BELGARDE - Denver
Catégorie : Complexe d''appartements meublés.
Adresse : Juste à côté de la Fondation Francis Ngannou, Bonamoussadi, Douala.
Contact / WhatsApp : +237696162741.
Note Google Maps : 5/5 (1 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Dulcie Rochanto, note 5/5)
- "Note sans commentaire écrit." (Dulcie Rochanto, note 5/5)
- "Note sans commentaire écrit." (Dulcie Rochanto, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Juste à côté de la Fondation Francis Ngannou, Bonamoussadi, Douala',
    4.0898992,
    9.728969,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLc7I4kUGLQGQHUGczV8PkfSUtu81GeqqgWI1zBNYddniiqDMFjGzySVHU6AL6sCB392aSmVph7ciTbOPQpNgmiOYeTSKx2-DHQvZm9TdBOf4sGMIYR2G0950jWtnzvnDHPc9r9mpSVtW-RH=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLc7I4kUGLQGQHUGczV8PkfSUtu81GeqqgWI1zBNYddniiqDMFjGzySVHU6AL6sCB392aSmVph7ciTbOPQpNgmiOYeTSKx2-DHQvZm9TdBOf4sGMIYR2G0950jWtnzvnDHPc9r9mpSVtW-RH=s1600', true, 0, 'APPARTEMENT CHLESEA & BELGARDE - Denver')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T9nYGhWfCr6y2k3QhnMADuuJd6RDq_kIon-OTx_J7q9qtLbcIKm57gi8pqXY4N-7oJfwuP7nU5Gk1p0_yC57e08W-LW6zF6dX2wHa9L0F1KShNIB7PaPlkwttxaA4b-VaLeKkjf-FadAa0=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T9nYGhWfCr6y2k3QhnMADuuJd6RDq_kIon-OTx_J7q9qtLbcIKm57gi8pqXY4N-7oJfwuP7nU5Gk1p0_yC57e08W-LW6zF6dX2wHa9L0F1KShNIB7PaPlkwttxaA4b-VaLeKkjf-FadAa0=s1600', false, 1, 'APPARTEMENT CHLESEA & BELGARDE - Denver')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T3YfXRlu01PcT8P19l6duMYoKIlqVGS9CvTsVxoU5OWJ3AYtJPMBo80j8L33xHLK0EhG2c_6twUPGl3UKDXKdshM58sLRV5vFdNtz_7TKgOuB_7Lxs2bbhYMaChskdBic6hh42OZ6JR52z=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T3YfXRlu01PcT8P19l6duMYoKIlqVGS9CvTsVxoU5OWJ3AYtJPMBo80j8L33xHLK0EhG2c_6twUPGl3UKDXKdshM58sLRV5vFdNtz_7TKgOuB_7Lxs2bbhYMaChskdBic6hh42OZ6JR52z=s1600', false, 2, 'APPARTEMENT CHLESEA & BELGARDE - Denver')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QyvRez6J7MwUEMxz35OnebnpEThZt3DNU1RQ6_46v4oXUAV2FvbrvSx6ntm43Hok19hS1iOl43FeWp6Q45vAIKb0QWh4PwIw2e5lB7iytzDiTagr7MLeyFDFDy3zk4MQ9SekE0mo33sVzz=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QyvRez6J7MwUEMxz35OnebnpEThZt3DNU1RQ6_46v4oXUAV2FvbrvSx6ntm43Hok19hS1iOl43FeWp6Q45vAIKb0QWh4PwIw2e5lB7iytzDiTagr7MLeyFDFDy3zk4MQ9SekE0mo33sVzz=s1600', false, 3, 'APPARTEMENT CHLESEA & BELGARDE - Denver')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QXLl93CsR20owRiW0h557m4rOQOWXNENueMsotCp_jzok3MWUsrXfIDJI-kHWHD6ALiT9VMbZ68G8GX6N7Sg7TFJegvQwk1rC2ukvraLLmzfRuMvrZUm6mekxEFSRICsezn-_lyZHv8DMg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QXLl93CsR20owRiW0h557m4rOQOWXNENueMsotCp_jzok3MWUsrXfIDJI-kHWHD6ALiT9VMbZ68G8GX6N7Sg7TFJegvQwk1rC2ukvraLLmzfRuMvrZUm6mekxEFSRICsezn-_lyZHv8DMg=s1600', false, 4, 'APPARTEMENT CHLESEA & BELGARDE - Denver')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tv8z3bUnxsgoLGJ_Ew2Zza1pQWZAKUoIy6NiBhJLV3K4nnaXG4JKTVFPhOJJrKYLWND6G-Um1KpZrsqGzN10JcA_Sv5fsijeClkTlIoxT41vpgb-WAdB3dY0v2sqkhkjjZrFQuTqJGEmA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tv8z3bUnxsgoLGJ_Ew2Zza1pQWZAKUoIy6NiBhJLV3K4nnaXG4JKTVFPhOJJrKYLWND6G-Um1KpZrsqGzN10JcA_Sv5fsijeClkTlIoxT41vpgb-WAdB3dY0v2sqkhkjjZrFQuTqJGEmA=s1600', false, 5, 'APPARTEMENT CHLESEA & BELGARDE - Denver')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SWqeiFVn8SB4z6wdPRTwuickxf445Ay68ymY24g88Kue8p7U-YGnxE5L4gnhn9QrTVMPXCaQjZ60y8vsPTAC5Nc2lEK5SSbrLgMpi7GgoRjqKP_LgRfPIE0oGNo6Q9TfyVWkrL5p6zCyg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SWqeiFVn8SB4z6wdPRTwuickxf445Ay68ymY24g88Kue8p7U-YGnxE5L4gnhn9QrTVMPXCaQjZ60y8vsPTAC5Nc2lEK5SSbrLgMpi7GgoRjqKP_LgRfPIE0oGNo6Q9TfyVWkrL5p6zCyg=s1600', false, 6, 'APPARTEMENT CHLESEA & BELGARDE - Denver')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QHo5vP0HyTUHIZ4vw-G31x0CQ5dya10hXcG-vKumtu3_1ZytjuZnwEB6oCZQaHv5URpcO7x9EAtS5W1QK6ljovtUWvuZYfA6BsovWbuTxXYPDP9fBcUf8RwSzpQ6Ifhiqifxx5ieQVBPnt=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QHo5vP0HyTUHIZ4vw-G31x0CQ5dya10hXcG-vKumtu3_1ZytjuZnwEB6oCZQaHv5URpcO7x9EAtS5W1QK6ljovtUWvuZYfA6BsovWbuTxXYPDP9fBcUf8RwSzpQ6Ifhiqifxx5ieQVBPnt=s1600', false, 7, 'APPARTEMENT CHLESEA & BELGARDE - Denver')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLc7I4kUGLQGQHUGczV8PkfSUtu81GeqqgWI1zBNYddniiqDMFjGzySVHU6AL6sCB392aSmVph7ciTbOPQpNgmiOYeTSKx2-DHQvZm9TdBOf4sGMIYR2G0950jWtnzvnDHPc9r9mpSVtW-RH=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLc7I4kUGLQGQHUGczV8PkfSUtu81GeqqgWI1zBNYddniiqDMFjGzySVHU6AL6sCB392aSmVph7ciTbOPQpNgmiOYeTSKx2-DHQvZm9TdBOf4sGMIYR2G0950jWtnzvnDHPc9r9mpSVtW-RH=s1600-p-k-no', false, 8, 'APPARTEMENT CHLESEA & BELGARDE - Denver')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TztFzxgsFMKEaJqNdD5tocl3fdEV6rtLqUtybzC6LDq8DzaP5RrOezm9h-GkVMIACs4GKXCLwXQTiAvJVYgHs6yPCFya-FwRK-ihMGhxEXwXeBzthjv9-NsiUsACPV7jnm67DMnn-w3Mw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TztFzxgsFMKEaJqNdD5tocl3fdEV6rtLqUtybzC6LDq8DzaP5RrOezm9h-GkVMIACs4GKXCLwXQTiAvJVYgHs6yPCFya-FwRK-ihMGhxEXwXeBzthjv9-NsiUsACPV7jnm67DMnn-w3Mw=s1600', false, 9, 'APPARTEMENT CHLESEA & BELGARDE - Denver')
  on conflict do nothing;

  -- [60] chez balbine appartement meuble (Kotto)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'chez-balbine-appartement-meuble-kotto',
    'apartment',
    'published',
    'chez balbine appartement meuble',
    'chez balbine appartement meuble
Catégorie : Hébergement d''intérieur.
Adresse : 3QW2+PXJ, Kotto Bloc M Kotto-Bloc, Douala.
Contact / WhatsApp : +237655823362.
Note Google Maps : 3.5/5 (88 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Anny-laure A. AMANG (Laurey ann), note 3/5)
- "Note sans commentaire écrit." (lilian russel, note 3/5)
- "Note sans commentaire écrit." (Franck Kom, note 4/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'kotto'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3QW2+PXJ, Kotto Bloc M Kotto-Bloc, Douala',
    4.0968414,
    9.7524005,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLenz5SWrwYrdq39Nz2Iyl0Qn20Gge7xPnHvAgQ7JL7BYBRHKjT8gccoV7CZbMEXtW6YzqwAyswjH1_SLSb57-FiVysX-Upj0dUB5PF01i5Lyrovq12z3RKIYZDjfch1NaCQ6vkE=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLenz5SWrwYrdq39Nz2Iyl0Qn20Gge7xPnHvAgQ7JL7BYBRHKjT8gccoV7CZbMEXtW6YzqwAyswjH1_SLSb57-FiVysX-Upj0dUB5PF01i5Lyrovq12z3RKIYZDjfch1NaCQ6vkE=s1600', true, 0, 'chez balbine appartement meuble')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLenz5SWrwYrdq39Nz2Iyl0Qn20Gge7xPnHvAgQ7JL7BYBRHKjT8gccoV7CZbMEXtW6YzqwAyswjH1_SLSb57-FiVysX-Upj0dUB5PF01i5Lyrovq12z3RKIYZDjfch1NaCQ6vkE=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLenz5SWrwYrdq39Nz2Iyl0Qn20Gge7xPnHvAgQ7JL7BYBRHKjT8gccoV7CZbMEXtW6YzqwAyswjH1_SLSb57-FiVysX-Upj0dUB5PF01i5Lyrovq12z3RKIYZDjfch1NaCQ6vkE=s1600-p-k-no', false, 1, 'chez balbine appartement meuble')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T6CYZvHZQQB0JyYyUB6lIehGXS0b-j5xV_cxokWgzKKBG3XpFUnfDJO5ZCczVODrp08SWJvIvXz_Cavb19qNE1CueCvK18g-IWVzVf4NP-vtGKofcwaQQ-OyYBHWbRRIO21Qc4=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T6CYZvHZQQB0JyYyUB6lIehGXS0b-j5xV_cxokWgzKKBG3XpFUnfDJO5ZCczVODrp08SWJvIvXz_Cavb19qNE1CueCvK18g-IWVzVf4NP-vtGKofcwaQQ-OyYBHWbRRIO21Qc4=s1600', false, 2, 'chez balbine appartement meuble')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RyHOa2xA9mJkPq8cCCU-7Xr3Y_ZXCYQXuei-rR-wm3P8G5QLgd2D6Dtq94uuuwSL89PjxJR2VNGzybewrCpdTvmMPBWpfOyBIPvnDjEqBJ06lQ6Lvofixl5l1F6HTME1c6YwOs=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RyHOa2xA9mJkPq8cCCU-7Xr3Y_ZXCYQXuei-rR-wm3P8G5QLgd2D6Dtq94uuuwSL89PjxJR2VNGzybewrCpdTvmMPBWpfOyBIPvnDjEqBJ06lQ6Lvofixl5l1F6HTME1c6YwOs=s1600', false, 3, 'chez balbine appartement meuble')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TORkfxoGbbIIw1Np0UbBTeZ4SG9z-JYLf0A_bQV7t4Fo5u8dniB_q0vjB7ZAg21zME_aEWdQlPu_Tyv5vLD5z4hbl_wZc3BhCD2163SxkmNb0uDqtKoCFK0my-0XwRWCPst8w=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TORkfxoGbbIIw1Np0UbBTeZ4SG9z-JYLf0A_bQV7t4Fo5u8dniB_q0vjB7ZAg21zME_aEWdQlPu_Tyv5vLD5z4hbl_wZc3BhCD2163SxkmNb0uDqtKoCFK0my-0XwRWCPst8w=s1600', false, 4, 'chez balbine appartement meuble')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QXwrOMttnAUg681rH-9y2WyH59vsl7jXhAeGmPiz5JPbkKI__FA4GSaqIxS-a9leAKQ6UooTvhbLhI1CEPdseKhBIl9NOh6jJHGtreHXHWIFQ5-4FwK9V_pGPxyOhL_-tcEmuy=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QXwrOMttnAUg681rH-9y2WyH59vsl7jXhAeGmPiz5JPbkKI__FA4GSaqIxS-a9leAKQ6UooTvhbLhI1CEPdseKhBIl9NOh6jJHGtreHXHWIFQ5-4FwK9V_pGPxyOhL_-tcEmuy=s1600', false, 5, 'chez balbine appartement meuble')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a-/ALV-UjXuap52QmygGwbfoUlWtUXXuxypQgahvCsH0yoggEfBUemuzx_a4g=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a-/ALV-UjXuap52QmygGwbfoUlWtUXXuxypQgahvCsH0yoggEfBUemuzx_a4g=s1600-p-k-no-mo', false, 6, 'chez balbine appartement meuble')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qoqz42Dfs186jrCCre3pM5vPCYUGjY3feGNcFFbTaI8ihzmEy-ziSCRHvhei1epZKPEcZBtgacFdTOIMQjr5sIuM_nNjzlTMWyLUTL5HRPGuqs9WfE_52loH8BeMPwaN5l4vEpiQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qoqz42Dfs186jrCCre3pM5vPCYUGjY3feGNcFFbTaI8ihzmEy-ziSCRHvhei1epZKPEcZBtgacFdTOIMQjr5sIuM_nNjzlTMWyLUTL5HRPGuqs9WfE_52loH8BeMPwaN5l4vEpiQ=s1600', false, 7, 'chez balbine appartement meuble')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q8xMJu3eNCaLkj4amnuCOeJJ5EEs8sM_axwkU_yJHpp-21ohZ7lQKFGiUEUojQQmSbHE3AeAjvxTlxb5q6OpocOEwJaIW8Fgk-dlzqfTXKBh4A17A2BN9KhxB1BSIeQj8opVrERg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q8xMJu3eNCaLkj4amnuCOeJJ5EEs8sM_axwkU_yJHpp-21ohZ7lQKFGiUEUojQQmSbHE3AeAjvxTlxb5q6OpocOEwJaIW8Fgk-dlzqfTXKBh4A17A2BN9KhxB1BSIeQj8opVrERg=s1600', false, 8, 'chez balbine appartement meuble')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QdGiBhGVLHybSStpr-RH2rGxujR72MJIxmck2BOedzHdApQ8isyBNCihqaKaGLrlLEiWWrCyS3CdiWOlL-J86ZUSETcVKq-1Sroh5-jrpwtl5Y2eEiqnooqM63jUC7IEaDrXK_=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QdGiBhGVLHybSStpr-RH2rGxujR72MJIxmck2BOedzHdApQ8isyBNCihqaKaGLrlLEiWWrCyS3CdiWOlL-J86ZUSETcVKq-1Sroh5-jrpwtl5Y2eEiqnooqM63jUC7IEaDrXK_=s1600', false, 9, 'chez balbine appartement meuble')
  on conflict do nothing;

  -- [61] Logements Meublés FUSTEL CITY (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'logements-meubles-fustel-city-bonamoussadi',
    'apartment',
    'published',
    'Logements Meublés FUSTEL CITY',
    'Logements Meublés FUSTEL CITY
Catégorie : Location d''appartement de vacances.
Adresse : 3PRW+9MF, Douala.
Contact / WhatsApp : +237650430830.
Note Google Maps : 4.5/5 (2 avis).

Avis clients récents :
- "Note sans commentaire écrit." (L’Homme Du monde, note 4/5)
- "Note sans commentaire écrit." (Bedel ngassa, note 5/5)
- "Note sans commentaire écrit." (L’Homme Du monde, note 4/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3PRW+9MF, Douala',
    4.0908312,
    9.7470725,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfFmtByPE6oZ9mMkmfQW6zqg_VJWp91oO6Ufq0VwjmBMcnd4AGSE-2TRdCYXR0Mx5St4t45BRCpcmricnzlEvOM44I1SQ1s-Hs_FgwaBAfjtdfHpH4N5ccupTDSzjR84ADDkKnm=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfFmtByPE6oZ9mMkmfQW6zqg_VJWp91oO6Ufq0VwjmBMcnd4AGSE-2TRdCYXR0Mx5St4t45BRCpcmricnzlEvOM44I1SQ1s-Hs_FgwaBAfjtdfHpH4N5ccupTDSzjR84ADDkKnm=s1600', true, 0, 'Logements Meublés FUSTEL CITY')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QcVlCo35XGR3rXFAQDCfFiZY2ZtyJ4QhKy7lRfPXgydtTqSlsNJXxpaLLO_cCpec7icNUNI6k85v3LTtNoy7_BXEa-fI6YQB7YDegb3Qp8eU3rUeUKvW9jqwOFEQvRR_xYae9C=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QcVlCo35XGR3rXFAQDCfFiZY2ZtyJ4QhKy7lRfPXgydtTqSlsNJXxpaLLO_cCpec7icNUNI6k85v3LTtNoy7_BXEa-fI6YQB7YDegb3Qp8eU3rUeUKvW9jqwOFEQvRR_xYae9C=s1600', false, 1, 'Logements Meublés FUSTEL CITY')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9To1fl4x0Nzy4IATfXpw2352SYbw6RmdNSQrUD0xgbH2TynUoj-YricZNzqMKnjkYr5jRGwHrKAaxYLvi-eyNHgVnTMzHU0PEajLhHqJMcF839mOmuPxcOqkLjP8KJZaANFrvt-XQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9To1fl4x0Nzy4IATfXpw2352SYbw6RmdNSQrUD0xgbH2TynUoj-YricZNzqMKnjkYr5jRGwHrKAaxYLvi-eyNHgVnTMzHU0PEajLhHqJMcF839mOmuPxcOqkLjP8KJZaANFrvt-XQ=s1600', false, 2, 'Logements Meublés FUSTEL CITY')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SRS12FhKwj77NTQBeloVn308euAkAnSI4T1C2C2eZLTyqKshyEhwfVqvZw1X0R2jivMqRAn-IzJgmO98kahMaarSgweYomAMR9TZNNH2mq7WYlmsc-Vyn3If1O2IEwq38hezOl=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SRS12FhKwj77NTQBeloVn308euAkAnSI4T1C2C2eZLTyqKshyEhwfVqvZw1X0R2jivMqRAn-IzJgmO98kahMaarSgweYomAMR9TZNNH2mq7WYlmsc-Vyn3If1O2IEwq38hezOl=s1600', false, 3, 'Logements Meublés FUSTEL CITY')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TLI5hHXOl9NY_rruRaTISstm1o7kXS8coXUnOVdz07x52E-tsWJ8yEDT8KTq-woKat07LrYGpUqSZ7r3J6NxmklXZCyIjcKvzSNtmbRygvQiY3Qn6QDWYoj6v5RuFkmoRXotj-pA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TLI5hHXOl9NY_rruRaTISstm1o7kXS8coXUnOVdz07x52E-tsWJ8yEDT8KTq-woKat07LrYGpUqSZ7r3J6NxmklXZCyIjcKvzSNtmbRygvQiY3Qn6QDWYoj6v5RuFkmoRXotj-pA=s1600', false, 4, 'Logements Meublés FUSTEL CITY')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RDJILE-RyIDHl8e1lfK7edJ1C2fBduZ0KKMuLINHKyavgkpyVS0o2eO-FEv_pefjhE_QBMYR0FE6UkYNiRukRdHphNGWoryaJaixqWwJ6jKxyM8c0yIE1pXugHNgnDbQfeiUjV=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RDJILE-RyIDHl8e1lfK7edJ1C2fBduZ0KKMuLINHKyavgkpyVS0o2eO-FEv_pefjhE_QBMYR0FE6UkYNiRukRdHphNGWoryaJaixqWwJ6jKxyM8c0yIE1pXugHNgnDbQfeiUjV=s1600', false, 5, 'Logements Meublés FUSTEL CITY')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T2mqhHsuDXfps7UjFkAc7rxDeJzHiou7eSgyS-iCtCpeuZ2VKzzKZ_ogIA13kiCfkJDoaHoHpFPqrj8rhQgSXN7i-dlfJDX0rPZK3zrRfsmFwaKE2g2-D6G02uttBNHyeYj72n=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T2mqhHsuDXfps7UjFkAc7rxDeJzHiou7eSgyS-iCtCpeuZ2VKzzKZ_ogIA13kiCfkJDoaHoHpFPqrj8rhQgSXN7i-dlfJDX0rPZK3zrRfsmFwaKE2g2-D6G02uttBNHyeYj72n=s1600', false, 6, 'Logements Meublés FUSTEL CITY')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tcnfhgo6mY3ZGnofuKVEckS3f4anKH6bkJTwlWG3GUkkU05iq13eF2giL_GXFZDM3V98Zb5jDtxXAWH_8HalijDC_nIYENiZj_xAhftXI4DbT4wjw0EYl_uLitCJT8V_GXGOKD=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tcnfhgo6mY3ZGnofuKVEckS3f4anKH6bkJTwlWG3GUkkU05iq13eF2giL_GXFZDM3V98Zb5jDtxXAWH_8HalijDC_nIYENiZj_xAhftXI4DbT4wjw0EYl_uLitCJT8V_GXGOKD=s1600', false, 7, 'Logements Meublés FUSTEL CITY')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfFmtByPE6oZ9mMkmfQW6zqg_VJWp91oO6Ufq0VwjmBMcnd4AGSE-2TRdCYXR0Mx5St4t45BRCpcmricnzlEvOM44I1SQ1s-Hs_FgwaBAfjtdfHpH4N5ccupTDSzjR84ADDkKnm=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfFmtByPE6oZ9mMkmfQW6zqg_VJWp91oO6Ufq0VwjmBMcnd4AGSE-2TRdCYXR0Mx5St4t45BRCpcmricnzlEvOM44I1SQ1s-Hs_FgwaBAfjtdfHpH4N5ccupTDSzjR84ADDkKnm=s1600-p-k-no', false, 8, 'Logements Meublés FUSTEL CITY')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a/ACg8ocIF1jgEQO_jK1MT7LTJ6BG1u1glcdyXuHn2WK1dGHS9eYMT-g=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a/ACg8ocIF1jgEQO_jK1MT7LTJ6BG1u1glcdyXuHn2WK1dGHS9eYMT-g=s1600-p-k-no-mo', false, 9, 'Logements Meublés FUSTEL CITY')
  on conflict do nothing;

  -- [62] Appartement meublé haut standing Bonamoussadi (Kotto) - Two-Bedroom Apartment (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-haut-standing-bonamoussadi-kotto-two-bedroom-apartment-b',
    'room',
    'published',
    'Appartement meublé haut standing Bonamoussadi (Kotto) - Two-Bedroom Apartment',
    'Appartement meublé haut standing Bonamoussadi (Kotto) - Two-Bedroom Apartment
Adresse : Douala.
Note Google Maps : 4.2/5 (0 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0970702,
    9.7474899,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0wfK--HICUmXDoFSgK8JpwvVh-dDVjWbA27dPFQxgJLWbLwMsVBfOswfGj8FfXDUR-yrrVqX1vE-gIxqGGVFky7X1gt9tVF4DBUqF1n3qoiLjoHIKA_dmE9MwCuNykPEvDeYZrMxTeNso3LR93lioHawOVcTc92Qy3LeKIrNMVPX2h76sqhMiPpg=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0wfK--HICUmXDoFSgK8JpwvVh-dDVjWbA27dPFQxgJLWbLwMsVBfOswfGj8FfXDUR-yrrVqX1vE-gIxqGGVFky7X1gt9tVF4DBUqF1n3qoiLjoHIKA_dmE9MwCuNykPEvDeYZrMxTeNso3LR93lioHawOVcTc92Qy3LeKIrNMVPX2h76sqhMiPpg=s1600', true, 0, 'Appartement meublé haut standing Bonamoussadi (Kotto) - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0wfK--HICUmXDoFSgK8JpwvVh-dDVjWbA27dPFQxgJLWbLwMsVBfOswfGj8FfXDUR-yrrVqX1vE-gIxqGGVFky7X1gt9tVF4DBUqF1n3qoiLjoHIKA_dmE9MwCuNykPEvDeYZrMxTeNso3LR93lioHawOVcTc92Qy3LeKIrNMVPX2h76sqhMiPpg=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0wfK--HICUmXDoFSgK8JpwvVh-dDVjWbA27dPFQxgJLWbLwMsVBfOswfGj8FfXDUR-yrrVqX1vE-gIxqGGVFky7X1gt9tVF4DBUqF1n3qoiLjoHIKA_dmE9MwCuNykPEvDeYZrMxTeNso3LR93lioHawOVcTc92Qy3LeKIrNMVPX2h76sqhMiPpg=s1600-p-k-no', false, 1, 'Appartement meublé haut standing Bonamoussadi (Kotto) - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHD2iepIBp0nBlQxyChIsPtrxEOPEInLy1LH2OCo9caTvVa8uC0aoQi0q8kJmS704jApl5Xs5sw4ercNoRBpDHEXCHc6K45bu70vu0i45rZGmOd2cdCUWI328CdChgYstqJebbwG5kc8NNaTOZhArncf3rcXQ7MiqIz6favwAqqYGzrvmKV03YAXQ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHD2iepIBp0nBlQxyChIsPtrxEOPEInLy1LH2OCo9caTvVa8uC0aoQi0q8kJmS704jApl5Xs5sw4ercNoRBpDHEXCHc6K45bu70vu0i45rZGmOd2cdCUWI328CdChgYstqJebbwG5kc8NNaTOZhArncf3rcXQ7MiqIz6favwAqqYGzrvmKV03YAXQ=s1600', false, 2, 'Appartement meublé haut standing Bonamoussadi (Kotto) - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGrwIQMwvzZ_f_5YmaX9eELk4OfhvZoyUues_6hQhs-HH_FJXUKAUaULD5CtsZ2BArqIjO9tVKO1XxZWG81wbCh8TYd9gVi0veLJmf5dOzW0cuhVNOEXEq6ibuylyEBqD2Ibl78D8Nc0peeAb6DuxHlQMcGKeVrgtkUY8E97zvXlkP-3c0UoRKd=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGrwIQMwvzZ_f_5YmaX9eELk4OfhvZoyUues_6hQhs-HH_FJXUKAUaULD5CtsZ2BArqIjO9tVKO1XxZWG81wbCh8TYd9gVi0veLJmf5dOzW0cuhVNOEXEq6ibuylyEBqD2Ibl78D8Nc0peeAb6DuxHlQMcGKeVrgtkUY8E97zvXlkP-3c0UoRKd=s1600', false, 3, 'Appartement meublé haut standing Bonamoussadi (Kotto) - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFK5BVSQliXYCd6HW18B7eekUAyHT4aPhDA2j87dIhJ0M-yQ6_EnmG5_NKPT8m9uQsNRmUU-nv0WmUL0rS9AzovWpIkriC7xZZbHdk3pgnGwI24WTzPmq4eZ_9DGgLu_xBKoZrGvVER6bUzYFnyYE6gBf68Oy4ND84cqkaAXprwgKzF18Byimc0=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFK5BVSQliXYCd6HW18B7eekUAyHT4aPhDA2j87dIhJ0M-yQ6_EnmG5_NKPT8m9uQsNRmUU-nv0WmUL0rS9AzovWpIkriC7xZZbHdk3pgnGwI24WTzPmq4eZ_9DGgLu_xBKoZrGvVER6bUzYFnyYE6gBf68Oy4ND84cqkaAXprwgKzF18Byimc0=s1600', false, 4, 'Appartement meublé haut standing Bonamoussadi (Kotto) - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFdaiK8JEI3Ye4AZjuLsA37YGlfTIsm8bFevhfSNi-W5s3mLee7qEbG-p531TbynofZta6mVjlP1X1cTrVi7t8uaeVXA6Pxz9inPoj7_42LKcdmVoWRJWggGiDbvZUQMko4ZFWFa3k0s93HSQti-aOGfMKp1ZQQyzVBxA1qDXEMCNEgYW7S9p3g=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFdaiK8JEI3Ye4AZjuLsA37YGlfTIsm8bFevhfSNi-W5s3mLee7qEbG-p531TbynofZta6mVjlP1X1cTrVi7t8uaeVXA6Pxz9inPoj7_42LKcdmVoWRJWggGiDbvZUQMko4ZFWFa3k0s93HSQti-aOGfMKp1ZQQyzVBxA1qDXEMCNEgYW7S9p3g=s1600', false, 5, 'Appartement meublé haut standing Bonamoussadi (Kotto) - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGZx8ja6C22zLr7rMsccnOQgz-X4RLzSfxGj61WVpjKyhnNdavX4cM9oNKdRYYimvHwJZhKa3j8UyPY5hmR-I5sN6BUxaBplEqHLOefyvo97bKtXEpvd_9oLS_KqLn0jiZsmBA2N6Oc2nHvYzciTAbM1QfKd2s-6SSMQdjJGHq8yPYj6uctMjLM2g=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGZx8ja6C22zLr7rMsccnOQgz-X4RLzSfxGj61WVpjKyhnNdavX4cM9oNKdRYYimvHwJZhKa3j8UyPY5hmR-I5sN6BUxaBplEqHLOefyvo97bKtXEpvd_9oLS_KqLn0jiZsmBA2N6Oc2nHvYzciTAbM1QfKd2s-6SSMQdjJGHq8yPYj6uctMjLM2g=s1600', false, 6, 'Appartement meublé haut standing Bonamoussadi (Kotto) - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEDeZd5dX9ZaB-TQJVro25f_ok10JjPiQyr26S_jBj58zgz90efHYP89BddHkpRRLDb7QKHgc7ZESn7tWpR_a8FAGMOgS8eALZB9ShJlsPtu0jn8k8LflRsslhdd-B6MuUWnYegJI57npDckF-3R89ipVlQQjD67kdqjmYrac3-YOlYKtrwz24=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEDeZd5dX9ZaB-TQJVro25f_ok10JjPiQyr26S_jBj58zgz90efHYP89BddHkpRRLDb7QKHgc7ZESn7tWpR_a8FAGMOgS8eALZB9ShJlsPtu0jn8k8LflRsslhdd-B6MuUWnYegJI57npDckF-3R89ipVlQQjD67kdqjmYrac3-YOlYKtrwz24=s1600', false, 7, 'Appartement meublé haut standing Bonamoussadi (Kotto) - Two-Bedroom Apartment')
  on conflict do nothing;

  -- [63] Résidence Citypi (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-citypi-bonamoussadi',
    'apartment',
    'published',
    'Résidence Citypi',
    'Résidence Citypi
Catégorie : Complexe d''appartements meublés.
Adresse : Unnamed Road, Douala.
Contact / WhatsApp : +237696864170.
Note Google Maps : 4.5/5 (2 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Cindy Kamkuimo, note 5/5)
- "Note sans commentaire écrit." (champi pinar, note 4/5)
- "Note sans commentaire écrit." (Cindy Kamkuimo, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Unnamed Road, Douala',
    4.0944411,
    9.7459471,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdKEEaVWFEryFnow1ackrqmgBTp-EARj_8kw2dDKAAvj_9ZLcYwmOdBAevxprGhA-OXt-wjLVbBGJ5daean3WyO9P0EnQQ-IxZH8xJ70ojoQJX3537m8oZPr1AkTMrDpmbbks-J=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdKEEaVWFEryFnow1ackrqmgBTp-EARj_8kw2dDKAAvj_9ZLcYwmOdBAevxprGhA-OXt-wjLVbBGJ5daean3WyO9P0EnQQ-IxZH8xJ70ojoQJX3537m8oZPr1AkTMrDpmbbks-J=s1600', true, 0, 'Résidence Citypi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdKEEaVWFEryFnow1ackrqmgBTp-EARj_8kw2dDKAAvj_9ZLcYwmOdBAevxprGhA-OXt-wjLVbBGJ5daean3WyO9P0EnQQ-IxZH8xJ70ojoQJX3537m8oZPr1AkTMrDpmbbks-J=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdKEEaVWFEryFnow1ackrqmgBTp-EARj_8kw2dDKAAvj_9ZLcYwmOdBAevxprGhA-OXt-wjLVbBGJ5daean3WyO9P0EnQQ-IxZH8xJ70ojoQJX3537m8oZPr1AkTMrDpmbbks-J=s1600-p-k-no', false, 1, 'Résidence Citypi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QalSU2No6adsh4jk9_0n1hKQ2ddASZmWWdz6LdFxvtto6PHPIr5LsyUjC4wL3A6WcGCdy8p5ElGw4oY0qydq9Zkhu9Ia9QDPeK8VjO-O752_yDe6lpfSzTEoUHItYNo3887JP6=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QalSU2No6adsh4jk9_0n1hKQ2ddASZmWWdz6LdFxvtto6PHPIr5LsyUjC4wL3A6WcGCdy8p5ElGw4oY0qydq9Zkhu9Ia9QDPeK8VjO-O752_yDe6lpfSzTEoUHItYNo3887JP6=s1600', false, 2, 'Résidence Citypi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TEEtAn06hoNwSQRZtDacZGUUb4EkUg6uUgTUVJ1AfZMZmJNL5YYqGGpFyunTUHQ3AmzKP8-aeQ1_Pl81TIh_Lwf80tT1kDhwOg9fauFoxWUwmaZffDwEsS90fTNnHitcES4tIq2A=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TEEtAn06hoNwSQRZtDacZGUUb4EkUg6uUgTUVJ1AfZMZmJNL5YYqGGpFyunTUHQ3AmzKP8-aeQ1_Pl81TIh_Lwf80tT1kDhwOg9fauFoxWUwmaZffDwEsS90fTNnHitcES4tIq2A=s1600', false, 3, 'Résidence Citypi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RQQa1ogyqjQRNqcpZ4ANBREifY2FzOXAMAXE1FoHp6xU2jX70YuVvXReacgMDl5GrVz9Hva4Nc7In98rOdx47GvnvjBj6ivim7opvxapmyMVLhzd3mZ6aK1uZEH3fm5tqNv6S5Zw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RQQa1ogyqjQRNqcpZ4ANBREifY2FzOXAMAXE1FoHp6xU2jX70YuVvXReacgMDl5GrVz9Hva4Nc7In98rOdx47GvnvjBj6ivim7opvxapmyMVLhzd3mZ6aK1uZEH3fm5tqNv6S5Zw=s1600', false, 4, 'Résidence Citypi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QjulqNlNLEE_HEMeUIJfERGUa4LNVuO1ESG1O7ZoNmuPVOChVXyyirykJKX6NU0EubCh84Qm3Jd2yUd4QkdDIiYz3htMO5YSBXS-e4u8jzORNMiU2JRB2fjuKP7rUyffFaaxKl=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QjulqNlNLEE_HEMeUIJfERGUa4LNVuO1ESG1O7ZoNmuPVOChVXyyirykJKX6NU0EubCh84Qm3Jd2yUd4QkdDIiYz3htMO5YSBXS-e4u8jzORNMiU2JRB2fjuKP7rUyffFaaxKl=s1600', false, 5, 'Résidence Citypi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a/ACg8ocKhJNGCSATzOq00Vse7ujKVHHuMbMgVtriMA33Vxoc_wLM--Q=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a/ACg8ocKhJNGCSATzOq00Vse7ujKVHHuMbMgVtriMA33Vxoc_wLM--Q=s1600-p-k-no-mo', false, 6, 'Résidence Citypi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RsX6kMzwLGlTYlYhdsPO0T3-AQrbP1cs7kFphOMBtwnzcqF0XyUc7hcfFiab6Kexa84ULLUAB5Bg4iUqbxYfkC2NMiiLLSVyq1dQ0NTI_QwraM45I2oBNwM3iI3t2YxyXczxSi4w=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RsX6kMzwLGlTYlYhdsPO0T3-AQrbP1cs7kFphOMBtwnzcqF0XyUc7hcfFiab6Kexa84ULLUAB5Bg4iUqbxYfkC2NMiiLLSVyq1dQ0NTI_QwraM45I2oBNwM3iI3t2YxyXczxSi4w=s1600', false, 7, 'Résidence Citypi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T25J1zu8F8-4xBtQ_hByEPGifg5rOPL2_tM8j69waWXNFEVCn_GGdxRpWihUwijbfBgMPtRqHF1mvB9kWiO1_N8C4Lct3EJXik4kllxK6SWU3p9SX7ISdVIknRCzfWHatAIcUD=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T25J1zu8F8-4xBtQ_hByEPGifg5rOPL2_tM8j69waWXNFEVCn_GGdxRpWihUwijbfBgMPtRqHF1mvB9kWiO1_N8C4Lct3EJXik4kllxK6SWU3p9SX7ISdVIknRCzfWHatAIcUD=s1600', false, 8, 'Résidence Citypi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SyE8ZBeGRjK095H-Y-opcHUlSqsXiOWYZila7en260aK8rsCjT3cLLj7z3RFM7f6PjJV6zawj3Ofh7QMva16752NWU3Vdl26RBT6pqTNmmoJZyl2wFLeilduf227nfA2djpDZXQw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SyE8ZBeGRjK095H-Y-opcHUlSqsXiOWYZila7en260aK8rsCjT3cLLj7z3RFM7f6PjJV6zawj3Ofh7QMva16752NWU3Vdl26RBT6pqTNmmoJZyl2wFLeilduf227nfA2djpDZXQw=s1600', false, 9, 'Résidence Citypi')
  on conflict do nothing;

  -- [64] Appart Mama Louise (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appart-mama-louise-bonamoussadi',
    'apartment',
    'published',
    'Appart Mama Louise',
    'Appart Mama Louise
Adresse : 3PQV+M4G, Unnamed Road, Douala.
Contact / WhatsApp : +237659204168.
Note Google Maps : 3.9/5 (16 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3PQV+M4G, Unnamed Road, Douala',
    4.0891849,
    9.7428407,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3eLkv3LIzFeSH9R19bGcS5uIxn8mVCDUcAHUmWzqKxp9SuOXv4-aVM2Sh4EnK6RiMeHQ3cVWkrRkpyx5FMCWFHPxHYIqfLjb82fspGgfnt6iWXcQnn1unzE-noPkwjImP4uklgqYBbYeW_qZUJp60F7qpPk_wVXa3VzrT_Ys1XBzLm7QF1z8xKfg=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3eLkv3LIzFeSH9R19bGcS5uIxn8mVCDUcAHUmWzqKxp9SuOXv4-aVM2Sh4EnK6RiMeHQ3cVWkrRkpyx5FMCWFHPxHYIqfLjb82fspGgfnt6iWXcQnn1unzE-noPkwjImP4uklgqYBbYeW_qZUJp60F7qpPk_wVXa3VzrT_Ys1XBzLm7QF1z8xKfg=s1600', true, 0, 'Appart Mama Louise')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhE4LWvmmFCyEAreSTOS_oU5Yteay9_ETusnCDrSoIvxT2oyNtxhqz13SGQsrFpSCt91hWzOJPdqGD7-8mRAr2IwTcL3UkFlqL0RQWusN-EL-P6zizo2YyxJM19XTAX4ACAkix3ap6NXSbHdTk0yerCifPjbsN8vdLk51NIsvACwK2fVbRT3aHHHeg=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhE4LWvmmFCyEAreSTOS_oU5Yteay9_ETusnCDrSoIvxT2oyNtxhqz13SGQsrFpSCt91hWzOJPdqGD7-8mRAr2IwTcL3UkFlqL0RQWusN-EL-P6zizo2YyxJM19XTAX4ACAkix3ap6NXSbHdTk0yerCifPjbsN8vdLk51NIsvACwK2fVbRT3aHHHeg=s1600', false, 1, 'Appart Mama Louise')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGIZRuHWuyRaS4N58BUSeuGWtPnwtlrRzQ21P1C9FDDNA2qioIMtTAK9x74-xMqBYyKs0O1fkvGuwDmH_74QJV011k5pXatUdCS6USLgh4IVveJcguBCxmLfuZu7VbyKhqQBNzZsUVCOSJKlywt3WZHNIi4hVwR19beMpUAi0IOMxY7oKaEr2yjPA=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGIZRuHWuyRaS4N58BUSeuGWtPnwtlrRzQ21P1C9FDDNA2qioIMtTAK9x74-xMqBYyKs0O1fkvGuwDmH_74QJV011k5pXatUdCS6USLgh4IVveJcguBCxmLfuZu7VbyKhqQBNzZsUVCOSJKlywt3WZHNIi4hVwR19beMpUAi0IOMxY7oKaEr2yjPA=s1600', false, 2, 'Appart Mama Louise')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFzTz1OV3jL5xSIvb14Pw9YEhvImWqNtud1rzIjnHqehdxv77fdnVBIVtcet68XpN_HGZH18IMf5dO0Tb6vfHq43BM5hLqZd6gLjUpddvAdp3xJUWZUVXWvEx3zMHZertu3dYggX_HHGU3qAXDKiIVvjmYKsS6Pjq8EhDsE_anPcANuj8V-NAw6=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFzTz1OV3jL5xSIvb14Pw9YEhvImWqNtud1rzIjnHqehdxv77fdnVBIVtcet68XpN_HGZH18IMf5dO0Tb6vfHq43BM5hLqZd6gLjUpddvAdp3xJUWZUVXWvEx3zMHZertu3dYggX_HHGU3qAXDKiIVvjmYKsS6Pjq8EhDsE_anPcANuj8V-NAw6=s1600', false, 3, 'Appart Mama Louise')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhElNByuh-3yQgdFQ7tfjKjVibD9Dr4jhfjH2QThsWiJwIi9fKge16eAFWiSvmhlZ1pi9UW7bYb1UuzHRC85N9S_IU8uzEI3sSaeANS8EDJMMRWobWUrGg6uWBkPRe75MO5397nFVKaCFGkY4JapzLYqvZ0O56Z8ZlBfPHcWe70iRHOeJ29nZ_ew=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhElNByuh-3yQgdFQ7tfjKjVibD9Dr4jhfjH2QThsWiJwIi9fKge16eAFWiSvmhlZ1pi9UW7bYb1UuzHRC85N9S_IU8uzEI3sSaeANS8EDJMMRWobWUrGg6uWBkPRe75MO5397nFVKaCFGkY4JapzLYqvZ0O56Z8ZlBfPHcWe70iRHOeJ29nZ_ew=s1600', false, 4, 'Appart Mama Louise')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhH8sbnNY1fM9RYhJmYGyCE04op1R_YlyfmJJjAQ-j2ZZ_QB-syhLI65hi87q-JpJtXlYdROK2meg5Z7-N1s_QvosYD4CdyGQBCurxS0kqAzjkudVSczsKX3n0LvvhumJTwFzyPX5EyZAxzeTbdQTCOd4asj5WasgdB72Y6Fcg2XQZTa4g_V9FCC=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhH8sbnNY1fM9RYhJmYGyCE04op1R_YlyfmJJjAQ-j2ZZ_QB-syhLI65hi87q-JpJtXlYdROK2meg5Z7-N1s_QvosYD4CdyGQBCurxS0kqAzjkudVSczsKX3n0LvvhumJTwFzyPX5EyZAxzeTbdQTCOd4asj5WasgdB72Y6Fcg2XQZTa4g_V9FCC=s1600', false, 5, 'Appart Mama Louise')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHFRMiJzkXoZTQq3jXDD_p6_c75LA-528ibviwJxM2W7-1u_rKnRtyICJV45iOL80L8woHmL0pnJJRQeDYPeianJFZRVWlIDQNCPL8HhLZFGgFuZ2cahJU5kDBb2gb77yWeniq11-pwA2Xn1B5dYXlGmg0emUB8I6brE_VN0tszaoHn5BdT6bMx=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHFRMiJzkXoZTQq3jXDD_p6_c75LA-528ibviwJxM2W7-1u_rKnRtyICJV45iOL80L8woHmL0pnJJRQeDYPeianJFZRVWlIDQNCPL8HhLZFGgFuZ2cahJU5kDBb2gb77yWeniq11-pwA2Xn1B5dYXlGmg0emUB8I6brE_VN0tszaoHn5BdT6bMx=s1600', false, 6, 'Appart Mama Louise')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3eLkv3LIzFeSH9R19bGcS5uIxn8mVCDUcAHUmWzqKxp9SuOXv4-aVM2Sh4EnK6RiMeHQ3cVWkrRkpyx5FMCWFHPxHYIqfLjb82fspGgfnt6iWXcQnn1unzE-noPkwjImP4uklgqYBbYeW_qZUJp60F7qpPk_wVXa3VzrT_Ys1XBzLm7QF1z8xKfg=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3eLkv3LIzFeSH9R19bGcS5uIxn8mVCDUcAHUmWzqKxp9SuOXv4-aVM2Sh4EnK6RiMeHQ3cVWkrRkpyx5FMCWFHPxHYIqfLjb82fspGgfnt6iWXcQnn1unzE-noPkwjImP4uklgqYBbYeW_qZUJp60F7qpPk_wVXa3VzrT_Ys1XBzLm7QF1z8xKfg=s1600-p-k-no', false, 7, 'Appart Mama Louise')
  on conflict do nothing;

  -- [65] Appartement Makepe BM (Makepe)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-makepe-bm-makepe',
    'apartment',
    'published',
    'Appartement Makepe BM',
    'Appartement Makepe BM
Adresse : Douala.
Note Google Maps : 4.1/5 (74 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'makepe'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0826058,
    9.7559583,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3ezVc6LGlZACF7QIzRMTzXZTOq0MAzZIOH5Qih9i5cUIj2PX5swZnI0za6b8XGm0DO-7vxM46pA0iNKT-JTOgY_0i6oC5tkUj2I16fccKsajEEUStcBQMFEp0SuMwUXKF1l_qHvxMJFAXKPMu8gDuF5z9sMayo3PO6QsA0SIA50AxaTnD72HXK=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3ezVc6LGlZACF7QIzRMTzXZTOq0MAzZIOH5Qih9i5cUIj2PX5swZnI0za6b8XGm0DO-7vxM46pA0iNKT-JTOgY_0i6oC5tkUj2I16fccKsajEEUStcBQMFEp0SuMwUXKF1l_qHvxMJFAXKPMu8gDuF5z9sMayo3PO6QsA0SIA50AxaTnD72HXK=s1600', true, 0, 'Appartement Makepe BM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEOpn1xesV1y_mHf1DC-_DWPDANPEvVoF3McghLralZFnJIbzBLQn9ukvg2q2GLn0dera2-BgifEUKS8S17ZbuJITvOHj6WTTefnvMzc_jVsN0sSFsJSOV96KjTjUl0o94kvTD61TQxb08llgT9BSrmTMxg_zB33fdv-UlbG6Dvgyn3LJ-Z5Wh9=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEOpn1xesV1y_mHf1DC-_DWPDANPEvVoF3McghLralZFnJIbzBLQn9ukvg2q2GLn0dera2-BgifEUKS8S17ZbuJITvOHj6WTTefnvMzc_jVsN0sSFsJSOV96KjTjUl0o94kvTD61TQxb08llgT9BSrmTMxg_zB33fdv-UlbG6Dvgyn3LJ-Z5Wh9=s1600', false, 1, 'Appartement Makepe BM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SyBJ1zKXaO0m4BCv8DeCFqzC_k7o9MkWeHyR_smTRI1_zoVBqMCcwhkkd7wibk1rvK6URN8MrUuWy2NKaR5ky9cjQmqFi6h0GsjXTxe8tMgL7JpsMr2SnYGtGZn9yH-IMvM3WZdw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SyBJ1zKXaO0m4BCv8DeCFqzC_k7o9MkWeHyR_smTRI1_zoVBqMCcwhkkd7wibk1rvK6URN8MrUuWy2NKaR5ky9cjQmqFi6h0GsjXTxe8tMgL7JpsMr2SnYGtGZn9yH-IMvM3WZdw=s1600', false, 2, 'Appartement Makepe BM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QJ8mT6sHUdGFAhKjR3IXNFzeH5pKc9yxxX5RurVD-t0mvSCtxaED2leP4zl9lytFfT8AXQhy_ABTsxX4IHeLzAyU3nt9YcvUWxhDG4MZTSzu3R5L13vvdhaFqUH5ohesF-ey5B6A=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QJ8mT6sHUdGFAhKjR3IXNFzeH5pKc9yxxX5RurVD-t0mvSCtxaED2leP4zl9lytFfT8AXQhy_ABTsxX4IHeLzAyU3nt9YcvUWxhDG4MZTSzu3R5L13vvdhaFqUH5ohesF-ey5B6A=s1600', false, 3, 'Appartement Makepe BM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3ezVc6LGlZACF7QIzRMTzXZTOq0MAzZIOH5Qih9i5cUIj2PX5swZnI0za6b8XGm0DO-7vxM46pA0iNKT-JTOgY_0i6oC5tkUj2I16fccKsajEEUStcBQMFEp0SuMwUXKF1l_qHvxMJFAXKPMu8gDuF5z9sMayo3PO6QsA0SIA50AxaTnD72HXK=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3ezVc6LGlZACF7QIzRMTzXZTOq0MAzZIOH5Qih9i5cUIj2PX5swZnI0za6b8XGm0DO-7vxM46pA0iNKT-JTOgY_0i6oC5tkUj2I16fccKsajEEUStcBQMFEp0SuMwUXKF1l_qHvxMJFAXKPMu8gDuF5z9sMayo3PO6QsA0SIA50AxaTnD72HXK=s1600-p-k-no', false, 4, 'Appartement Makepe BM')
  on conflict do nothing;

  -- [66] Appartement Meublé / Douala - One-Bedroom Apartment (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-douala-one-bedroom-apartment-bonamoussadi',
    'room',
    'published',
    'Appartement Meublé / Douala - One-Bedroom Apartment',
    'Appartement Meublé / Douala - One-Bedroom Apartment
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0992899,
    9.7420797,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1lMFs9hN80H0wczzpwE1deq2Pkajg4Rph3AzzgqTs4PG_FS62Ggntn8Hv9nZn7OAI1z7bTl4bZSKnvazz98vTCG0CtJRfK1ZwIR9HCLko_PP1H402RyOpP5iABU7l3V88ySKphUSSmzarsK5gUjzwz3yomN94dOwFgkSL4Dksr5_IkJwh_EAu6=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1lMFs9hN80H0wczzpwE1deq2Pkajg4Rph3AzzgqTs4PG_FS62Ggntn8Hv9nZn7OAI1z7bTl4bZSKnvazz98vTCG0CtJRfK1ZwIR9HCLko_PP1H402RyOpP5iABU7l3V88ySKphUSSmzarsK5gUjzwz3yomN94dOwFgkSL4Dksr5_IkJwh_EAu6=s1600', true, 0, 'Appartement Meublé / Douala - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1lMFs9hN80H0wczzpwE1deq2Pkajg4Rph3AzzgqTs4PG_FS62Ggntn8Hv9nZn7OAI1z7bTl4bZSKnvazz98vTCG0CtJRfK1ZwIR9HCLko_PP1H402RyOpP5iABU7l3V88ySKphUSSmzarsK5gUjzwz3yomN94dOwFgkSL4Dksr5_IkJwh_EAu6=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1lMFs9hN80H0wczzpwE1deq2Pkajg4Rph3AzzgqTs4PG_FS62Ggntn8Hv9nZn7OAI1z7bTl4bZSKnvazz98vTCG0CtJRfK1ZwIR9HCLko_PP1H402RyOpP5iABU7l3V88ySKphUSSmzarsK5gUjzwz3yomN94dOwFgkSL4Dksr5_IkJwh_EAu6=s1600-p-k-no', false, 1, 'Appartement Meublé / Douala - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHXXTWH6cYDaI-gEjeI3fpDF3MKpJD3plkHvpM9CWeYk0lbMbAAo8VX0dQoni9-gYPku4QAHb0z2cp2HmgF_g47Xdop6jz7CArAaMSZKErXv-411CsgdrnC4IP4wVSSLjNPt5gH__t5rg1eN_ga4FoAxsSwra6fmEqX5fhSQEWCBShIyWizUHXI=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHXXTWH6cYDaI-gEjeI3fpDF3MKpJD3plkHvpM9CWeYk0lbMbAAo8VX0dQoni9-gYPku4QAHb0z2cp2HmgF_g47Xdop6jz7CArAaMSZKErXv-411CsgdrnC4IP4wVSSLjNPt5gH__t5rg1eN_ga4FoAxsSwra6fmEqX5fhSQEWCBShIyWizUHXI=s1600', false, 2, 'Appartement Meublé / Douala - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGXsPMT1vSM8GIA6ULU1gck7IbcPQ6u5YvhFVzvsuJDY2RqYsqWf5DB3f8PMW7sWEd5lIGCiL2kySdF-mAwMxLe_sAAYLevbJcp1StsjLmH6GUqfAoT_cZGVb5hY-5wdqDPXnVeRQRaPZCcfV__W68l61aF82s7zzHq7h0UL29Bkvwf9WwIKk3z=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGXsPMT1vSM8GIA6ULU1gck7IbcPQ6u5YvhFVzvsuJDY2RqYsqWf5DB3f8PMW7sWEd5lIGCiL2kySdF-mAwMxLe_sAAYLevbJcp1StsjLmH6GUqfAoT_cZGVb5hY-5wdqDPXnVeRQRaPZCcfV__W68l61aF82s7zzHq7h0UL29Bkvwf9WwIKk3z=s1600', false, 3, 'Appartement Meublé / Douala - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFuw8YafcM59EHvb5PwYCIWz6-b8994wan4DBfuXdvKy6c0mC9q0_B95rSC5IRBPqlygW2s4dfOVJehlmCAZamam_fIU4yRRKWB-OH6Z37Gm3MyHUbKi0mUpdkpOVb4u3Khv64l9Vo2uX5jliyOBj5RxZWjmvJ4MdKtANv7ny-Fb7PGKv-_Ro5D=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFuw8YafcM59EHvb5PwYCIWz6-b8994wan4DBfuXdvKy6c0mC9q0_B95rSC5IRBPqlygW2s4dfOVJehlmCAZamam_fIU4yRRKWB-OH6Z37Gm3MyHUbKi0mUpdkpOVb4u3Khv64l9Vo2uX5jliyOBj5RxZWjmvJ4MdKtANv7ny-Fb7PGKv-_Ro5D=s1600', false, 4, 'Appartement Meublé / Douala - One-Bedroom Apartment')
  on conflict do nothing;

  -- [67] Studio Meublé Bonamoussadi 4è - One-Bedroom Apartment (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'studio-meuble-bonamoussadi-4e-one-bedroom-apartment-bonamoussadi',
    'studio',
    'published',
    'Studio Meublé Bonamoussadi 4è - One-Bedroom Apartment',
    'Studio Meublé Bonamoussadi 4è - One-Bedroom Apartment
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0869698,
    9.7470103,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2KdtxbGc3J3CDnUMoDGO3K37I8GJq4-jDutFP-K6Y-mMzzfclj0bKflOjLiLKJ9SB-gXUZ_9eYZ5l5Fyvb2SBGOcS1SIylyO5UNq51C4gmBFwsTbScxdjRa4x2dLA3Zd3sKLtKxOPEcPuZV4qYikH-WzWtq_u2gpg3gKmWEpuP26stFLDVpOoD=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2KdtxbGc3J3CDnUMoDGO3K37I8GJq4-jDutFP-K6Y-mMzzfclj0bKflOjLiLKJ9SB-gXUZ_9eYZ5l5Fyvb2SBGOcS1SIylyO5UNq51C4gmBFwsTbScxdjRa4x2dLA3Zd3sKLtKxOPEcPuZV4qYikH-WzWtq_u2gpg3gKmWEpuP26stFLDVpOoD=s1600', true, 0, 'Studio Meublé Bonamoussadi 4è - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGFu6urC0p2RZ6VkbVwKtLeCDpDATKBAFU5XfPabQNsChSXk7i1RLc64RVr0FIGPx-b66wXMIhbmgDdo9AMBut1UUwJiTy_QcP7nzLP0yskqOGDVA8IO-e-mwnC4_CXJLGOnGj5nU7DgmbeK_hOLqd-cdPTTIphHLFgS7kPa259Vax7ehEsGZHG=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGFu6urC0p2RZ6VkbVwKtLeCDpDATKBAFU5XfPabQNsChSXk7i1RLc64RVr0FIGPx-b66wXMIhbmgDdo9AMBut1UUwJiTy_QcP7nzLP0yskqOGDVA8IO-e-mwnC4_CXJLGOnGj5nU7DgmbeK_hOLqd-cdPTTIphHLFgS7kPa259Vax7ehEsGZHG=s1600', false, 1, 'Studio Meublé Bonamoussadi 4è - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHuwm3SvmfJmhDCrMLhFOYmsKwX-o7EW4VVmsvZIP4IkX0NUpzvViZ3axr2B20dhEcqBqo1sIa04x6oLWhUSXYyVKYwT5GwxrLZqY-FjA-nPzeYKzjCgVCXDpY2N-E5XRPvcyCZ7rJwIq_dRb0PjbhAmfN7t8XYkda5PaV3M88SUPeEUANJRV3x=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHuwm3SvmfJmhDCrMLhFOYmsKwX-o7EW4VVmsvZIP4IkX0NUpzvViZ3axr2B20dhEcqBqo1sIa04x6oLWhUSXYyVKYwT5GwxrLZqY-FjA-nPzeYKzjCgVCXDpY2N-E5XRPvcyCZ7rJwIq_dRb0PjbhAmfN7t8XYkda5PaV3M88SUPeEUANJRV3x=s1600', false, 2, 'Studio Meublé Bonamoussadi 4è - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGs2_YJWtUF24q2S-rbX2N6xSZ5KkyIPk-P7aNuO8wnCOSdKJtEjq7zE643JIKI0Z-uJIn9aOOHjNEYV8bJVlyb8sP7e22MThZr0NmubPxV7qs4S6_8wnfMj6FNRHtfPuOoJBU9wBpQo_Nvwbce_0esnh1GNz1ofq98izKGRlli3AyJQgW0AhZq0w=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGs2_YJWtUF24q2S-rbX2N6xSZ5KkyIPk-P7aNuO8wnCOSdKJtEjq7zE643JIKI0Z-uJIn9aOOHjNEYV8bJVlyb8sP7e22MThZr0NmubPxV7qs4S6_8wnfMj6FNRHtfPuOoJBU9wBpQo_Nvwbce_0esnh1GNz1ofq98izKGRlli3AyJQgW0AhZq0w=s1600', false, 3, 'Studio Meublé Bonamoussadi 4è - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2KdtxbGc3J3CDnUMoDGO3K37I8GJq4-jDutFP-K6Y-mMzzfclj0bKflOjLiLKJ9SB-gXUZ_9eYZ5l5Fyvb2SBGOcS1SIylyO5UNq51C4gmBFwsTbScxdjRa4x2dLA3Zd3sKLtKxOPEcPuZV4qYikH-WzWtq_u2gpg3gKmWEpuP26stFLDVpOoD=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2KdtxbGc3J3CDnUMoDGO3K37I8GJq4-jDutFP-K6Y-mMzzfclj0bKflOjLiLKJ9SB-gXUZ_9eYZ5l5Fyvb2SBGOcS1SIylyO5UNq51C4gmBFwsTbScxdjRa4x2dLA3Zd3sKLtKxOPEcPuZV4qYikH-WzWtq_u2gpg3gKmWEpuP26stFLDVpOoD=s1600-p-k-no', false, 4, 'Studio Meublé Bonamoussadi 4è - One-Bedroom Apartment')
  on conflict do nothing;

  -- [68] La Résidence Bloc H (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'la-residence-bloc-h-bonamoussadi',
    'apartment',
    'published',
    'La Résidence Bloc H',
    'La Résidence Bloc H
Catégorie : Appartement de vacances.
Adresse : Douala.
Contact / WhatsApp : +237672841606.
Note Google Maps : 4.9/5 (62 avis).

Avis clients récents :
- "Note sans commentaire écrit." (MINDOBAT, note 5/5)
- "Note sans commentaire écrit." (laurel kemoe, note 5/5)
- "Note sans commentaire écrit." (Anuarite Djoukang, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0957195,
    9.7417542,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLflXkBlzRoJtyf9g51Bx0EfVfiLsNI6OVlMMwN-dHj3OscKub0O5QEPej4CXtGL1xfyuTDmllj5K-qTDFZaziTed41wjMPHoL3-Uv35hBQS2ojmTLxxBiY_yf6TxEJlVD5O094=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLflXkBlzRoJtyf9g51Bx0EfVfiLsNI6OVlMMwN-dHj3OscKub0O5QEPej4CXtGL1xfyuTDmllj5K-qTDFZaziTed41wjMPHoL3-Uv35hBQS2ojmTLxxBiY_yf6TxEJlVD5O094=s1600', true, 0, 'La Résidence Bloc H')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SlRAkaEHW1eWgJ85YVO2n6372iyGMLfQMaYpucCACrnKL8KUNquUN9urWUYeZSc5PNLkEwMfrjUC9VS5iZn8nfEpY6oX5SzelnFVVgh_CmIAhf_riypCdGbXr40b_aBLDXfoU=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SlRAkaEHW1eWgJ85YVO2n6372iyGMLfQMaYpucCACrnKL8KUNquUN9urWUYeZSc5PNLkEwMfrjUC9VS5iZn8nfEpY6oX5SzelnFVVgh_CmIAhf_riypCdGbXr40b_aBLDXfoU=s1600', false, 1, 'La Résidence Bloc H')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QVvlyTfEUMbmIka8OdlpdKSNQEwj17oK-1a-LOdsYtbLUS2iMMgiZmyn4SzqYfYUZpc7v13_-CM1XisngH0BeIeo79Q69kL8MlCWYClLFpdnifd5M-pnIJMfA7ZRCT18J-Y3DW=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QVvlyTfEUMbmIka8OdlpdKSNQEwj17oK-1a-LOdsYtbLUS2iMMgiZmyn4SzqYfYUZpc7v13_-CM1XisngH0BeIeo79Q69kL8MlCWYClLFpdnifd5M-pnIJMfA7ZRCT18J-Y3DW=s1600', false, 2, 'La Résidence Bloc H')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QjgYLH6G--hIGrI7wQmmKqdEb5w4b-Qx-ygOnZN5USAtON1ZTAkApImrgmiy0MYZIov67UVNlKuFX_oyZ7BmFcSuUCrm4oiohUCWpvrXWnOPMg-fYG4XlpAItCGugmQThCNKFm=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QjgYLH6G--hIGrI7wQmmKqdEb5w4b-Qx-ygOnZN5USAtON1ZTAkApImrgmiy0MYZIov67UVNlKuFX_oyZ7BmFcSuUCrm4oiohUCWpvrXWnOPMg-fYG4XlpAItCGugmQThCNKFm=s1600', false, 3, 'La Résidence Bloc H')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rd-jxrKAOfnPVoN93BIHQLGFygLk_JaxKQbAHmst0x7a52Wzbi0UjwgTRjEQeOXxvfw5fHdLxZvpf1BtBZubp6ww3_gVtQuGgFhB8CStP4-dPEX4OIVgFNo3nuQ6vYNY2YBvTe=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rd-jxrKAOfnPVoN93BIHQLGFygLk_JaxKQbAHmst0x7a52Wzbi0UjwgTRjEQeOXxvfw5fHdLxZvpf1BtBZubp6ww3_gVtQuGgFhB8CStP4-dPEX4OIVgFNo3nuQ6vYNY2YBvTe=s1600', false, 4, 'La Résidence Bloc H')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RaHHp_VlMVJEWdVJKTNJMMBgimmkdhf2ZdukRx5ele9q3t4emJxf3_8OB7OPXI_mxhjU_35K75TNVdRmOMeVJJLBEikS5nlyyz311htZMB6kV5fJHIo2LWf6ruZ22e_ox34dHpHQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RaHHp_VlMVJEWdVJKTNJMMBgimmkdhf2ZdukRx5ele9q3t4emJxf3_8OB7OPXI_mxhjU_35K75TNVdRmOMeVJJLBEikS5nlyyz311htZMB6kV5fJHIo2LWf6ruZ22e_ox34dHpHQ=s1600', false, 5, 'La Résidence Bloc H')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RV0dmMMItQtkeUQw7lRdWP7jpKg9mMEmlQl5F6ea_30b0ETSINmOPUA31ZIzT2AWzFIohbxjEOXZdXV-4dm_8uCzFvMziiMQ2GJj8fHSh-q4VBVBO-wldJKCCg5Zlg7OlEuaD5=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RV0dmMMItQtkeUQw7lRdWP7jpKg9mMEmlQl5F6ea_30b0ETSINmOPUA31ZIzT2AWzFIohbxjEOXZdXV-4dm_8uCzFvMziiMQ2GJj8fHSh-q4VBVBO-wldJKCCg5Zlg7OlEuaD5=s1600', false, 6, 'La Résidence Bloc H')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S_aS_rqzlTJHMEBHey9BBGaxaaAzjvsSb5i9O2JMHnjtrNGSqwDpLsIlchO-plWZxtJH-3YJuh__Vspnhyki1aOtk4ON_86n0_7i7btG0dldVfLx_bNwbPnSswLB6kFrvxPcMM=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S_aS_rqzlTJHMEBHey9BBGaxaaAzjvsSb5i9O2JMHnjtrNGSqwDpLsIlchO-plWZxtJH-3YJuh__Vspnhyki1aOtk4ON_86n0_7i7btG0dldVfLx_bNwbPnSswLB6kFrvxPcMM=s1600', false, 7, 'La Résidence Bloc H')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QIKCiGuO_kwN-xWYlXRechornvO6eDA11oB6ZPh7nYT--2d_8zMwl2UxO0O_1rYDYLUK68HfxbAQSXjb84BFTJSOmh3MsT2gmjALs0F28yu_7svE4WcD2WACdq7ZQWg0JzuqPrZA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QIKCiGuO_kwN-xWYlXRechornvO6eDA11oB6ZPh7nYT--2d_8zMwl2UxO0O_1rYDYLUK68HfxbAQSXjb84BFTJSOmh3MsT2gmjALs0F28yu_7svE4WcD2WACdq7ZQWg0JzuqPrZA=s1600', false, 8, 'La Résidence Bloc H')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLflXkBlzRoJtyf9g51Bx0EfVfiLsNI6OVlMMwN-dHj3OscKub0O5QEPej4CXtGL1xfyuTDmllj5K-qTDFZaziTed41wjMPHoL3-Uv35hBQS2ojmTLxxBiY_yf6TxEJlVD5O094=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLflXkBlzRoJtyf9g51Bx0EfVfiLsNI6OVlMMwN-dHj3OscKub0O5QEPej4CXtGL1xfyuTDmllj5K-qTDFZaziTed41wjMPHoL3-Uv35hBQS2ojmTLxxBiY_yf6TxEJlVD5O094=s1600-p-k-no', false, 9, 'La Résidence Bloc H')
  on conflict do nothing;

  -- [69] Residence La Marina Douala (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-la-marina-douala-bonamoussadi',
    'apartment',
    'published',
    'Residence La Marina Douala',
    'Residence La Marina Douala
Adresse : rue 5.056, Douala.
Note Google Maps : 4/5 (88 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'rue 5.056, Douala',
    4.0888366,
    9.7451551,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdZo9OD9P5qsPZ3_erBWFPvF1yTPAD8l3hf3NInwgsgrXQMimarraO0x-WBRkWyiu_PVCfTWbqo_70uey_rTu0CAutItbkTkcT_qihjGGGFuXhWDvyq5P8g7jGR6PQKrD_ucrMu=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdZo9OD9P5qsPZ3_erBWFPvF1yTPAD8l3hf3NInwgsgrXQMimarraO0x-WBRkWyiu_PVCfTWbqo_70uey_rTu0CAutItbkTkcT_qihjGGGFuXhWDvyq5P8g7jGR6PQKrD_ucrMu=s1600', true, 0, 'Residence La Marina Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdZo9OD9P5qsPZ3_erBWFPvF1yTPAD8l3hf3NInwgsgrXQMimarraO0x-WBRkWyiu_PVCfTWbqo_70uey_rTu0CAutItbkTkcT_qihjGGGFuXhWDvyq5P8g7jGR6PQKrD_ucrMu=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdZo9OD9P5qsPZ3_erBWFPvF1yTPAD8l3hf3NInwgsgrXQMimarraO0x-WBRkWyiu_PVCfTWbqo_70uey_rTu0CAutItbkTkcT_qihjGGGFuXhWDvyq5P8g7jGR6PQKrD_ucrMu=s1600-p-k-no', false, 1, 'Residence La Marina Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qt2e0wQXCUsiRoM86gk8YDxTgpOTfvG5uQU-vbsIAOv-tMn6DQTClj8WdgvdJDzVCJNcHfCLrxRklnNNNHuTn8-d9UQbLdJjIzwL3QP6BIfp_rhEWHSPFAU9Hg6wEuCXL3HXa7=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qt2e0wQXCUsiRoM86gk8YDxTgpOTfvG5uQU-vbsIAOv-tMn6DQTClj8WdgvdJDzVCJNcHfCLrxRklnNNNHuTn8-d9UQbLdJjIzwL3QP6BIfp_rhEWHSPFAU9Hg6wEuCXL3HXa7=s1600', false, 2, 'Residence La Marina Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SvBIR4tFO1ZyqzszKNCCRPKMfr1aGodBGFf8ZtvDGfkIUW6m7cHm1G77QEV8GZdseDthSdigboAo20-0lUtUSYqFCHUWL8ZovDDIp4g1I6alC4V9kR6Z3znFVwkGVItjozdVSW=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SvBIR4tFO1ZyqzszKNCCRPKMfr1aGodBGFf8ZtvDGfkIUW6m7cHm1G77QEV8GZdseDthSdigboAo20-0lUtUSYqFCHUWL8ZovDDIp4g1I6alC4V9kR6Z3znFVwkGVItjozdVSW=s1600', false, 3, 'Residence La Marina Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QYqDx9o0PIKR3uiOjeJ4ati_uRsaXug1H9PIHHq83ki9qp9pA0aZ_CziI51n_VnhhfvSNjY5SfnZDKkWo004icU6geCySFo9M1RW06a2v3ruxdBsvby6deN2Ef_18kAz0l_MfPKA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QYqDx9o0PIKR3uiOjeJ4ati_uRsaXug1H9PIHHq83ki9qp9pA0aZ_CziI51n_VnhhfvSNjY5SfnZDKkWo004icU6geCySFo9M1RW06a2v3ruxdBsvby6deN2Ef_18kAz0l_MfPKA=s1600', false, 4, 'Residence La Marina Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a-/ALV-UjX0azPb3Fh7i7DbBWmo3RbXk-7fJUqPAtEdsqIJl23XdX6Qrps=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a-/ALV-UjX0azPb3Fh7i7DbBWmo3RbXk-7fJUqPAtEdsqIJl23XdX6Qrps=s1600-p-k-no-mo', false, 5, 'Residence La Marina Douala')
  on conflict do nothing;

  -- [70] Résidence Le Monaco (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-le-monaco-bonamoussadi',
    'apartment',
    'published',
    'Résidence Le Monaco',
    'Résidence Le Monaco
Catégorie : Complexe d''appartements meublés.
Adresse : 2e maison à gauche, Bonamoussadi, Carrefour Eto''o À côté de The Studio, Douala.
Contact / WhatsApp : +237678162278.
Note Google Maps : 3/5 (1 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Bastos NGOB, note 3/5)
- "Note sans commentaire écrit." (Bastos NGOB, note 3/5)
- "Note sans commentaire écrit." (Bastos NGOB, note 3/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '2e maison à gauche, Bonamoussadi, Carrefour Eto''o À côté de The Studio, Douala',
    4.0868979,
    9.744409,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeTRMlJGa3-rIB6i63BCk2gjLqGxuk0wZsdp4GHFTX7bb52YdPdyPf1Nv3YE27L3OmLypDTUhsSrLtzDYtAkxt2VCH_EEywvRlFt0vHAwFEjk8cg7Ov_xaLCBAEB5ZeKzbcrbm9vewc_1sZ=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeTRMlJGa3-rIB6i63BCk2gjLqGxuk0wZsdp4GHFTX7bb52YdPdyPf1Nv3YE27L3OmLypDTUhsSrLtzDYtAkxt2VCH_EEywvRlFt0vHAwFEjk8cg7Ov_xaLCBAEB5ZeKzbcrbm9vewc_1sZ=s1600', true, 0, 'Résidence Le Monaco')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TVe6lQxnOqVcsmmeEeCVRzB_1h4gnRgCeelTMNR2yZTpsDgqQ9EZHs8PbdTfZG6rxEx-xy6N04oIBhch06Av7ijr8yqtj1IbJU-j_sLQheMWclkCqqMZo-gFolDaMHNeUqE_F8hagtXxXi=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TVe6lQxnOqVcsmmeEeCVRzB_1h4gnRgCeelTMNR2yZTpsDgqQ9EZHs8PbdTfZG6rxEx-xy6N04oIBhch06Av7ijr8yqtj1IbJU-j_sLQheMWclkCqqMZo-gFolDaMHNeUqE_F8hagtXxXi=s1600', false, 1, 'Résidence Le Monaco')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SXmTrX4AS6C3tSwdy2L-TaJ9tXt6H6Xe7djefzMMWgNaoroqG69MV7NUJRR-Qlx8FSdwhTi_tEUD0Xi477DFZd-nNdqvF2LPCzmvr-mCasf1VoYfVg8otp-3mw0lT-KJJMcskKOAq6BJyR=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SXmTrX4AS6C3tSwdy2L-TaJ9tXt6H6Xe7djefzMMWgNaoroqG69MV7NUJRR-Qlx8FSdwhTi_tEUD0Xi477DFZd-nNdqvF2LPCzmvr-mCasf1VoYfVg8otp-3mw0lT-KJJMcskKOAq6BJyR=s1600', false, 2, 'Résidence Le Monaco')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TIxJ_6UI0tl3w1VPhca6IfwzF0eNClMeCXf3gq2-YjiczOWsJEQFE_vwG5bPF_ZwgvKNGRhBRqIqjaJYT8B5quCdr_U-5UDjEyINLRiVyZBCPeWRYUz4M5WsIKTfWNV2oG71J_RLYQlLSV=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TIxJ_6UI0tl3w1VPhca6IfwzF0eNClMeCXf3gq2-YjiczOWsJEQFE_vwG5bPF_ZwgvKNGRhBRqIqjaJYT8B5quCdr_U-5UDjEyINLRiVyZBCPeWRYUz4M5WsIKTfWNV2oG71J_RLYQlLSV=s1600', false, 3, 'Résidence Le Monaco')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RuluDev7sCGgL-SdYng8k1O6Ll1eRlFCnBNyqZpA5zd6LTsq2coJBq4RJh2N2jUKFEhDRuGrPTDRKGDnL3FZQKQQx0qaDo4A1LECWE-RPwWhG6ds89X9IDqNRi_-7OzMsR03k3KQv-ddTp=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RuluDev7sCGgL-SdYng8k1O6Ll1eRlFCnBNyqZpA5zd6LTsq2coJBq4RJh2N2jUKFEhDRuGrPTDRKGDnL3FZQKQQx0qaDo4A1LECWE-RPwWhG6ds89X9IDqNRi_-7OzMsR03k3KQv-ddTp=s1600', false, 4, 'Résidence Le Monaco')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TTuSItgDlWTfrLrvckxEGOuxIVgLgxRmkCv72GXrb4_Il02MtGrzNtNZGBxqbB0KQbPSy-1w1LE5ZGxEL7K_LwDgyIGDwRzfIT8j807XTIW4RQW4gwXP8WavJV_NalcWjPsMhVBPk1dEE=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TTuSItgDlWTfrLrvckxEGOuxIVgLgxRmkCv72GXrb4_Il02MtGrzNtNZGBxqbB0KQbPSy-1w1LE5ZGxEL7K_LwDgyIGDwRzfIT8j807XTIW4RQW4gwXP8WavJV_NalcWjPsMhVBPk1dEE=s1600', false, 5, 'Résidence Le Monaco')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QUTjNbqsK7FUfGyuE3PrhIWqUKBbkkuB1dKOj63fp3c0T0zfmcsH37vFbI2FKFt2odXGiFBWcwHnGLLyqo8Lq-vApYshAzJNg2G2fs7egLSvrByBJxGnNqRNlbg9Ni1y8Bt-nFy5ZpwljI=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QUTjNbqsK7FUfGyuE3PrhIWqUKBbkkuB1dKOj63fp3c0T0zfmcsH37vFbI2FKFt2odXGiFBWcwHnGLLyqo8Lq-vApYshAzJNg2G2fs7egLSvrByBJxGnNqRNlbg9Ni1y8Bt-nFy5ZpwljI=s1600', false, 6, 'Résidence Le Monaco')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RAfyielSvqsV0LRlY80hpDLrpEY5aYnaUq5ZgOMcfDGAAVSuin3SBenw0B187W3amVdKPOTEpNkWBfkgwB3AwLL6FuwK3zQ2NPQW6917DcuBZK0Xdgi98xin1IjzF5yH4EpuqcPr6gS0Q=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RAfyielSvqsV0LRlY80hpDLrpEY5aYnaUq5ZgOMcfDGAAVSuin3SBenw0B187W3amVdKPOTEpNkWBfkgwB3AwLL6FuwK3zQ2NPQW6917DcuBZK0Xdgi98xin1IjzF5yH4EpuqcPr6gS0Q=s1600', false, 7, 'Résidence Le Monaco')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QGZqdSjXyP43sQGqsc_sH0bDkZzMOKx8z5GM67H-gzSdZxrTI3mUClYigCfhI_DTaJsxtxB4GiT1uD65WwQMOf2ZUJoFkcBtrLYUZhc3c02r52tFLL903-XD_YmPNJYWJzmBYIWXSHdMwG=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QGZqdSjXyP43sQGqsc_sH0bDkZzMOKx8z5GM67H-gzSdZxrTI3mUClYigCfhI_DTaJsxtxB4GiT1uD65WwQMOf2ZUJoFkcBtrLYUZhc3c02r52tFLL903-XD_YmPNJYWJzmBYIWXSHdMwG=s1600', false, 8, 'Résidence Le Monaco')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeTRMlJGa3-rIB6i63BCk2gjLqGxuk0wZsdp4GHFTX7bb52YdPdyPf1Nv3YE27L3OmLypDTUhsSrLtzDYtAkxt2VCH_EEywvRlFt0vHAwFEjk8cg7Ov_xaLCBAEB5ZeKzbcrbm9vewc_1sZ=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeTRMlJGa3-rIB6i63BCk2gjLqGxuk0wZsdp4GHFTX7bb52YdPdyPf1Nv3YE27L3OmLypDTUhsSrLtzDYtAkxt2VCH_EEywvRlFt0vHAwFEjk8cg7Ov_xaLCBAEB5ZeKzbcrbm9vewc_1sZ=s1600-p-k-no', false, 9, 'Résidence Le Monaco')
  on conflict do nothing;

  -- [71] Meublé à Bonamoussadi - One-Bedroom Apartment (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'meuble-a-bonamoussadi-one-bedroom-apartment-bonamoussadi',
    'room',
    'published',
    'Meublé à Bonamoussadi - One-Bedroom Apartment',
    'Meublé à Bonamoussadi - One-Bedroom Apartment
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.08919,
    9.7427797,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3x1i0Yo8I0-mBPEw5fiZk1hXdHkcUPjJNgVG6u6n3P1fwLvwffVXn6F9ZUQIqaFv-TWk_KUQtv-oANvXPoeMIBN9l-YcHBH4-TIqHZ-s_vM9xS2ixfkGv53bKfpr607kziPx6vFJ-tdRgxjCbcYEh0CTqv2kqBMNgAE9TrTK4biLVSQnYZERuAjQ=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3x1i0Yo8I0-mBPEw5fiZk1hXdHkcUPjJNgVG6u6n3P1fwLvwffVXn6F9ZUQIqaFv-TWk_KUQtv-oANvXPoeMIBN9l-YcHBH4-TIqHZ-s_vM9xS2ixfkGv53bKfpr607kziPx6vFJ-tdRgxjCbcYEh0CTqv2kqBMNgAE9TrTK4biLVSQnYZERuAjQ=s1600', true, 0, 'Meublé à Bonamoussadi - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3x1i0Yo8I0-mBPEw5fiZk1hXdHkcUPjJNgVG6u6n3P1fwLvwffVXn6F9ZUQIqaFv-TWk_KUQtv-oANvXPoeMIBN9l-YcHBH4-TIqHZ-s_vM9xS2ixfkGv53bKfpr607kziPx6vFJ-tdRgxjCbcYEh0CTqv2kqBMNgAE9TrTK4biLVSQnYZERuAjQ=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3x1i0Yo8I0-mBPEw5fiZk1hXdHkcUPjJNgVG6u6n3P1fwLvwffVXn6F9ZUQIqaFv-TWk_KUQtv-oANvXPoeMIBN9l-YcHBH4-TIqHZ-s_vM9xS2ixfkGv53bKfpr607kziPx6vFJ-tdRgxjCbcYEh0CTqv2kqBMNgAE9TrTK4biLVSQnYZERuAjQ=s1600-p-k-no', false, 1, 'Meublé à Bonamoussadi - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhE12g4NBXAMDODZhf0_icr04muHN3WH3tQLwx1tfBJNOYFAsQ5_QItbuGuc8ba-knRBrIy6jqHRHPqu3-me6FsmpZR8YE1dsIxIGIL5MTcSqXQ6ED1tMSfbAyFe7HJxGsfSK01JaO0Od9M_tGSYSd1c_4Gsg50NFtTztaQ_8y9n0gKTdC4rG-zENA=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhE12g4NBXAMDODZhf0_icr04muHN3WH3tQLwx1tfBJNOYFAsQ5_QItbuGuc8ba-knRBrIy6jqHRHPqu3-me6FsmpZR8YE1dsIxIGIL5MTcSqXQ6ED1tMSfbAyFe7HJxGsfSK01JaO0Od9M_tGSYSd1c_4Gsg50NFtTztaQ_8y9n0gKTdC4rG-zENA=s1600', false, 2, 'Meublé à Bonamoussadi - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhH0nVHqgayYJTi9HIsdg1ja856bDeTmVn5ya5gB0iE1j5ENGQxTd24Ujb-PjCq_lPuIjjw47aU8K6jZuQZgCTRdgiKr-hJhRuJoNiKArRtBmW80jBg12UrS_uAe0KfUtzc0R93v2G60rPpCGkPfJHAduCwBXUZ-Dwm8d9FdYh3dFZswjyj9FnsL=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhH0nVHqgayYJTi9HIsdg1ja856bDeTmVn5ya5gB0iE1j5ENGQxTd24Ujb-PjCq_lPuIjjw47aU8K6jZuQZgCTRdgiKr-hJhRuJoNiKArRtBmW80jBg12UrS_uAe0KfUtzc0R93v2G60rPpCGkPfJHAduCwBXUZ-Dwm8d9FdYh3dFZswjyj9FnsL=s1600', false, 3, 'Meublé à Bonamoussadi - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhESZjghW_XAb6KGVcxNeISpMC4KxvRNQGvtgs91IMia_WlYhmo1QSxULZWApe8i61G78xskdYUKanLx5TUu6SKSAOLBsVeb-JyHJ1lIiT0lmhkvNPv3tmNal31DTFqreplcsAldtN4gBVT6IiA98lNjHa-j4SjN_4WjH2Ce3CguTVClrT5xbfH1=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhESZjghW_XAb6KGVcxNeISpMC4KxvRNQGvtgs91IMia_WlYhmo1QSxULZWApe8i61G78xskdYUKanLx5TUu6SKSAOLBsVeb-JyHJ1lIiT0lmhkvNPv3tmNal31DTFqreplcsAldtN4gBVT6IiA98lNjHa-j4SjN_4WjH2Ce3CguTVClrT5xbfH1=s1600', false, 4, 'Meublé à Bonamoussadi - One-Bedroom Apartment')
  on conflict do nothing;

  -- [72] Studio meublé, à 200 M de la mairie de Bonamoussadi - One-Bedroom Apartment (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'studio-meuble-a-200-m-de-la-mairie-de-bonamoussadi-one-bedroom-apartment-bo',
    'studio',
    'published',
    'Studio meublé, à 200 M de la mairie de Bonamoussadi - One-Bedroom Apartment',
    'Studio meublé, à 200 M de la mairie de Bonamoussadi - One-Bedroom Apartment
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0914698,
    9.7375803,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0kyjwg7BIY2D0EduopyrUi9aK8GbmsyqKHntfjBA7B83tjgRB7mWNnPukfawjqcRlRGl4c11GMk-Qn25ZeKsr_4Ac2EGVlWb-UcHoJQNhHjz9455-eH_RSSrloNl6bNLkwOrnfHgH1ha7FBK4jOu410pePbhZhIb_t9yPq2AR2_spXH5pViIOX=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0kyjwg7BIY2D0EduopyrUi9aK8GbmsyqKHntfjBA7B83tjgRB7mWNnPukfawjqcRlRGl4c11GMk-Qn25ZeKsr_4Ac2EGVlWb-UcHoJQNhHjz9455-eH_RSSrloNl6bNLkwOrnfHgH1ha7FBK4jOu410pePbhZhIb_t9yPq2AR2_spXH5pViIOX=s1600', true, 0, 'Studio meublé, à 200 M de la mairie de Bonamoussadi - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0kyjwg7BIY2D0EduopyrUi9aK8GbmsyqKHntfjBA7B83tjgRB7mWNnPukfawjqcRlRGl4c11GMk-Qn25ZeKsr_4Ac2EGVlWb-UcHoJQNhHjz9455-eH_RSSrloNl6bNLkwOrnfHgH1ha7FBK4jOu410pePbhZhIb_t9yPq2AR2_spXH5pViIOX=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0kyjwg7BIY2D0EduopyrUi9aK8GbmsyqKHntfjBA7B83tjgRB7mWNnPukfawjqcRlRGl4c11GMk-Qn25ZeKsr_4Ac2EGVlWb-UcHoJQNhHjz9455-eH_RSSrloNl6bNLkwOrnfHgH1ha7FBK4jOu410pePbhZhIb_t9yPq2AR2_spXH5pViIOX=s1600-p-k-no', false, 1, 'Studio meublé, à 200 M de la mairie de Bonamoussadi - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFyWseqCX4D5GvKhmcSBHJyH_uLyxlQ4BaBpfmpHL5wY1HJOnZk0eMZePC-AZQi_o4aSh66kILnAavYkPghcnEJ7yQzsgy-7m1iXIw1EMa9oIzMcyfkwvzKnQdvXde2ZmIqVzV4qzD7sFCKb37HMmoT_iUdPFmPBwng-IxpcuPvhJt05MWNveI4=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFyWseqCX4D5GvKhmcSBHJyH_uLyxlQ4BaBpfmpHL5wY1HJOnZk0eMZePC-AZQi_o4aSh66kILnAavYkPghcnEJ7yQzsgy-7m1iXIw1EMa9oIzMcyfkwvzKnQdvXde2ZmIqVzV4qzD7sFCKb37HMmoT_iUdPFmPBwng-IxpcuPvhJt05MWNveI4=s1600', false, 2, 'Studio meublé, à 200 M de la mairie de Bonamoussadi - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhESiA7bvSHTSl6AALa1LKWn6bMNAYqycpeWtnd9DvcL7o_8PBfAyhfkQG1Vjl3SBt_CUiWUSAfxS_KZL1hJ3U8iijKzkoUSRxbeQ4zGlpG5NvYZXkmxMlzZNGXSY0SI_ZSoPU6C3sQ1Ismj-NUp9rSZoVrWR1xFumEjdRWFEmWNgOqRvYNYhDQ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhESiA7bvSHTSl6AALa1LKWn6bMNAYqycpeWtnd9DvcL7o_8PBfAyhfkQG1Vjl3SBt_CUiWUSAfxS_KZL1hJ3U8iijKzkoUSRxbeQ4zGlpG5NvYZXkmxMlzZNGXSY0SI_ZSoPU6C3sQ1Ismj-NUp9rSZoVrWR1xFumEjdRWFEmWNgOqRvYNYhDQ=s1600', false, 3, 'Studio meublé, à 200 M de la mairie de Bonamoussadi - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG8H614N8qqp-FmENatbSd93H13hnF2MdsRYhjCqPWD7iiO145MWdarJfHKqSG0U0LTlnX16GKIKUH3VL8-eskNGyLaS3ZArWlwDeJmpfrhqTG36GpDxNCh7NkdAkQ6F-uepr8NLIgHlAza2lzWtHo_4TpPlzWj6lIPvaHFSaQ3qY6kSjIIQUVh=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG8H614N8qqp-FmENatbSd93H13hnF2MdsRYhjCqPWD7iiO145MWdarJfHKqSG0U0LTlnX16GKIKUH3VL8-eskNGyLaS3ZArWlwDeJmpfrhqTG36GpDxNCh7NkdAkQ6F-uepr8NLIgHlAza2lzWtHo_4TpPlzWj6lIPvaHFSaQ3qY6kSjIIQUVh=s1600', false, 4, 'Studio meublé, à 200 M de la mairie de Bonamoussadi - One-Bedroom Apartment')
  on conflict do nothing;

  -- [73] Residence les Cottages (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-les-cottages-bonamoussadi',
    'apartment',
    'published',
    'Residence les Cottages',
    'Residence les Cottages
Catégorie : Hôtel.
Adresse : Douala.
Contact / WhatsApp : +237670936272.
Note Google Maps : 4/5 (7 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Robert franky, note 5/5)
- "Note sans commentaire écrit." (La Dominicaine, note 5/5)
- "Note sans commentaire écrit." (Merveille Tatsinkou, note 4/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0931709,
    9.7416533,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfqXNujT8QmdmGuofVf1RZwh-PuVsNWnN4OFedayI2y22pV_MXejFsdij8Hh2qkx7q01WmPk7YnZzB8GetGfHKcTO5yUrcjAEoJ0JK1DTjGNISPF9AqdPWwEjdgR_uWrLWFZsYwCsqmbrM=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfqXNujT8QmdmGuofVf1RZwh-PuVsNWnN4OFedayI2y22pV_MXejFsdij8Hh2qkx7q01WmPk7YnZzB8GetGfHKcTO5yUrcjAEoJ0JK1DTjGNISPF9AqdPWwEjdgR_uWrLWFZsYwCsqmbrM=s1600', true, 0, 'Residence les Cottages')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfqXNujT8QmdmGuofVf1RZwh-PuVsNWnN4OFedayI2y22pV_MXejFsdij8Hh2qkx7q01WmPk7YnZzB8GetGfHKcTO5yUrcjAEoJ0JK1DTjGNISPF9AqdPWwEjdgR_uWrLWFZsYwCsqmbrM=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfqXNujT8QmdmGuofVf1RZwh-PuVsNWnN4OFedayI2y22pV_MXejFsdij8Hh2qkx7q01WmPk7YnZzB8GetGfHKcTO5yUrcjAEoJ0JK1DTjGNISPF9AqdPWwEjdgR_uWrLWFZsYwCsqmbrM=s1600-p-k-no', false, 1, 'Residence les Cottages')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeVHmCFIVX7sJnpECkLuosvbs9VNPiAmLE7fOoF3Ix6t53cGo_keW_kM9E1MDPmICEggKY5U8YeDyKd7xa6BJXj1RbI1znKvVSqKQWvyhpg0yualzMTmILZIa5tLc0pVhXALYD-Dw0GQy_I=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeVHmCFIVX7sJnpECkLuosvbs9VNPiAmLE7fOoF3Ix6t53cGo_keW_kM9E1MDPmICEggKY5U8YeDyKd7xa6BJXj1RbI1znKvVSqKQWvyhpg0yualzMTmILZIa5tLc0pVhXALYD-Dw0GQy_I=s1600', false, 2, 'Residence les Cottages')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/a/ACg8ocIOXLTpxCt--TiC_BKTcm7ddOdpf-EQjRSvbkTd--vYfP-nYQ=s1600-p-rp-mo-br100', 'https://lh3.googleusercontent.com/a/ACg8ocIOXLTpxCt--TiC_BKTcm7ddOdpf-EQjRSvbkTd--vYfP-nYQ=s1600-p-rp-mo-br100', false, 3, 'Residence les Cottages')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/a/ACg8ocISe6ikoppvjLCoEIqRsN5LTXCqF65SNOe4ulHQMGlSHyzNWQ=s1600-p-rp-mo-br100', 'https://lh3.googleusercontent.com/a/ACg8ocISe6ikoppvjLCoEIqRsN5LTXCqF65SNOe4ulHQMGlSHyzNWQ=s1600-p-rp-mo-br100', false, 4, 'Residence les Cottages')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/a-/ALV-UjW-MbWOwuzwao93hWbu0RgOoaavAIxELA7LN3njbOWEsozCXiNi=s1600-p-rp-mo-br100', 'https://lh3.googleusercontent.com/a-/ALV-UjW-MbWOwuzwao93hWbu0RgOoaavAIxELA7LN3njbOWEsozCXiNi=s1600-p-rp-mo-br100', false, 5, 'Residence les Cottages')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R-rSDm7IhNbPviI_4aIppkuwRuIZGvTJRmrNp0lVfFWh7QWUZNVqbjZytYSvpJVScGwTJKciDuNycY6roDvxO1wVYyuhN_A9M_IWvM-T9UinEPdOB243Ad-w8391zvpMA3P3W60qiR0OA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R-rSDm7IhNbPviI_4aIppkuwRuIZGvTJRmrNp0lVfFWh7QWUZNVqbjZytYSvpJVScGwTJKciDuNycY6roDvxO1wVYyuhN_A9M_IWvM-T9UinEPdOB243Ad-w8391zvpMA3P3W60qiR0OA=s1600', false, 6, 'Residence les Cottages')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RfD3NZqXbRyHiaX9pMUubNougqA5olD8vlvJ4WkVOeFRvCaunfyQCRrBTAi1E3AcOjY6ZDQG9aP5LEPQOpK5lpd1ykoV1idfGjB-1tzXt5CRh4Dec4jCI2IK7SazYka-C_wsTg_I9V28Xz=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RfD3NZqXbRyHiaX9pMUubNougqA5olD8vlvJ4WkVOeFRvCaunfyQCRrBTAi1E3AcOjY6ZDQG9aP5LEPQOpK5lpd1ykoV1idfGjB-1tzXt5CRh4Dec4jCI2IK7SazYka-C_wsTg_I9V28Xz=s1600', false, 7, 'Residence les Cottages')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R4fZLrmln6pcX6GiGiuhJkfjuXV8KylusRAlmf_ZtyPMQRPXs8Wq6OVe7UVbQgla5S_IS9cOACHlygwCU3p13N5ErraY6awu00h-_94-aTWvpozQLAUYCbv2eT37O9DSP9iR8VH358Qmt7=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R4fZLrmln6pcX6GiGiuhJkfjuXV8KylusRAlmf_ZtyPMQRPXs8Wq6OVe7UVbQgla5S_IS9cOACHlygwCU3p13N5ErraY6awu00h-_94-aTWvpozQLAUYCbv2eT37O9DSP9iR8VH358Qmt7=s1600', false, 8, 'Residence les Cottages')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TArvJZJeHk7co4rwUzXETb6iENi2HIg-bPva49s_60SazNGgNtej1Pt_vNq-kXWFWZ3qAkgTpsQaDh0tG2a-Z9j0tqh4sO21OAY0QhKX3PzGnka8IJeMrkEFcGtE2nXBdkviEMPezx3H0=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TArvJZJeHk7co4rwUzXETb6iENi2HIg-bPva49s_60SazNGgNtej1Pt_vNq-kXWFWZ3qAkgTpsQaDh0tG2a-Z9j0tqh4sO21OAY0QhKX3PzGnka8IJeMrkEFcGtE2nXBdkviEMPezx3H0=s1600', false, 9, 'Residence les Cottages')
  on conflict do nothing;

  -- [74] Studio Meublé Paisible _à Bonamoussadi (Kotto) - One-Bedroom Apartment (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'studio-meuble-paisible-a-bonamoussadi-kotto-one-bedroom-apartment-bonamouss',
    'studio',
    'published',
    'Studio Meublé Paisible _à Bonamoussadi (Kotto) - One-Bedroom Apartment',
    'Studio Meublé Paisible _à Bonamoussadi (Kotto) - One-Bedroom Apartment
Adresse : Douala.
Note Google Maps : 3.9/5 (0 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0973902,
    9.7489099,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3u2pxg1cBD7mugQktuTR6lgASBDyqUOj9bA93Roq8XzQc4nP1ekZdSu-yiTRi-Z1XsUS8JGhhEj16cuE4jJtN7ZXeMwTHSjVYnNvL22PHmYk0dweZkJV4w-_rYJmCdli22Jpslryn8f31z-SGiGDS7QairZngwB3xKLMgv6SSsaOe9yZo38HHz=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3u2pxg1cBD7mugQktuTR6lgASBDyqUOj9bA93Roq8XzQc4nP1ekZdSu-yiTRi-Z1XsUS8JGhhEj16cuE4jJtN7ZXeMwTHSjVYnNvL22PHmYk0dweZkJV4w-_rYJmCdli22Jpslryn8f31z-SGiGDS7QairZngwB3xKLMgv6SSsaOe9yZo38HHz=s1600', true, 0, 'Studio Meublé Paisible _à Bonamoussadi (Kotto) - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGEQ1LiXP659RGjwWy8B4cbgnUXI2wo1CrUIWgQ67MlQyKkwJihIombDdRR_XadGSUNkuwvFRXC4KNApm5pm-G2K2I8zea7lx_fHmGel5kIcPqMwLwDZm4UovWN89V4_be4xesbbriHGYRJPY9Bghk0q0npIRqZ0N1MTZk5fY_7klZBCkfAM7ic=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGEQ1LiXP659RGjwWy8B4cbgnUXI2wo1CrUIWgQ67MlQyKkwJihIombDdRR_XadGSUNkuwvFRXC4KNApm5pm-G2K2I8zea7lx_fHmGel5kIcPqMwLwDZm4UovWN89V4_be4xesbbriHGYRJPY9Bghk0q0npIRqZ0N1MTZk5fY_7klZBCkfAM7ic=s1600', false, 1, 'Studio Meublé Paisible _à Bonamoussadi (Kotto) - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEEkHQUi_6VMKuJhDa82s4e0FFLeS_WPv2blwCjq8NyORakkrjwdVzfQcDRDoAZ4uW3khVHOPqSeGWw3mYzDzQDQrdT34iXBFZmqt2t6rPNgpnJWklN9kOjH_Dy4_9qcEVIQyJcvbw-RNWvfOiNhfJ0g52mBjLZ0wLlouu8ELykqjsqNkNaWmniVg=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEEkHQUi_6VMKuJhDa82s4e0FFLeS_WPv2blwCjq8NyORakkrjwdVzfQcDRDoAZ4uW3khVHOPqSeGWw3mYzDzQDQrdT34iXBFZmqt2t6rPNgpnJWklN9kOjH_Dy4_9qcEVIQyJcvbw-RNWvfOiNhfJ0g52mBjLZ0wLlouu8ELykqjsqNkNaWmniVg=s1600', false, 2, 'Studio Meublé Paisible _à Bonamoussadi (Kotto) - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFtwfe6_WFMaofDDzy_x27sZYAtJAc3YzprobcNZFxZBriB4sh1cHVHKU3O1386NHNxX1LW7_Pds1b-3sQBVADWukjB_eRrEwGWCqgMXGyTTHCBtq_A4ocz-_NFU5Na0iVwTPf4eIhF9VY9yCWx26bl6qobV0pxtaJyLChJ16EB8T59BIIHEFAn=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFtwfe6_WFMaofDDzy_x27sZYAtJAc3YzprobcNZFxZBriB4sh1cHVHKU3O1386NHNxX1LW7_Pds1b-3sQBVADWukjB_eRrEwGWCqgMXGyTTHCBtq_A4ocz-_NFU5Na0iVwTPf4eIhF9VY9yCWx26bl6qobV0pxtaJyLChJ16EB8T59BIIHEFAn=s1600', false, 3, 'Studio Meublé Paisible _à Bonamoussadi (Kotto) - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFjVNhfLGpNpFxX5rfRQ5cZ4gFC9mrkmBeYF6jUaoa_vs6VLu5Yj3e3kBtI29XE8zv5MyS2O3ZmH-uv9SvnQviNOM_A3g4ZkTuns6QI3SNRQ5BR_g0O5xOwmyAaoSNPmnCXk8o5JF8OwftpniwgRWmi9Awzjg651pk2jE8NX5I8Lv9y4gbmjD9J=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFjVNhfLGpNpFxX5rfRQ5cZ4gFC9mrkmBeYF6jUaoa_vs6VLu5Yj3e3kBtI29XE8zv5MyS2O3ZmH-uv9SvnQviNOM_A3g4ZkTuns6QI3SNRQ5BR_g0O5xOwmyAaoSNPmnCXk8o5JF8OwftpniwgRWmi9Awzjg651pk2jE8NX5I8Lv9y4gbmjD9J=s1600', false, 4, 'Studio Meublé Paisible _à Bonamoussadi (Kotto) - One-Bedroom Apartment')
  on conflict do nothing;

  -- [75] Residence hoteliere samba (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-hoteliere-samba-bonamoussadi',
    'apartment',
    'published',
    'Residence hoteliere samba',
    'Residence hoteliere samba
Adresse : 99322, Douala.
Contact / WhatsApp : +237672651970.
Note Google Maps : 4.1/5 (40 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '99322, Douala',
    4.0892791,
    9.7397538,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2WREYZ72MWnytjCBtGKq7nrgEzIZMUO-9KjjDTzYqPgDKB4273S1mnwSTdVSuFOjxwtNS_Ga5Oj3wt-pSCb2WSGnvKjGPC2KHADa9PTziQJXF_47e6zAZPgtuCoFu0Krul_5PgsaLEcDgyW30hFRvvaBGBH2L_Z1PY22pGzp3fI2lj83_XBHDI=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2WREYZ72MWnytjCBtGKq7nrgEzIZMUO-9KjjDTzYqPgDKB4273S1mnwSTdVSuFOjxwtNS_Ga5Oj3wt-pSCb2WSGnvKjGPC2KHADa9PTziQJXF_47e6zAZPgtuCoFu0Krul_5PgsaLEcDgyW30hFRvvaBGBH2L_Z1PY22pGzp3fI2lj83_XBHDI=s1600', true, 0, 'Residence hoteliere samba')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2WREYZ72MWnytjCBtGKq7nrgEzIZMUO-9KjjDTzYqPgDKB4273S1mnwSTdVSuFOjxwtNS_Ga5Oj3wt-pSCb2WSGnvKjGPC2KHADa9PTziQJXF_47e6zAZPgtuCoFu0Krul_5PgsaLEcDgyW30hFRvvaBGBH2L_Z1PY22pGzp3fI2lj83_XBHDI=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2WREYZ72MWnytjCBtGKq7nrgEzIZMUO-9KjjDTzYqPgDKB4273S1mnwSTdVSuFOjxwtNS_Ga5Oj3wt-pSCb2WSGnvKjGPC2KHADa9PTziQJXF_47e6zAZPgtuCoFu0Krul_5PgsaLEcDgyW30hFRvvaBGBH2L_Z1PY22pGzp3fI2lj83_XBHDI=s1600-p-k-no', false, 1, 'Residence hoteliere samba')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHqGSnG8fX6PQfdShXG7jt9Y5H2bLpDAX8SrlDgAalPMAOCQSSKseBF2s-6dxywmEqbUFXtwE2Hll1dfLIvvOfqP38V8CBvzSNnBrVG62YN5rSiqrEibpJdLrv9dxNz6_X8fIfRlkYSouNcVAgoLbZSl9FeiFwxkLlAtsfH-D1-vGF-FkVO8OO6=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHqGSnG8fX6PQfdShXG7jt9Y5H2bLpDAX8SrlDgAalPMAOCQSSKseBF2s-6dxywmEqbUFXtwE2Hll1dfLIvvOfqP38V8CBvzSNnBrVG62YN5rSiqrEibpJdLrv9dxNz6_X8fIfRlkYSouNcVAgoLbZSl9FeiFwxkLlAtsfH-D1-vGF-FkVO8OO6=s1600', false, 2, 'Residence hoteliere samba')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SHplU7lteUOLwFbEss-T4cUak1o3eO1KB7gPmGtrX_UWNfx_iPBAd13hvuijebcV5GjEHI3J5dKbRn70tpoEhxqbGc5BAltaoliNoAk3GovC83grWqAhEsP5QRSD6e4MEcOgyi=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SHplU7lteUOLwFbEss-T4cUak1o3eO1KB7gPmGtrX_UWNfx_iPBAd13hvuijebcV5GjEHI3J5dKbRn70tpoEhxqbGc5BAltaoliNoAk3GovC83grWqAhEsP5QRSD6e4MEcOgyi=s1600', false, 3, 'Residence hoteliere samba')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RbyWdk9Bzkt0Wf20uPwZQZPRb97SYbvB13NP65n4LNs7ll8UOtLTAy6AFe-e07IWIdmAzoxfmtb06yQNP_PHOjk9SzbyITohZd2wJw947gCt4WF1LRDuuCwbBpndvqHafFh6QH2VU2zZ7i=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RbyWdk9Bzkt0Wf20uPwZQZPRb97SYbvB13NP65n4LNs7ll8UOtLTAy6AFe-e07IWIdmAzoxfmtb06yQNP_PHOjk9SzbyITohZd2wJw947gCt4WF1LRDuuCwbBpndvqHafFh6QH2VU2zZ7i=s1600', false, 4, 'Residence hoteliere samba')
  on conflict do nothing;

  -- [76] IKN Residence - Bonamoussadi (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'ikn-residence-bonamoussadi-bonamoussadi',
    'apartment',
    'published',
    'IKN Residence - Bonamoussadi',
    'IKN Residence - Bonamoussadi
Catégorie : Résidence hôtelière.
Adresse : au stade annexe, Douala.
Contact / WhatsApp : +237691823382.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'au stade annexe, Douala',
    4.0934293,
    9.7405486,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfXE-MNNxG13r3P8kr-99Xig9--LcVWRNAiScnl7593bv6Io7JD8iHyIE5KQdvQSL3-4IW9rMc5TgDeVFyyu2fRX8hgjyQnhB93CabAycGtk7-Xd5f0CKBK48LyEysngWuE5s3QCNWXcHOk=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfXE-MNNxG13r3P8kr-99Xig9--LcVWRNAiScnl7593bv6Io7JD8iHyIE5KQdvQSL3-4IW9rMc5TgDeVFyyu2fRX8hgjyQnhB93CabAycGtk7-Xd5f0CKBK48LyEysngWuE5s3QCNWXcHOk=s1600', true, 0, 'IKN Residence - Bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TezdxoDoFayQ4xhHpCrQnCnHmOLtIaclxAVmseFPD98CTPD2haacfFAlq5wVSkaSbBday9SBGwC3_ow9WNoHk6w1E14MzFOKspi1PPY61zBBdGJR93U4dnzd6EoUQ3qGcZqwvyN9-tGAtm=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TezdxoDoFayQ4xhHpCrQnCnHmOLtIaclxAVmseFPD98CTPD2haacfFAlq5wVSkaSbBday9SBGwC3_ow9WNoHk6w1E14MzFOKspi1PPY61zBBdGJR93U4dnzd6EoUQ3qGcZqwvyN9-tGAtm=s1600', false, 1, 'IKN Residence - Bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T685p--zIPAI7kZ5tE4syes_JMvTlDqMrfehvgMbDHC5I6mXL4Lk649XPSsfrHLUukqDurJ2pwkj_0-InlHqEbNWqPipkEEPu64PcJLuY0DhSXfIgD4qGZLcpiy3IcgjiXLS-1JclQ1_8=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T685p--zIPAI7kZ5tE4syes_JMvTlDqMrfehvgMbDHC5I6mXL4Lk649XPSsfrHLUukqDurJ2pwkj_0-InlHqEbNWqPipkEEPu64PcJLuY0DhSXfIgD4qGZLcpiy3IcgjiXLS-1JclQ1_8=s1600', false, 2, 'IKN Residence - Bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfXE-MNNxG13r3P8kr-99Xig9--LcVWRNAiScnl7593bv6Io7JD8iHyIE5KQdvQSL3-4IW9rMc5TgDeVFyyu2fRX8hgjyQnhB93CabAycGtk7-Xd5f0CKBK48LyEysngWuE5s3QCNWXcHOk=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfXE-MNNxG13r3P8kr-99Xig9--LcVWRNAiScnl7593bv6Io7JD8iHyIE5KQdvQSL3-4IW9rMc5TgDeVFyyu2fRX8hgjyQnhB93CabAycGtk7-Xd5f0CKBK48LyEysngWuE5s3QCNWXcHOk=s1600-p-k-no', false, 3, 'IKN Residence - Bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a/ACg8ocLpxm_CWWQt_pCs7aBUQ5VL1WxkCjRgooB6xVTgxYILf0vTUw=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a/ACg8ocLpxm_CWWQt_pCs7aBUQ5VL1WxkCjRgooB6xVTgxYILf0vTUw=s1600-p-k-no-mo', false, 4, 'IKN Residence - Bonamoussadi')
  on conflict do nothing;

  -- [77] Résidence meublée NETA Paradise (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-meublee-neta-paradise-bonamoussadi',
    'apartment',
    'published',
    'Résidence meublée NETA Paradise',
    'Résidence meublée NETA Paradise
Catégorie : Hôtel.
Adresse : 3QQ4+8XC, Douala.
Contact / WhatsApp : +237659367190.
Note Google Maps : 4.2/5 (58 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3QQ4+8XC, Douala',
    4.0883045,
    9.7573862,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdtrcLUIelOWIkNg7TnUm_omJ-p7I1wKXJEZCTmJqhR4kqUES4yA0zLeyslT_KFRGGSlHdePCnYxavqpOpEKthdFhROZrawepk9ghwHFqmQiTP10MJ-k-8ftFEGpg-_9HQtxWLS=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdtrcLUIelOWIkNg7TnUm_omJ-p7I1wKXJEZCTmJqhR4kqUES4yA0zLeyslT_KFRGGSlHdePCnYxavqpOpEKthdFhROZrawepk9ghwHFqmQiTP10MJ-k-8ftFEGpg-_9HQtxWLS=s1600', true, 0, 'Résidence meublée NETA Paradise')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TUBfKy8Jc8wPHXAia52k9kwNKqZAK3fjChSe_z2Y91ZTsFBskAc_wMAFUp-CVytiuF8xsyPehyRoIL7QPPrhvLcvnBQxnUUGyR0LxVutDWNzVDzT67iARvZrV6qlvrvkzASbcG=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TUBfKy8Jc8wPHXAia52k9kwNKqZAK3fjChSe_z2Y91ZTsFBskAc_wMAFUp-CVytiuF8xsyPehyRoIL7QPPrhvLcvnBQxnUUGyR0LxVutDWNzVDzT67iARvZrV6qlvrvkzASbcG=s1600', false, 1, 'Résidence meublée NETA Paradise')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SnDQbhjmsw3F8ps7ZvA2o7ohUw_6OD6MsqDRSxdqi9YHX-r_bhJYidCasls9vFDv89Q7f4b1pTF8gcWBiEVP5TMR-dD3_13cIPRnSB50VKTCvdkW3UhQinWq6c9ZkBQL4jPRgY_w=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SnDQbhjmsw3F8ps7ZvA2o7ohUw_6OD6MsqDRSxdqi9YHX-r_bhJYidCasls9vFDv89Q7f4b1pTF8gcWBiEVP5TMR-dD3_13cIPRnSB50VKTCvdkW3UhQinWq6c9ZkBQL4jPRgY_w=s1600', false, 2, 'Résidence meublée NETA Paradise')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SjoKeT3UqRueCgLY6FHRJsRlDjJJ6ibQV3AK_DzgD36QwmqdOtxbbl7jY_GxJs3zKCmK269hVnaf86ufIgGUo7nojng_uhj2SL0X10oz1wSOw6zdWqF8pTKiQcUdaIDqT7qyQdcQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SjoKeT3UqRueCgLY6FHRJsRlDjJJ6ibQV3AK_DzgD36QwmqdOtxbbl7jY_GxJs3zKCmK269hVnaf86ufIgGUo7nojng_uhj2SL0X10oz1wSOw6zdWqF8pTKiQcUdaIDqT7qyQdcQ=s1600', false, 3, 'Résidence meublée NETA Paradise')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RB9G--r2ZkMSZ9eydGW1v6S4fRYKDJa7gjDAF3AtllLfFo5Ta8BjwKGhwsCKcL-XCV3DMfzao_7lFrJ2qZEwBzcLSJinULlc3BmOM9JC3vkwgUuxZV0lxZiJkGzKLxojxyli1euw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RB9G--r2ZkMSZ9eydGW1v6S4fRYKDJa7gjDAF3AtllLfFo5Ta8BjwKGhwsCKcL-XCV3DMfzao_7lFrJ2qZEwBzcLSJinULlc3BmOM9JC3vkwgUuxZV0lxZiJkGzKLxojxyli1euw=s1600', false, 4, 'Résidence meublée NETA Paradise')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TCdpExANNgPmvMFgwcTGyPBKyG-Z_fCCMleRXDwPu-W5VS6gfIEn1A7RXUFQybDcPKffO87N_PLLZRK7iMu_MAs8T_wktNKtF12jh_aXJiFeNoRUa8RRiTVdu33ssPAuBxuNQO=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TCdpExANNgPmvMFgwcTGyPBKyG-Z_fCCMleRXDwPu-W5VS6gfIEn1A7RXUFQybDcPKffO87N_PLLZRK7iMu_MAs8T_wktNKtF12jh_aXJiFeNoRUa8RRiTVdu33ssPAuBxuNQO=s1600', false, 5, 'Résidence meublée NETA Paradise')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QGO7YhRewzlLzNHkZA5Bb0x_xXCRSPsKiNjTVtSQcNdD4LiSCfcyWFSjoPvMhWZR8tQTQW521pGcgF_arKm2nPNwV0-EROvjwvGYYwBrBWkUqdT3oaezmSjO7sSsjKdc1Oww=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QGO7YhRewzlLzNHkZA5Bb0x_xXCRSPsKiNjTVtSQcNdD4LiSCfcyWFSjoPvMhWZR8tQTQW521pGcgF_arKm2nPNwV0-EROvjwvGYYwBrBWkUqdT3oaezmSjO7sSsjKdc1Oww=s1600', false, 6, 'Résidence meublée NETA Paradise')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QMjO2NG9-ct4V36zyNz6R2uiOrndvGkO0rwM1CLuWBoZCM5exSRvvmBlKZf44wFOfZdouML4k8wEct2dmX6JDIkNHFVT_5jOGTifo6RpW0_5T3roGFWk6_nyKcFIc7Y9cqRLSPww=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QMjO2NG9-ct4V36zyNz6R2uiOrndvGkO0rwM1CLuWBoZCM5exSRvvmBlKZf44wFOfZdouML4k8wEct2dmX6JDIkNHFVT_5jOGTifo6RpW0_5T3roGFWk6_nyKcFIc7Y9cqRLSPww=s1600', false, 7, 'Résidence meublée NETA Paradise')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T5y6ekpEwZ143KF0Pjoxxdoi2TdoTatnFK-2-oBbgEb-iN3Tufjb5BBK99Ogkm0sqlR9MS1pZwInkGt_7WnjniAY3L3EaTHEymJQ9h5g2fMWY0YXUsb_vZdL7tXGY2j27dwAJ5=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T5y6ekpEwZ143KF0Pjoxxdoi2TdoTatnFK-2-oBbgEb-iN3Tufjb5BBK99Ogkm0sqlR9MS1pZwInkGt_7WnjniAY3L3EaTHEymJQ9h5g2fMWY0YXUsb_vZdL7tXGY2j27dwAJ5=s1600', false, 8, 'Résidence meublée NETA Paradise')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QolU_ptI3xLfoJSM-UBiDJImsew1lGbL14wcZNljTWdyClQClb-wC3dpuGiKBmYgxSXDQUm_CLeoqc_v4ENqLf-s84m-98XJB-Xm42GolVjDXlS2q9g6pmozyaZP8EJ3nZTnY7Uw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QolU_ptI3xLfoJSM-UBiDJImsew1lGbL14wcZNljTWdyClQClb-wC3dpuGiKBmYgxSXDQUm_CLeoqc_v4ENqLf-s84m-98XJB-Xm42GolVjDXlS2q9g6pmozyaZP8EJ3nZTnY7Uw=s1600', false, 9, 'Résidence meublée NETA Paradise')
  on conflict do nothing;

  -- [78] Chambres Meublées & Nuitées Immeuble Maka Bonamoussadi (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'chambres-meublees-nuitees-immeuble-maka-bonamoussadi-bonamoussadi',
    'room',
    'published',
    'Chambres Meublées & Nuitées Immeuble Maka Bonamoussadi',
    'Chambres Meublées & Nuitées Immeuble Maka Bonamoussadi
Adresse : Laboratoire - Meka, Douala.
Contact / WhatsApp : +237657851475.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Laboratoire - Meka, Douala',
    4.0869393,
    9.7381866,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeTTc3JiTp7jkD62QILxzTAjJInpYJtrGj9LESvPRk_i2IgOc7TrVb8U6IAkAzw3g8m-1Fz-pnuwNWLq9VGtRSQs0K0qVv1VRrxQNZYGRjHze3FCx_2eItotSpmz8kzqyti_srQTxZ2Tyg=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeTTc3JiTp7jkD62QILxzTAjJInpYJtrGj9LESvPRk_i2IgOc7TrVb8U6IAkAzw3g8m-1Fz-pnuwNWLq9VGtRSQs0K0qVv1VRrxQNZYGRjHze3FCx_2eItotSpmz8kzqyti_srQTxZ2Tyg=s1600', true, 0, 'Chambres Meublées & Nuitées Immeuble Maka Bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeTTc3JiTp7jkD62QILxzTAjJInpYJtrGj9LESvPRk_i2IgOc7TrVb8U6IAkAzw3g8m-1Fz-pnuwNWLq9VGtRSQs0K0qVv1VRrxQNZYGRjHze3FCx_2eItotSpmz8kzqyti_srQTxZ2Tyg=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeTTc3JiTp7jkD62QILxzTAjJInpYJtrGj9LESvPRk_i2IgOc7TrVb8U6IAkAzw3g8m-1Fz-pnuwNWLq9VGtRSQs0K0qVv1VRrxQNZYGRjHze3FCx_2eItotSpmz8kzqyti_srQTxZ2Tyg=s1600-p-k-no', false, 1, 'Chambres Meublées & Nuitées Immeuble Maka Bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tt9TyJPDGjIWqCXPXxp54XDx9wKFptosq7y2P8iSvBXXkX-ei7LQVKE1bAtJYdeX1IVFhDdPErHRzxKzKPGCIbKvuz9e2D-eHPYHKLZd6SUpURFMxDm5hNt1fQe-JVD5ZeWe7FKCo9SvA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tt9TyJPDGjIWqCXPXxp54XDx9wKFptosq7y2P8iSvBXXkX-ei7LQVKE1bAtJYdeX1IVFhDdPErHRzxKzKPGCIbKvuz9e2D-eHPYHKLZd6SUpURFMxDm5hNt1fQe-JVD5ZeWe7FKCo9SvA=s1600', false, 2, 'Chambres Meublées & Nuitées Immeuble Maka Bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QxzlnTnq_Yt5kvduqtnsYFmCUZxcs5dAiOh9ay2LiimS8pVk31xQuVaosZ1JEol4GQglx5JbriQAJleNwFLQKuXM9sYMEnunXwS-6pVMHD7xL5I-m6DfllfqCOwWYnSlWi3ZS2rZyCUIo=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QxzlnTnq_Yt5kvduqtnsYFmCUZxcs5dAiOh9ay2LiimS8pVk31xQuVaosZ1JEol4GQglx5JbriQAJleNwFLQKuXM9sYMEnunXwS-6pVMHD7xL5I-m6DfllfqCOwWYnSlWi3ZS2rZyCUIo=s1600', false, 3, 'Chambres Meublées & Nuitées Immeuble Maka Bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Ts8tTHDIPjhjplHsTrt-X6Qa2Yp53tRaj2lGJr09IYh-bCiqEW7zddL5TIv3x8KVAS3aPM61TPt1sGtl7-zV8pnrGjULgIWA6SJl1f_FyCk9UYh6cnvnZDLe2g2Q_I5vxuTaPtvVnq1Jo=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Ts8tTHDIPjhjplHsTrt-X6Qa2Yp53tRaj2lGJr09IYh-bCiqEW7zddL5TIv3x8KVAS3aPM61TPt1sGtl7-zV8pnrGjULgIWA6SJl1f_FyCk9UYh6cnvnZDLe2g2Q_I5vxuTaPtvVnq1Jo=s1600', false, 4, 'Chambres Meublées & Nuitées Immeuble Maka Bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a/ACg8ocKjPxhP9zhEukusqP6b528O6MCI2_0m7OLqF5ixz5dY7F4tyA=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a/ACg8ocKjPxhP9zhEukusqP6b528O6MCI2_0m7OLqF5ixz5dY7F4tyA=s1600-p-k-no-mo', false, 5, 'Chambres Meublées & Nuitées Immeuble Maka Bonamoussadi')
  on conflict do nothing;

  -- [79] Diadème Housing - Appartements meublés à BONAMOUSSADI (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'diademe-housing-appartements-meubles-a-bonamoussadi-bonamoussadi',
    'apartment',
    'published',
    'Diadème Housing - Appartements meublés à BONAMOUSSADI',
    'Diadème Housing - Appartements meublés à BONAMOUSSADI
Catégorie : Location d''appartement de vacances.
Adresse : face au collège La Conquête, Vallée Ndogbong, Douala.
Contact / WhatsApp : +237699425625.
Note Google Maps : 5/5 (3 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Jean PIEWE, note 5/5)
- "Note sans commentaire écrit." (Alphonse Ndeuko, note 5/5)
- "Note sans commentaire écrit." (esther mbongo, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'face au collège La Conquête, Vallée Ndogbong, Douala',
    4.0691769,
    9.7549035,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeK6iWK_Kkyg2G5Um8GiobD8hGXfh_dw5oFovNcv0s41M7tz25zVgYiQJ_mv0CeoeMzKz6tioMUMoS_4MKdHt5LgaiDArZ5qKzlvXQbRa1j_34CCD4IMyWN69D9mHIh5EBMv-k1GDLfxEH6=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeK6iWK_Kkyg2G5Um8GiobD8hGXfh_dw5oFovNcv0s41M7tz25zVgYiQJ_mv0CeoeMzKz6tioMUMoS_4MKdHt5LgaiDArZ5qKzlvXQbRa1j_34CCD4IMyWN69D9mHIh5EBMv-k1GDLfxEH6=s1600', true, 0, 'Diadème Housing - Appartements meublés à BONAMOUSSADI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RbudDEwSOWSP7BZgmpYZG232v8XIsREPgqLi3Yxec68Ifx4P0U6P69am_-IkTKg-GxavZvBTf0AQxmuG9BCg8d4kQSUpZCAnA2SSEjhS2dMGbEPHwCRIh5opvhdK7MFCJ1XpZwFZS96cjk=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RbudDEwSOWSP7BZgmpYZG232v8XIsREPgqLi3Yxec68Ifx4P0U6P69am_-IkTKg-GxavZvBTf0AQxmuG9BCg8d4kQSUpZCAnA2SSEjhS2dMGbEPHwCRIh5opvhdK7MFCJ1XpZwFZS96cjk=s1600', false, 1, 'Diadème Housing - Appartements meublés à BONAMOUSSADI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SWHqc2GlceXqra3nCsEks03TRRvC6zQ_eGCSVE1yWFgSUpLYshu88nSbIN6f5cK788MqoGzDQQmYpJP3kGqPynfv73QigCKvnPd7FIBmbjZspr5RrrBYpIm7YE6UmwB5EkSxdIEyQFFTQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SWHqc2GlceXqra3nCsEks03TRRvC6zQ_eGCSVE1yWFgSUpLYshu88nSbIN6f5cK788MqoGzDQQmYpJP3kGqPynfv73QigCKvnPd7FIBmbjZspr5RrrBYpIm7YE6UmwB5EkSxdIEyQFFTQ=s1600', false, 2, 'Diadème Housing - Appartements meublés à BONAMOUSSADI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TCbD8g9GhSTYaxqmEru7yRdAguZ_ibDDBkhtUtAe9ZLKDTeA9ALTOGKZwatvpQpSEjVFKIEBtIgQrF2kbmGstR58dRbcCrtG6IqQ50MkuYmfkGz3Xl_IbY0KxrSavYhggc5TxJDXMVBYIw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TCbD8g9GhSTYaxqmEru7yRdAguZ_ibDDBkhtUtAe9ZLKDTeA9ALTOGKZwatvpQpSEjVFKIEBtIgQrF2kbmGstR58dRbcCrtG6IqQ50MkuYmfkGz3Xl_IbY0KxrSavYhggc5TxJDXMVBYIw=s1600', false, 3, 'Diadème Housing - Appartements meublés à BONAMOUSSADI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QZ-mubDlVLgoKFGdM5NCawacGWo0T3jM3daOcUeI4lY0DyMaei7XV4sxJCvDmf39RpDEuDrsyjgYbEdyybmulhW6Es0RKTpDnmNSPT2TBl77oDI96Yq6mrkvS5Mc1_Olzfdpn9mM-r0lA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QZ-mubDlVLgoKFGdM5NCawacGWo0T3jM3daOcUeI4lY0DyMaei7XV4sxJCvDmf39RpDEuDrsyjgYbEdyybmulhW6Es0RKTpDnmNSPT2TBl77oDI96Yq6mrkvS5Mc1_Olzfdpn9mM-r0lA=s1600', false, 4, 'Diadème Housing - Appartements meublés à BONAMOUSSADI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RGDwtffsMxhkxQL3JHpY9cKKiFSJufFtZJwju9Im7XKuNKxR7TDlGsipoePYWP4Mf8HgF_PX5afwBVpZODnYP9PSJAmyzT0TOWP7CSBTdOdpAqZN6vkEUgSVoqY_xRtd2YPNppvpsDS3Q=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RGDwtffsMxhkxQL3JHpY9cKKiFSJufFtZJwju9Im7XKuNKxR7TDlGsipoePYWP4Mf8HgF_PX5afwBVpZODnYP9PSJAmyzT0TOWP7CSBTdOdpAqZN6vkEUgSVoqY_xRtd2YPNppvpsDS3Q=s1600', false, 5, 'Diadème Housing - Appartements meublés à BONAMOUSSADI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TyYiArA2_7Ax03yJzoNkH0T0TXOtZ7_HUtr0S4okfUJNRwx6NN76gbsIPCFbSwdQE1h0K8X0box-4CBc9o5QH4QZweU8Kvgj-1lEFAgu5Th5czCkzZ8uA87ARVfomFAr49A3xhVXargPNV=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TyYiArA2_7Ax03yJzoNkH0T0TXOtZ7_HUtr0S4okfUJNRwx6NN76gbsIPCFbSwdQE1h0K8X0box-4CBc9o5QH4QZweU8Kvgj-1lEFAgu5Th5czCkzZ8uA87ARVfomFAr49A3xhVXargPNV=s1600', false, 6, 'Diadème Housing - Appartements meublés à BONAMOUSSADI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RkgbBGe8YTx5It15SMi-b28ljRozk94ntRwVLnFUlw0_o1ckTnPIVjDMI7HPP0vIL61SVl8TjXVc9u6kqD-KqPOYPx9VMckM5ZHsQJXy78e4Su380kigyllWZU-WUZqUzwEPdgo7K5rLo=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RkgbBGe8YTx5It15SMi-b28ljRozk94ntRwVLnFUlw0_o1ckTnPIVjDMI7HPP0vIL61SVl8TjXVc9u6kqD-KqPOYPx9VMckM5ZHsQJXy78e4Su380kigyllWZU-WUZqUzwEPdgo7K5rLo=s1600', false, 7, 'Diadème Housing - Appartements meublés à BONAMOUSSADI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QhuQ9ql7ULSMwcrgjkpa9BzzsG7WuFRTN0NKwbnBRT9WMoxplx8mAIYQeYGv3Yxyg_NiTdM1j8i1sltOySisGYb3zbpuIm0fC6sB5-tVYPtnlo5CumLwSJNz1uPWAJjrwXUp4gbIIICwp8=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QhuQ9ql7ULSMwcrgjkpa9BzzsG7WuFRTN0NKwbnBRT9WMoxplx8mAIYQeYGv3Yxyg_NiTdM1j8i1sltOySisGYb3zbpuIm0fC6sB5-tVYPtnlo5CumLwSJNz1uPWAJjrwXUp4gbIIICwp8=s1600', false, 8, 'Diadème Housing - Appartements meublés à BONAMOUSSADI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TR2P-UCMq2LyG9N63sku_I3pYEqj_9yn5B_JRFTmJ_yqH7q8yNrko2gndPOkUFAAUXPyEfXLH2JiJrCPncPkx0uslWp6QibqXDexPE4iYIapCdUi1GTFaNldwsaj03yOt9MF9wMpplQN0=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TR2P-UCMq2LyG9N63sku_I3pYEqj_9yn5B_JRFTmJ_yqH7q8yNrko2gndPOkUFAAUXPyEfXLH2JiJrCPncPkx0uslWp6QibqXDexPE4iYIapCdUi1GTFaNldwsaj03yOt9MF9wMpplQN0=s1600', false, 9, 'Diadème Housing - Appartements meublés à BONAMOUSSADI')
  on conflict do nothing;

  -- [80] The studio bonamoussadi (Bonamoussadi)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'the-studio-bonamoussadi-bonamoussadi',
    'studio',
    'published',
    'The studio bonamoussadi',
    'The studio bonamoussadi
Catégorie : Studio de photographie.
Adresse : Douala.
Contact / WhatsApp : +237651963615.
Note Google Maps : 3.9/5 (110 avis).

Avis clients récents :
- "Note sans commentaire écrit." (catherine kamdom, note 4/5)
- "Note sans commentaire écrit." (Emilie NKOUE, note 4/5)
- "Note sans commentaire écrit." (Manuella Kevine Kouamo Ntekoh, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bonamoussadi'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0869659,
    9.7442115,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdV43hAHeHWxUI6bS5wqgCHuUV81FGcNpE2s6IIA56v8lxguS8s1qttDJTqU1Uu_I0bTVf4hsydcpnT-j0bjn5wJwNcOEaZ85QIJHmHxZpiOV5TKQZ7xqHi4jEI6Bbdkuo2GjJJtw=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdV43hAHeHWxUI6bS5wqgCHuUV81FGcNpE2s6IIA56v8lxguS8s1qttDJTqU1Uu_I0bTVf4hsydcpnT-j0bjn5wJwNcOEaZ85QIJHmHxZpiOV5TKQZ7xqHi4jEI6Bbdkuo2GjJJtw=s1600', true, 0, 'The studio bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdV43hAHeHWxUI6bS5wqgCHuUV81FGcNpE2s6IIA56v8lxguS8s1qttDJTqU1Uu_I0bTVf4hsydcpnT-j0bjn5wJwNcOEaZ85QIJHmHxZpiOV5TKQZ7xqHi4jEI6Bbdkuo2GjJJtw=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdV43hAHeHWxUI6bS5wqgCHuUV81FGcNpE2s6IIA56v8lxguS8s1qttDJTqU1Uu_I0bTVf4hsydcpnT-j0bjn5wJwNcOEaZ85QIJHmHxZpiOV5TKQZ7xqHi4jEI6Bbdkuo2GjJJtw=s1600-p-k-no', false, 1, 'The studio bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SPB1xMrN9vxQAB2KzWDrJtH6-POuaD7yxheQq_roajo0aPG5OHjZxr5gDiV5quZW96RU6UfznDUP6htQxPMfHGZux3CRJiaypq_pfibi-uTnEBOjaT_Tc6WEF6jgDLZHLIsoAoBw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SPB1xMrN9vxQAB2KzWDrJtH6-POuaD7yxheQq_roajo0aPG5OHjZxr5gDiV5quZW96RU6UfznDUP6htQxPMfHGZux3CRJiaypq_pfibi-uTnEBOjaT_Tc6WEF6jgDLZHLIsoAoBw=s1600', false, 2, 'The studio bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SQ1smghWnjjghXZ9zGjkXbWHaIyj7epew0NcSJTJ613eMzB1t-G_CAs_Mjgr8Gng80wI08jBBULIa2p2aDbt4DZH0S2SP38uFpp_mY1dKnJx_LwAvzSnH2Csgr2jIF1ng-howOFw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SQ1smghWnjjghXZ9zGjkXbWHaIyj7epew0NcSJTJ613eMzB1t-G_CAs_Mjgr8Gng80wI08jBBULIa2p2aDbt4DZH0S2SP38uFpp_mY1dKnJx_LwAvzSnH2Csgr2jIF1ng-howOFw=s1600', false, 3, 'The studio bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T-7iTAAV9edtVXR7FrQkQStxySuesLiCZovZZw7ysbwfNlRtiV6LiBMTuVJpLqV_jCgv4Rcmz72oKWYZuhQo7Xky-nIV4pyAzoEksEmJXhDZgIeAAUIMJZ8T8JLlnpZDUKxEFO=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T-7iTAAV9edtVXR7FrQkQStxySuesLiCZovZZw7ysbwfNlRtiV6LiBMTuVJpLqV_jCgv4Rcmz72oKWYZuhQo7Xky-nIV4pyAzoEksEmJXhDZgIeAAUIMJZ8T8JLlnpZDUKxEFO=s1600', false, 4, 'The studio bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QgZIx2iYmWLlMRR-Tu1Gl5FhuCGaE1K1IycomsTh9sFlOrA2SQ7oMXPbRirsFVlwK9Ard8F7nJYdxMVtqoNVR8xcsvGc95sJmwANo3fTeAPtoAaV5vr5fzx-JNKZdXOYz-aEMY=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QgZIx2iYmWLlMRR-Tu1Gl5FhuCGaE1K1IycomsTh9sFlOrA2SQ7oMXPbRirsFVlwK9Ard8F7nJYdxMVtqoNVR8xcsvGc95sJmwANo3fTeAPtoAaV5vr5fzx-JNKZdXOYz-aEMY=s1600', false, 5, 'The studio bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a-/ALV-UjWB48ycP43vo0l99ZTS_ofkhHRv6kqo0TPeIK5ELm8Fez5f2iU=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a-/ALV-UjWB48ycP43vo0l99ZTS_ofkhHRv6kqo0TPeIK5ELm8Fez5f2iU=s1600-p-k-no-mo', false, 6, 'The studio bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Td_0cxuhJ8qL1glOma9QzRQz2TvD9UHdd-G73Y_kZFDYG_s1rT9yAvs34XB_604Qgw3zGMKcXTzosQqqchQsyvhgTd4BOagtNq4hGGxAigkDUgt1AEdQSfCoyqBVwe-wI3GMumxg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Td_0cxuhJ8qL1glOma9QzRQz2TvD9UHdd-G73Y_kZFDYG_s1rT9yAvs34XB_604Qgw3zGMKcXTzosQqqchQsyvhgTd4BOagtNq4hGGxAigkDUgt1AEdQSfCoyqBVwe-wI3GMumxg=s1600', false, 7, 'The studio bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QhQxbQZV86AKUGfPn1nfTTSpeIek7jefiQFlG3WlNFDCKe83h5j3VD8ymp4W6dDltbISvVzqUiv3iXjIKPY64tC-Ld1mxZmeZuPVSr49qn0ynYQhVLi85uCCyexGufvXtuR40ZCg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QhQxbQZV86AKUGfPn1nfTTSpeIek7jefiQFlG3WlNFDCKe83h5j3VD8ymp4W6dDltbISvVzqUiv3iXjIKPY64tC-Ld1mxZmeZuPVSr49qn0ynYQhVLi85uCCyexGufvXtuR40ZCg=s1600', false, 8, 'The studio bonamoussadi')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QrJIj7QsKdOF5MT4qRtAlcOeIqCqUDISnhC63DH5YzueiGAOjbBPSOWdoPMq1M5l3cx4XDQYin50bpuRB6kFhzKvCP8APzlimlVbmpmmmkE8_c2rn1R3UElVvJY9hPW3LR9P3Y=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QrJIj7QsKdOF5MT4qRtAlcOeIqCqUDISnhC63DH5YzueiGAOjbBPSOWdoPMq1M5l3cx4XDQYin50bpuRB6kFhzKvCP8APzlimlVbmpmmmkE8_c2rn1R3UElVvJY9hPW3LR9P3Y=s1600', false, 9, 'The studio bonamoussadi')
  on conflict do nothing;

  -- [81] Aud'Meublé Logpom (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'aud-meuble-logpom-logpom',
    'apartment',
    'published',
    'Aud''Meublé Logpom',
    'Aud''Meublé Logpom
Adresse : 0, Douala.
Contact / WhatsApp : +237699880508.
Note Google Maps : 5/5 (2 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '0, Douala',
    4.0869558,
    9.7616325,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfZvd_jpIIeGHwKbvK4heuZ8LS5CSX6SgrLjSsjMTxqcWRpb98_bjibKcpSC4W-i6r-zFsyYs2rFIHf-INUKSAK5ed38agVieRWgxv43soS_2qIlmfgg1-HQJCR7dDkQEQWzaEyDKIoCGyD=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfZvd_jpIIeGHwKbvK4heuZ8LS5CSX6SgrLjSsjMTxqcWRpb98_bjibKcpSC4W-i6r-zFsyYs2rFIHf-INUKSAK5ed38agVieRWgxv43soS_2qIlmfgg1-HQJCR7dDkQEQWzaEyDKIoCGyD=s1600', true, 0, 'Aud''Meublé Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TrdL3HoaqMLir5UBzTXf82FQp0ZfNegZA_PHmgeW57-3GVWanXxmbGTrRxM1gkCSMiUDUxRvQjgtQdPiMKhNqkqb4fJ_xcc8TnkWyjQRRr2WEMkIProGWoDT3vneiPwrp2km6v8r6Yb8pN=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TrdL3HoaqMLir5UBzTXf82FQp0ZfNegZA_PHmgeW57-3GVWanXxmbGTrRxM1gkCSMiUDUxRvQjgtQdPiMKhNqkqb4fJ_xcc8TnkWyjQRRr2WEMkIProGWoDT3vneiPwrp2km6v8r6Yb8pN=s1600', false, 1, 'Aud''Meublé Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tsh35BHo1mrAwVprPOsaxsPQHt3YQqZKtVm3ZbwGd0yH8GBFa_kifeFJIIjFDFY6UgzqR1OIGikYeOFWFoMKutURrpytN8BFxQOYkPTz5Cd3hUnrYwhE5bSZHtvKVxmWRlWf4OnSezmEQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tsh35BHo1mrAwVprPOsaxsPQHt3YQqZKtVm3ZbwGd0yH8GBFa_kifeFJIIjFDFY6UgzqR1OIGikYeOFWFoMKutURrpytN8BFxQOYkPTz5Cd3hUnrYwhE5bSZHtvKVxmWRlWf4OnSezmEQ=s1600', false, 2, 'Aud''Meublé Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QudZdYoRHvjo1TTjoU4nSWX9X3-7K-qZIWPnJZ04qBJydlDsGdvsmw3GXz7frC8bPww939tUvkBWXcN9uxamu1TgOZgDMugDLUzdKvtho8SkbLoWoATAPA6oV3RhZ2OGJJHOflhywzXQ8G=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QudZdYoRHvjo1TTjoU4nSWX9X3-7K-qZIWPnJZ04qBJydlDsGdvsmw3GXz7frC8bPww939tUvkBWXcN9uxamu1TgOZgDMugDLUzdKvtho8SkbLoWoATAPA6oV3RhZ2OGJJHOflhywzXQ8G=s1600', false, 3, 'Aud''Meublé Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sne7KsSA1-GqpUXyuQZwB4QWY9qZUVqN7Lmkf7H4re56wnPOj85mdKQAQZ23A_Bl8K-_lLZlAWLK3ls9FdxoQ-lfWPdYW8NRB1PYjQSzZu3t3lcRZMmeqjuwbb8XYowOI0YZtHoC6EyiDa=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sne7KsSA1-GqpUXyuQZwB4QWY9qZUVqN7Lmkf7H4re56wnPOj85mdKQAQZ23A_Bl8K-_lLZlAWLK3ls9FdxoQ-lfWPdYW8NRB1PYjQSzZu3t3lcRZMmeqjuwbb8XYowOI0YZtHoC6EyiDa=s1600', false, 4, 'Aud''Meublé Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T6T-fe2jcvt3kCrHXLJysuOeebSyGVCMhC45PiMBEDnjOCF6rTwWAU5uYek63CgO1af66L_ts4MBpQ7pI4w5d_zYSWGjmu8Pfm2yny6V6F64jwlAgytMI1X3M9yKeIdVmvWjFXIJ_iwA4=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T6T-fe2jcvt3kCrHXLJysuOeebSyGVCMhC45PiMBEDnjOCF6rTwWAU5uYek63CgO1af66L_ts4MBpQ7pI4w5d_zYSWGjmu8Pfm2yny6V6F64jwlAgytMI1X3M9yKeIdVmvWjFXIJ_iwA4=s1600', false, 5, 'Aud''Meublé Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfZvd_jpIIeGHwKbvK4heuZ8LS5CSX6SgrLjSsjMTxqcWRpb98_bjibKcpSC4W-i6r-zFsyYs2rFIHf-INUKSAK5ed38agVieRWgxv43soS_2qIlmfgg1-HQJCR7dDkQEQWzaEyDKIoCGyD=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfZvd_jpIIeGHwKbvK4heuZ8LS5CSX6SgrLjSsjMTxqcWRpb98_bjibKcpSC4W-i6r-zFsyYs2rFIHf-INUKSAK5ed38agVieRWgxv43soS_2qIlmfgg1-HQJCR7dDkQEQWzaEyDKIoCGyD=s1600-p-k-no', false, 6, 'Aud''Meublé Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a/ACg8ocLa_s2Nz6mh7xaSmBEqJnTZdPAMa8onow53QSPsd7X5K5wuPA=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a/ACg8ocLa_s2Nz6mh7xaSmBEqJnTZdPAMa8onow53QSPsd7X5K5wuPA=s1600-p-k-no-mo', false, 7, 'Aud''Meublé Logpom')
  on conflict do nothing;

  -- [82] Belappart - Appartement Meublé Douala Logpom (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'belappart-appartement-meuble-douala-logpom-logpom',
    'apartment',
    'published',
    'Belappart - Appartement Meublé Douala Logpom',
    'Belappart - Appartement Meublé Douala Logpom
Catégorie : Complexe d''appartements meublés.
Adresse : Ecole Publique Logpom, Douala.
Contact / WhatsApp : +237680716222.
Note Google Maps : 5/5 (5 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Ludrilla Tsebabe Njadja, note 5/5)
- "Note sans commentaire écrit." (Jase - jasenomadetv, note 5/5)
- "Note sans commentaire écrit." (Marie Guems, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Ecole Publique Logpom, Douala',
    4.0875451,
    9.7677817,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLegNP13DKrLHEYRPnF7BBehkemx9zsyIM1aoZ4DkWyBVbl33BfloJ9VjAB8OB6BH5fGVeqmGt1d_1VjRzyZc3uFhMZcfXS4majpAnh3j-aXcWnwtt4OUBC7HKYda3ZZmTC0MqRb2A=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLegNP13DKrLHEYRPnF7BBehkemx9zsyIM1aoZ4DkWyBVbl33BfloJ9VjAB8OB6BH5fGVeqmGt1d_1VjRzyZc3uFhMZcfXS4majpAnh3j-aXcWnwtt4OUBC7HKYda3ZZmTC0MqRb2A=s1600', true, 0, 'Belappart - Appartement Meublé Douala Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLegNP13DKrLHEYRPnF7BBehkemx9zsyIM1aoZ4DkWyBVbl33BfloJ9VjAB8OB6BH5fGVeqmGt1d_1VjRzyZc3uFhMZcfXS4majpAnh3j-aXcWnwtt4OUBC7HKYda3ZZmTC0MqRb2A=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLegNP13DKrLHEYRPnF7BBehkemx9zsyIM1aoZ4DkWyBVbl33BfloJ9VjAB8OB6BH5fGVeqmGt1d_1VjRzyZc3uFhMZcfXS4majpAnh3j-aXcWnwtt4OUBC7HKYda3ZZmTC0MqRb2A=s1600-p-k-no', false, 1, 'Belappart - Appartement Meublé Douala Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QX-EPuqBvuijzzBqkks-saKXPzDdmiHqkZZF_SDGS3tmaBX6bAmYjnUJG1Ll2Tt_nyQ6lJS-hcw5DAU0wqinrKlFnT5etjf0XCtDKYI6z19Kn4sDjDHrIE2EbpcpuSzuVKKJTyxg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QX-EPuqBvuijzzBqkks-saKXPzDdmiHqkZZF_SDGS3tmaBX6bAmYjnUJG1Ll2Tt_nyQ6lJS-hcw5DAU0wqinrKlFnT5etjf0XCtDKYI6z19Kn4sDjDHrIE2EbpcpuSzuVKKJTyxg=s1600', false, 2, 'Belappart - Appartement Meublé Douala Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QplhEoyg0Rg_fgQVbtdGA4cbpIVsNHe3joV99QS-PuU9EQn7QqTiNpI8-rICUTWQmTUiqwhVCAJ4dlq3bwwUzYgS6Bqg8NuM_CqlnQR9spQWOecJLN-j5gNpvVDtFxjZp6zkqpBA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QplhEoyg0Rg_fgQVbtdGA4cbpIVsNHe3joV99QS-PuU9EQn7QqTiNpI8-rICUTWQmTUiqwhVCAJ4dlq3bwwUzYgS6Bqg8NuM_CqlnQR9spQWOecJLN-j5gNpvVDtFxjZp6zkqpBA=s1600', false, 3, 'Belappart - Appartement Meublé Douala Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RSkKGxWonHsWpKXn_n0_yjKQsYXvyDay01H37zpZStALvu94N1yzKRV-OzU_s_SRVK85Igvaxig69HDDGZTmsbCwiZ7sCGwFen4XyTU6ddW-1zmLhuQDZ1ojknjAfUvacW9kucew=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RSkKGxWonHsWpKXn_n0_yjKQsYXvyDay01H37zpZStALvu94N1yzKRV-OzU_s_SRVK85Igvaxig69HDDGZTmsbCwiZ7sCGwFen4XyTU6ddW-1zmLhuQDZ1ojknjAfUvacW9kucew=s1600', false, 4, 'Belappart - Appartement Meublé Douala Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TO7Uz0oMI3q11kRe12Xb2lB-kXkofbfN8xElstfZYb-cKtLDB7NEmqShgjPKC7XnWMk3ewQbdMCh4NmJX-3BUCsEck-l-SoWtFRYg4K-WFFbcroG2NO5O5QY6d4f28Mv4AhDW5=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TO7Uz0oMI3q11kRe12Xb2lB-kXkofbfN8xElstfZYb-cKtLDB7NEmqShgjPKC7XnWMk3ewQbdMCh4NmJX-3BUCsEck-l-SoWtFRYg4K-WFFbcroG2NO5O5QY6d4f28Mv4AhDW5=s1600', false, 5, 'Belappart - Appartement Meublé Douala Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TlqSfNRpAurC4VwxB4KQ75ljDMh9b02nbpLWwNxbZiamgCUDqLiCT4pjx67K5lfrDCLkdSHrcQdzczrqxPAzN33jBEoFx_c6kI0RsOiZm1QUeuvBTe5sTpg2niXrvo0emwfigf=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TlqSfNRpAurC4VwxB4KQ75ljDMh9b02nbpLWwNxbZiamgCUDqLiCT4pjx67K5lfrDCLkdSHrcQdzczrqxPAzN33jBEoFx_c6kI0RsOiZm1QUeuvBTe5sTpg2niXrvo0emwfigf=s1600', false, 6, 'Belappart - Appartement Meublé Douala Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a/ACg8ocJ2OWs9eitgrBVimO7dfrq00gPJr1wRere7R-ylWgCFi8NPYQ=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a/ACg8ocJ2OWs9eitgrBVimO7dfrq00gPJr1wRere7R-ylWgCFi8NPYQ=s1600-p-k-no-mo', false, 7, 'Belappart - Appartement Meublé Douala Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QTdelaAwja156AKMBwqlxjcERcUdQOYeO8_YArpE7WWwd8c6vybbd0Arklh--gUhcqWjPDvh5NDPcSPQJa0n8Vxy8h0lQybhxPLZjorV84kukaIqAZ-R8zo8hybzuK8rWkaLc=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QTdelaAwja156AKMBwqlxjcERcUdQOYeO8_YArpE7WWwd8c6vybbd0Arklh--gUhcqWjPDvh5NDPcSPQJa0n8Vxy8h0lQybhxPLZjorV84kukaIqAZ-R8zo8hybzuK8rWkaLc=s1600', false, 8, 'Belappart - Appartement Meublé Douala Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RulrokEWps2S12rRjE2TXbWobj2PUWU-KffRmHt5nzRBzAia2B7ZZyt606_Tn9nPQNSYkaLb0oGZ_hoTAgm_zH7EKunGe65yL15HjvhXK3H0EXJXT9Kowv7OMTpgDM_SS-ydVd=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RulrokEWps2S12rRjE2TXbWobj2PUWU-KffRmHt5nzRBzAia2B7ZZyt606_Tn9nPQNSYkaLb0oGZ_hoTAgm_zH7EKunGe65yL15HjvhXK3H0EXJXT9Kowv7OMTpgDM_SS-ydVd=s1600', false, 9, 'Belappart - Appartement Meublé Douala Logpom')
  on conflict do nothing;

  -- [83] Résidence Cristal Logpom (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-cristal-logpom-logpom',
    'apartment',
    'published',
    'Résidence Cristal Logpom',
    'Résidence Cristal Logpom
Adresse : situé à 200m du carrefour basson à Logpom, Résidence Cristal, Douala.
Contact / WhatsApp : +237692034084.
Note Google Maps : 4.2/5 (51 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'situé à 200m du carrefour basson à Logpom, Résidence Cristal, Douala',
    4.0797608,
    9.7737792,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdCE_wC6TXblHMaf4iqQNgi2KN0TrO499YJWOIjtzbaR4uyt7EYaHJw-z2wQROTzk6c3bbC6ZkddXP4FZm5a3Ij49IkQw6qCDI_d56yDP9JZUznfYBvf23eXdzlXAVurUfPJgI=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdCE_wC6TXblHMaf4iqQNgi2KN0TrO499YJWOIjtzbaR4uyt7EYaHJw-z2wQROTzk6c3bbC6ZkddXP4FZm5a3Ij49IkQw6qCDI_d56yDP9JZUznfYBvf23eXdzlXAVurUfPJgI=s1600', true, 0, 'Résidence Cristal Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdCE_wC6TXblHMaf4iqQNgi2KN0TrO499YJWOIjtzbaR4uyt7EYaHJw-z2wQROTzk6c3bbC6ZkddXP4FZm5a3Ij49IkQw6qCDI_d56yDP9JZUznfYBvf23eXdzlXAVurUfPJgI=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdCE_wC6TXblHMaf4iqQNgi2KN0TrO499YJWOIjtzbaR4uyt7EYaHJw-z2wQROTzk6c3bbC6ZkddXP4FZm5a3Ij49IkQw6qCDI_d56yDP9JZUznfYBvf23eXdzlXAVurUfPJgI=s1600-p-k-no', false, 1, 'Résidence Cristal Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tte4Jg0h0fjN4J6zT4B3BSDQyua4qSR5KJngfMfdWVHyZdq2LvhnbI1ye-0dT9bTcsZQ_YWUpKD15a7Nwf1MIPbfrkzXcSGNVGhWGDhRRIEbkk1gGrGVAqfNzZnK8vUTnpCzg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tte4Jg0h0fjN4J6zT4B3BSDQyua4qSR5KJngfMfdWVHyZdq2LvhnbI1ye-0dT9bTcsZQ_YWUpKD15a7Nwf1MIPbfrkzXcSGNVGhWGDhRRIEbkk1gGrGVAqfNzZnK8vUTnpCzg=s1600', false, 2, 'Résidence Cristal Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TSHjG0XvkfWpVzSx6sRXmTo-OLjz8mMWGDsOot6rOsLTpHS0IWoa4wlw-BBMPhCzoeIu7hLahkGo9M3_sNzTQQvCP-WDzkqT0-iD_gLJP4qob6tmB-CBY8geP24aNaWX_xnH0=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TSHjG0XvkfWpVzSx6sRXmTo-OLjz8mMWGDsOot6rOsLTpHS0IWoa4wlw-BBMPhCzoeIu7hLahkGo9M3_sNzTQQvCP-WDzkqT0-iD_gLJP4qob6tmB-CBY8geP24aNaWX_xnH0=s1600', false, 3, 'Résidence Cristal Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SyBSLQkZTksl815xpL8CtAJv_EoSptrF0Yc-CxRUmStRcl_zcw_vbg9BGh8QqzMgrR4_VJvMoh6OYcAM3_H9JohATdrm3FkEWm8Xbubqy98V0_IkPre5stpw27bUr7DOlEFas=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SyBSLQkZTksl815xpL8CtAJv_EoSptrF0Yc-CxRUmStRcl_zcw_vbg9BGh8QqzMgrR4_VJvMoh6OYcAM3_H9JohATdrm3FkEWm8Xbubqy98V0_IkPre5stpw27bUr7DOlEFas=s1600', false, 4, 'Résidence Cristal Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TInlCC52oyNjPucKq8sZGlllGJF6g3CxX9l1JrqEpojdNi9sJ_uTHmtXk7GAALi_gKiusyxsKdHGhIsTpSQ2fhmyd43Eg3ZDS5AR1Q4BgE5LOgIFSp1lIa2Qd9EAMCh0V2SpI=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TInlCC52oyNjPucKq8sZGlllGJF6g3CxX9l1JrqEpojdNi9sJ_uTHmtXk7GAALi_gKiusyxsKdHGhIsTpSQ2fhmyd43Eg3ZDS5AR1Q4BgE5LOgIFSp1lIa2Qd9EAMCh0V2SpI=s1600', false, 5, 'Résidence Cristal Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rql7Pk1B7ZkMdgRp1v9cXorL2KSqkLDCtQQnEHKUWQwSn8dVvgCz2cQhwp9eM8UufmRssWUriv6XBz_G6CrWvkgdduwUlDtIm_AUNWFY_arK_HNUmEITs65a49kAFIwEDemMarZQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rql7Pk1B7ZkMdgRp1v9cXorL2KSqkLDCtQQnEHKUWQwSn8dVvgCz2cQhwp9eM8UufmRssWUriv6XBz_G6CrWvkgdduwUlDtIm_AUNWFY_arK_HNUmEITs65a49kAFIwEDemMarZQ=s1600', false, 6, 'Résidence Cristal Logpom')
  on conflict do nothing;

  -- [84] Magnifique Appartement Meublé 1 Chambre, Cuisine, Salon, 2 Toilets - Douala Logpom - One-Bedroom Apartment (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'magnifique-appartement-meuble-1-chambre-cuisine-salon-2-toilets-douala-logp',
    'room',
    'published',
    'Magnifique Appartement Meublé 1 Chambre, Cuisine, Salon, 2 Toilets - Douala Logpom - One-Bedroom Apartment',
    'Magnifique Appartement Meublé 1 Chambre, Cuisine, Salon, 2 Toilets - Douala Logpom - One-Bedroom Apartment
Adresse : Douala.
Note Google Maps : 3.7/5 (0 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.08321,
    9.7673502,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2AbVXln8Cec5jIYtbVskDV_r5fL1kVSeJn0c_7ufnKoko10K_DKs8pP4X-dt4b8lQ1_mlxxXvd7MBCzyxBpy0DUQ5TQdPqi44djQh90O--vRynitcocNclBwUhOF1xf6oNXGcFJRx-JvxmO1FH75Moz3e2qwdmeCa779znvRrbfEvviU-9VXa1=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2AbVXln8Cec5jIYtbVskDV_r5fL1kVSeJn0c_7ufnKoko10K_DKs8pP4X-dt4b8lQ1_mlxxXvd7MBCzyxBpy0DUQ5TQdPqi44djQh90O--vRynitcocNclBwUhOF1xf6oNXGcFJRx-JvxmO1FH75Moz3e2qwdmeCa779znvRrbfEvviU-9VXa1=s1600', true, 0, 'Magnifique Appartement Meublé 1 Chambre, Cuisine, Salon, 2 Toilets - Douala Logpom - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2AbVXln8Cec5jIYtbVskDV_r5fL1kVSeJn0c_7ufnKoko10K_DKs8pP4X-dt4b8lQ1_mlxxXvd7MBCzyxBpy0DUQ5TQdPqi44djQh90O--vRynitcocNclBwUhOF1xf6oNXGcFJRx-JvxmO1FH75Moz3e2qwdmeCa779znvRrbfEvviU-9VXa1=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2AbVXln8Cec5jIYtbVskDV_r5fL1kVSeJn0c_7ufnKoko10K_DKs8pP4X-dt4b8lQ1_mlxxXvd7MBCzyxBpy0DUQ5TQdPqi44djQh90O--vRynitcocNclBwUhOF1xf6oNXGcFJRx-JvxmO1FH75Moz3e2qwdmeCa779znvRrbfEvviU-9VXa1=s1600-p-k-no', false, 1, 'Magnifique Appartement Meublé 1 Chambre, Cuisine, Salon, 2 Toilets - Douala Logpom - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhELfAw7khvmRY89GO_wHdMw2b4iT4HQgsxEpez19Ycq_thod8fHhuyhngxMJXvX1WFv3_g6sl7uMzDIC_SY09ecHWdPDrmIZHoLPjXbAi9Gfm129kjeG3Pvv5GQl34cT-0ARr8IJtaHOoXbklRRYQlZhNTzFEMdwxppj0Atpo4hk2p-FyZMj6VW=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhELfAw7khvmRY89GO_wHdMw2b4iT4HQgsxEpez19Ycq_thod8fHhuyhngxMJXvX1WFv3_g6sl7uMzDIC_SY09ecHWdPDrmIZHoLPjXbAi9Gfm129kjeG3Pvv5GQl34cT-0ARr8IJtaHOoXbklRRYQlZhNTzFEMdwxppj0Atpo4hk2p-FyZMj6VW=s1600', false, 2, 'Magnifique Appartement Meublé 1 Chambre, Cuisine, Salon, 2 Toilets - Douala Logpom - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFclYISjW_1mJbxymTOSIS8lDVkdKh17Vg5FuaqBnqFNkTBvKe_6CDj244hmT_WgZhqGpfxXkZXhlX_HCL-sGXRlZh_ErAC_oiMkKtkcOHyL7GFVdqI74EfwCl8_3ExldsIqpyF14BEKx01CDFmDeh6kRT2X6hhFTyzi35I5j-hr4B3zTdQgqWz=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFclYISjW_1mJbxymTOSIS8lDVkdKh17Vg5FuaqBnqFNkTBvKe_6CDj244hmT_WgZhqGpfxXkZXhlX_HCL-sGXRlZh_ErAC_oiMkKtkcOHyL7GFVdqI74EfwCl8_3ExldsIqpyF14BEKx01CDFmDeh6kRT2X6hhFTyzi35I5j-hr4B3zTdQgqWz=s1600', false, 3, 'Magnifique Appartement Meublé 1 Chambre, Cuisine, Salon, 2 Toilets - Douala Logpom - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGcYS07ERdSz_vA6xfIoBtxE2guM6mwnn9VpLuMvAOQCqcwYJCnPIrTO0gXrY1RbbVDNMV00Qga1nKi2o_gVQjyYEHtAUw17OUgg1V9at9qV9mN93v5DjNATeCFILn05z6273X29d2BwhjFobAQnbX7QdTr2nRnDTZ2Mk44G8BaY4aDX5FgVcRcKg=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGcYS07ERdSz_vA6xfIoBtxE2guM6mwnn9VpLuMvAOQCqcwYJCnPIrTO0gXrY1RbbVDNMV00Qga1nKi2o_gVQjyYEHtAUw17OUgg1V9at9qV9mN93v5DjNATeCFILn05z6273X29d2BwhjFobAQnbX7QdTr2nRnDTZ2Mk44G8BaY4aDX5FgVcRcKg=s1600', false, 4, 'Magnifique Appartement Meublé 1 Chambre, Cuisine, Salon, 2 Toilets - Douala Logpom - One-Bedroom Apartment')
  on conflict do nothing;

  -- [85] Meublés Douala MAKEPE- LOGPOM (Makepe)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'meubles-douala-makepe-logpom-makepe',
    'apartment',
    'published',
    'Meublés Douala MAKEPE- LOGPOM',
    'Meublés Douala MAKEPE- LOGPOM
Adresse : 0098, Douala.
Contact / WhatsApp : +237694195937.
Note Google Maps : 5/5 (3 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'makepe'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '0098, Douala',
    4.0853696,
    9.767969,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcNQlyNAnTgPvhlAJQoRuychPlwy8YLi-w252dzh1JTCc2OQzUt1_FnuqOIEYRIfvKlAb0Q_V0ynr5YPcf8xWHs_Vll4U0DZx0M5pi6vRUeAE0KS90tU0tDe80K_8s_yIy4e2o=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcNQlyNAnTgPvhlAJQoRuychPlwy8YLi-w252dzh1JTCc2OQzUt1_FnuqOIEYRIfvKlAb0Q_V0ynr5YPcf8xWHs_Vll4U0DZx0M5pi6vRUeAE0KS90tU0tDe80K_8s_yIy4e2o=s1600', true, 0, 'Meublés Douala MAKEPE- LOGPOM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcNQlyNAnTgPvhlAJQoRuychPlwy8YLi-w252dzh1JTCc2OQzUt1_FnuqOIEYRIfvKlAb0Q_V0ynr5YPcf8xWHs_Vll4U0DZx0M5pi6vRUeAE0KS90tU0tDe80K_8s_yIy4e2o=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcNQlyNAnTgPvhlAJQoRuychPlwy8YLi-w252dzh1JTCc2OQzUt1_FnuqOIEYRIfvKlAb0Q_V0ynr5YPcf8xWHs_Vll4U0DZx0M5pi6vRUeAE0KS90tU0tDe80K_8s_yIy4e2o=s1600-p-k-no', false, 1, 'Meublés Douala MAKEPE- LOGPOM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SFIXHKGd3Qgt0zW7O6O41Z_K4-H5jLhojt3QhUD7wre6JTNMM-QoZzNqSfgrcmlg92l8_JFctT0uYIkgpBrzIhZF-v2G5GH1bmIVA5_LObunHPiTSZ7ipw7AS1bAN-tINHvqE=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SFIXHKGd3Qgt0zW7O6O41Z_K4-H5jLhojt3QhUD7wre6JTNMM-QoZzNqSfgrcmlg92l8_JFctT0uYIkgpBrzIhZF-v2G5GH1bmIVA5_LObunHPiTSZ7ipw7AS1bAN-tINHvqE=s1600', false, 2, 'Meublés Douala MAKEPE- LOGPOM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QzMVaLgFMkWQjW1rsItV6B4Nu1KLFjAJ5Tig2iHtz1QrQy1Jpprtz6TvipFaWxNYtM9T_9IBTvpU_9ouM6ipKZG3jPQ1zghRgoBfAYXxhA_6x0mpWbEpzgkQGL1ppvfQZK6-hK=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QzMVaLgFMkWQjW1rsItV6B4Nu1KLFjAJ5Tig2iHtz1QrQy1Jpprtz6TvipFaWxNYtM9T_9IBTvpU_9ouM6ipKZG3jPQ1zghRgoBfAYXxhA_6x0mpWbEpzgkQGL1ppvfQZK6-hK=s1600', false, 3, 'Meublés Douala MAKEPE- LOGPOM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RDeS2srEzmwHzFLkV0bM-tTqtiSgfLQL3HRmkZsVvwLaSr4rIIzBdPR3XMPWfPnesVHzu_wUgTJvduU0eGjoORxPseFtyI81ZC-job00vh9NGbPXvXDKL8upxlAJswA5-0pENW=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RDeS2srEzmwHzFLkV0bM-tTqtiSgfLQL3HRmkZsVvwLaSr4rIIzBdPR3XMPWfPnesVHzu_wUgTJvduU0eGjoORxPseFtyI81ZC-job00vh9NGbPXvXDKL8upxlAJswA5-0pENW=s1600', false, 4, 'Meublés Douala MAKEPE- LOGPOM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T6hFUci7PVxEnNGnJJhEpA2FheVFxru2-FWiz8Qn3D40RQzfHAQlpXmkh3eP6LovmP9DdxFRxkydm5Fb5gCGxbGGEpsq8rGShyMGEqptA0c-FYY3z4gq8zfnY9yIyfoq32nK7O=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T6hFUci7PVxEnNGnJJhEpA2FheVFxru2-FWiz8Qn3D40RQzfHAQlpXmkh3eP6LovmP9DdxFRxkydm5Fb5gCGxbGGEpsq8rGShyMGEqptA0c-FYY3z4gq8zfnY9yIyfoq32nK7O=s1600', false, 5, 'Meublés Douala MAKEPE- LOGPOM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a/ACg8ocLQcGOCbezVcgqke5lxtnfsNaLl7qoQBhG24sxNA6f4645gcg=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a/ACg8ocLQcGOCbezVcgqke5lxtnfsNaLl7qoQBhG24sxNA6f4645gcg=s1600-p-k-no-mo', false, 6, 'Meublés Douala MAKEPE- LOGPOM')
  on conflict do nothing;

  -- [86] ✨️Résidence la Perle Douala-Logbessou ( appartement meublé) (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-la-perle-douala-logbessou-appartement-meuble-logpom',
    'apartment',
    'published',
    '✨️Résidence la Perle Douala-Logbessou ( appartement meublé)',
    '✨️Résidence la Perle Douala-Logbessou ( appartement meublé)
Catégorie : Complexe d''appartements meublés.
Adresse : 237, Douala.
Contact / WhatsApp : +237690164892.
Note Google Maps : 4.9/5 (31 avis).

Avis clients récents :
- "Note sans commentaire écrit." (THIERRY HYACINTHE, note 5/5)
- "Note sans commentaire écrit." (Lydia Fosso, note 5/5)
- "Note sans commentaire écrit." (Lince Jidjou, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '237, Douala',
    4.0869432,
    9.7746221,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeQSp6PRHUd_8-Pu4dyARBHg9jgYZ-if-XauRsKrw-PYfhYsvnsgyzza-kgQjL_359-glsvNwip4PGKbtaAhDUO7OTojaCAyETeWUGrKYdU1wgCIWaqS3VzQyuCotA19LVJ-8Uw0SNadsue=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeQSp6PRHUd_8-Pu4dyARBHg9jgYZ-if-XauRsKrw-PYfhYsvnsgyzza-kgQjL_359-glsvNwip4PGKbtaAhDUO7OTojaCAyETeWUGrKYdU1wgCIWaqS3VzQyuCotA19LVJ-8Uw0SNadsue=s1600', true, 0, '✨️Résidence la Perle Douala-Logbessou ( appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TEWzXhP73WkFAg9NA-gz9dRE3swReVkfrdE78-XNvyba3mCuuT6UOimeEPz0dR8vZ3xH1UR05oMrIPLPdF6efZkEs0P0gW0Y4ybbYk1fFvZrZoDeI4jG0K_58_rxhuH5uVVDfcrvkA7ZfS=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TEWzXhP73WkFAg9NA-gz9dRE3swReVkfrdE78-XNvyba3mCuuT6UOimeEPz0dR8vZ3xH1UR05oMrIPLPdF6efZkEs0P0gW0Y4ybbYk1fFvZrZoDeI4jG0K_58_rxhuH5uVVDfcrvkA7ZfS=s1600', false, 1, '✨️Résidence la Perle Douala-Logbessou ( appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SANcXaL396riUJC958Fbl6Os6piW2N5_PoSl9MEIZS2Cskhb-W14b7Ng3onvXuKH6YAcHfYuwBhoiJlMpVH3UXnbTznwVXdAm59YuqF4RfVRvFtqvpZFHJtJQp7UQkeXbWDbzXhDTNNuc=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SANcXaL396riUJC958Fbl6Os6piW2N5_PoSl9MEIZS2Cskhb-W14b7Ng3onvXuKH6YAcHfYuwBhoiJlMpVH3UXnbTznwVXdAm59YuqF4RfVRvFtqvpZFHJtJQp7UQkeXbWDbzXhDTNNuc=s1600', false, 2, '✨️Résidence la Perle Douala-Logbessou ( appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rvwv-tEuiGGY2R5KkElXEB_Jiyo9rzhBcoSEAZarxP0Zrz8zcKqC1N_7Jr7lFu8jrFuFeef01M2UUDS02wJilCMu7N99C67e4NezNeKJElxuhAy_QwF2BE3zWv9vaFZtspCTR3Et7gk7Pl=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rvwv-tEuiGGY2R5KkElXEB_Jiyo9rzhBcoSEAZarxP0Zrz8zcKqC1N_7Jr7lFu8jrFuFeef01M2UUDS02wJilCMu7N99C67e4NezNeKJElxuhAy_QwF2BE3zWv9vaFZtspCTR3Et7gk7Pl=s1600', false, 3, '✨️Résidence la Perle Douala-Logbessou ( appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SV75OD6FPVCnha0Bo2jtbgRUVDuxfkKR0EpM7lLVv9UulmbPO7m2f-ftCFyn0zi582tF5_Jhnr6RsP20CXgpcwoOWUyhcuPcAJPXJprRBpzIBUOEefhaL-SCx42jpsaKxb9K-h-IBogZeA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SV75OD6FPVCnha0Bo2jtbgRUVDuxfkKR0EpM7lLVv9UulmbPO7m2f-ftCFyn0zi582tF5_Jhnr6RsP20CXgpcwoOWUyhcuPcAJPXJprRBpzIBUOEefhaL-SCx42jpsaKxb9K-h-IBogZeA=s1600', false, 4, '✨️Résidence la Perle Douala-Logbessou ( appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Si267xE1qFspdZ447hWUi4-g5fACJQnAPfbmX0xK9ijk_KR-ycqDe3KyNMVJwv_1qnde38F3wiNKNhFvVpiY4Gq8R0P3Y9DYyVGhFBs9TK6VunaHfBdvMbtPf6P85-caU6RYkf=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Si267xE1qFspdZ447hWUi4-g5fACJQnAPfbmX0xK9ijk_KR-ycqDe3KyNMVJwv_1qnde38F3wiNKNhFvVpiY4Gq8R0P3Y9DYyVGhFBs9TK6VunaHfBdvMbtPf6P85-caU6RYkf=s1600', false, 5, '✨️Résidence la Perle Douala-Logbessou ( appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QFteHwzJDmyOG9U6b9FtpRGavrvhlw55LNiknnzeJmuMzo_V93FQyIdsxpBBp6m5wtk96yIEvVzZZ_kaQ2rsnW5n_B0cX5PxbGrFM0Z2BsffX3VeLzEE1UEBBSsyq_Plepy3DEp5MZ-4b_=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QFteHwzJDmyOG9U6b9FtpRGavrvhlw55LNiknnzeJmuMzo_V93FQyIdsxpBBp6m5wtk96yIEvVzZZ_kaQ2rsnW5n_B0cX5PxbGrFM0Z2BsffX3VeLzEE1UEBBSsyq_Plepy3DEp5MZ-4b_=s1600', false, 6, '✨️Résidence la Perle Douala-Logbessou ( appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeQSp6PRHUd_8-Pu4dyARBHg9jgYZ-if-XauRsKrw-PYfhYsvnsgyzza-kgQjL_359-glsvNwip4PGKbtaAhDUO7OTojaCAyETeWUGrKYdU1wgCIWaqS3VzQyuCotA19LVJ-8Uw0SNadsue=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeQSp6PRHUd_8-Pu4dyARBHg9jgYZ-if-XauRsKrw-PYfhYsvnsgyzza-kgQjL_359-glsvNwip4PGKbtaAhDUO7OTojaCAyETeWUGrKYdU1wgCIWaqS3VzQyuCotA19LVJ-8Uw0SNadsue=s1600-p-k-no', false, 7, '✨️Résidence la Perle Douala-Logbessou ( appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TXFSXAclNjFMcOw_GNIuixdZkiBEnRw45WWHrrgIr2oArVRvyVFfdsTzjcj4-qPmzjDihORkWW5b-2hreVWixNFoUwMAJK6WvP-oYmqpRz_skPhX7pJGs0PUyPmwzVP1lIRbEORk_JRCAm=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TXFSXAclNjFMcOw_GNIuixdZkiBEnRw45WWHrrgIr2oArVRvyVFfdsTzjcj4-qPmzjDihORkWW5b-2hreVWixNFoUwMAJK6WvP-oYmqpRz_skPhX7pJGs0PUyPmwzVP1lIRbEORk_JRCAm=s1600', false, 8, '✨️Résidence la Perle Douala-Logbessou ( appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RMcOUyCPk9ivX-JpJgm6uwU9rBg1Zr-narXL-KBjfvtl__LRsyoBjCzLb0SevKGIljcJsQUddkUhQmDbfnOiFPp6AQYCsxxRN4mwiL_OA10HH-xEMxB8euQes_V1NjlhAPZXATYfC03e0=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RMcOUyCPk9ivX-JpJgm6uwU9rBg1Zr-narXL-KBjfvtl__LRsyoBjCzLb0SevKGIljcJsQUddkUhQmDbfnOiFPp6AQYCsxxRN4mwiL_OA10HH-xEMxB8euQes_V1NjlhAPZXATYfC03e0=s1600', false, 9, '✨️Résidence la Perle Douala-Logbessou ( appartement meublé)')
  on conflict do nothing;

  -- [87] Appartement meublé Logpom Douala Cameroun (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-logpom-douala-cameroun-logpom',
    'apartment',
    'published',
    'Appartement meublé Logpom Douala Cameroun',
    'Appartement meublé Logpom Douala Cameroun
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0796442,
    9.7705527,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0LECONxg-ekRCCALZWt_HPafRX18HL5bILGTxS5F_pqmWo-_6gtaNetdSK4Sh3v5q1CXji6r7Rsbx5zEsh77cSGsMsDdk59P69hjel13hjJ5Bwwjbv8Q-GohbbXiuNrNBssp2CF5mEQZy2oNWWF27WCxd83O4tGlKfO_vB5utc16ApqJ9m2Dul=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0LECONxg-ekRCCALZWt_HPafRX18HL5bILGTxS5F_pqmWo-_6gtaNetdSK4Sh3v5q1CXji6r7Rsbx5zEsh77cSGsMsDdk59P69hjel13hjJ5Bwwjbv8Q-GohbbXiuNrNBssp2CF5mEQZy2oNWWF27WCxd83O4tGlKfO_vB5utc16ApqJ9m2Dul=s1600', true, 0, 'Appartement meublé Logpom Douala Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEBXF1rTA5SNgirxUHRzfBNTWkDMlQzANA343I68-5yAPmECrLLDOrD2Cpxev2sYlwfygMTM4nRTiY13t6qWJYRHpOvcv6LPNv61ZdZuxInD8wzuovyVjFwpSEh3KKyjP7UnPh_uhrAL4n2TSV03uahLNXltMxpFYjeeWw15KKkxhj5_DbJwZBj=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEBXF1rTA5SNgirxUHRzfBNTWkDMlQzANA343I68-5yAPmECrLLDOrD2Cpxev2sYlwfygMTM4nRTiY13t6qWJYRHpOvcv6LPNv61ZdZuxInD8wzuovyVjFwpSEh3KKyjP7UnPh_uhrAL4n2TSV03uahLNXltMxpFYjeeWw15KKkxhj5_DbJwZBj=s1600', false, 1, 'Appartement meublé Logpom Douala Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG-voVTqsIGIQvDc_GaRxqabiy6JfGwSwbtlva-150n36NBNQDsa-to54GBS5yduz3FvFYrvCJTqOXVnh8q5-FRKrKjadYhsCcNJnLIL3hmNw7-I1wElzAC2XAg7lZSFMlC-V9u7t0pH-ldE4qthBSOh7aOkNwek5yrcBXwby00Wzr85iRuzeYw=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG-voVTqsIGIQvDc_GaRxqabiy6JfGwSwbtlva-150n36NBNQDsa-to54GBS5yduz3FvFYrvCJTqOXVnh8q5-FRKrKjadYhsCcNJnLIL3hmNw7-I1wElzAC2XAg7lZSFMlC-V9u7t0pH-ldE4qthBSOh7aOkNwek5yrcBXwby00Wzr85iRuzeYw=s1600', false, 2, 'Appartement meublé Logpom Douala Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhF1t66e2HJ9dusGxOchPfJkdv2og_tQZuf2KMuUJf3aQ35WnbEFZ5MrOkvisKg7mkUf6rGp9r-ysrDVlH2caYiZ6Aqc7s5ghQ_7ZRwyL9YONhZVtUEh9TjHIs08sPeJIKHt1Cxvzx1NYpVvULwGaEocZ7fI958rZzvFjOopArptvfQo4s7hAHnq=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhF1t66e2HJ9dusGxOchPfJkdv2og_tQZuf2KMuUJf3aQ35WnbEFZ5MrOkvisKg7mkUf6rGp9r-ysrDVlH2caYiZ6Aqc7s5ghQ_7ZRwyL9YONhZVtUEh9TjHIs08sPeJIKHt1Cxvzx1NYpVvULwGaEocZ7fI958rZzvFjOopArptvfQo4s7hAHnq=s1600', false, 3, 'Appartement meublé Logpom Douala Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFVOChoCpJJt63T8dBLWi8zmizY2hkADYWXpRyZnGZfzHusmiACzQ7otdwE_ofNzPxKoNHLUtuzh_DVnnPBu4SawMjIs4hO7B3l7gc7dtI3iSHQ6CNPILVXrsQJIb2Y6ibOvRupA1Hen0rgAaPfnLm0xew1JokAA1N_KoxUAo-6xSH6z6jzawqveQ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFVOChoCpJJt63T8dBLWi8zmizY2hkADYWXpRyZnGZfzHusmiACzQ7otdwE_ofNzPxKoNHLUtuzh_DVnnPBu4SawMjIs4hO7B3l7gc7dtI3iSHQ6CNPILVXrsQJIb2Y6ibOvRupA1Hen0rgAaPfnLm0xew1JokAA1N_KoxUAo-6xSH6z6jzawqveQ=s1600', false, 4, 'Appartement meublé Logpom Douala Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGxGdNgw6olR7ds_wsPUjDpFWTHNYN_ArOTqH0iqun_KcMgP8qwUNWsixlF3sp9afvRPvULGIbCwNgexXwdWohU8Ip2bfLMOGk2SRfSnN0Dd2kTu-8O-vlwz0O8Pln1_JOkjjuxIaeOU4xXdlOL1pu11JhIZyKItmsJcjpTASzGbIexRvi_9jIS=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGxGdNgw6olR7ds_wsPUjDpFWTHNYN_ArOTqH0iqun_KcMgP8qwUNWsixlF3sp9afvRPvULGIbCwNgexXwdWohU8Ip2bfLMOGk2SRfSnN0Dd2kTu-8O-vlwz0O8Pln1_JOkjjuxIaeOU4xXdlOL1pu11JhIZyKItmsJcjpTASzGbIexRvi_9jIS=s1600', false, 5, 'Appartement meublé Logpom Douala Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0LECONxg-ekRCCALZWt_HPafRX18HL5bILGTxS5F_pqmWo-_6gtaNetdSK4Sh3v5q1CXji6r7Rsbx5zEsh77cSGsMsDdk59P69hjel13hjJ5Bwwjbv8Q-GohbbXiuNrNBssp2CF5mEQZy2oNWWF27WCxd83O4tGlKfO_vB5utc16ApqJ9m2Dul=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0LECONxg-ekRCCALZWt_HPafRX18HL5bILGTxS5F_pqmWo-_6gtaNetdSK4Sh3v5q1CXji6r7Rsbx5zEsh77cSGsMsDdk59P69hjel13hjJ5Bwwjbv8Q-GohbbXiuNrNBssp2CF5mEQZy2oNWWF27WCxd83O4tGlKfO_vB5utc16ApqJ9m2Dul=s1600-p-k-no', false, 6, 'Appartement meublé Logpom Douala Cameroun')
  on conflict do nothing;

  -- [88] RESIDENCE ISMERUYA (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-ismeruya-logpom',
    'apartment',
    'published',
    'RESIDENCE ISMERUYA',
    'RESIDENCE ISMERUYA
Catégorie : Résidence.
Adresse : 3QM6+P64, Douala.
Contact / WhatsApp : +237699279159.
Note Google Maps : 4.8/5 (8 avis).

Avis clients récents :
- "Note sans commentaire écrit." (VISIBILITY VY, note 5/5)
- "Note sans commentaire écrit." (Larissa Yebga, note 5/5)
- "Note sans commentaire écrit." (Blaise Kenmoe, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3QM6+P64, Douala',
    4.0842737,
    9.7605644,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeF9Uk6kvaggfFTxCH02DDdml4RAiVJpySiCPAV7JAPec4auB3znDaAT60M0S78ByYv7J5jXi7BxMEaveXoRnMqEaMYFLK1sz4cJXDO-3F8Lr45NHS9XmKI9IdvlSLIpP6q34KkSw=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeF9Uk6kvaggfFTxCH02DDdml4RAiVJpySiCPAV7JAPec4auB3znDaAT60M0S78ByYv7J5jXi7BxMEaveXoRnMqEaMYFLK1sz4cJXDO-3F8Lr45NHS9XmKI9IdvlSLIpP6q34KkSw=s1600', true, 0, 'RESIDENCE ISMERUYA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qq1EBTr6rdUS_EMGY367FS5J8tfEMpJKyAk4pnEPEqg_K2C2k6MP55q5rrDLCSbD_vFSMHag4AQ7m5dEHBK0EE1S6vEtivV2tQ2vfamRHedZuzrpaFOfOSikiG6_wGp79TNu6AiA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qq1EBTr6rdUS_EMGY367FS5J8tfEMpJKyAk4pnEPEqg_K2C2k6MP55q5rrDLCSbD_vFSMHag4AQ7m5dEHBK0EE1S6vEtivV2tQ2vfamRHedZuzrpaFOfOSikiG6_wGp79TNu6AiA=s1600', false, 1, 'RESIDENCE ISMERUYA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SzttPZUbdzM8OjudfHftsKA3i7TaBIoVL58u1qLHsXaPZIivcrWcOusPuSVdCkcbBmgrmOIIti1FeG5kKTa_Ktaj52dgzD0tYysRGHhrQM5iZgut_L8oOZwneDf3pv-I9T3DxzpQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SzttPZUbdzM8OjudfHftsKA3i7TaBIoVL58u1qLHsXaPZIivcrWcOusPuSVdCkcbBmgrmOIIti1FeG5kKTa_Ktaj52dgzD0tYysRGHhrQM5iZgut_L8oOZwneDf3pv-I9T3DxzpQ=s1600', false, 2, 'RESIDENCE ISMERUYA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q5jiTVLRiCaSazKoSu6n9b_YvZ2IpGrgp2EgUNfY61mABr5L3ME1CMrSaZ1i8ypjse3end-AvoTFXc-qarsoQ6ycpnxHcCSbjOHwaqnR77caCYUE_uLNL4sK2c4ydj3BoqgzSX=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q5jiTVLRiCaSazKoSu6n9b_YvZ2IpGrgp2EgUNfY61mABr5L3ME1CMrSaZ1i8ypjse3end-AvoTFXc-qarsoQ6ycpnxHcCSbjOHwaqnR77caCYUE_uLNL4sK2c4ydj3BoqgzSX=s1600', false, 3, 'RESIDENCE ISMERUYA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TO69RbRNV7Jt5SKrhUe3-BAuDeF0ZLGnkM2ARXG0TlZc4JwgQtX2yeUf4MRUIX0FLLK0ec-hilXd1ARCzX1Nq5cdAxXzaNrD5vxRI--FLxUz6RdZikV-QLd1UrdBaPzx-hf7gNAg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TO69RbRNV7Jt5SKrhUe3-BAuDeF0ZLGnkM2ARXG0TlZc4JwgQtX2yeUf4MRUIX0FLLK0ec-hilXd1ARCzX1Nq5cdAxXzaNrD5vxRI--FLxUz6RdZikV-QLd1UrdBaPzx-hf7gNAg=s1600', false, 4, 'RESIDENCE ISMERUYA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T7ieWj3Mx_oC7Nb6Shv3Io83iMEdea9V6idNsGDGXeL7xOs9LuuKK6Z7UM2DXkSylNuRAjFr8Vh8dh1-35Kzfxt7tADfMP8qFEsnxy3vjh69zZ6ErWJeMgl78AsnO4iW_6zj9T=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T7ieWj3Mx_oC7Nb6Shv3Io83iMEdea9V6idNsGDGXeL7xOs9LuuKK6Z7UM2DXkSylNuRAjFr8Vh8dh1-35Kzfxt7tADfMP8qFEsnxy3vjh69zZ6ErWJeMgl78AsnO4iW_6zj9T=s1600', false, 5, 'RESIDENCE ISMERUYA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeF9Uk6kvaggfFTxCH02DDdml4RAiVJpySiCPAV7JAPec4auB3znDaAT60M0S78ByYv7J5jXi7BxMEaveXoRnMqEaMYFLK1sz4cJXDO-3F8Lr45NHS9XmKI9IdvlSLIpP6q34KkSw=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeF9Uk6kvaggfFTxCH02DDdml4RAiVJpySiCPAV7JAPec4auB3znDaAT60M0S78ByYv7J5jXi7BxMEaveXoRnMqEaMYFLK1sz4cJXDO-3F8Lr45NHS9XmKI9IdvlSLIpP6q34KkSw=s1600-p-k-no', false, 6, 'RESIDENCE ISMERUYA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a-/ALV-UjUUeOD3NlfZJnbwQZE8Pxum_gQu5Bxw-NWVl6SbaIZF3ZI20jlGSA=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a-/ALV-UjUUeOD3NlfZJnbwQZE8Pxum_gQu5Bxw-NWVl6SbaIZF3ZI20jlGSA=s1600-p-k-no-mo', false, 7, 'RESIDENCE ISMERUYA')
  on conflict do nothing;

  -- [89] Appartement meublé Logpom Douala Cameroun - Two-Bedroom Apartment (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-logpom-douala-cameroun-two-bedroom-apartment-logpom',
    'room',
    'published',
    'Appartement meublé Logpom Douala Cameroun - Two-Bedroom Apartment',
    'Appartement meublé Logpom Douala Cameroun - Two-Bedroom Apartment
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0796399,
    9.7705498,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1ZL4Hb5w-Wz_Ix6tZXV9nDAbqg68xIANnO_qkZzf3nT6gtcu-Iq_xEba25n7IfkXLfPF9cWRAdlOXCq9VNxly9O7xzRy2-FS1V9ySZhXVzVS4msFeLHO8pedptGVSYS1meNOdhNB84ayZVmCdNLX-GO8Ens3zaK7F8kJG-r-46x_bbMPKWJH1l=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1ZL4Hb5w-Wz_Ix6tZXV9nDAbqg68xIANnO_qkZzf3nT6gtcu-Iq_xEba25n7IfkXLfPF9cWRAdlOXCq9VNxly9O7xzRy2-FS1V9ySZhXVzVS4msFeLHO8pedptGVSYS1meNOdhNB84ayZVmCdNLX-GO8Ens3zaK7F8kJG-r-46x_bbMPKWJH1l=s1600', true, 0, 'Appartement meublé Logpom Douala Cameroun - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGTmXfXNCaVFdaj4wxNHNhLqqFM7R851xOhLTCXM_QM3qHtQKq3OrqLbvUHbr_MxgNIDWUkQk_9T-COPHT8H4Mz9JXfSMCM1usC-ihcgj6mQbVSNAbc8EKNePz40UrNt5kh0LuRDlM2hBlU9lWvBsZcqTAmvYltQnU4PIlesWGcFa-aSIvMFGzD=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGTmXfXNCaVFdaj4wxNHNhLqqFM7R851xOhLTCXM_QM3qHtQKq3OrqLbvUHbr_MxgNIDWUkQk_9T-COPHT8H4Mz9JXfSMCM1usC-ihcgj6mQbVSNAbc8EKNePz40UrNt5kh0LuRDlM2hBlU9lWvBsZcqTAmvYltQnU4PIlesWGcFa-aSIvMFGzD=s1600', false, 1, 'Appartement meublé Logpom Douala Cameroun - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFocBRPPoEpxdHYQ6MjoBLnFUunsuuorSrbG19gCPZaYlmCPPjm2PxJP3iO7W13Tf7A0vejpsNrnnKdMhg3hL-fqrAL6_nsw8fyHPi6SbYMWWdb4ZHm86AsAaUnBkalzGHFzzC3N_HQR9hzKuLb1IQABRP8FoxSpfax75CVnFhTd9kc-YvpiEpo=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFocBRPPoEpxdHYQ6MjoBLnFUunsuuorSrbG19gCPZaYlmCPPjm2PxJP3iO7W13Tf7A0vejpsNrnnKdMhg3hL-fqrAL6_nsw8fyHPi6SbYMWWdb4ZHm86AsAaUnBkalzGHFzzC3N_HQR9hzKuLb1IQABRP8FoxSpfax75CVnFhTd9kc-YvpiEpo=s1600', false, 2, 'Appartement meublé Logpom Douala Cameroun - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEagmPuwhQ8yLnaUHg_Ro3YGB5-DjOqIFZTK5eO5slKpYCRs66E-Wuh_1PBFqCGcRm01ggWYBfxr_UizN0vlUmTRAQ-RpUIBxFtszOhSgD27d8HIzpppwxrEYmffltM_a20uAJrNn9zFWVRSzG0Tw84BOZPYmyQzNaFo3sbchyx7lBgEBUk7NKgjQ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEagmPuwhQ8yLnaUHg_Ro3YGB5-DjOqIFZTK5eO5slKpYCRs66E-Wuh_1PBFqCGcRm01ggWYBfxr_UizN0vlUmTRAQ-RpUIBxFtszOhSgD27d8HIzpppwxrEYmffltM_a20uAJrNn9zFWVRSzG0Tw84BOZPYmyQzNaFo3sbchyx7lBgEBUk7NKgjQ=s1600', false, 3, 'Appartement meublé Logpom Douala Cameroun - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEKtBAbOmJsNlcwU7eBbK6RcKziZOEok1xNCkup3yNJ3CqgPksME38d5EF51VSVIk-5GxhiNrYzKDzagsUQiH4pgyijTe0Qf1XOHxQUim578ZHZmpc7igoq4-ZfQEQ34KKgsDDle4SQLPQ9ufnOL-6jHBZgM0TZih4PAHMz8aYQK6hqAqyEf93t6w=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEKtBAbOmJsNlcwU7eBbK6RcKziZOEok1xNCkup3yNJ3CqgPksME38d5EF51VSVIk-5GxhiNrYzKDzagsUQiH4pgyijTe0Qf1XOHxQUim578ZHZmpc7igoq4-ZfQEQ34KKgsDDle4SQLPQ9ufnOL-6jHBZgM0TZih4PAHMz8aYQK6hqAqyEf93t6w=s1600', false, 4, 'Appartement meublé Logpom Douala Cameroun - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHNSmebb46SUDSzdkYySfphTqj29SQY_Ak0QqbkfwS1F6OQ2MFbCaQYPsF7caIwjBZiAq4CRRMgjor-aA2Ly2_AhNqLO7wNmZyU5iA7TG2TmCnRDg5yjMHSKPhM3RdyYJF9GM2jvYO2U2AFjABTHQqQ0TGjVdy7sGHDAwV1QDgXF3cq-gIMzMyySA=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHNSmebb46SUDSzdkYySfphTqj29SQY_Ak0QqbkfwS1F6OQ2MFbCaQYPsF7caIwjBZiAq4CRRMgjor-aA2Ly2_AhNqLO7wNmZyU5iA7TG2TmCnRDg5yjMHSKPhM3RdyYJF9GM2jvYO2U2AFjABTHQqQ0TGjVdy7sGHDAwV1QDgXF3cq-gIMzMyySA=s1600', false, 5, 'Appartement meublé Logpom Douala Cameroun - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1ZL4Hb5w-Wz_Ix6tZXV9nDAbqg68xIANnO_qkZzf3nT6gtcu-Iq_xEba25n7IfkXLfPF9cWRAdlOXCq9VNxly9O7xzRy2-FS1V9ySZhXVzVS4msFeLHO8pedptGVSYS1meNOdhNB84ayZVmCdNLX-GO8Ens3zaK7F8kJG-r-46x_bbMPKWJH1l=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1ZL4Hb5w-Wz_Ix6tZXV9nDAbqg68xIANnO_qkZzf3nT6gtcu-Iq_xEba25n7IfkXLfPF9cWRAdlOXCq9VNxly9O7xzRy2-FS1V9ySZhXVzVS4msFeLHO8pedptGVSYS1meNOdhNB84ayZVmCdNLX-GO8Ens3zaK7F8kJG-r-46x_bbMPKWJH1l=s1600-p-k-no', false, 6, 'Appartement meublé Logpom Douala Cameroun - Two-Bedroom Apartment')
  on conflict do nothing;

  -- [90] LAJOH Residence - Appartements Meublés, Ndogbong (Ndogbong)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'lajoh-residence-appartements-meubles-ndogbong-ndogbong',
    'apartment',
    'published',
    'LAJOH Residence - Appartements Meublés, Ndogbong',
    'LAJOH Residence - Appartements Meublés, Ndogbong
Catégorie : Résidence hôtelière.
Adresse : Carrefour Zachmann, Ndogbong, Douala.
Contact / WhatsApp : +237690898005.
Note Google Maps : 4.8/5 (4 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Junior Ngouana, note 4/5)
- "Note sans commentaire écrit." (Berthe Mamdjowe, note 5/5)
- "Note sans commentaire écrit." (Orely Christiane Magoun, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'ndogbong'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Carrefour Zachmann, Ndogbong, Douala',
    4.0551898,
    9.7485224,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfkY2XF_0z7F5xjwPKI5u-6hL8JX4GA8lV4f1ek7noQnEclGY2p30L61OmUMDmkrrAfviIMsHpDshEWHBMUQ1cRcn5mksR-IRbBCedii6eZj4WubhfyEnrslxweQENS0Mma_56FtBRKzQ2t=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfkY2XF_0z7F5xjwPKI5u-6hL8JX4GA8lV4f1ek7noQnEclGY2p30L61OmUMDmkrrAfviIMsHpDshEWHBMUQ1cRcn5mksR-IRbBCedii6eZj4WubhfyEnrslxweQENS0Mma_56FtBRKzQ2t=s1600', true, 0, 'LAJOH Residence - Appartements Meublés, Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfkY2XF_0z7F5xjwPKI5u-6hL8JX4GA8lV4f1ek7noQnEclGY2p30L61OmUMDmkrrAfviIMsHpDshEWHBMUQ1cRcn5mksR-IRbBCedii6eZj4WubhfyEnrslxweQENS0Mma_56FtBRKzQ2t=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfkY2XF_0z7F5xjwPKI5u-6hL8JX4GA8lV4f1ek7noQnEclGY2p30L61OmUMDmkrrAfviIMsHpDshEWHBMUQ1cRcn5mksR-IRbBCedii6eZj4WubhfyEnrslxweQENS0Mma_56FtBRKzQ2t=s1600-p-k-no', false, 1, 'LAJOH Residence - Appartements Meublés, Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qe9YDcffrYFdV0NySGFVIu728Pn61ChlLa_XBA7HC09h_XGeuNZpQQUqJxSrJC9RKryJkQHkGTgxruSL_BTWKy9VY_3gJzGpT95Tx75OvxbjUnU-dCScxFqnOeAG2A-NyWB8h-viv5kjNu=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qe9YDcffrYFdV0NySGFVIu728Pn61ChlLa_XBA7HC09h_XGeuNZpQQUqJxSrJC9RKryJkQHkGTgxruSL_BTWKy9VY_3gJzGpT95Tx75OvxbjUnU-dCScxFqnOeAG2A-NyWB8h-viv5kjNu=s1600', false, 2, 'LAJOH Residence - Appartements Meublés, Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T6krvdrNkIJYWNMbMEO48w3DsoNL9z7QvoZ34I6J6ydU9OZslbzftdJI4C2LIGw1eF2GttlG2HwX1WJLRmdgABufiMIUiI2VkCGO78ve-ejGKgyBnPk2RaSLcsdzpSuXDBh14ip9Mjd38=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T6krvdrNkIJYWNMbMEO48w3DsoNL9z7QvoZ34I6J6ydU9OZslbzftdJI4C2LIGw1eF2GttlG2HwX1WJLRmdgABufiMIUiI2VkCGO78ve-ejGKgyBnPk2RaSLcsdzpSuXDBh14ip9Mjd38=s1600', false, 3, 'LAJOH Residence - Appartements Meublés, Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TXXGm9DtukFs4rXvRCaHpnKHWgCsqZYZ7QgdsBD4ucKggw5MhQxoLIqiLhjTp0YONdfKnfPORHhQHgTHUWYA9c6k9Kjeb2CE9-KhS8IDVkE-7s2t0Qn3CGc2JzbLvF1uVoefPY7ow69fQk=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TXXGm9DtukFs4rXvRCaHpnKHWgCsqZYZ7QgdsBD4ucKggw5MhQxoLIqiLhjTp0YONdfKnfPORHhQHgTHUWYA9c6k9Kjeb2CE9-KhS8IDVkE-7s2t0Qn3CGc2JzbLvF1uVoefPY7ow69fQk=s1600', false, 4, 'LAJOH Residence - Appartements Meublés, Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a-/ALV-UjVubQznZvPgBts_3RE-RbuqDnrx5LXJ1lRma6UWB95SgvTTDj8=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a-/ALV-UjVubQznZvPgBts_3RE-RbuqDnrx5LXJ1lRma6UWB95SgvTTDj8=s1600-p-k-no-mo', false, 5, 'LAJOH Residence - Appartements Meublés, Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SHH871nmovgBdWBsGMLVSzoW-0jv2Ow1FvI6m3h1gUoHS0MWKyuZSk8zwbPYUbN1SycZ2bDCG2zFBeZUmQ8mMnAisUxssgSeCgb3pv1N63MLUu64tQthquV2EiCiZfouWJ38QRgZwdoFyi=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SHH871nmovgBdWBsGMLVSzoW-0jv2Ow1FvI6m3h1gUoHS0MWKyuZSk8zwbPYUbN1SycZ2bDCG2zFBeZUmQ8mMnAisUxssgSeCgb3pv1N63MLUu64tQthquV2EiCiZfouWJ38QRgZwdoFyi=s1600', false, 6, 'LAJOH Residence - Appartements Meublés, Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q7HyxisW7Rb9CzW2LYfccs-qy8QTWXI-FMBTSoNJICV8ppwX4tU1nBsKKrwYFfKqNL-oEvouUEghhsIjiQ8SE1I1QCCyPIRt4OhSfmm_tyn2WH1pvUrmCOjeaQbwe1PFvIhqPJSv91HfyM=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q7HyxisW7Rb9CzW2LYfccs-qy8QTWXI-FMBTSoNJICV8ppwX4tU1nBsKKrwYFfKqNL-oEvouUEghhsIjiQ8SE1I1QCCyPIRt4OhSfmm_tyn2WH1pvUrmCOjeaQbwe1PFvIhqPJSv91HfyM=s1600', false, 7, 'LAJOH Residence - Appartements Meublés, Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QQMCU3os-ednj2yPBPdQ5D3UrAoiE17KjnCoZiBQbb7HJoFWpY0sukv_f3NU0mKNUOSXgZbVeR9qmKfwzkROxTDI1WkrIcu76mGFWbKJIYGB5zpbOWq4sWGfHCIOz767tZY1gS6USqw6k=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QQMCU3os-ednj2yPBPdQ5D3UrAoiE17KjnCoZiBQbb7HJoFWpY0sukv_f3NU0mKNUOSXgZbVeR9qmKfwzkROxTDI1WkrIcu76mGFWbKJIYGB5zpbOWq4sWGfHCIOz767tZY1gS6USqw6k=s1600', false, 8, 'LAJOH Residence - Appartements Meublés, Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TQJMekf38Yx-uakw9Ie1flUURfphgrNCxjhZKCX6WWX-un9vfNuXRw7bITmjz6Si_CGAFedrPyUgwPXIQ2Uq9v4w2N_S3IAv-BAslcOYDCenuodag4pM-bH0RGf_ivv4D3QI1sx107t5u8=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TQJMekf38Yx-uakw9Ie1flUURfphgrNCxjhZKCX6WWX-un9vfNuXRw7bITmjz6Si_CGAFedrPyUgwPXIQ2Uq9v4w2N_S3IAv-BAslcOYDCenuodag4pM-bH0RGf_ivv4D3QI1sx107t5u8=s1600', false, 9, 'LAJOH Residence - Appartements Meublés, Ndogbong')
  on conflict do nothing;

  -- [91] Logpom (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'logpom-logpom',
    'apartment',
    'published',
    'Logpom',
    'Logpom',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Logpom',
    4.0837996,
    9.770657,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdOpvliQKDVJ-n86PffYYsmrq14652ga21fuG9_v0WkF5q7ajTV7WpnWFLk3M9ixC0aoe-lQHpqY9Z6Q-B1gVPI6MNc_uLmTHlkPgzrpeYwnhQXSzbJC-GSbVWA6BliV2P4FQBk=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdOpvliQKDVJ-n86PffYYsmrq14652ga21fuG9_v0WkF5q7ajTV7WpnWFLk3M9ixC0aoe-lQHpqY9Z6Q-B1gVPI6MNc_uLmTHlkPgzrpeYwnhQXSzbJC-GSbVWA6BliV2P4FQBk=s1600', true, 0, 'Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TpU-TGE8QUOTtBXHfugxSiRBR39D98brDdCGYFotF86ZiOz0FqmDOrF1KCC2buXt9hO3cIGY5w5Bhq0b3oC6U8XkIm6oN-Ieu_j5ieM_DZQICL64mZYO1SowvfbEp_deFeCpEV=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TpU-TGE8QUOTtBXHfugxSiRBR39D98brDdCGYFotF86ZiOz0FqmDOrF1KCC2buXt9hO3cIGY5w5Bhq0b3oC6U8XkIm6oN-Ieu_j5ieM_DZQICL64mZYO1SowvfbEp_deFeCpEV=s1600', false, 1, 'Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R5_60VwffFt9qPD9tc_5uCpOgazAzPe8TxLXez8hdaodJgGf5u3Lw5oYR7njHUXsN0-5ZwEiAd-LY5o0FfuqQ3rRrp5kbwIg81yDUWcdeq69rbiSY8043xMnCjOJX_vr_pUvyy=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R5_60VwffFt9qPD9tc_5uCpOgazAzPe8TxLXez8hdaodJgGf5u3Lw5oYR7njHUXsN0-5ZwEiAd-LY5o0FfuqQ3rRrp5kbwIg81yDUWcdeq69rbiSY8043xMnCjOJX_vr_pUvyy=s1600', false, 2, 'Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tr4NQZXNJ1c3zfOfVwDYTqCZv9CKNLOtRjOfHIzM2gAgN6FPoNiTId5ColZkrNMmnztwki5JsjnWQpGkMTFGCT96cCx23dAFRNhFr5Qd0xabyLscdVysX6yAQhY554ts3xU0bkMg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tr4NQZXNJ1c3zfOfVwDYTqCZv9CKNLOtRjOfHIzM2gAgN6FPoNiTId5ColZkrNMmnztwki5JsjnWQpGkMTFGCT96cCx23dAFRNhFr5Qd0xabyLscdVysX6yAQhY554ts3xU0bkMg=s1600', false, 3, 'Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q9q2mVapzYKnbjGc1KVeMJXXnD7Q0dc422PaeUFGQvI5n5FF028NyXZ3Ks_ua0JN-NddPIDJt5LHmPpZ_KH3HE3DMTxqi03AubH9YOdG0kI1ghRbV95Sy4TgBbKhKKYyH-Q9GD=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q9q2mVapzYKnbjGc1KVeMJXXnD7Q0dc422PaeUFGQvI5n5FF028NyXZ3Ks_ua0JN-NddPIDJt5LHmPpZ_KH3HE3DMTxqi03AubH9YOdG0kI1ghRbV95Sy4TgBbKhKKYyH-Q9GD=s1600', false, 4, 'Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdOpvliQKDVJ-n86PffYYsmrq14652ga21fuG9_v0WkF5q7ajTV7WpnWFLk3M9ixC0aoe-lQHpqY9Z6Q-B1gVPI6MNc_uLmTHlkPgzrpeYwnhQXSzbJC-GSbVWA6BliV2P4FQBk=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdOpvliQKDVJ-n86PffYYsmrq14652ga21fuG9_v0WkF5q7ajTV7WpnWFLk3M9ixC0aoe-lQHpqY9Z6Q-B1gVPI6MNc_uLmTHlkPgzrpeYwnhQXSzbJC-GSbVWA6BliV2P4FQBk=s1600-p-k-no', false, 5, 'Logpom')
  on conflict do nothing;

  -- [92] 237Residency (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    '237residency-logpom',
    'apartment',
    'published',
    '237Residency',
    '237Residency
Catégorie : Complexe d''appartements meublés.
Adresse : 4.080406, 9 773634, Douala.
Contact / WhatsApp : +237654530250.
Note Google Maps : 4.9/5 (7 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Yolene Ng, note 5/5)
- "Note sans commentaire écrit." (Derlin Ngayap, note 4/5)
- "Note sans commentaire écrit." (Prosper Songmo, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '4.080406, 9 773634, Douala',
    4.0803457,
    9.7736813,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdiVUJTJmLhrEwZWwT6idtLWnSaTAkvJwjKigntC-GO0OfAMk7tiJ4niICBr5htVXxLe3a30rP8fjLUv5L6JpDVgxr6Ls3GNqhCZPVCD1cP86fUNGu36f5-mzNByNLFmQ3ZZjN_47GfURCD=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdiVUJTJmLhrEwZWwT6idtLWnSaTAkvJwjKigntC-GO0OfAMk7tiJ4niICBr5htVXxLe3a30rP8fjLUv5L6JpDVgxr6Ls3GNqhCZPVCD1cP86fUNGu36f5-mzNByNLFmQ3ZZjN_47GfURCD=s1600', true, 0, '237Residency')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QXyR9-ae_qMXgpqvFbPJ3ht76VNBQp7n9ZiZkF14_FOM5Axkl288cpkpVnTVYFQtkSSclJMZsOXoXJaqMU4lJWfyHNHQU6FCq1i3Q6d_z6vnOFIQtuXJilRtT0CRu9KdMPtQIOPv5ufwR4=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QXyR9-ae_qMXgpqvFbPJ3ht76VNBQp7n9ZiZkF14_FOM5Axkl288cpkpVnTVYFQtkSSclJMZsOXoXJaqMU4lJWfyHNHQU6FCq1i3Q6d_z6vnOFIQtuXJilRtT0CRu9KdMPtQIOPv5ufwR4=s1600', false, 1, '237Residency')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T3TSLgb2GFqBJA2BWM8oMs8lR_XBD0KAemdS1fRzVapwjIX5LfZBNAvZrLYHCae6ifDzqTFG44ZBaCyR7lS4JZoeKnMEXIuhd7jNhqqpDXav7RPj3gS9dZIipPmnel24-JKOzl7WWiO-yF=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T3TSLgb2GFqBJA2BWM8oMs8lR_XBD0KAemdS1fRzVapwjIX5LfZBNAvZrLYHCae6ifDzqTFG44ZBaCyR7lS4JZoeKnMEXIuhd7jNhqqpDXav7RPj3gS9dZIipPmnel24-JKOzl7WWiO-yF=s1600', false, 2, '237Residency')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QmSwO83ntbYLqGQZQMVOcY5XHERHqrYYeS_aRoL6OPy4CJxuJJ4XiLJFcf_EhyojO4eJmrA-HSI5aFlzfsaufTtz7DN5Fgm5pivEHuBptaSq5LrzNRx9MHBOIebt_xuliiiqJgGlSL2VNy=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QmSwO83ntbYLqGQZQMVOcY5XHERHqrYYeS_aRoL6OPy4CJxuJJ4XiLJFcf_EhyojO4eJmrA-HSI5aFlzfsaufTtz7DN5Fgm5pivEHuBptaSq5LrzNRx9MHBOIebt_xuliiiqJgGlSL2VNy=s1600', false, 3, '237Residency')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RRK2clnn6hu_5bA7kgHfiTuK4bX3OAf9seX8o2fFqxEub5XhsAIkUPL8fOY4C5HGAMVid7ZvPrsSsuu-z8bbgwuxn9EujGGeaCJDPTjeRGJNB-RNDkTV2LpG2gpvAKfl9ofyrhA6JWpIAO=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RRK2clnn6hu_5bA7kgHfiTuK4bX3OAf9seX8o2fFqxEub5XhsAIkUPL8fOY4C5HGAMVid7ZvPrsSsuu-z8bbgwuxn9EujGGeaCJDPTjeRGJNB-RNDkTV2LpG2gpvAKfl9ofyrhA6JWpIAO=s1600', false, 4, '237Residency')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S51p5Uv0HUGWJY17b0f2VKYdJWgvsm8xu_W09OYDXXuApcAh1p9ePoMW5fMygGRGEQHu7tAaj5HKp4kMBl1TLCdNfkt0BQ-JM3AhPiQypy50W4hzyrPCGFxqCRv5Tzar4jb_bcFju1Qms=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S51p5Uv0HUGWJY17b0f2VKYdJWgvsm8xu_W09OYDXXuApcAh1p9ePoMW5fMygGRGEQHu7tAaj5HKp4kMBl1TLCdNfkt0BQ-JM3AhPiQypy50W4hzyrPCGFxqCRv5Tzar4jb_bcFju1Qms=s1600', false, 5, '237Residency')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TiENljISCDw1K_zcgy0t7sfljj4YnL4z7zF0VBifZln3EAhM_K6xARBTivbjXnGUnOI_1SNbXYYdKWgGH7VDp1O4UK1tcSLdA7ydlvPGPvTb-w9u4XdlF1fQ6Xy0-asVKSIRUFX6DK_jyD=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TiENljISCDw1K_zcgy0t7sfljj4YnL4z7zF0VBifZln3EAhM_K6xARBTivbjXnGUnOI_1SNbXYYdKWgGH7VDp1O4UK1tcSLdA7ydlvPGPvTb-w9u4XdlF1fQ6Xy0-asVKSIRUFX6DK_jyD=s1600', false, 6, '237Residency')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S9zJ3PPhywDP5ewo90u4psWh0VH4jS8CZRTD70O2eJqvVUe5aabm-IGQ1ng5KkhrVuq2W1b1PEXYK9DecNeT1xfVoiWc8vh1Xfef3UhuNYRWHr032QHF8pGouMjOsz9ReFIzBaDD49C_Xa=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S9zJ3PPhywDP5ewo90u4psWh0VH4jS8CZRTD70O2eJqvVUe5aabm-IGQ1ng5KkhrVuq2W1b1PEXYK9DecNeT1xfVoiWc8vh1Xfef3UhuNYRWHr032QHF8pGouMjOsz9ReFIzBaDD49C_Xa=s1600', false, 7, '237Residency')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TrgSrBiNb8O94ztOb5EBnNacpJ4to2eWz-cVb0vOQploBEgp6CSzDQ8QXLXA-dRSBuF2gFLbG2_jhjX2zDRPK9Byqcj2nL9zPHARMByAjUMyUOLVp38l8c_5snWyruwEs2qWT0dcyXdOY=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TrgSrBiNb8O94ztOb5EBnNacpJ4to2eWz-cVb0vOQploBEgp6CSzDQ8QXLXA-dRSBuF2gFLbG2_jhjX2zDRPK9Byqcj2nL9zPHARMByAjUMyUOLVp38l8c_5snWyruwEs2qWT0dcyXdOY=s1600', false, 8, '237Residency')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Snm8bDnWjceWJ0zg6Nhv4rnUyZvjRny1PiUJEi4NY7Dh9nHg3b0Ooqe-LqVQ45C2bmEjkIKAu-HtGz4IfEE_rZRDuaff9bkjhGlZN0CUmAhulBJk65prFYqTILM7S5UBFsMqi6nm3brwQv=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Snm8bDnWjceWJ0zg6Nhv4rnUyZvjRny1PiUJEi4NY7Dh9nHg3b0Ooqe-LqVQ45C2bmEjkIKAu-HtGz4IfEE_rZRDuaff9bkjhGlZN0CUmAhulBJk65prFYqTILM7S5UBFsMqi6nm3brwQv=s1600', false, 9, '237Residency')
  on conflict do nothing;

  -- [93] Deluxe Séjour - Appartements & Studios Meublés (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'deluxe-sejour-appartements-studios-meubles-logpom',
    'studio',
    'published',
    'Deluxe Séjour - Appartements & Studios Meublés',
    'Deluxe Séjour - Appartements & Studios Meublés
Catégorie : Complexe d''appartements meublés.
Adresse : Andem (à 50m du goudron, Logpom, face station Neptune, Douala.
Contact / WhatsApp : +237693279744.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Andem (à 50m du goudron, Logpom, face station Neptune, Douala',
    4.0882762,
    9.7650717,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcmBIj44pBmRF5qA_V1WY13x9BHqvGERPiTpgRgCB-JD-SvtKqy2J3wtnUcnhBqF5CJjZjbIbQUjofp71R-wvVaqZOY2IDe3sYMc1jRyy_r0UTRFXD9971-ra9VjA68b9acOJ5sZOBTaufV=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcmBIj44pBmRF5qA_V1WY13x9BHqvGERPiTpgRgCB-JD-SvtKqy2J3wtnUcnhBqF5CJjZjbIbQUjofp71R-wvVaqZOY2IDe3sYMc1jRyy_r0UTRFXD9971-ra9VjA68b9acOJ5sZOBTaufV=s1600', true, 0, 'Deluxe Séjour - Appartements & Studios Meublés')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcmBIj44pBmRF5qA_V1WY13x9BHqvGERPiTpgRgCB-JD-SvtKqy2J3wtnUcnhBqF5CJjZjbIbQUjofp71R-wvVaqZOY2IDe3sYMc1jRyy_r0UTRFXD9971-ra9VjA68b9acOJ5sZOBTaufV=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcmBIj44pBmRF5qA_V1WY13x9BHqvGERPiTpgRgCB-JD-SvtKqy2J3wtnUcnhBqF5CJjZjbIbQUjofp71R-wvVaqZOY2IDe3sYMc1jRyy_r0UTRFXD9971-ra9VjA68b9acOJ5sZOBTaufV=s1600-p-k-no', false, 1, 'Deluxe Séjour - Appartements & Studios Meublés')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SkF0nTUMnokdPyFX9013PfxWfipsq9GrHRYad-ZCDOK_sUUYNmkmUahF5Y1rVcI4xjhK4GQcbrBf9bh8zQ-CWet4D9YjIndr6VF81GmNRG1JnB1JIXBDm_pdncVUsYVTfHYjaQKFBw6_zk=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SkF0nTUMnokdPyFX9013PfxWfipsq9GrHRYad-ZCDOK_sUUYNmkmUahF5Y1rVcI4xjhK4GQcbrBf9bh8zQ-CWet4D9YjIndr6VF81GmNRG1JnB1JIXBDm_pdncVUsYVTfHYjaQKFBw6_zk=s1600', false, 2, 'Deluxe Séjour - Appartements & Studios Meublés')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RvoeL8SqRksGcFDskuLHyPuB7jnG64wRTT7kp_n3G_Vnr2Tgqj3I3uwvuArchAniS3b98jFx8vegCijt8CYbCVIeC2WajC5k9mBLzB4B1AvnbJtBGpLZa_XvOjIBOSQ5sM_ytM1KMAvNgh=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RvoeL8SqRksGcFDskuLHyPuB7jnG64wRTT7kp_n3G_Vnr2Tgqj3I3uwvuArchAniS3b98jFx8vegCijt8CYbCVIeC2WajC5k9mBLzB4B1AvnbJtBGpLZa_XvOjIBOSQ5sM_ytM1KMAvNgh=s1600', false, 3, 'Deluxe Séjour - Appartements & Studios Meublés')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R7r_9M71grLBl-DWU_fkVqiXwO1RL5YRbi64U0POX3Z0qdzEyPzYoiyVkbLgTo_iRtAjsaZx0HZXPcoPhdIAtnmD_NINfnV3qHLfyjkZr4ueiavyunk7kWItrqpSzEdioTV-Ikvn2vq7pp=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R7r_9M71grLBl-DWU_fkVqiXwO1RL5YRbi64U0POX3Z0qdzEyPzYoiyVkbLgTo_iRtAjsaZx0HZXPcoPhdIAtnmD_NINfnV3qHLfyjkZr4ueiavyunk7kWItrqpSzEdioTV-Ikvn2vq7pp=s1600', false, 4, 'Deluxe Séjour - Appartements & Studios Meublés')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QATlSPitQd-K7WR3LeDs5s7ICwllIWAFDn20Wvzt7qXWF7pI4fy2z2SvOEUQMssY48YIT2jeOKYndG0VCLyjjUKqSUKY31A8V27UWt5wcNBWgQl4tr_uTRe3-AAuHDJ4dsEuWpHqiUCZs=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QATlSPitQd-K7WR3LeDs5s7ICwllIWAFDn20Wvzt7qXWF7pI4fy2z2SvOEUQMssY48YIT2jeOKYndG0VCLyjjUKqSUKY31A8V27UWt5wcNBWgQl4tr_uTRe3-AAuHDJ4dsEuWpHqiUCZs=s1600', false, 5, 'Deluxe Séjour - Appartements & Studios Meublés')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a-/ALV-UjUkSxm_S33dT3ZoV2GLLIRMYVTIc10SK-DAu1TFdFaLZdQ9m2c=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a-/ALV-UjUkSxm_S33dT3ZoV2GLLIRMYVTIc10SK-DAu1TFdFaLZdQ9m2c=s1600-p-k-no-mo', false, 6, 'Deluxe Séjour - Appartements & Studios Meublés')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sys9L3a0rqdiMjuIF4M6JiDDLJdwpwP4r0IJbk-CWWaWE05ft7yCUYxvHpfO7oidUU54f3DUJahmQ7mT8d6Ram3ekL_yHre8eJE3izH7zybovOJOxOcrvHDkfQv68hWwoErRjaR6yWItqQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sys9L3a0rqdiMjuIF4M6JiDDLJdwpwP4r0IJbk-CWWaWE05ft7yCUYxvHpfO7oidUU54f3DUJahmQ7mT8d6Ram3ekL_yHre8eJE3izH7zybovOJOxOcrvHDkfQv68hWwoErRjaR6yWItqQ=s1600', false, 7, 'Deluxe Séjour - Appartements & Studios Meublés')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RhhLdfi5rU-BUP0MONghF090eTpFq3tWKD2tU6z7Fjxw9x48ATdHFkaz17Pwfshdvn5c2ChTmgVy88evvs8qlw_cQN_6DGxS6EsYZenQgdZlg02ojWlw1WJSe49K3jubYgECV6IEA-7MOr=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RhhLdfi5rU-BUP0MONghF090eTpFq3tWKD2tU6z7Fjxw9x48ATdHFkaz17Pwfshdvn5c2ChTmgVy88evvs8qlw_cQN_6DGxS6EsYZenQgdZlg02ojWlw1WJSe49K3jubYgECV6IEA-7MOr=s1600', false, 8, 'Deluxe Séjour - Appartements & Studios Meublés')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tb6W3FJRIyuivJgv0u2gS59J4sjxtVBR_NK8jtGrJGuDWWj9k2lu5HIT1B3ks5yKt3evpR-veeZcTjEx1FbNk9fVmVYAYI0rx5Gi39lR4L12EdjvplRcvsKlwuXdW8FC4a2AbFvjELxb6-=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tb6W3FJRIyuivJgv0u2gS59J4sjxtVBR_NK8jtGrJGuDWWj9k2lu5HIT1B3ks5yKt3evpR-veeZcTjEx1FbNk9fVmVYAYI0rx5Gi39lR4L12EdjvplRcvsKlwuXdW8FC4a2AbFvjELxb6-=s1600', false, 9, 'Deluxe Séjour - Appartements & Studios Meublés')
  on conflict do nothing;

  -- [94] Résidence La Grâce (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-la-grace-logpom',
    'apartment',
    'published',
    'Résidence La Grâce',
    'Résidence La Grâce
Adresse : 237 Log Pom 1 Douala (Wouri)- Log Pom.
Contact / WhatsApp : +237699975184.
Note Google Maps : 3.6/5 (29 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '237 Log Pom 1 Douala (Wouri)- Log Pom',
    4.0751957,
    9.7670798,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1Ty57X-fBeBU6IuzPzFL1SnhaIJZIsANWtcvqxiPyaw-VsFaF8lWKsiTeXqHxE8hS0M7rjPBkxAh1y56wnjQmUPITbBebwFwft3E6sSM5toeIqo1lVOFTEP2z5jZVUSfy0Dm4pS4DH5OLny-Z0pUSL4qFfXb0It1dcriMtAy4i8prabwb4cdHd=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1Ty57X-fBeBU6IuzPzFL1SnhaIJZIsANWtcvqxiPyaw-VsFaF8lWKsiTeXqHxE8hS0M7rjPBkxAh1y56wnjQmUPITbBebwFwft3E6sSM5toeIqo1lVOFTEP2z5jZVUSfy0Dm4pS4DH5OLny-Z0pUSL4qFfXb0It1dcriMtAy4i8prabwb4cdHd=s1600', true, 0, 'Résidence La Grâce')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1Ty57X-fBeBU6IuzPzFL1SnhaIJZIsANWtcvqxiPyaw-VsFaF8lWKsiTeXqHxE8hS0M7rjPBkxAh1y56wnjQmUPITbBebwFwft3E6sSM5toeIqo1lVOFTEP2z5jZVUSfy0Dm4pS4DH5OLny-Z0pUSL4qFfXb0It1dcriMtAy4i8prabwb4cdHd=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1Ty57X-fBeBU6IuzPzFL1SnhaIJZIsANWtcvqxiPyaw-VsFaF8lWKsiTeXqHxE8hS0M7rjPBkxAh1y56wnjQmUPITbBebwFwft3E6sSM5toeIqo1lVOFTEP2z5jZVUSfy0Dm4pS4DH5OLny-Z0pUSL4qFfXb0It1dcriMtAy4i8prabwb4cdHd=s1600-p-k-no', false, 1, 'Résidence La Grâce')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHP19BRIkIbP1RIeF9DTtwBaQbYQPaLlOEfmWhF3p4f7kTsdUsOBvqCwKWZMMzV-AB6umwz8vHfLdfVDLE81XsYPl6KHN7t-MeR9xUdqs0gIA29QuelST3azbHvt07nZPX0INSSUnc1ejeKvb7ROAZddSRTB6gIFL-ijwO-eIxZE_56zZXkGDYv=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHP19BRIkIbP1RIeF9DTtwBaQbYQPaLlOEfmWhF3p4f7kTsdUsOBvqCwKWZMMzV-AB6umwz8vHfLdfVDLE81XsYPl6KHN7t-MeR9xUdqs0gIA29QuelST3azbHvt07nZPX0INSSUnc1ejeKvb7ROAZddSRTB6gIFL-ijwO-eIxZE_56zZXkGDYv=s1600', false, 2, 'Résidence La Grâce')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFNINPBv4iCnQbKjwly6lSUnT9rj2ane0Wv99yc9vUZKOy487drTPvuGc4BRsg2DMXKlaUCxtp4ZTtvNePWJaaAYvZpxuJnpUD8uAThrF0dOFOJ5AAQgnmrPygIjvpmqWYfpjU4ajRMa2ARfKjmIHPEOTt6hTsKqp3W_rN7eVFWtiQ1uTuoMytuoA=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFNINPBv4iCnQbKjwly6lSUnT9rj2ane0Wv99yc9vUZKOy487drTPvuGc4BRsg2DMXKlaUCxtp4ZTtvNePWJaaAYvZpxuJnpUD8uAThrF0dOFOJ5AAQgnmrPygIjvpmqWYfpjU4ajRMa2ARfKjmIHPEOTt6hTsKqp3W_rN7eVFWtiQ1uTuoMytuoA=s1600', false, 3, 'Résidence La Grâce')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SkukxVHgwugppsCfYDRfvJ82_Qr067wJa_VKTxJPc9OaXp_D_gii7WbVbPze1KnDNlq3wU4aYEbP-41AeK_GNSZ_AAio7YAj_u_kfnokerPIjiV9iwJrOO_PXNFCn3WRdnbug=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SkukxVHgwugppsCfYDRfvJ82_Qr067wJa_VKTxJPc9OaXp_D_gii7WbVbPze1KnDNlq3wU4aYEbP-41AeK_GNSZ_AAio7YAj_u_kfnokerPIjiV9iwJrOO_PXNFCn3WRdnbug=s1600', false, 4, 'Résidence La Grâce')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RuDlT7NABrfLHomuRXgHQsxCc4PRQGYl1YuHFGfVQagd5elQagJgRdkTdimUTreX91U9Q7aVjzzL9llRGHwfKqVE4Zw5R6YTZN6cnM1DLutKVbwokkdEY8ds9DZ6h1_7ck6HJTXw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RuDlT7NABrfLHomuRXgHQsxCc4PRQGYl1YuHFGfVQagd5elQagJgRdkTdimUTreX91U9Q7aVjzzL9llRGHwfKqVE4Zw5R6YTZN6cnM1DLutKVbwokkdEY8ds9DZ6h1_7ck6HJTXw=s1600', false, 5, 'Résidence La Grâce')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RODt2CFsCcLNpzuW7FFrhZi53BkTlU5_TTrA66lBZ6H9GWyyGGic_6pquqNUQuhwAUR_l38-_LZ5jZjMo-3CwD1jH2l7xTxGobJb5FVHvZHjosuYq_GuXRtEY9XBDJKa5dZAoh=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RODt2CFsCcLNpzuW7FFrhZi53BkTlU5_TTrA66lBZ6H9GWyyGGic_6pquqNUQuhwAUR_l38-_LZ5jZjMo-3CwD1jH2l7xTxGobJb5FVHvZHjosuYq_GuXRtEY9XBDJKa5dZAoh=s1600', false, 6, 'Résidence La Grâce')
  on conflict do nothing;

  -- [95] Sci ksw ELu hôtel appartement logpom (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'sci-ksw-elu-hotel-appartement-logpom-logpom',
    'apartment',
    'published',
    'Sci ksw ELu hôtel appartement logpom',
    'Sci ksw ELu hôtel appartement logpom
Catégorie : Appartement de vacances.
Adresse : 2ème avenue, Douala.
Contact / WhatsApp : +237695382802.
Note Google Maps : 3.6/5 (5 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Site Antipas, note 5/5)
- "Note sans commentaire écrit." (Cédric LADEU, note 3/5)
- "Note sans commentaire écrit." (cedric kengne, note 2/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '2ème avenue, Douala',
    4.0908379,
    9.7701585,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcWAF4vOmw2AfkqxSG8N5GaL7LKY_ZsBQ1EB1lsAP8b0Qp-PF8WD9CGHeVAz6Kwdy6aHYHimutA0AjbuASo0JqsPuJ_sPByAHfZ2_20QuetrhgIiI8_ZUYkWHQXrJzJuUbvBLRp=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcWAF4vOmw2AfkqxSG8N5GaL7LKY_ZsBQ1EB1lsAP8b0Qp-PF8WD9CGHeVAz6Kwdy6aHYHimutA0AjbuASo0JqsPuJ_sPByAHfZ2_20QuetrhgIiI8_ZUYkWHQXrJzJuUbvBLRp=s1600', true, 0, 'Sci ksw ELu hôtel appartement logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcWAF4vOmw2AfkqxSG8N5GaL7LKY_ZsBQ1EB1lsAP8b0Qp-PF8WD9CGHeVAz6Kwdy6aHYHimutA0AjbuASo0JqsPuJ_sPByAHfZ2_20QuetrhgIiI8_ZUYkWHQXrJzJuUbvBLRp=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcWAF4vOmw2AfkqxSG8N5GaL7LKY_ZsBQ1EB1lsAP8b0Qp-PF8WD9CGHeVAz6Kwdy6aHYHimutA0AjbuASo0JqsPuJ_sPByAHfZ2_20QuetrhgIiI8_ZUYkWHQXrJzJuUbvBLRp=s1600-p-k-no', false, 1, 'Sci ksw ELu hôtel appartement logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a/ACg8ocKsPN-dkrPri5R8V8Jb6vW5C_N8PY5hYX0FJiOL9lB4IKyzhQ=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a/ACg8ocKsPN-dkrPri5R8V8Jb6vW5C_N8PY5hYX0FJiOL9lB4IKyzhQ=s1600-p-k-no-mo', false, 2, 'Sci ksw ELu hôtel appartement logpom')
  on conflict do nothing;

  -- [96] Appartement meublé à Logpom (Andem) - Two-Bedroom Apartment (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-a-logpom-andem-two-bedroom-apartment-logpom',
    'room',
    'published',
    'Appartement meublé à Logpom (Andem) - Two-Bedroom Apartment',
    'Appartement meublé à Logpom (Andem) - Two-Bedroom Apartment
Adresse : Douala.
Note Google Maps : 4/5 (0 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0887599,
    9.7641296,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3URfnPtcgb9uonmZlcKpvXbqBDsGMdIoY2ri98ZlPSkA6FlGDIMJQxON6V2bfNkXQ080HDgn1KbDB--Utwyr08CyQ2JQ_xh8oMOXoP7mTPRnKHhFar9PeRVYPh_jVcw0KzgdB-A7PjAG0ETTsNlZaQixNzKAm1xv-7nPtKNeOd_K6vznUYGftl5A=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3URfnPtcgb9uonmZlcKpvXbqBDsGMdIoY2ri98ZlPSkA6FlGDIMJQxON6V2bfNkXQ080HDgn1KbDB--Utwyr08CyQ2JQ_xh8oMOXoP7mTPRnKHhFar9PeRVYPh_jVcw0KzgdB-A7PjAG0ETTsNlZaQixNzKAm1xv-7nPtKNeOd_K6vznUYGftl5A=s1600', true, 0, 'Appartement meublé à Logpom (Andem) - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3URfnPtcgb9uonmZlcKpvXbqBDsGMdIoY2ri98ZlPSkA6FlGDIMJQxON6V2bfNkXQ080HDgn1KbDB--Utwyr08CyQ2JQ_xh8oMOXoP7mTPRnKHhFar9PeRVYPh_jVcw0KzgdB-A7PjAG0ETTsNlZaQixNzKAm1xv-7nPtKNeOd_K6vznUYGftl5A=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3URfnPtcgb9uonmZlcKpvXbqBDsGMdIoY2ri98ZlPSkA6FlGDIMJQxON6V2bfNkXQ080HDgn1KbDB--Utwyr08CyQ2JQ_xh8oMOXoP7mTPRnKHhFar9PeRVYPh_jVcw0KzgdB-A7PjAG0ETTsNlZaQixNzKAm1xv-7nPtKNeOd_K6vznUYGftl5A=s1600-p-k-no', false, 1, 'Appartement meublé à Logpom (Andem) - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2WiZ1iyP0fhXTF7vlknqPfklJUw5u0ouBUyZEAiwYEpBQdx9okI0oYxCJQKi_UsBZrvxHtQy5Wr_Uigee3vcTsN18uRW43coiejaf90ch8EBQEn--fojP2sGPPaUkQrvQbpHiBelAxcqD3mmtsDVAjV8Z4bhym7K8kgrR_UmTLZV8x1f3SPYbFVg=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2WiZ1iyP0fhXTF7vlknqPfklJUw5u0ouBUyZEAiwYEpBQdx9okI0oYxCJQKi_UsBZrvxHtQy5Wr_Uigee3vcTsN18uRW43coiejaf90ch8EBQEn--fojP2sGPPaUkQrvQbpHiBelAxcqD3mmtsDVAjV8Z4bhym7K8kgrR_UmTLZV8x1f3SPYbFVg=s1600', false, 2, 'Appartement meublé à Logpom (Andem) - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3LxvUpx1cIDNeL3laHz4NEBIcbA6FHrNX0_QEIlzGJ3hnaRoNKOw58UH1pnIAqtNh-KXfe-yY5kGeBG41sLWl9AmoosGW5RQCgDxoWMhogwp8qYRFBNQHsbjuQx-nIujvhpm7PoWOM9wI2uAkuBUXl0G8LcqOwv9bGOBc7sO31OAxstCG9x0HI_A=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3LxvUpx1cIDNeL3laHz4NEBIcbA6FHrNX0_QEIlzGJ3hnaRoNKOw58UH1pnIAqtNh-KXfe-yY5kGeBG41sLWl9AmoosGW5RQCgDxoWMhogwp8qYRFBNQHsbjuQx-nIujvhpm7PoWOM9wI2uAkuBUXl0G8LcqOwv9bGOBc7sO31OAxstCG9x0HI_A=s1600-p-k-no', false, 3, 'Appartement meublé à Logpom (Andem) - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1_Z697PZvP5WuMlKGl4kr8Iv9mc2_yZzeY1lZiB8STS9ATLIs400_opercEkHVJ1bJAsll0FtyGYWLTPfyIcXZLHxmoZDAf1gByENnBVZaJbo7Alpu_CXoDptKjm2Xsx2WJ7rH0VhEPN8YOAaOVve2j3U_Ri10pBU2j2jTECsoFj4nS0JOhsHI=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1_Z697PZvP5WuMlKGl4kr8Iv9mc2_yZzeY1lZiB8STS9ATLIs400_opercEkHVJ1bJAsll0FtyGYWLTPfyIcXZLHxmoZDAf1gByENnBVZaJbo7Alpu_CXoDptKjm2Xsx2WJ7rH0VhEPN8YOAaOVve2j3U_Ri10pBU2j2jTECsoFj4nS0JOhsHI=s1600-p-k-no', false, 4, 'Appartement meublé à Logpom (Andem) - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0j8aYVf8C0sCAi9Yy31PJHug_run5hzccZ3_WuC0Ydn_fv6jis5UNxNV2svOwnMePGauC8AmsypizwptmP3Moz4ImImoYNMtkjxW3VBF3kOgw8GPu63Ck5E_xRwmDrzVvF-4BvMQQY5hUwU9_WCs8K-J4xOYWXS6XxKMb4AoJo8HIkabLHmUQ_=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0j8aYVf8C0sCAi9Yy31PJHug_run5hzccZ3_WuC0Ydn_fv6jis5UNxNV2svOwnMePGauC8AmsypizwptmP3Moz4ImImoYNMtkjxW3VBF3kOgw8GPu63Ck5E_xRwmDrzVvF-4BvMQQY5hUwU9_WCs8K-J4xOYWXS6XxKMb4AoJo8HIkabLHmUQ_=s1600-p-k-no', false, 5, 'Appartement meublé à Logpom (Andem) - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3eQSs6fMsHovElFA1bJY8GUJif-4xxdSDJUBZPkFIGTg03FK8AnoIp2FVOP8wAMC3Ye9gMskN1NP68EM8-owwGXWY7owfHcI606_f1UlUK0VOUm53xDB2d8pQBYjvds-0B8CvK8L2EQp1FlB_tsMqeIYqBj9dPJuPKj1VxiTlpR8eUAfpRkD27=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3eQSs6fMsHovElFA1bJY8GUJif-4xxdSDJUBZPkFIGTg03FK8AnoIp2FVOP8wAMC3Ye9gMskN1NP68EM8-owwGXWY7owfHcI606_f1UlUK0VOUm53xDB2d8pQBYjvds-0B8CvK8L2EQp1FlB_tsMqeIYqBj9dPJuPKj1VxiTlpR8eUAfpRkD27=s1600-p-k-no', false, 6, 'Appartement meublé à Logpom (Andem) - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW07VJHmYH88A8Ydj72Br3VxO5dbU9LH5qk-_4KWVGhw-XYIUoCu9yMJz7EiLMYYDK_PobY8uOI6HMpgj0AAo_LJvQJI8YmVQVYiDsOfcIWH6uk7B0pzy49UuwpB_xKZKcXzxCI8ko5D0AuNpoNmXS0pS-tsu_-YuCLT9CJq_FqrghdnzbtCj9Kuhg=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW07VJHmYH88A8Ydj72Br3VxO5dbU9LH5qk-_4KWVGhw-XYIUoCu9yMJz7EiLMYYDK_PobY8uOI6HMpgj0AAo_LJvQJI8YmVQVYiDsOfcIWH6uk7B0pzy49UuwpB_xKZKcXzxCI8ko5D0AuNpoNmXS0pS-tsu_-YuCLT9CJq_FqrghdnzbtCj9Kuhg=s1600-p-k-no', false, 7, 'Appartement meublé à Logpom (Andem) - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1Z5ceSIPbWlVHpgzzFtqbbJLnsyVpXwABe7HBmxFzIZM-JuUpu57dZLFAoLGnqP9wKBDqZHclYLI5ATHrxMz3H1_oYyrMJ21_3tMdV6_cdQeVI-oqUPjReW9PC8z_CDW2Iq7UAt3iANMVQapyF6lsSNpWfO6Z3mzGe0LyFkSYj02K5iwmkz1EL=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1Z5ceSIPbWlVHpgzzFtqbbJLnsyVpXwABe7HBmxFzIZM-JuUpu57dZLFAoLGnqP9wKBDqZHclYLI5ATHrxMz3H1_oYyrMJ21_3tMdV6_cdQeVI-oqUPjReW9PC8z_CDW2Iq7UAt3iANMVQapyF6lsSNpWfO6Z3mzGe0LyFkSYj02K5iwmkz1EL=s1600-p-k-no', false, 8, 'Appartement meublé à Logpom (Andem) - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3OEYp94-exxgnpSRmkZ8VBkMRN4yGtdITHOTl4XQG1kwMevTD0ZvVyDQHrRftRkXDC6ES0WyywqgZf2OYBYzYoHPhrsFJZIT9WFlMZoaaekqSnBa-qB1nS0k9VMKEvCfC90-UkEQk9gLZiEKiXMOa1H3UDGOR8d4suxQKH3-eHZx-mIkcVi761=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3OEYp94-exxgnpSRmkZ8VBkMRN4yGtdITHOTl4XQG1kwMevTD0ZvVyDQHrRftRkXDC6ES0WyywqgZf2OYBYzYoHPhrsFJZIT9WFlMZoaaekqSnBa-qB1nS0k9VMKEvCfC90-UkEQk9gLZiEKiXMOa1H3UDGOR8d4suxQKH3-eHZx-mIkcVi761=s1600-p-k-no', false, 9, 'Appartement meublé à Logpom (Andem) - Two-Bedroom Apartment')
  on conflict do nothing;

  -- [97] appartement meublé a logpom douala (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-a-logpom-douala-logpom',
    'apartment',
    'published',
    'appartement meublé a logpom douala',
    'appartement meublé a logpom douala
Adresse : Douala.
Note Google Maps : 4.5/5 (0 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0808516,
    9.7719469,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2rxnfsJsJ6aLw8iV6Dt9DC9ZJbm4Sjhopu4hfiQ09Kn5wsR_GGDvyqSlPrZNfnFzVQ2OFbihUeXJbmeYLZ_JiJyzJ0JduKClNFK0zpJn5BgClQ5F1fNPNe_FKdn75AUB-75l6pJhp3ccIf9xvunGGwVUCjQ9NwAa3DGh423UhtOlv9GrPcT5TI=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2rxnfsJsJ6aLw8iV6Dt9DC9ZJbm4Sjhopu4hfiQ09Kn5wsR_GGDvyqSlPrZNfnFzVQ2OFbihUeXJbmeYLZ_JiJyzJ0JduKClNFK0zpJn5BgClQ5F1fNPNe_FKdn75AUB-75l6pJhp3ccIf9xvunGGwVUCjQ9NwAa3DGh423UhtOlv9GrPcT5TI=s1600', true, 0, 'appartement meublé a logpom douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2rxnfsJsJ6aLw8iV6Dt9DC9ZJbm4Sjhopu4hfiQ09Kn5wsR_GGDvyqSlPrZNfnFzVQ2OFbihUeXJbmeYLZ_JiJyzJ0JduKClNFK0zpJn5BgClQ5F1fNPNe_FKdn75AUB-75l6pJhp3ccIf9xvunGGwVUCjQ9NwAa3DGh423UhtOlv9GrPcT5TI=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2rxnfsJsJ6aLw8iV6Dt9DC9ZJbm4Sjhopu4hfiQ09Kn5wsR_GGDvyqSlPrZNfnFzVQ2OFbihUeXJbmeYLZ_JiJyzJ0JduKClNFK0zpJn5BgClQ5F1fNPNe_FKdn75AUB-75l6pJhp3ccIf9xvunGGwVUCjQ9NwAa3DGh423UhtOlv9GrPcT5TI=s1600-p-k-no', false, 1, 'appartement meublé a logpom douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEYgJLnUUFHBocL7lkiSnXfZCIFKzJIpAKHa9tJAdtHgDljCM-_VmPktbsVf9iJJxJyYsgD0vG5qnM5d5G1KINkEBMclDqiBzZVHdIYlKF7uUudBxnZoc5X470SSsYV4k1TeFvf3qhujGA3hVhG4Z45zaVTd8a_3tuqjVe5_xV9uLXGuPzQ37mu=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEYgJLnUUFHBocL7lkiSnXfZCIFKzJIpAKHa9tJAdtHgDljCM-_VmPktbsVf9iJJxJyYsgD0vG5qnM5d5G1KINkEBMclDqiBzZVHdIYlKF7uUudBxnZoc5X470SSsYV4k1TeFvf3qhujGA3hVhG4Z45zaVTd8a_3tuqjVe5_xV9uLXGuPzQ37mu=s1600', false, 2, 'appartement meublé a logpom douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHS0P2EBb5L3GawvTNIBeycPNIPxF77A0k8skL6pqchocsbeYWot-KIwNaZpLRRf6avmYuQcLalTJTAz-u2gQ8MxRPelKEaGp1xzZOLcCpBbG_j3XlVFpGZaCLeWp2zLukJXa1ru3uhC-WJ55aGgZuWCK0ApHe-wcDVsl0d98yts91vK-a53c3U=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHS0P2EBb5L3GawvTNIBeycPNIPxF77A0k8skL6pqchocsbeYWot-KIwNaZpLRRf6avmYuQcLalTJTAz-u2gQ8MxRPelKEaGp1xzZOLcCpBbG_j3XlVFpGZaCLeWp2zLukJXa1ru3uhC-WJ55aGgZuWCK0ApHe-wcDVsl0d98yts91vK-a53c3U=s1600', false, 3, 'appartement meublé a logpom douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHEa3KEkaAJyqrFjiHVYo6ZCYb8O1ChngfZ4JfFE1M-jpyG6TAQqo6VdWGkgmPV2KFt3ZJ8JqiyvEa9tgN_TCXRDBpQb0P58CIkIFEUqHWRryesOlTpL1TF-hUZdcjndWuodTFdQPexokD4ba3EhrvheVuD3NeEE7jRPB64_L0oDEBDu8S3qEsn=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHEa3KEkaAJyqrFjiHVYo6ZCYb8O1ChngfZ4JfFE1M-jpyG6TAQqo6VdWGkgmPV2KFt3ZJ8JqiyvEa9tgN_TCXRDBpQb0P58CIkIFEUqHWRryesOlTpL1TF-hUZdcjndWuodTFdQPexokD4ba3EhrvheVuD3NeEE7jRPB64_L0oDEBDu8S3qEsn=s1600', false, 4, 'appartement meublé a logpom douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHkG0sIJ8rvFJoEFRHAh4_-lLgMDODllwTqhN-lBo7HnvtHnb6hHGyVZZtdXDlXxCIKgI7sTWXGPubsCWBxC3BDqRw0YdsBzeNnpDDzdr88mnDr86GTHbFs62ao8_1_KmQ95BoICcn-qwS2bwmEG933pGq7QN9zes15LeQjGb7V1WH0ZeZJyekK=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHkG0sIJ8rvFJoEFRHAh4_-lLgMDODllwTqhN-lBo7HnvtHnb6hHGyVZZtdXDlXxCIKgI7sTWXGPubsCWBxC3BDqRw0YdsBzeNnpDDzdr88mnDr86GTHbFs62ao8_1_KmQ95BoICcn-qwS2bwmEG933pGq7QN9zes15LeQjGb7V1WH0ZeZJyekK=s1600', false, 5, 'appartement meublé a logpom douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHGiQo_mUY1MYyDlecP0y5svATreIRkAERBkK523JFLHJ9M5afgn55HzYhlJuUCWLn0GEKMiRad1JOl4Mgo-OWplxfbyMar2grPB917MSA9bNzuGtKlG_hNDaZ6rqOTQ3Hc465nIQvBVS2AyPgaweNMYMov4OKU6rUrXgv9c78SFuU5vR4DI6yP=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHGiQo_mUY1MYyDlecP0y5svATreIRkAERBkK523JFLHJ9M5afgn55HzYhlJuUCWLn0GEKMiRad1JOl4Mgo-OWplxfbyMar2grPB917MSA9bNzuGtKlG_hNDaZ6rqOTQ3Hc465nIQvBVS2AyPgaweNMYMov4OKU6rUrXgv9c78SFuU5vR4DI6yP=s1600', false, 6, 'appartement meublé a logpom douala')
  on conflict do nothing;

  -- [98] Appartement meublé à LOGPOM Bassong - One-Bedroom Apartment (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-a-logpom-bassong-one-bedroom-apartment-logpom',
    'room',
    'published',
    'Appartement meublé à LOGPOM Bassong - One-Bedroom Apartment',
    'Appartement meublé à LOGPOM Bassong - One-Bedroom Apartment
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0833101,
    9.7732601,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3asvCsXOmO4waXS06_ZprZaNWUDToYGHaqAtPg9gIL6bq3-oBVE9tRLDJmYlAphZQ-MewJNYHM55EbHtjp9vqONVFfWC_CU2i9CrjGpy4mwD8L7QYEG0XQl8pS1nDmsEluJVmyX5DL_PhYV8Ox9GR8fwgD0hsjEIPuuzjAEiMdMWmQ6iMlqoChQg=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3asvCsXOmO4waXS06_ZprZaNWUDToYGHaqAtPg9gIL6bq3-oBVE9tRLDJmYlAphZQ-MewJNYHM55EbHtjp9vqONVFfWC_CU2i9CrjGpy4mwD8L7QYEG0XQl8pS1nDmsEluJVmyX5DL_PhYV8Ox9GR8fwgD0hsjEIPuuzjAEiMdMWmQ6iMlqoChQg=s1600', true, 0, 'Appartement meublé à LOGPOM Bassong - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3asvCsXOmO4waXS06_ZprZaNWUDToYGHaqAtPg9gIL6bq3-oBVE9tRLDJmYlAphZQ-MewJNYHM55EbHtjp9vqONVFfWC_CU2i9CrjGpy4mwD8L7QYEG0XQl8pS1nDmsEluJVmyX5DL_PhYV8Ox9GR8fwgD0hsjEIPuuzjAEiMdMWmQ6iMlqoChQg=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3asvCsXOmO4waXS06_ZprZaNWUDToYGHaqAtPg9gIL6bq3-oBVE9tRLDJmYlAphZQ-MewJNYHM55EbHtjp9vqONVFfWC_CU2i9CrjGpy4mwD8L7QYEG0XQl8pS1nDmsEluJVmyX5DL_PhYV8Ox9GR8fwgD0hsjEIPuuzjAEiMdMWmQ6iMlqoChQg=s1600-p-k-no', false, 1, 'Appartement meublé à LOGPOM Bassong - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFbYYUgvlXuaiF3gQlUIfAAUPg7ThNO7dGEmL8CdAD6uCrX7GOspq1nsT66j8qWW-IvIgRry_-RPwtsUIFJ-HZK6SL8CyHsuN8ds1bMSKCsUdlz4Nbt_Htk6PVj_b1Zbdx52pOOqDOeq08EGDqLGkUQSb9AxRAuW2hMQn3lG8t4NMy4C8Y_cIg_0g=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFbYYUgvlXuaiF3gQlUIfAAUPg7ThNO7dGEmL8CdAD6uCrX7GOspq1nsT66j8qWW-IvIgRry_-RPwtsUIFJ-HZK6SL8CyHsuN8ds1bMSKCsUdlz4Nbt_Htk6PVj_b1Zbdx52pOOqDOeq08EGDqLGkUQSb9AxRAuW2hMQn3lG8t4NMy4C8Y_cIg_0g=s1600', false, 2, 'Appartement meublé à LOGPOM Bassong - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEO6IlXJ4-lYpU5CGDemvngrGCIU3m5-hdeJ7dxJ_1plLj_Kl7_JdsazRXDUTJ7QvZFCL5d528MvhR5yToUZ6Q5Ib8WKKTmziH7M3PQG98pd1QuLYwmPH36adTqhFsYLOIxudWNUsTP0WMF-T17FyzlyIoiU7-lDksloDIfwND4Bg9u9ssvf0mo=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEO6IlXJ4-lYpU5CGDemvngrGCIU3m5-hdeJ7dxJ_1plLj_Kl7_JdsazRXDUTJ7QvZFCL5d528MvhR5yToUZ6Q5Ib8WKKTmziH7M3PQG98pd1QuLYwmPH36adTqhFsYLOIxudWNUsTP0WMF-T17FyzlyIoiU7-lDksloDIfwND4Bg9u9ssvf0mo=s1600', false, 3, 'Appartement meublé à LOGPOM Bassong - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHGdWG8qCrWhiZXf07WSNjlfHAchQ6y4YwQ9mH_qwE5idFEA7s0jbfkvMPgNoGsLNH5k1BOlV1gNXfqxQkwE10MT_D_W5lotvuX9zNzEM9mG5-fNfZrZR9nGs9adhFDGDKZT28RmtUnHm2pCnnMhG8CcDfB_CdNVI7LE0UvQ2fNGOfOJ9EdOYrw=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHGdWG8qCrWhiZXf07WSNjlfHAchQ6y4YwQ9mH_qwE5idFEA7s0jbfkvMPgNoGsLNH5k1BOlV1gNXfqxQkwE10MT_D_W5lotvuX9zNzEM9mG5-fNfZrZR9nGs9adhFDGDKZT28RmtUnHm2pCnnMhG8CcDfB_CdNVI7LE0UvQ2fNGOfOJ9EdOYrw=s1600', false, 4, 'Appartement meublé à LOGPOM Bassong - One-Bedroom Apartment')
  on conflict do nothing;

  -- [99] NEW LAND (Ndogbong)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'new-land-ndogbong',
    'apartment',
    'published',
    'NEW LAND',
    'NEW LAND
Catégorie : Complexe d''appartements meublés.
Adresse : Face Collège Dauphine Ndogbong, Douala.
Contact / WhatsApp : +237698911910.
Note Google Maps : 4.7/5 (16 avis).

Avis clients récents :
- "Note sans commentaire écrit." (sambo sadou, note 4/5)
- "Note sans commentaire écrit." (Gaëlle Oum, note 5/5)
- "Note sans commentaire écrit." (Demba Kouta, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'ndogbong'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Face Collège Dauphine Ndogbong, Douala',
    4.0591131,
    9.7496159,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLehjIC1Gb3c_KUPE7iwlfc_jXA9c1fcSsfIJNmbxdGh-jLjCe8eONVNwjSpce3KBIFKNXe_F5fp8hNR3VuHsvYz-bn0X4eOJxzuqPR_FpW1Z3iJhJI7wV0LyAsaCo46J5JyYZkJ=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLehjIC1Gb3c_KUPE7iwlfc_jXA9c1fcSsfIJNmbxdGh-jLjCe8eONVNwjSpce3KBIFKNXe_F5fp8hNR3VuHsvYz-bn0X4eOJxzuqPR_FpW1Z3iJhJI7wV0LyAsaCo46J5JyYZkJ=s1600', true, 0, 'NEW LAND')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SQ_LctQ-lelAzHPT10XHvXjVZiG-UpTAWO-t8oHLNCPEqAVa4XwDw2CMjte1_2550pA2-gQ6W6dAADwo-3qwaT9ql3IhYDl6uKSMEB9HdgnEKttPShQSJg0kKirSZz4xPU-VRo=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SQ_LctQ-lelAzHPT10XHvXjVZiG-UpTAWO-t8oHLNCPEqAVa4XwDw2CMjte1_2550pA2-gQ6W6dAADwo-3qwaT9ql3IhYDl6uKSMEB9HdgnEKttPShQSJg0kKirSZz4xPU-VRo=s1600', false, 1, 'NEW LAND')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R9a680PcYCc6MKWCRKijV8kVQehIOlJXrdgeEDwNHDPu5yP7HWuNwSu2tR6fIdSLboXBYnLdTXCxWCQvHbSS4ic5NksKzt0NBhxNIwwh_NGmb9UHCWnrPRCZHfULcUWF1YSxW5pQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R9a680PcYCc6MKWCRKijV8kVQehIOlJXrdgeEDwNHDPu5yP7HWuNwSu2tR6fIdSLboXBYnLdTXCxWCQvHbSS4ic5NksKzt0NBhxNIwwh_NGmb9UHCWnrPRCZHfULcUWF1YSxW5pQ=s1600', false, 2, 'NEW LAND')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TMkWj28EymIjN5yedkzrk0oOrRwNsSj8P7LqhWdBanpba6Ejt_EcUyzvoqyG25qzWAfIozc2zUQcfUcA3Jb58vkdkhmArhAG_354YXSznZgW1D1toZPXMoD2X15cZURnwD2EwY=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TMkWj28EymIjN5yedkzrk0oOrRwNsSj8P7LqhWdBanpba6Ejt_EcUyzvoqyG25qzWAfIozc2zUQcfUcA3Jb58vkdkhmArhAG_354YXSznZgW1D1toZPXMoD2X15cZURnwD2EwY=s1600', false, 3, 'NEW LAND')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TQMipwubYFQD2NkVoedPxfRT6EGfIORV_KwdI8qY05GcxttegSxvhe1GbRayjKuKGasRMvnzg7k2vUekiuKjmLOCbjPZWjjg7ttHuyr-5JZTUbzbGa5WGdZJd7-yzy6V2Q7Pmk=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TQMipwubYFQD2NkVoedPxfRT6EGfIORV_KwdI8qY05GcxttegSxvhe1GbRayjKuKGasRMvnzg7k2vUekiuKjmLOCbjPZWjjg7ttHuyr-5JZTUbzbGa5WGdZJd7-yzy6V2Q7Pmk=s1600', false, 4, 'NEW LAND')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QrqtOojp6wdbVBTX0CJivpmI3PgeX1oJtiWIhUVt4Af_-jaSzaFtdTbaUE106bt06h3B-9NLnd_2ovHyLecti5Xtrb6rQriFPsG9kg6W1NhlCvEskzskoIUWgVgrw3BB1Utmc=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QrqtOojp6wdbVBTX0CJivpmI3PgeX1oJtiWIhUVt4Af_-jaSzaFtdTbaUE106bt06h3B-9NLnd_2ovHyLecti5Xtrb6rQriFPsG9kg6W1NhlCvEskzskoIUWgVgrw3BB1Utmc=s1600', false, 5, 'NEW LAND')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QsdHQQyc0yBnC224DmyOA7P4v_R2VCEZV_13SsghyYdToTt0_2lKExVLbZIj7P6N_h7x06VaoKYyEpD9mmbTwkJPPPSl_aa5Wq7tC7qnQdEyMC1-LYLJRJ2Q9vydE4rzCLyE8f=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QsdHQQyc0yBnC224DmyOA7P4v_R2VCEZV_13SsghyYdToTt0_2lKExVLbZIj7P6N_h7x06VaoKYyEpD9mmbTwkJPPPSl_aa5Wq7tC7qnQdEyMC1-LYLJRJ2Q9vydE4rzCLyE8f=s1600', false, 6, 'NEW LAND')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TK1sgXkSHG8qRKIGgvrZ3fh6-gLl9aEG7VAszG7w6K6qPxwEwud6JzCKL62wUfDRVek-bwkIMTqIb_7yX_oxItOYfKDgFiNgGlRa8lH9NRD4zfCjFT7wwqQPqvwQi7GQfjqX0hoQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TK1sgXkSHG8qRKIGgvrZ3fh6-gLl9aEG7VAszG7w6K6qPxwEwud6JzCKL62wUfDRVek-bwkIMTqIb_7yX_oxItOYfKDgFiNgGlRa8lH9NRD4zfCjFT7wwqQPqvwQi7GQfjqX0hoQ=s1600', false, 7, 'NEW LAND')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SjZOEvq3NDMLw-NoiSd1G1EQywsXN1wUyeZpw_1L06dKn-CZ3q3fAm0GjIR2mjNPm8NDuEFmKfdcwBoN--PiCZM4UVKUdbAUNrbopz4FibDHCxr6uh92_DgKaCGt44L9fX7mWP=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SjZOEvq3NDMLw-NoiSd1G1EQywsXN1wUyeZpw_1L06dKn-CZ3q3fAm0GjIR2mjNPm8NDuEFmKfdcwBoN--PiCZM4UVKUdbAUNrbopz4FibDHCxr6uh92_DgKaCGt44L9fX7mWP=s1600', false, 8, 'NEW LAND')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Quy6mIWzOXEmLerDyjOAZ13amc4l1pVhjmUSSuRaiLrhTEdEaK2eTo3QqysXb12eaqVmWYzdc7tMkv0paLx8XDSY3vFq9wgg2pDwwHm2I-KniFLlcDZemrlOZEb3v07EaLHCeZ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Quy6mIWzOXEmLerDyjOAZ13amc4l1pVhjmUSSuRaiLrhTEdEaK2eTo3QqysXb12eaqVmWYzdc7tMkv0paLx8XDSY3vFq9wgg2pDwwHm2I-KniFLlcDZemrlOZEb3v07EaLHCeZ=s1600', false, 9, 'NEW LAND')
  on conflict do nothing;

  -- [100] Baobab Lodge Douala (Makepe) (Makepe)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'baobab-lodge-douala-makepe-makepe',
    'apartment',
    'published',
    'Baobab Lodge Douala (Makepe)',
    'Baobab Lodge Douala (Makepe)
Catégorie : Complexe d''appartements meublés.
Adresse : TotalEnergies Makepe, Douala.
Contact / WhatsApp : +237693060019.
Note Google Maps : 5/5 (1 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Ndang Loveline, note 5/5)
- "Note sans commentaire écrit." (Ndang Loveline, note 5/5)
- "Note sans commentaire écrit." (Ndang Loveline, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'makepe'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'TotalEnergies Makepe, Douala',
    4.0766909,
    9.7510798,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLe_TvFWPyGtZquetRU0TiPShHBDpgxVrvm4HyEH4nqUUihjFg3ISSMDCTuabJWXZvecC2euBNjMOlPEvIm24TqsXMt550lbIHqqsjmlYccRjajoO6il06tR4TBSBo_25ojHC63x-AKHJPGy=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLe_TvFWPyGtZquetRU0TiPShHBDpgxVrvm4HyEH4nqUUihjFg3ISSMDCTuabJWXZvecC2euBNjMOlPEvIm24TqsXMt550lbIHqqsjmlYccRjajoO6il06tR4TBSBo_25ojHC63x-AKHJPGy=s1600', true, 0, 'Baobab Lodge Douala (Makepe)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TnSKJ18LKOPfVD9xj8T2S2phXeH700w1Qsng70IlnzCUpoV9ArRWUdfHNzXFS7wGIFv9-DndkaAWx8xAoDUWU8Abs_W-D4uDEMzUcnWe4UJQ9eq-JIhQY-2-1KqMI1ugbCmGWtqtgEoc6x=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TnSKJ18LKOPfVD9xj8T2S2phXeH700w1Qsng70IlnzCUpoV9ArRWUdfHNzXFS7wGIFv9-DndkaAWx8xAoDUWU8Abs_W-D4uDEMzUcnWe4UJQ9eq-JIhQY-2-1KqMI1ugbCmGWtqtgEoc6x=s1600', false, 1, 'Baobab Lodge Douala (Makepe)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RRXz-M718HbucJ5Us8HUZuQobHi2kq63omrcST1UHor1Q66gwiUWnIE0YsGEs9vw5owbovIGDvouc3JPzdKKf1NH39YdNtdaOp8NqmXkVX2k0QdWqdQ5rPYbUWsL2tWFoA1sUU2FWSrjyV=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RRXz-M718HbucJ5Us8HUZuQobHi2kq63omrcST1UHor1Q66gwiUWnIE0YsGEs9vw5owbovIGDvouc3JPzdKKf1NH39YdNtdaOp8NqmXkVX2k0QdWqdQ5rPYbUWsL2tWFoA1sUU2FWSrjyV=s1600', false, 2, 'Baobab Lodge Douala (Makepe)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QNfMorhDoJFpDSZCRwf7ABECyCvYSW-sDSygtyF0bOArOCousD4UhlDgqWHOGQzhzSHlu_hs5vn54WajSCv1fZeXdB0ho_l6VWNwh62RBf_uEJfANp5uEp7acueRZsWabj4c8UiMgR0Pk=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QNfMorhDoJFpDSZCRwf7ABECyCvYSW-sDSygtyF0bOArOCousD4UhlDgqWHOGQzhzSHlu_hs5vn54WajSCv1fZeXdB0ho_l6VWNwh62RBf_uEJfANp5uEp7acueRZsWabj4c8UiMgR0Pk=s1600', false, 3, 'Baobab Lodge Douala (Makepe)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SFcVWiXn_Vjb-tRDVI7LtX-ge2Uq4HpSJACjNeoMfyAlo086rJ9jQwVqFZHWea26I7F6GPqodoXZpIqR791pHqkRrApW9HrGmyC0-WuS6tEjJ2CpW6Iwy9x3J6siG2JyxQ6Z_TaFGYKt5E=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SFcVWiXn_Vjb-tRDVI7LtX-ge2Uq4HpSJACjNeoMfyAlo086rJ9jQwVqFZHWea26I7F6GPqodoXZpIqR791pHqkRrApW9HrGmyC0-WuS6tEjJ2CpW6Iwy9x3J6siG2JyxQ6Z_TaFGYKt5E=s1600', false, 4, 'Baobab Lodge Douala (Makepe)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TbAKal_m3JcsaFrsxJDvqIwHSSjai5Vg-9PVsi2-0rs5ICNYcsfq_0ovStsfRxLeRNFoWQAS5atF0zBLQU15XrjOuxdEHzNTZzsKBBLmWMZJnQ5F4fUnnZoy7vpSyxKF6VVrh42WgJJ7kS=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TbAKal_m3JcsaFrsxJDvqIwHSSjai5Vg-9PVsi2-0rs5ICNYcsfq_0ovStsfRxLeRNFoWQAS5atF0zBLQU15XrjOuxdEHzNTZzsKBBLmWMZJnQ5F4fUnnZoy7vpSyxKF6VVrh42WgJJ7kS=s1600', false, 5, 'Baobab Lodge Douala (Makepe)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RLhqIGu-MIKh99ud5AFaA7i0LUuxnMEfml5o-8SySEJeOaPLs-B6Gi4HnoUBeg8p4hlYNmPSaT1Ry8pC7vlnibaDGp4p0H1KbL7cKKNo0aRC8JdZbkEpasd0W49nU9k5byujqS77qGZGGZ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RLhqIGu-MIKh99ud5AFaA7i0LUuxnMEfml5o-8SySEJeOaPLs-B6Gi4HnoUBeg8p4hlYNmPSaT1Ry8pC7vlnibaDGp4p0H1KbL7cKKNo0aRC8JdZbkEpasd0W49nU9k5byujqS77qGZGGZ=s1600', false, 6, 'Baobab Lodge Douala (Makepe)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qg5xDK0SorafipvRh0D7MSnA3PWhWttaQSg-bihgsF-wQQiTfXec8qMZLekimk1vAgu8anDKhDqALw2Bu5kz4KIIPlfra2Q8ZwTaZ4XQHnY5PbHN3ONDGFtrMWfigXf_Mu6fI-Z_ksEDkL=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qg5xDK0SorafipvRh0D7MSnA3PWhWttaQSg-bihgsF-wQQiTfXec8qMZLekimk1vAgu8anDKhDqALw2Bu5kz4KIIPlfra2Q8ZwTaZ4XQHnY5PbHN3ONDGFtrMWfigXf_Mu6fI-Z_ksEDkL=s1600', false, 7, 'Baobab Lodge Douala (Makepe)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TURdtCFLlmfohlztcrEKemP1MIg9OK9qZdJyaN3R14fnkSoLA9PtLnu8r3EP7K9SiyXC7jJWeUJG2kvei5qtJrGzWe6hsL7AFniMLpk4KmGwuC8W_TBdfNkfkaouPJS01V7NE2qj2kWkgx=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TURdtCFLlmfohlztcrEKemP1MIg9OK9qZdJyaN3R14fnkSoLA9PtLnu8r3EP7K9SiyXC7jJWeUJG2kvei5qtJrGzWe6hsL7AFniMLpk4KmGwuC8W_TBdfNkfkaouPJS01V7NE2qj2kWkgx=s1600', false, 8, 'Baobab Lodge Douala (Makepe)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLe_TvFWPyGtZquetRU0TiPShHBDpgxVrvm4HyEH4nqUUihjFg3ISSMDCTuabJWXZvecC2euBNjMOlPEvIm24TqsXMt550lbIHqqsjmlYccRjajoO6il06tR4TBSBo_25ojHC63x-AKHJPGy=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLe_TvFWPyGtZquetRU0TiPShHBDpgxVrvm4HyEH4nqUUihjFg3ISSMDCTuabJWXZvecC2euBNjMOlPEvIm24TqsXMt550lbIHqqsjmlYccRjajoO6il06tR4TBSBo_25ojHC63x-AKHJPGy=s1600-p-k-no', false, 9, 'Baobab Lodge Douala (Makepe)')
  on conflict do nothing;

  -- [101] Ébène Residence Logpom (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'ebene-residence-logpom-logpom',
    'apartment',
    'published',
    'Ébène Residence Logpom',
    'Ébène Residence Logpom
Catégorie : Résidence.
Adresse : 3QCG+RVX, Douala.
Note Google Maps : 5/5 (4 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Marie claire Kouaga, note 5/5)
- "Note sans commentaire écrit." (severin Meli, note 5/5)
- "Note sans commentaire écrit." (Marie Claire Kouaga, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3QCG+RVX, Douala',
    4.0721133,
    9.7773081,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLf0sYdvSNHJsfLILbB8b8ajAb0MpgtP0TRfgnbRJb8ydREeSXI7CNFhirD07akSoDRYODUI-WH9Lx7rsWr_VaoClVGksBXJrPAoW9LAG9lvg_1RimuttJalwQgS1or26UBL0lRQuqTp3AjT=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLf0sYdvSNHJsfLILbB8b8ajAb0MpgtP0TRfgnbRJb8ydREeSXI7CNFhirD07akSoDRYODUI-WH9Lx7rsWr_VaoClVGksBXJrPAoW9LAG9lvg_1RimuttJalwQgS1or26UBL0lRQuqTp3AjT=s1600', true, 0, 'Ébène Residence Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLf0sYdvSNHJsfLILbB8b8ajAb0MpgtP0TRfgnbRJb8ydREeSXI7CNFhirD07akSoDRYODUI-WH9Lx7rsWr_VaoClVGksBXJrPAoW9LAG9lvg_1RimuttJalwQgS1or26UBL0lRQuqTp3AjT=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLf0sYdvSNHJsfLILbB8b8ajAb0MpgtP0TRfgnbRJb8ydREeSXI7CNFhirD07akSoDRYODUI-WH9Lx7rsWr_VaoClVGksBXJrPAoW9LAG9lvg_1RimuttJalwQgS1or26UBL0lRQuqTp3AjT=s1600-p-k-no', false, 1, 'Ébène Residence Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R0Mbp_MBKVVo4PfvIhrObjsnTxXWXFCt1eM47i6-dSOC5IZg-3zKuBxtR_ap-xy0tRrK1G8XStMgqqjuJtrApVkUgR39-iHvGCKt6cIWNJtyaqoGyB2fXZFp_4PyYH2fF5n6ea8ktYslCU=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R0Mbp_MBKVVo4PfvIhrObjsnTxXWXFCt1eM47i6-dSOC5IZg-3zKuBxtR_ap-xy0tRrK1G8XStMgqqjuJtrApVkUgR39-iHvGCKt6cIWNJtyaqoGyB2fXZFp_4PyYH2fF5n6ea8ktYslCU=s1600', false, 2, 'Ébène Residence Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T-dwmYErbHg-6-ylcAL25Ll3CAHQ8LgxwLcKrmajj3MrFSFD6_0M7LPgSiLmvfSPSP1xyyKYVCN024lo_L7eoNx2dC_LbN1_VumkNS284F2oqoLPJWe8-F7cNW_B5K7OGEXsYZF9oTGtw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T-dwmYErbHg-6-ylcAL25Ll3CAHQ8LgxwLcKrmajj3MrFSFD6_0M7LPgSiLmvfSPSP1xyyKYVCN024lo_L7eoNx2dC_LbN1_VumkNS284F2oqoLPJWe8-F7cNW_B5K7OGEXsYZF9oTGtw=s1600', false, 3, 'Ébène Residence Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SOLQyy3T8TI3j9kA4gX4xqCYDZhociauzeSfI-k5xQMNBlCpx9U-Lb_B4dS5TPZoVvwBvqlPALUvOcb_FztTF4yj6xC10SKW7Kc2-EzSnbwT-87Vx7Jxna1tX4vWUhf8w7MwbDIIKUAhTh=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SOLQyy3T8TI3j9kA4gX4xqCYDZhociauzeSfI-k5xQMNBlCpx9U-Lb_B4dS5TPZoVvwBvqlPALUvOcb_FztTF4yj6xC10SKW7Kc2-EzSnbwT-87Vx7Jxna1tX4vWUhf8w7MwbDIIKUAhTh=s1600', false, 4, 'Ébène Residence Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RyV5ek0V-Y_kaBfKRMLVw3QtzsGPwRdD8FnL6q342cC5jSaoOh6f00RoxREftJ3SPhky6CCbBvCoRg7Dws6sA8auQz-eZrAQ8OdKao8g7WZHnZ328Lk0nh-omT7i-mos7SUrH3fgJ7acef=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RyV5ek0V-Y_kaBfKRMLVw3QtzsGPwRdD8FnL6q342cC5jSaoOh6f00RoxREftJ3SPhky6CCbBvCoRg7Dws6sA8auQz-eZrAQ8OdKao8g7WZHnZ328Lk0nh-omT7i-mos7SUrH3fgJ7acef=s1600', false, 5, 'Ébène Residence Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RBaiE4G_435RMSBmYQmojVpBw2etGCuP36BrtaH-6xU0Nf8Ux8EJP7yFp36g9GGKFOm-zOFutcXuJopwZ6bvS7HM_FGWfi73Q3kOpGma43UTxJTKwAJWIfEU_SbZbrR_Etu5bge0FyFmun=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RBaiE4G_435RMSBmYQmojVpBw2etGCuP36BrtaH-6xU0Nf8Ux8EJP7yFp36g9GGKFOm-zOFutcXuJopwZ6bvS7HM_FGWfi73Q3kOpGma43UTxJTKwAJWIfEU_SbZbrR_Etu5bge0FyFmun=s1600', false, 6, 'Ébène Residence Logpom')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a/ACg8ocId7GN3_R3drRhfq27D03Xnzk8BunmzRrTUXg1QHGHlDdY2nQ=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a/ACg8ocId7GN3_R3drRhfq27D03Xnzk8BunmzRrTUXg1QHGHlDdY2nQ=s1600-p-k-no-mo', false, 7, 'Ébène Residence Logpom')
  on conflict do nothing;

  -- [102] LS APPARTEMENTS MEUBLES (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'ls-appartements-meubles-logpom',
    'apartment',
    'published',
    'LS APPARTEMENTS MEUBLES',
    'LS APPARTEMENTS MEUBLES
Catégorie : Agence de location d''appartements.
Adresse : Douala.
Contact / WhatsApp : +237690326320.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0845154,
    9.7704132,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeJzV96AQgpEOBjOUE-skoHT-2QBWm0HnWzxzHoc8mKFrcYTtb5PxYqF1e3Yhoz7ZY8KcwXhQqYuXEgy70DJgDOOJzqpn_RAS2TVsHNILYtReGwSYbQiXUytbE07NEVUSNhnhqEww=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeJzV96AQgpEOBjOUE-skoHT-2QBWm0HnWzxzHoc8mKFrcYTtb5PxYqF1e3Yhoz7ZY8KcwXhQqYuXEgy70DJgDOOJzqpn_RAS2TVsHNILYtReGwSYbQiXUytbE07NEVUSNhnhqEww=s1600', true, 0, 'LS APPARTEMENTS MEUBLES')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeJzV96AQgpEOBjOUE-skoHT-2QBWm0HnWzxzHoc8mKFrcYTtb5PxYqF1e3Yhoz7ZY8KcwXhQqYuXEgy70DJgDOOJzqpn_RAS2TVsHNILYtReGwSYbQiXUytbE07NEVUSNhnhqEww=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeJzV96AQgpEOBjOUE-skoHT-2QBWm0HnWzxzHoc8mKFrcYTtb5PxYqF1e3Yhoz7ZY8KcwXhQqYuXEgy70DJgDOOJzqpn_RAS2TVsHNILYtReGwSYbQiXUytbE07NEVUSNhnhqEww=s1600-p-k-no', false, 1, 'LS APPARTEMENTS MEUBLES')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RlFzg8odzZ2NljelxFQT52Rs5XTJvjii0rV16S0npOAS6N3dLdYexmf1kE3t6k7-F6XG9g6oNUKM7b4DSc_74_2WFRRxEBSakapQLRZZbmuordrNLVlR5gufv3popSFZKOhZIjyg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RlFzg8odzZ2NljelxFQT52Rs5XTJvjii0rV16S0npOAS6N3dLdYexmf1kE3t6k7-F6XG9g6oNUKM7b4DSc_74_2WFRRxEBSakapQLRZZbmuordrNLVlR5gufv3popSFZKOhZIjyg=s1600', false, 2, 'LS APPARTEMENTS MEUBLES')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RB8lHdnveMWWAOOEvIToqt1QDdsrVSVj3d8f08Ec6XtDdwD7PRW-Qiy2P2-DsiHsyVNeMJZGlJrl5JpgYgJhI29v-cxc5615AQlyuX7TSG7LVfR_0lo8L98ogdsazeLPaq=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RB8lHdnveMWWAOOEvIToqt1QDdsrVSVj3d8f08Ec6XtDdwD7PRW-Qiy2P2-DsiHsyVNeMJZGlJrl5JpgYgJhI29v-cxc5615AQlyuX7TSG7LVfR_0lo8L98ogdsazeLPaq=s1600', false, 3, 'LS APPARTEMENTS MEUBLES')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R-98OwSKYFEB5CAmlwHlDMX5oFjp-VICVcq1uXdfChyDXPfTH3-F_VpwnJP6eGZvALYVAmYSU9QR2XKRbo27uvNd1mATUtgN7hkLfrgA0HDwOrxKDQrYGm9raxvVlE_PFeXqWb=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R-98OwSKYFEB5CAmlwHlDMX5oFjp-VICVcq1uXdfChyDXPfTH3-F_VpwnJP6eGZvALYVAmYSU9QR2XKRbo27uvNd1mATUtgN7hkLfrgA0HDwOrxKDQrYGm9raxvVlE_PFeXqWb=s1600', false, 4, 'LS APPARTEMENTS MEUBLES')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TOPZm2LN0I3uIKifV11LGPgo7GIGVNZet3AZ0af0UX_GCeShf-p7V0tz7deUBI0GsFXylcH-0_8u-7DQ_iUxvIjhZGsI0fj1PLQjdYRieCh0YSM_UunzhFipkoaSv0vRQuDyLN=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TOPZm2LN0I3uIKifV11LGPgo7GIGVNZet3AZ0af0UX_GCeShf-p7V0tz7deUBI0GsFXylcH-0_8u-7DQ_iUxvIjhZGsI0fj1PLQjdYRieCh0YSM_UunzhFipkoaSv0vRQuDyLN=s1600', false, 5, 'LS APPARTEMENTS MEUBLES')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q5L0vSoZgvIvaO7uRgqThsajl5fbDJdpzkSvXYNUKBu4IwUzia3vMM2NkwnHcWTtJw0RT9NJ5M_PfkhZT-jhHd3ibfz0s2CNsBR4Z2tWJnyQV7m-cfI2gIIGdNdLQ7dys6a8hZQA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q5L0vSoZgvIvaO7uRgqThsajl5fbDJdpzkSvXYNUKBu4IwUzia3vMM2NkwnHcWTtJw0RT9NJ5M_PfkhZT-jhHd3ibfz0s2CNsBR4Z2tWJnyQV7m-cfI2gIIGdNdLQ7dys6a8hZQA=s1600', false, 6, 'LS APPARTEMENTS MEUBLES')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SBe1Iqj63Wh9TVxkS4GtgC_YusJYRJqqp1rDJwk7jgJ3lw7B2Cis9qHIIOqlhbBKRZnA1y7nc9WCdlvhE3yJ1rBenExt5na8jg5k6BlANnSApcXJoqTgOUb1Gf2hpP4LwFa70n=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SBe1Iqj63Wh9TVxkS4GtgC_YusJYRJqqp1rDJwk7jgJ3lw7B2Cis9qHIIOqlhbBKRZnA1y7nc9WCdlvhE3yJ1rBenExt5na8jg5k6BlANnSApcXJoqTgOUb1Gf2hpP4LwFa70n=s1600', false, 7, 'LS APPARTEMENTS MEUBLES')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a-/ALV-UjWJ1vCd_ZXLCDhBk-8tG1Th9TaZmrNclXh6eRHew87MoAnct5E=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a-/ALV-UjWJ1vCd_ZXLCDhBk-8tG1Th9TaZmrNclXh6eRHew87MoAnct5E=s1600-p-k-no-mo', false, 8, 'LS APPARTEMENTS MEUBLES')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RKAalYFcEmVooqAnq6brSJh3avTAu_VpkZLarzBqjlnbJEjnHJGKmMX-6R_INqRUW-merwpgtPXnOVJQt3xgrX6xXYzpU2Ezp-aJgRNQtmdFhDjBYYdGtwIeCSAe7Rh88FU3wl=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RKAalYFcEmVooqAnq6brSJh3avTAu_VpkZLarzBqjlnbJEjnHJGKmMX-6R_INqRUW-merwpgtPXnOVJQt3xgrX6xXYzpU2Ezp-aJgRNQtmdFhDjBYYdGtwIeCSAe7Rh88FU3wl=s1600', false, 9, 'LS APPARTEMENTS MEUBLES')
  on conflict do nothing;

  -- [103] MEUBLÉ PROJET DE DIEU (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'meuble-projet-de-dieu-logpom',
    'apartment',
    'published',
    'MEUBLÉ PROJET DE DIEU',
    'MEUBLÉ PROJET DE DIEU
Catégorie : Location d''appartement de vacances.
Adresse : 3QH5+MFX, Douala.
Contact / WhatsApp : +237678018816.
Note Google Maps : 5/5 (1 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Narcisse NOUBIENGANG, note 5/5)
- "Note sans commentaire écrit." (Narcisse NOUBIENGANG, note 5/5)
- "Note sans commentaire écrit." (Narcisse NOUBIENGANG, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3QH5+MFX, Douala',
    4.0792286,
    9.7587267,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLd0U8QzvUxCwaZWulIXa88ta7gKJ0vedQXyTXNJuRzW9FTOHCmxEvmHe4FhK0R9WUjszQd1CG0DQaBSYzaLo-cCnfBCTwhJh3DZzoOBvpwc8dicP5Dj45gFnYwosS14N9ZV5cJFge4Adjo=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLd0U8QzvUxCwaZWulIXa88ta7gKJ0vedQXyTXNJuRzW9FTOHCmxEvmHe4FhK0R9WUjszQd1CG0DQaBSYzaLo-cCnfBCTwhJh3DZzoOBvpwc8dicP5Dj45gFnYwosS14N9ZV5cJFge4Adjo=s1600', true, 0, 'MEUBLÉ PROJET DE DIEU')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLd0U8QzvUxCwaZWulIXa88ta7gKJ0vedQXyTXNJuRzW9FTOHCmxEvmHe4FhK0R9WUjszQd1CG0DQaBSYzaLo-cCnfBCTwhJh3DZzoOBvpwc8dicP5Dj45gFnYwosS14N9ZV5cJFge4Adjo=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLd0U8QzvUxCwaZWulIXa88ta7gKJ0vedQXyTXNJuRzW9FTOHCmxEvmHe4FhK0R9WUjszQd1CG0DQaBSYzaLo-cCnfBCTwhJh3DZzoOBvpwc8dicP5Dj45gFnYwosS14N9ZV5cJFge4Adjo=s1600-p-k-no', false, 1, 'MEUBLÉ PROJET DE DIEU')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QR35SS4MaoID-J8drMGP7nSNyr5Gisf7CfgmQHGja-00wPXYFrH3axnPI408ntlbrIUUtfRCh_MFmPUtIMKpGwf0gRcWqT10X9jaeKC-2i8_4J3CzDHOoUDRj5qUMs93eqr_nA8VetbwQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QR35SS4MaoID-J8drMGP7nSNyr5Gisf7CfgmQHGja-00wPXYFrH3axnPI408ntlbrIUUtfRCh_MFmPUtIMKpGwf0gRcWqT10X9jaeKC-2i8_4J3CzDHOoUDRj5qUMs93eqr_nA8VetbwQ=s1600', false, 2, 'MEUBLÉ PROJET DE DIEU')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QUScQrfvHgov1fzzYd_lERK03gfsaAJbvl6GAlzR3J7sIPO1xzBlJgSMJkQ5PINqgerEsSKwWFe3ICVsG7Xf8JN5OItwCqLQiUj8mKVY2vIe14XtshMUhFO7SaUGOPwQIRNDxZ89YyPeg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QUScQrfvHgov1fzzYd_lERK03gfsaAJbvl6GAlzR3J7sIPO1xzBlJgSMJkQ5PINqgerEsSKwWFe3ICVsG7Xf8JN5OItwCqLQiUj8mKVY2vIe14XtshMUhFO7SaUGOPwQIRNDxZ89YyPeg=s1600', false, 3, 'MEUBLÉ PROJET DE DIEU')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SMuBDlAJdaulfBlEsAOTjv4vZirlAP4a7Jmm1Qdmizx-0H6eLplCP3UeUZpDPqX6DOWJjNq_eIPyd91ulAlT2DOxgfb0zlyYhwoxWd_APtmY1pn2owL5mmJQUFZSUqg4FWqZLouxiU8JQ0=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SMuBDlAJdaulfBlEsAOTjv4vZirlAP4a7Jmm1Qdmizx-0H6eLplCP3UeUZpDPqX6DOWJjNq_eIPyd91ulAlT2DOxgfb0zlyYhwoxWd_APtmY1pn2owL5mmJQUFZSUqg4FWqZLouxiU8JQ0=s1600', false, 4, 'MEUBLÉ PROJET DE DIEU')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TG0tt6N__vuemtnazjW4oDnDRmMTDr-RtoREWmRfKz-Cx5y_IToS4-hKrYUiCsdWv3XjMiK2KSUcpY8Ky0gvyQcn0guk7z6Y_92p04EJktTC14kiGJjVjXyI-kXUg4sD9WpLHceaFaWLKR=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TG0tt6N__vuemtnazjW4oDnDRmMTDr-RtoREWmRfKz-Cx5y_IToS4-hKrYUiCsdWv3XjMiK2KSUcpY8Ky0gvyQcn0guk7z6Y_92p04EJktTC14kiGJjVjXyI-kXUg4sD9WpLHceaFaWLKR=s1600', false, 5, 'MEUBLÉ PROJET DE DIEU')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T1fdesImDLaCGEzqXGuL0MriH08UCm-EDzd5rKnU7S393J9hvloswp6DxPr6Fwz6bwTfvJ8Vj5IBiha56HhR7XNWg90gEbeDBY96WzLdMejLB9Ktib_Liwgpz7nXLeAYz0UAfkL2cH_OvN=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T1fdesImDLaCGEzqXGuL0MriH08UCm-EDzd5rKnU7S393J9hvloswp6DxPr6Fwz6bwTfvJ8Vj5IBiha56HhR7XNWg90gEbeDBY96WzLdMejLB9Ktib_Liwgpz7nXLeAYz0UAfkL2cH_OvN=s1600', false, 6, 'MEUBLÉ PROJET DE DIEU')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SHCj79rd4PhVyP2cn_XiqPVsqPdOjAPwNvpgpnWBBrv0rxCBusgccZd8MFIAuFu6TvLHGk_qk4nZ7YVoaDSDS63ApDFaNA1St6w16KWafFG3uFw9RZzsZ9j9JrW62iMAWEvsWcr0ahrlck=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SHCj79rd4PhVyP2cn_XiqPVsqPdOjAPwNvpgpnWBBrv0rxCBusgccZd8MFIAuFu6TvLHGk_qk4nZ7YVoaDSDS63ApDFaNA1St6w16KWafFG3uFw9RZzsZ9j9JrW62iMAWEvsWcr0ahrlck=s1600', false, 7, 'MEUBLÉ PROJET DE DIEU')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a-/ALV-UjVO8E-qY5VMKt6DmZniRlPD7ZsbMR98guAttz2r72qJCXeokdMd=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a-/ALV-UjVO8E-qY5VMKt6DmZniRlPD7ZsbMR98guAttz2r72qJCXeokdMd=s1600-p-k-no-mo', false, 8, 'MEUBLÉ PROJET DE DIEU')
  on conflict do nothing;

  -- [104] Appart Meublé G2C (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appart-meuble-g2c-logpom',
    'apartment',
    'published',
    'Appart Meublé G2C',
    'Appart Meublé G2C
Catégorie : Location d''appartement de vacances.
Adresse : 3QP9+XMR Immeuble KOLONTCHA, Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3QP9+XMR Immeuble KOLONTCHA, Douala',
    4.0874806,
    9.7691353,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  -- [105] appartement meublé a logpom douala - Three-Bedroom Apartment (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-a-logpom-douala-three-bedroom-apartment-logpom',
    'room',
    'published',
    'appartement meublé a logpom douala - Three-Bedroom Apartment',
    'appartement meublé a logpom douala - Three-Bedroom Apartment
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0808502,
    9.7719498,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3wvIaibAt_UOdrjGogHcFukdkDpr2nk8EY1N1ejUGpqr3q9w6RLfhsTF4zwJBqwNx-s_SYXrvDxMYJVIThsFBeLsZ6omHyfGIBIYqZn2ZHkdmi74Nhi1r0IQvTx4sTu2Cj2kmXGF7DIoMh6r1-2bABJaqwWWGXF_ZLMJVtvSVUSFjAEpi0YjS9=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3wvIaibAt_UOdrjGogHcFukdkDpr2nk8EY1N1ejUGpqr3q9w6RLfhsTF4zwJBqwNx-s_SYXrvDxMYJVIThsFBeLsZ6omHyfGIBIYqZn2ZHkdmi74Nhi1r0IQvTx4sTu2Cj2kmXGF7DIoMh6r1-2bABJaqwWWGXF_ZLMJVtvSVUSFjAEpi0YjS9=s1600-p-k-no', true, 0, 'appartement meublé a logpom douala - Three-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhH6z9fHlhfVvDXNO-tO8gj0WoESXV3MWBFezksciuFs1JQ5GwYeRRkKQViQGO4V2zukI6HL1jwMBfkwM7CFMH0QNIfCg8_0qt60fB-GWLTKkyHjxvbspuY311sK5Hcpu47MVxUD1oAQAhIs462Nqlo924ehKQgciNVuDryqWX_s47JxqG20HXJ6=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhH6z9fHlhfVvDXNO-tO8gj0WoESXV3MWBFezksciuFs1JQ5GwYeRRkKQViQGO4V2zukI6HL1jwMBfkwM7CFMH0QNIfCg8_0qt60fB-GWLTKkyHjxvbspuY311sK5Hcpu47MVxUD1oAQAhIs462Nqlo924ehKQgciNVuDryqWX_s47JxqG20HXJ6=s1600', false, 1, 'appartement meublé a logpom douala - Three-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEwW2iqeBqpo8H-nwnFbvpaR9RnkNwOI-dOtvKqjdrVCvpD5y9Mml708FnrYivIwxrj1TYZP9EUGgmN6A8BLddnfDX48odyPSem0jfMwCYVE9PmaMSm-9OytQhVpcM-ikgngE9GUfFAB-lfOwYs5kwc2Mbc_QcggIVCDlImH43Dt1200YgKQMzg5w=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEwW2iqeBqpo8H-nwnFbvpaR9RnkNwOI-dOtvKqjdrVCvpD5y9Mml708FnrYivIwxrj1TYZP9EUGgmN6A8BLddnfDX48odyPSem0jfMwCYVE9PmaMSm-9OytQhVpcM-ikgngE9GUfFAB-lfOwYs5kwc2Mbc_QcggIVCDlImH43Dt1200YgKQMzg5w=s1600', false, 2, 'appartement meublé a logpom douala - Three-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHNNAu038D4D1T3Bn2uJydVxt0XikM5j99gnVYrYZZC_OtH9ZtNduNxlng8X1yXxGCqBv8Hrf2F1ZCn1_blFaTsPHov24LRkYnSvx5W-wuVBXvDMAiA3zb51qiziajucZJkNe9UmaXKE9rt5e53ZeEMXzhlzpgG88owzbCApCtPDx24Odb9ovQ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHNNAu038D4D1T3Bn2uJydVxt0XikM5j99gnVYrYZZC_OtH9ZtNduNxlng8X1yXxGCqBv8Hrf2F1ZCn1_blFaTsPHov24LRkYnSvx5W-wuVBXvDMAiA3zb51qiziajucZJkNe9UmaXKE9rt5e53ZeEMXzhlzpgG88owzbCApCtPDx24Odb9ovQ=s1600', false, 3, 'appartement meublé a logpom douala - Three-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGsWqSZg8aHMTb7lhbJooM-BZ71tYvEi_pr31MQr4OtLbRjKazu7PR-L2p6uyq8Hg1PhhOohn3XE4Yb-nCaRR9pL0AVUdEBaLJ2BzpnetQdzbnkpj40dI1oR_-ODsEcSgaxfjPnie-vadXqwKmyCmoh9BsVvd0pc4MmoYWJXqc7w8FvRo76rMvsNA=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGsWqSZg8aHMTb7lhbJooM-BZ71tYvEi_pr31MQr4OtLbRjKazu7PR-L2p6uyq8Hg1PhhOohn3XE4Yb-nCaRR9pL0AVUdEBaLJ2BzpnetQdzbnkpj40dI1oR_-ODsEcSgaxfjPnie-vadXqwKmyCmoh9BsVvd0pc4MmoYWJXqc7w8FvRo76rMvsNA=s1600', false, 4, 'appartement meublé a logpom douala - Three-Bedroom Apartment')
  on conflict do nothing;

  -- [106] CAMERHOME LYCEE CITÉ DES PALMIERS (Logpom)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'camerhome-lycee-cite-des-palmiers-logpom',
    'apartment',
    'published',
    'CAMERHOME LYCEE CITÉ DES PALMIERS',
    'CAMERHOME LYCEE CITÉ DES PALMIERS
Adresse : 3Q47+65C, Douala.
Contact / WhatsApp : +237697674875.
Note Google Maps : 4.1/5 (21 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'logpom'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3Q47+65C, Douala',
    4.055552,
    9.762899,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcNeNCGe46w093IVae_3TsiXchLqpoMTvtwEZPLROIMjEGTEVkc448Pn2pKACu0-HMxIeUQgt41CaFlvoIoMC7cfYSeq0DMJAfEtaU0ov1MCrOacGBUBaEAw0qtNGIq-JkK0Mrr=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcNeNCGe46w093IVae_3TsiXchLqpoMTvtwEZPLROIMjEGTEVkc448Pn2pKACu0-HMxIeUQgt41CaFlvoIoMC7cfYSeq0DMJAfEtaU0ov1MCrOacGBUBaEAw0qtNGIq-JkK0Mrr=s1600', true, 0, 'CAMERHOME LYCEE CITÉ DES PALMIERS')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcNeNCGe46w093IVae_3TsiXchLqpoMTvtwEZPLROIMjEGTEVkc448Pn2pKACu0-HMxIeUQgt41CaFlvoIoMC7cfYSeq0DMJAfEtaU0ov1MCrOacGBUBaEAw0qtNGIq-JkK0Mrr=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcNeNCGe46w093IVae_3TsiXchLqpoMTvtwEZPLROIMjEGTEVkc448Pn2pKACu0-HMxIeUQgt41CaFlvoIoMC7cfYSeq0DMJAfEtaU0ov1MCrOacGBUBaEAw0qtNGIq-JkK0Mrr=s1600-p-k-no', false, 1, 'CAMERHOME LYCEE CITÉ DES PALMIERS')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SOiyhnZqSTm-gl3YM_Qt5nxbAvNuDOTIkoVksZbwGtD8myHR5uyZQa7N0TC7UYnT8U3ykf7AL52hEn1R2-OpB86n7F3TW0g5JtXDa_jZATFNFO4g9Z68JH-gYATulqN6ujPuPJ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SOiyhnZqSTm-gl3YM_Qt5nxbAvNuDOTIkoVksZbwGtD8myHR5uyZQa7N0TC7UYnT8U3ykf7AL52hEn1R2-OpB86n7F3TW0g5JtXDa_jZATFNFO4g9Z68JH-gYATulqN6ujPuPJ=s1600', false, 2, 'CAMERHOME LYCEE CITÉ DES PALMIERS')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFf0eZd96BtmbWLj7koGWRu7vBSb-lW1F5LqLbV18HLuDDcg-VvoaozJ-KnKkxMBD74RELXF54OfK_jm9PjMLnBha7m4ZvNjTb9iAz_TrKtmooYw6aquFHYJduFSPYw9FXYacSQ86OL0QEt0avyWYYsTLjnlDahg7cB1t1Grcju1IGC4OaOKapU=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFf0eZd96BtmbWLj7koGWRu7vBSb-lW1F5LqLbV18HLuDDcg-VvoaozJ-KnKkxMBD74RELXF54OfK_jm9PjMLnBha7m4ZvNjTb9iAz_TrKtmooYw6aquFHYJduFSPYw9FXYacSQ86OL0QEt0avyWYYsTLjnlDahg7cB1t1Grcju1IGC4OaOKapU=s1600', false, 3, 'CAMERHOME LYCEE CITÉ DES PALMIERS')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RKUvxE6-NpthbLCDpYc_9UcpQCKwZZ_0qKvZFq5BYTU1ZFlTyK8Kjj7yo0IS3Z7YL2VS9cADb8LDtjlSxGEKoFXyBK6nNt7EY-EvBeDM71ml3IRZ81B-YNMswT2o_0yGp1fZ8SEw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RKUvxE6-NpthbLCDpYc_9UcpQCKwZZ_0qKvZFq5BYTU1ZFlTyK8Kjj7yo0IS3Z7YL2VS9cADb8LDtjlSxGEKoFXyBK6nNt7EY-EvBeDM71ml3IRZ81B-YNMswT2o_0yGp1fZ8SEw=s1600', false, 4, 'CAMERHOME LYCEE CITÉ DES PALMIERS')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QDZSlUSAdS6LgSiOODOCMTGpIqcDKjCb-L_mtg8W7mJdBAksLzZ6PhM4p8KANCsOdfizVVac6Odcg_Xwrc7NfeOlXBmQQiCMnQe_UONXV1nbwlk5TcZ9gaY4oYPRanB5Jl1I6C=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QDZSlUSAdS6LgSiOODOCMTGpIqcDKjCb-L_mtg8W7mJdBAksLzZ6PhM4p8KANCsOdfizVVac6Odcg_Xwrc7NfeOlXBmQQiCMnQe_UONXV1nbwlk5TcZ9gaY4oYPRanB5Jl1I6C=s1600', false, 5, 'CAMERHOME LYCEE CITÉ DES PALMIERS')
  on conflict do nothing;

  -- [107] meublé douala deido (Deido)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'meuble-douala-deido-deido',
    'apartment',
    'published',
    'meublé douala deido',
    'meublé douala deido
Catégorie : Logement indépendant avec services.
Adresse : Beko express immeuble gynaissance, 1.872 Deido grand moulin, rue des pavée, Douala.
Contact / WhatsApp : +237672035492.
Note Google Maps : 4/5 (1 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Remy carter Bodjo, note 4/5)
- "Note sans commentaire écrit." (Remy carter Bodjo, note 4/5)
- "Note sans commentaire écrit." (Remy carter Bodjo, note 4/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'deido'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Beko express immeuble gynaissance, 1.872 Deido grand moulin, rue des pavée, Douala',
    4.0681364,
    9.7107273,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLe17Qp27S-3ZVT8YuOWNJlCgnRMwbMHT-Fxy-RibrgaaroRBLVlj0Qvl3EIcPk3LtJjKG9i3MbFhWQNRCn9sun-Lmz2kqlE5RFWxkNbCflXYU4Y3GTw7mvSyFxJt3AmKuVR31vR=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLe17Qp27S-3ZVT8YuOWNJlCgnRMwbMHT-Fxy-RibrgaaroRBLVlj0Qvl3EIcPk3LtJjKG9i3MbFhWQNRCn9sun-Lmz2kqlE5RFWxkNbCflXYU4Y3GTw7mvSyFxJt3AmKuVR31vR=s1600', true, 0, 'meublé douala deido')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLe17Qp27S-3ZVT8YuOWNJlCgnRMwbMHT-Fxy-RibrgaaroRBLVlj0Qvl3EIcPk3LtJjKG9i3MbFhWQNRCn9sun-Lmz2kqlE5RFWxkNbCflXYU4Y3GTw7mvSyFxJt3AmKuVR31vR=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLe17Qp27S-3ZVT8YuOWNJlCgnRMwbMHT-Fxy-RibrgaaroRBLVlj0Qvl3EIcPk3LtJjKG9i3MbFhWQNRCn9sun-Lmz2kqlE5RFWxkNbCflXYU4Y3GTw7mvSyFxJt3AmKuVR31vR=s1600-p-k-no', false, 1, 'meublé douala deido')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T5GH6JXZ1Nqe6lTHGE1Avf-YhXP6mxnVGm0nn1neLwNHqXuIGDllONhKZasTTSUtoCKLzEQLC86E4pyabJDRf6pumc_UALEjqpGbS9O2AObjpljTL2_y3RCYoPR9cGoqmLSy96=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T5GH6JXZ1Nqe6lTHGE1Avf-YhXP6mxnVGm0nn1neLwNHqXuIGDllONhKZasTTSUtoCKLzEQLC86E4pyabJDRf6pumc_UALEjqpGbS9O2AObjpljTL2_y3RCYoPR9cGoqmLSy96=s1600', false, 2, 'meublé douala deido')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rl7TT3k42QkZuX4ocxK_1-DYfSQJJaW_Z5X2e_GPYyIT5Jj_YwJmjpHeF6phtU03bZ8o470bDh1bznaN4Yg81LMKNhpg1fl7EIHaIYpoNQJsm0preBNWhmiRiTDbfVY61BGkG-wA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rl7TT3k42QkZuX4ocxK_1-DYfSQJJaW_Z5X2e_GPYyIT5Jj_YwJmjpHeF6phtU03bZ8o470bDh1bznaN4Yg81LMKNhpg1fl7EIHaIYpoNQJsm0preBNWhmiRiTDbfVY61BGkG-wA=s1600', false, 3, 'meublé douala deido')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QNSVwYDJ_1YowgyDa51AzqSkv4CeUMsGpXfsS7Ds5mPkOCyIEkW4KvRYkoG11R5tBOqMS8jAPkKWbIDvVNrTbO-CajPfGHF0YeBZRhzDSWXZRHtuEAoh9KYcABxghMgJ1kbwzm=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QNSVwYDJ_1YowgyDa51AzqSkv4CeUMsGpXfsS7Ds5mPkOCyIEkW4KvRYkoG11R5tBOqMS8jAPkKWbIDvVNrTbO-CajPfGHF0YeBZRhzDSWXZRHtuEAoh9KYcABxghMgJ1kbwzm=s1600', false, 4, 'meublé douala deido')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TqS8w9phmpKTuDrlDvaFBA8Gj0pXOEipCRzyig8IjOoCEOUVYwTL4ngTbfkEdbgGdY-c_yQ7r_0VyAsOTtbw24FwPfFXvGG8hw7HC34qhgtBvMdTkhcMNqdrZTQQseypAB4HoW=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TqS8w9phmpKTuDrlDvaFBA8Gj0pXOEipCRzyig8IjOoCEOUVYwTL4ngTbfkEdbgGdY-c_yQ7r_0VyAsOTtbw24FwPfFXvGG8hw7HC34qhgtBvMdTkhcMNqdrZTQQseypAB4HoW=s1600', false, 5, 'meublé douala deido')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TdlldkPOmznHiXLMblXnYOI7dWbzQlonAvfsdMGI22AYkGq8ea3l_oo0xx6aBmr9lbm0C-PTx1LQ0fFdy1PiPJmcMBmH_I611UE2_cGoQVCzgvmvZnCa8oGysgvlhp5hwHbw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TdlldkPOmznHiXLMblXnYOI7dWbzQlonAvfsdMGI22AYkGq8ea3l_oo0xx6aBmr9lbm0C-PTx1LQ0fFdy1PiPJmcMBmH_I611UE2_cGoQVCzgvmvZnCa8oGysgvlhp5hwHbw=s1600', false, 6, 'meublé douala deido')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RDZughaRYU5dD3NFVGHYkZllvbkdRBOBtUSsi6lO-fdPpJB7ssPPZeEbwSb5kpFgm8Wd-bhbWOn8XiWmvNJH_aal46F0f5nKaXmAAIQ8zwtwuEuvUu8XdEJpsWOjLuSUFMnRMobw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RDZughaRYU5dD3NFVGHYkZllvbkdRBOBtUSsi6lO-fdPpJB7ssPPZeEbwSb5kpFgm8Wd-bhbWOn8XiWmvNJH_aal46F0f5nKaXmAAIQ8zwtwuEuvUu8XdEJpsWOjLuSUFMnRMobw=s1600', false, 7, 'meublé douala deido')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TgXIqeeyVurYOwZp3RTOLcbOKNyTMLJkCCughpdBq3mm_r8rkJTJZzjIDjDbGIZwlcpkqF8uWHtJMd_dqcxrgRNW17UogEJhbTlBCDjY4AMwPMvWIsgjKQbS52PCw1HUxlnggy=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TgXIqeeyVurYOwZp3RTOLcbOKNyTMLJkCCughpdBq3mm_r8rkJTJZzjIDjDbGIZwlcpkqF8uWHtJMd_dqcxrgRNW17UogEJhbTlBCDjY4AMwPMvWIsgjKQbS52PCw1HUxlnggy=s1600', false, 8, 'meublé douala deido')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a/ACg8ocKriRMwdkBEPG9NTBvZWsdozhcaQXlDIXuX0adJtj5JZ5XH9g=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a/ACg8ocKriRMwdkBEPG9NTBvZWsdozhcaQXlDIXuX0adJtj5JZ5XH9g=s1600-p-k-no-mo', false, 9, 'meublé douala deido')
  on conflict do nothing;

  -- [108] Joy Residence - Appartements meublés (Deido)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'joy-residence-appartements-meubles-deido',
    'apartment',
    'published',
    'Joy Residence - Appartements meublés',
    'Joy Residence - Appartements meublés
Catégorie : Appartement avec services.
Adresse : Carrefour Degrando, Douala.
Contact / WhatsApp : +237640060552.
Note Google Maps : 5/5 (1 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Brice Idriss Yamben, note 5/5)
- "Note sans commentaire écrit." (Brice Idriss Yamben, note 5/5)
- "Note sans commentaire écrit." (Brice Idriss Yamben, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'deido'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Carrefour Degrando, Douala',
    4.0687623,
    9.7102549,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLew-VXyD27j4QcVT6YEOfax9eRmcTdhLGlXsAyPxy2ZfgOfLEJPdNDyYV8PRrmEaEkhgFAteoBW37Qf6PqjOD2Bi65vU_DP31VzP9HyietIJ2DFPM_3LHjtb6C-0dDjp_99eKZg4Erx7otv=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLew-VXyD27j4QcVT6YEOfax9eRmcTdhLGlXsAyPxy2ZfgOfLEJPdNDyYV8PRrmEaEkhgFAteoBW37Qf6PqjOD2Bi65vU_DP31VzP9HyietIJ2DFPM_3LHjtb6C-0dDjp_99eKZg4Erx7otv=s1600', true, 0, 'Joy Residence - Appartements meublés')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RxpA8aBZOseqEMKxRTLNn39zdgFpJ10-331k_gSpsoePA8qfsscJOa2sa_XiHnk-eoS1jZDEbpdtV2KF1AtakOdNNZUDT-a4hNxBZVDd3W4sD0prOqPmQXGxZIci94bSeKuZaPcdN3EpVZ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RxpA8aBZOseqEMKxRTLNn39zdgFpJ10-331k_gSpsoePA8qfsscJOa2sa_XiHnk-eoS1jZDEbpdtV2KF1AtakOdNNZUDT-a4hNxBZVDd3W4sD0prOqPmQXGxZIci94bSeKuZaPcdN3EpVZ=s1600', false, 1, 'Joy Residence - Appartements meublés')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RnzTn_jfv_A6N5Ne5BXbA5vwy1-ZMajMp_a0orSaxSm1LEhICBLfbSYuuAJDbYiN8cs6QSLT0XgKWjSdehv7Vah8m3cAZkBVFoEe59Tyro6y8BquqLJoZnJmnbaIX6IrHrky39i3xN_HGo=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RnzTn_jfv_A6N5Ne5BXbA5vwy1-ZMajMp_a0orSaxSm1LEhICBLfbSYuuAJDbYiN8cs6QSLT0XgKWjSdehv7Vah8m3cAZkBVFoEe59Tyro6y8BquqLJoZnJmnbaIX6IrHrky39i3xN_HGo=s1600', false, 2, 'Joy Residence - Appartements meublés')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RY7G2uK1trCsvwoZB_v9Dxc7mjUqKAG-OlWoJjADK9rJFsW0D_wbHOTvQ-w47Fvk9YZlIqF_Sgw_KRJ7XAt4EdG1o33VsBIHplx74RHydoHoKKX2kBLjSzdb5UJ4ygt3CnIdFaCaDXRy0=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RY7G2uK1trCsvwoZB_v9Dxc7mjUqKAG-OlWoJjADK9rJFsW0D_wbHOTvQ-w47Fvk9YZlIqF_Sgw_KRJ7XAt4EdG1o33VsBIHplx74RHydoHoKKX2kBLjSzdb5UJ4ygt3CnIdFaCaDXRy0=s1600', false, 3, 'Joy Residence - Appartements meublés')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TFtubtuLy1_o0JRLHWS2Y41F4EUR5368Jo0Kzr3Kx-CwquuaOhqIPAFYR_WlxV3XDVMego7xhNzbaCAyE8e56ZmC5OdncPq3oIN2O8l1aQDKAfqxjRy5JOHn5CJM6sRsj3ZdYeMt5ms5tD=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TFtubtuLy1_o0JRLHWS2Y41F4EUR5368Jo0Kzr3Kx-CwquuaOhqIPAFYR_WlxV3XDVMego7xhNzbaCAyE8e56ZmC5OdncPq3oIN2O8l1aQDKAfqxjRy5JOHn5CJM6sRsj3ZdYeMt5ms5tD=s1600', false, 4, 'Joy Residence - Appartements meublés')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QEN7bY90FyHndui6qiI5SHKpHK1lsnGNawajaghib8g247d2KXInk6jkvhSOdlAgFR3rd2DLAumYbHfx8tOkIBXd2o2IOIiKnssSPW_iKviRUEZQWXbjf-0vttEs7pLiMB-JFLFONrEy8n=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QEN7bY90FyHndui6qiI5SHKpHK1lsnGNawajaghib8g247d2KXInk6jkvhSOdlAgFR3rd2DLAumYbHfx8tOkIBXd2o2IOIiKnssSPW_iKviRUEZQWXbjf-0vttEs7pLiMB-JFLFONrEy8n=s1600', false, 5, 'Joy Residence - Appartements meublés')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QqwKRWGhLAGJ76L8wOBmb5IBRB4_jcqSU5w9SYWUEYBYMP8FF3ASZHDRXvnyJDcqgU_JmOUO3qpom50IejKxKwxc4u0V0TsOY45FKcpTxrUK9x4A0N_507kiQSUOaTdhgdp7tZrs9wNOeK=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QqwKRWGhLAGJ76L8wOBmb5IBRB4_jcqSU5w9SYWUEYBYMP8FF3ASZHDRXvnyJDcqgU_JmOUO3qpom50IejKxKwxc4u0V0TsOY45FKcpTxrUK9x4A0N_507kiQSUOaTdhgdp7tZrs9wNOeK=s1600', false, 6, 'Joy Residence - Appartements meublés')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TQqJQ6vOxunYZKEKJ98jdABxNLUkBsmcTAkpGhdq1UTd7pCwfNVaQsBTySPTdbv9nrixcyi7mV3rU95NWEmqf-Lae1hW_DbsNwy52wrAh5mORtt-U-QWYOYovzr9fElnXpPUX5gSqHPcg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TQqJQ6vOxunYZKEKJ98jdABxNLUkBsmcTAkpGhdq1UTd7pCwfNVaQsBTySPTdbv9nrixcyi7mV3rU95NWEmqf-Lae1hW_DbsNwy52wrAh5mORtt-U-QWYOYovzr9fElnXpPUX5gSqHPcg=s1600', false, 7, 'Joy Residence - Appartements meublés')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QbNigX2XZku2NWsT_-VNrdJlNnm6xu2eOIwhvKm_l17XXydddiM-TCewX98nAOL-w5qrI9HdjRB28nyLB-4fXCUnqjEYY4aW0Jt1EnyLwpjT1RA52Km3S-Pao-mScAfI0ctKMsppjXISAA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QbNigX2XZku2NWsT_-VNrdJlNnm6xu2eOIwhvKm_l17XXydddiM-TCewX98nAOL-w5qrI9HdjRB28nyLB-4fXCUnqjEYY4aW0Jt1EnyLwpjT1RA52Km3S-Pao-mScAfI0ctKMsppjXISAA=s1600', false, 8, 'Joy Residence - Appartements meublés')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RV0oA1DeeHEpywFSGAU7r5-WoOXm3KM79BcwtnYaojbVnGQKvdBx0iAN8KJdH0z_ALnew0xfu41SHvxRDSscZg597sfJ0TNoXVpU6pL0PTBYaV60JV0yizS1w1Wjpk65tFz3GkASi0qGQv=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RV0oA1DeeHEpywFSGAU7r5-WoOXm3KM79BcwtnYaojbVnGQKvdBx0iAN8KJdH0z_ALnew0xfu41SHvxRDSscZg597sfJ0TNoXVpU6pL0PTBYaV60JV0yizS1w1Wjpk65tFz3GkASi0qGQv=s1600', false, 9, 'Joy Residence - Appartements meublés')
  on conflict do nothing;

  -- [109] Féerie Home (appartement et studio meublés haut standing) (Deido)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'feerie-home-appartement-et-studio-meubles-haut-standing-deido',
    'studio',
    'published',
    'Féerie Home (appartement et studio meublés haut standing)',
    'Féerie Home (appartement et studio meublés haut standing)
Catégorie : Location d''appartement de vacances.
Adresse : 3P4C+XP5, Rte de Bepanda, Douala.
Contact / WhatsApp : +237692731763.
Note Google Maps : 4.4/5 (21 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Billong Berlyse, note 3/5)
- "Note sans commentaire écrit." (Charly Noel, note 5/5)
- "Note sans commentaire écrit." (mre bree, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'deido'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3P4C+XP5, Rte de Bepanda, Douala',
    4.0575317,
    9.7219029,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdBjt8Vlm746qwtYoePWnNgplmOwzJzoDMr2eVjSkIki6mYPjgzObOGd6Pc3HAAeZZzbIXdI1HOFgaJ3yg1_YKmnBFFd86Iis9B7gJGHuy8IJFwhjJv0SXH2fZNnRte9XtnkGoZ=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdBjt8Vlm746qwtYoePWnNgplmOwzJzoDMr2eVjSkIki6mYPjgzObOGd6Pc3HAAeZZzbIXdI1HOFgaJ3yg1_YKmnBFFd86Iis9B7gJGHuy8IJFwhjJv0SXH2fZNnRte9XtnkGoZ=s1600', true, 0, 'Féerie Home (appartement et studio meublés haut standing)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QFluIeFG7bOuAyiMAavzyCSjcaLoFjxgFTP6pKf0k0wAVJzG3ZJvl5WOKp5ZUCCNsTX7xhjV4hbUNMsLJ7kfu4Lrfnf_Y-8B42tnRrHxqFbT_oJLozIWctNelaNlWRrKsHZgKE=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QFluIeFG7bOuAyiMAavzyCSjcaLoFjxgFTP6pKf0k0wAVJzG3ZJvl5WOKp5ZUCCNsTX7xhjV4hbUNMsLJ7kfu4Lrfnf_Y-8B42tnRrHxqFbT_oJLozIWctNelaNlWRrKsHZgKE=s1600', false, 1, 'Féerie Home (appartement et studio meublés haut standing)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tr7Km-Qh1UKa6Y4xQb8dZrHl8JwolcsWBF5m5-YsMr6pY9QfP4PIuJf4m87jH-BMqXA5427cUXxjs4M4olBI3W6D8gNmwPli4CAKzM5Hw4a2DPsFyZJR42_G510CRCR74t7NJx=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tr7Km-Qh1UKa6Y4xQb8dZrHl8JwolcsWBF5m5-YsMr6pY9QfP4PIuJf4m87jH-BMqXA5427cUXxjs4M4olBI3W6D8gNmwPli4CAKzM5Hw4a2DPsFyZJR42_G510CRCR74t7NJx=s1600', false, 2, 'Féerie Home (appartement et studio meublés haut standing)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TKnK1BvhuGCMktQ5U1nEufQrXD3hf_LoIcZQ1KVz12o-dxrXknTyPWPd34vQxy7Yk_fT_ECg_O8YgX9C-KGOwVrHfJQDx-bKFbA7_gVs352E7pDLMENFS0p9t8BnS-7JWAJEzolA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TKnK1BvhuGCMktQ5U1nEufQrXD3hf_LoIcZQ1KVz12o-dxrXknTyPWPd34vQxy7Yk_fT_ECg_O8YgX9C-KGOwVrHfJQDx-bKFbA7_gVs352E7pDLMENFS0p9t8BnS-7JWAJEzolA=s1600', false, 3, 'Féerie Home (appartement et studio meublés haut standing)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R-aejrkSqBrLH9kBgyl2Fty6gpZe6udZWaep532RkMJOLBZgvRpqm_IrRPcYikpPlsoclUmGenLD4SBTOjWrygx_fKBj2covSg_LraKj-8XDhrjMl9aE_GSmWoG_XTmC40rRuDUg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R-aejrkSqBrLH9kBgyl2Fty6gpZe6udZWaep532RkMJOLBZgvRpqm_IrRPcYikpPlsoclUmGenLD4SBTOjWrygx_fKBj2covSg_LraKj-8XDhrjMl9aE_GSmWoG_XTmC40rRuDUg=s1600', false, 4, 'Féerie Home (appartement et studio meublés haut standing)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RSDqqW_Er7xy-JRGsY-itNAs0TnFoNJtqJrdZUDO9C-NuA50EbCPGHwWc37x0r-eGoTd_g-amJH4gslz5fJT8ksvQbN4CnA3bP4345sFvwIOTi-lxDe-lOUFEVJxFSCcwMlkNy=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RSDqqW_Er7xy-JRGsY-itNAs0TnFoNJtqJrdZUDO9C-NuA50EbCPGHwWc37x0r-eGoTd_g-amJH4gslz5fJT8ksvQbN4CnA3bP4345sFvwIOTi-lxDe-lOUFEVJxFSCcwMlkNy=s1600', false, 5, 'Féerie Home (appartement et studio meublés haut standing)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RSrt13T3k2GgncIofQ46SJ9EFcck0s8dCmqYNJSMQsRQilnPrqBZamSM66k2PH_uo0994a1xSNkuuwtP-CA8xTCe9gZZQe2jhalEhyb4L8GP0WwlCKdXzAB62wIaqOP1GIduFC=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RSrt13T3k2GgncIofQ46SJ9EFcck0s8dCmqYNJSMQsRQilnPrqBZamSM66k2PH_uo0994a1xSNkuuwtP-CA8xTCe9gZZQe2jhalEhyb4L8GP0WwlCKdXzAB62wIaqOP1GIduFC=s1600', false, 6, 'Féerie Home (appartement et studio meublés haut standing)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TauoB4RKfSutHfSed7H8WschLZbTZAvDZKQykB3PqNnKIOdvbyvSyTIlJkDlnCjJOczw4080WwnvoNA0uSv9_lGvzd_EoZWeZglJXB_wPLpDr36AhXunLSIn5fCUFi5cwoSHiz=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TauoB4RKfSutHfSed7H8WschLZbTZAvDZKQykB3PqNnKIOdvbyvSyTIlJkDlnCjJOczw4080WwnvoNA0uSv9_lGvzd_EoZWeZglJXB_wPLpDr36AhXunLSIn5fCUFi5cwoSHiz=s1600', false, 7, 'Féerie Home (appartement et studio meublés haut standing)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SGe0LFlrnOL3mLNWkGbvbvBmfiaxCagZ8WNpmxDK9jrEvDVIzwMPy4-UAqUJvqLPu8cT3CnFftYwQV8KwoREP6RN9yCygI9LZGLGCfkS-EpLsXtuLjltK96ogaIN3Gcu1bjDOh7Q=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SGe0LFlrnOL3mLNWkGbvbvBmfiaxCagZ8WNpmxDK9jrEvDVIzwMPy4-UAqUJvqLPu8cT3CnFftYwQV8KwoREP6RN9yCygI9LZGLGCfkS-EpLsXtuLjltK96ogaIN3Gcu1bjDOh7Q=s1600', false, 8, 'Féerie Home (appartement et studio meublés haut standing)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S3DGjTYSwKtMSvP7ivQa4es32Eah4h-bNSteE5WUtkl8kjT5NW9osVNQXNjT7FfKgR8RcGrtQvDbsX7PsJiddoe4d2su-aXjafygZ_6gYJWQ4ZClsZznARqnIjA7BFaupL62O9=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S3DGjTYSwKtMSvP7ivQa4es32Eah4h-bNSteE5WUtkl8kjT5NW9osVNQXNjT7FfKgR8RcGrtQvDbsX7PsJiddoe4d2su-aXjafygZ_6gYJWQ4ZClsZznARqnIjA7BFaupL62O9=s1600', false, 9, 'Féerie Home (appartement et studio meublés haut standing)')
  on conflict do nothing;

  -- [110] APPARTEMENTS MEUBLES Douala - One-Bedroom Apartment (Deido)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartements-meubles-douala-one-bedroom-apartment-deido',
    'room',
    'published',
    'APPARTEMENTS MEUBLES Douala - One-Bedroom Apartment',
    'APPARTEMENTS MEUBLES Douala - One-Bedroom Apartment
Adresse : Douala.
Note Google Maps : 3.5/5 (0 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'deido'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0839,
    9.7312403,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW018qyA3LnyDHj_B0bAyz1A5RLnijXx-k__32OfxYoNPvHN-4eMOEVpFPV2PKrbfM8gBiovBvJm4Byj6mFsXw_9iyCHetMgyCRtL_HtnQHBUWikSJ5MvdsjmureYosy7gwq9878R0om08B4xf8PjKL3m_iFV66WUGZ4-jN8XclptBLILZfkg2w=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW018qyA3LnyDHj_B0bAyz1A5RLnijXx-k__32OfxYoNPvHN-4eMOEVpFPV2PKrbfM8gBiovBvJm4Byj6mFsXw_9iyCHetMgyCRtL_HtnQHBUWikSJ5MvdsjmureYosy7gwq9878R0om08B4xf8PjKL3m_iFV66WUGZ4-jN8XclptBLILZfkg2w=s1600', true, 0, 'APPARTEMENTS MEUBLES Douala - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW018qyA3LnyDHj_B0bAyz1A5RLnijXx-k__32OfxYoNPvHN-4eMOEVpFPV2PKrbfM8gBiovBvJm4Byj6mFsXw_9iyCHetMgyCRtL_HtnQHBUWikSJ5MvdsjmureYosy7gwq9878R0om08B4xf8PjKL3m_iFV66WUGZ4-jN8XclptBLILZfkg2w=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW018qyA3LnyDHj_B0bAyz1A5RLnijXx-k__32OfxYoNPvHN-4eMOEVpFPV2PKrbfM8gBiovBvJm4Byj6mFsXw_9iyCHetMgyCRtL_HtnQHBUWikSJ5MvdsjmureYosy7gwq9878R0om08B4xf8PjKL3m_iFV66WUGZ4-jN8XclptBLILZfkg2w=s1600-p-k-no', false, 1, 'APPARTEMENTS MEUBLES Douala - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFIBjQ_qFfuayDqTQ8ZBsTdIMhzSqriYEUfPhPw5wthW6fA7ykSu3r2VZTIIQ2IWZnjDdGeQKGGaWSCUJ8mHTMlMVUFH8IqsjNxhy_6IBNa3rwLETPYfgOM726526yKvBKHXOXWMFD2WLXWADycPcveNyegFhxoUb5FDNTAej-rOo8EIcV0ZpQ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFIBjQ_qFfuayDqTQ8ZBsTdIMhzSqriYEUfPhPw5wthW6fA7ykSu3r2VZTIIQ2IWZnjDdGeQKGGaWSCUJ8mHTMlMVUFH8IqsjNxhy_6IBNa3rwLETPYfgOM726526yKvBKHXOXWMFD2WLXWADycPcveNyegFhxoUb5FDNTAej-rOo8EIcV0ZpQ=s1600', false, 2, 'APPARTEMENTS MEUBLES Douala - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhF35Q72AqItvH6Bq-tO8DLFgyYK8OwPHwTNUMN-i_kGzF2oUBrLVM0WBqKxTx9dbhZCNAXi4lNL4ManJyVaGdUWvaO-ayWLJIYNe8UEhEi0sWkktkPAqRuT-5N7QaGS512Uo23VAa0xIrz9pZx3iXQx3S43olqRjPxONeWdKzX9gpLRbwm9ydax=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhF35Q72AqItvH6Bq-tO8DLFgyYK8OwPHwTNUMN-i_kGzF2oUBrLVM0WBqKxTx9dbhZCNAXi4lNL4ManJyVaGdUWvaO-ayWLJIYNe8UEhEi0sWkktkPAqRuT-5N7QaGS512Uo23VAa0xIrz9pZx3iXQx3S43olqRjPxONeWdKzX9gpLRbwm9ydax=s1600', false, 3, 'APPARTEMENTS MEUBLES Douala - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFXLJ5G71EwI75Q2UlP4hue4Jw6jYUOk7gvRPtIbouqrZlRjwkUMXWue7QUkEVvhQR3HHCYbSA16QYkMf7YfcklozHahyET2QC_O_2sF-ZQqE-YRTcmKnh2ZzvU_TXdFwMK--nPo3wv4sGpoKDVrdyhPp9RzFNFxRwDwntqmavcyRYDJOGPGhnZcA=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFXLJ5G71EwI75Q2UlP4hue4Jw6jYUOk7gvRPtIbouqrZlRjwkUMXWue7QUkEVvhQR3HHCYbSA16QYkMf7YfcklozHahyET2QC_O_2sF-ZQqE-YRTcmKnh2ZzvU_TXdFwMK--nPo3wv4sGpoKDVrdyhPp9RzFNFxRwDwntqmavcyRYDJOGPGhnZcA=s1600', false, 4, 'APPARTEMENTS MEUBLES Douala - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHIYXn-J_MVqjSaNF0b1k7RIU44KGfjx1LMax_t-QGNWm5B0DKYY5qre1RD8WD3ZQEgUCV9IvWjeClEcUjcK5uH3QkeyLWHdtdewCoISIAXnw8nTGasjkK3etCGuMTz4Qw_vHLzJDDPb30yI91gOkswD8DN3JvsvbefEkamrTXigX2n1ROQocc=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHIYXn-J_MVqjSaNF0b1k7RIU44KGfjx1LMax_t-QGNWm5B0DKYY5qre1RD8WD3ZQEgUCV9IvWjeClEcUjcK5uH3QkeyLWHdtdewCoISIAXnw8nTGasjkK3etCGuMTz4Qw_vHLzJDDPb30yI91gOkswD8DN3JvsvbefEkamrTXigX2n1ROQocc=s1600', false, 5, 'APPARTEMENTS MEUBLES Douala - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGQr4_0kex7o0XPcqkpXKh03NVGj4nH5PWLfQ-AJPXtGzgVZj0_I3jyQs2X9LgdmEY9_OylvXPWErGtyjPkfnUg0SKcIwb89m16hfzumeW0OR3pSjHepMsPlHo3J2WYz8nuWthEyLcYzVACtcPHRzdtJkIyzSAM3FEe9tPMvFxWQZXVuYLgMWLhsw=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGQr4_0kex7o0XPcqkpXKh03NVGj4nH5PWLfQ-AJPXtGzgVZj0_I3jyQs2X9LgdmEY9_OylvXPWErGtyjPkfnUg0SKcIwb89m16hfzumeW0OR3pSjHepMsPlHo3J2WYz8nuWthEyLcYzVACtcPHRzdtJkIyzSAM3FEe9tPMvFxWQZXVuYLgMWLhsw=s1600', false, 6, 'APPARTEMENTS MEUBLES Douala - One-Bedroom Apartment')
  on conflict do nothing;

  -- [111] Multi-Logis (complexe d'Appartements meublés) (Deido)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'multi-logis-complexe-d-appartements-meubles-deido',
    'apartment',
    'published',
    'Multi-Logis (complexe d''Appartements meublés)',
    'Multi-Logis (complexe d''Appartements meublés)
Catégorie : Complexe d''appartements meublés.
Adresse : N°, Rue Dobelle, Douala.
Contact / WhatsApp : +237654565656.
Note Google Maps : 4.3/5 (3 avis).

Avis clients récents :
- "Note sans commentaire écrit." (dexter sama, note 5/5)
- "Note sans commentaire écrit." (Joel Misson, note 5/5)
- "Note sans commentaire écrit." (FOKI Royal, note 3/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'deido'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'N°, Rue Dobelle, Douala',
    4.0641637,
    9.7188473,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcsbmMCgR6HBo63MRZWfx5EpEh98iQkpwg1WuZubzCHmBqE-OuubNCzfS14VKEWJQcmIJCSyQRpe9_7YpSg0NxYHGSYlBK22Lh-FhVkJdRn9VsfTyMVd3MgOtoBA-InZceOD2hu=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcsbmMCgR6HBo63MRZWfx5EpEh98iQkpwg1WuZubzCHmBqE-OuubNCzfS14VKEWJQcmIJCSyQRpe9_7YpSg0NxYHGSYlBK22Lh-FhVkJdRn9VsfTyMVd3MgOtoBA-InZceOD2hu=s1600', true, 0, 'Multi-Logis (complexe d''Appartements meublés)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcsbmMCgR6HBo63MRZWfx5EpEh98iQkpwg1WuZubzCHmBqE-OuubNCzfS14VKEWJQcmIJCSyQRpe9_7YpSg0NxYHGSYlBK22Lh-FhVkJdRn9VsfTyMVd3MgOtoBA-InZceOD2hu=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcsbmMCgR6HBo63MRZWfx5EpEh98iQkpwg1WuZubzCHmBqE-OuubNCzfS14VKEWJQcmIJCSyQRpe9_7YpSg0NxYHGSYlBK22Lh-FhVkJdRn9VsfTyMVd3MgOtoBA-InZceOD2hu=s1600-p-k-no', false, 1, 'Multi-Logis (complexe d''Appartements meublés)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9ROpZ8bBZNG9_-ddy2FpE0nzHk9JSyN1n-msMGYCxx8ZeO7MjTBO6x0HLjYaFpeAe92cOwbNlfLUf1hVVo1d42AA5jxrP2luznxC7Og7bL0Al-j6hdKrR-GnuNRoYK2Fq7mlhYY=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9ROpZ8bBZNG9_-ddy2FpE0nzHk9JSyN1n-msMGYCxx8ZeO7MjTBO6x0HLjYaFpeAe92cOwbNlfLUf1hVVo1d42AA5jxrP2luznxC7Og7bL0Al-j6hdKrR-GnuNRoYK2Fq7mlhYY=s1600', false, 2, 'Multi-Logis (complexe d''Appartements meublés)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rm-lF9egdRzEdk2Ael_ZBqpnPzAnsov-hfdRXyxW2IQtOyX0IVQEiQiAZi1wAZWDSpOUeWTEATQrkI85BPb7dXA3mWIVSiSlRSZCfw6jL9nDzUiseUv2LqWhYNff5A3NtjX4u4=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rm-lF9egdRzEdk2Ael_ZBqpnPzAnsov-hfdRXyxW2IQtOyX0IVQEiQiAZi1wAZWDSpOUeWTEATQrkI85BPb7dXA3mWIVSiSlRSZCfw6jL9nDzUiseUv2LqWhYNff5A3NtjX4u4=s1600', false, 3, 'Multi-Logis (complexe d''Appartements meublés)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QlHD44LBfPNGEhfHEVSJX63UIVB8LCd7BMJZmc34OsEUk4KuLMdGuCigggHBCcoJD4nagDpzN5D3UI7Sx2MOoFsmMlZNeIxPShzfTEzornAXEyybggMXE9U7YZEqp-I37gars=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QlHD44LBfPNGEhfHEVSJX63UIVB8LCd7BMJZmc34OsEUk4KuLMdGuCigggHBCcoJD4nagDpzN5D3UI7Sx2MOoFsmMlZNeIxPShzfTEzornAXEyybggMXE9U7YZEqp-I37gars=s1600', false, 4, 'Multi-Logis (complexe d''Appartements meublés)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T2Y818AbMgW_T2fAKyX-U9_s2LgfNXRT7bnWsbx7PLE0GYb6LY_8UorkhbufawkiavlE3VN0De_WWE3WNILZz019Ozna_jhqun1gfErEfZ6JC-uymXZ3fPwu7iRM_elI17RGYWpA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T2Y818AbMgW_T2fAKyX-U9_s2LgfNXRT7bnWsbx7PLE0GYb6LY_8UorkhbufawkiavlE3VN0De_WWE3WNILZz019Ozna_jhqun1gfErEfZ6JC-uymXZ3fPwu7iRM_elI17RGYWpA=s1600', false, 5, 'Multi-Logis (complexe d''Appartements meublés)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a/ACg8ocLU4hxxv_QnztrqwkRkGyWHuNHhO3zYUoL0x7prhAs69rYFcA=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a/ACg8ocLU4hxxv_QnztrqwkRkGyWHuNHhO3zYUoL0x7prhAs69rYFcA=s1600-p-k-no-mo', false, 6, 'Multi-Logis (complexe d''Appartements meublés)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q7fhMtIskucMj6-knxrv8f1J_nl5Ry1g-LNUrKDWz_pt8W4Io--zMFnjJD0S9aoXaYZJ_iJeVy4-53WY0Hr90AndPxOAGthp2ASne5qtARphXg6rTMTBpu43ckkkY2wXswdFWC=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q7fhMtIskucMj6-knxrv8f1J_nl5Ry1g-LNUrKDWz_pt8W4Io--zMFnjJD0S9aoXaYZJ_iJeVy4-53WY0Hr90AndPxOAGthp2ASne5qtARphXg6rTMTBpu43ckkkY2wXswdFWC=s1600', false, 7, 'Multi-Logis (complexe d''Appartements meublés)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QYQsu7BBVafxFo9HBmmKV-1FLEKshVHFhU6L6u_AFF1rTDHogghqRkxlR_wAQ4MUpc_rH6F9kI5mRHb-CwRRDatYvcz8_IADPXGDQewg3AyqSygn3HsIPrscHQfOAAAdadT3ow=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QYQsu7BBVafxFo9HBmmKV-1FLEKshVHFhU6L6u_AFF1rTDHogghqRkxlR_wAQ4MUpc_rH6F9kI5mRHb-CwRRDatYvcz8_IADPXGDQewg3AyqSygn3HsIPrscHQfOAAAdadT3ow=s1600', false, 8, 'Multi-Logis (complexe d''Appartements meublés)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RSUGzH6IHJ-ZBT7Xh7JJmYjFuRFAnOwSb59JFYEhS8cv58BfuWonTnRzIqWGXOSApvpL9kVzKb0tLgQyZ5cVoTDNaO1CDqeFd28BUNw5ZknukRNvyRyyzSXFxtLkaU6ilXRkD2Rg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RSUGzH6IHJ-ZBT7Xh7JJmYjFuRFAnOwSb59JFYEhS8cv58BfuWonTnRzIqWGXOSApvpL9kVzKb0tLgQyZ5cVoTDNaO1CDqeFd28BUNw5ZknukRNvyRyyzSXFxtLkaU6ilXRkD2Rg=s1600', false, 9, 'Multi-Logis (complexe d''Appartements meublés)')
  on conflict do nothing;

  -- [112] Homeeroom (appartement meublé) (Deido)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'homeeroom-appartement-meuble-deido',
    'room',
    'published',
    'Homeeroom (appartement meublé)',
    'Homeeroom (appartement meublé)
Catégorie : Maison d''hôtes.
Adresse : Nouvelle route grand moulin. Lieux dit : terrain de basket, Douala.
Contact / WhatsApp : +237696240889.
Note Google Maps : 5/5 (1 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Marie. M Ndenga, note 5/5)
- "Note sans commentaire écrit." (Marie. M Ndenga, note 5/5)
- "Note sans commentaire écrit." (Marie. M Ndenga, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'deido'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Nouvelle route grand moulin. Lieux dit : terrain de basket, Douala',
    4.0651772,
    9.7211493,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdZnAWbp12PP2oiNT1LtEK2gBTfkUfG0oWib-eJ-FIdohieT4_8X_NGVL_ZW_7w0tYf0DzmxfN5IQMd5nQ61JA-TPR-FJQDmOKPBuEnJqaWx0R02b7nIrHsvsLesmFwdCoPyX8f=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdZnAWbp12PP2oiNT1LtEK2gBTfkUfG0oWib-eJ-FIdohieT4_8X_NGVL_ZW_7w0tYf0DzmxfN5IQMd5nQ61JA-TPR-FJQDmOKPBuEnJqaWx0R02b7nIrHsvsLesmFwdCoPyX8f=s1600', true, 0, 'Homeeroom (appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdZnAWbp12PP2oiNT1LtEK2gBTfkUfG0oWib-eJ-FIdohieT4_8X_NGVL_ZW_7w0tYf0DzmxfN5IQMd5nQ61JA-TPR-FJQDmOKPBuEnJqaWx0R02b7nIrHsvsLesmFwdCoPyX8f=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdZnAWbp12PP2oiNT1LtEK2gBTfkUfG0oWib-eJ-FIdohieT4_8X_NGVL_ZW_7w0tYf0DzmxfN5IQMd5nQ61JA-TPR-FJQDmOKPBuEnJqaWx0R02b7nIrHsvsLesmFwdCoPyX8f=s1600-p-k-no', false, 1, 'Homeeroom (appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QuRb6Og18ayuuXuxh8enZ6qkJZISOrm__6qkSxhmID9ID2g5DInfTxwZpWc1x4KKV1wMWH3Zo74CmZfvivs49rIxfWnYkSK_8s9kW9JLgufO6ZjXd9RZ3cvZkn4bohf1cVXbjO=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QuRb6Og18ayuuXuxh8enZ6qkJZISOrm__6qkSxhmID9ID2g5DInfTxwZpWc1x4KKV1wMWH3Zo74CmZfvivs49rIxfWnYkSK_8s9kW9JLgufO6ZjXd9RZ3cvZkn4bohf1cVXbjO=s1600', false, 2, 'Homeeroom (appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QI5Ck1K0N06PX7MRUvxyxpiSGtrRjmn6RBu7rhrODMi1TLFutLXa2YoSuS0rHTFyX8mdb29p4Vu41OnnuB1iVXRlNtYriYSh4EStRjZ1bEUZzDA9qlEROBwVDStXtx9C-iYv-j=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QI5Ck1K0N06PX7MRUvxyxpiSGtrRjmn6RBu7rhrODMi1TLFutLXa2YoSuS0rHTFyX8mdb29p4Vu41OnnuB1iVXRlNtYriYSh4EStRjZ1bEUZzDA9qlEROBwVDStXtx9C-iYv-j=s1600', false, 3, 'Homeeroom (appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SBn05qdRrxsMCnkkv-2le5-i2qZ_qKTdE1Gg74t_c-Nn6UFHq9w1zz5Vr3cejeN339jHi-iIzZzgyHKFg8Es1f9DHLadnyQD5JZPSBlEe27bwSg8G8ah8HO1PgmHKwnux5hDkl=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SBn05qdRrxsMCnkkv-2le5-i2qZ_qKTdE1Gg74t_c-Nn6UFHq9w1zz5Vr3cejeN339jHi-iIzZzgyHKFg8Es1f9DHLadnyQD5JZPSBlEe27bwSg8G8ah8HO1PgmHKwnux5hDkl=s1600', false, 4, 'Homeeroom (appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a/ACg8ocInWIkKrMmoT3RJ2--Xi-8_kcgh5gyFu4PZH3Jy17nq5nOT8A=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a/ACg8ocInWIkKrMmoT3RJ2--Xi-8_kcgh5gyFu4PZH3Jy17nq5nOT8A=s1600-p-k-no-mo', false, 5, 'Homeeroom (appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QlXeyg_XYkt39cSZRQSemsOYmBvb_P4Ex-tRjCQNG1fjFxHDeAzwTQ0TFXsUQZelhRmQ7AIbO7D4Ffy0ktClWwsERuiGXtLqVvsN8mK197jswq2hhBX8vAIcA-XeWatVGg51RA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QlXeyg_XYkt39cSZRQSemsOYmBvb_P4Ex-tRjCQNG1fjFxHDeAzwTQ0TFXsUQZelhRmQ7AIbO7D4Ffy0ktClWwsERuiGXtLqVvsN8mK197jswq2hhBX8vAIcA-XeWatVGg51RA=s1600', false, 6, 'Homeeroom (appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T4GHu7gSos33w7KnCEwWk2LaP7YJzckA1G0_QrqT348gPAzqRHhjVlucczaMNsy0sYdH--rWB9dSQ3q2m_HFUNjAZs0mJtPXejMXkRXCRHDcJ2KJDiMQ02Q0pKSdO9aQSmNZ14=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T4GHu7gSos33w7KnCEwWk2LaP7YJzckA1G0_QrqT348gPAzqRHhjVlucczaMNsy0sYdH--rWB9dSQ3q2m_HFUNjAZs0mJtPXejMXkRXCRHDcJ2KJDiMQ02Q0pKSdO9aQSmNZ14=s1600', false, 7, 'Homeeroom (appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T0pugms8q36FikNjKCLKdH9hGKqZrOWr1d1-cVHyzcJKeP0YTsdCzm2HI3gxwuDxdnA-dhSRGkxkVcZNAa9js9miFbqDuQTOYjItacXXQtvlmE-6s8EbQ7M8m3FhEC_zDuFscvTQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T0pugms8q36FikNjKCLKdH9hGKqZrOWr1d1-cVHyzcJKeP0YTsdCzm2HI3gxwuDxdnA-dhSRGkxkVcZNAa9js9miFbqDuQTOYjItacXXQtvlmE-6s8EbQ7M8m3FhEC_zDuFscvTQ=s1600', false, 8, 'Homeeroom (appartement meublé)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RlJQq2ijck_JueCpBwlV6VgRBFZSn88KrcvpGrRUKhWpnFykSC27_SuKGbTlA2sCuDthysySpOfsPSQqkeMeUntgN3Nak7uebm40YdoKpYpd2Fw967AhAVJrINzGPAHNJm8Ybw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RlJQq2ijck_JueCpBwlV6VgRBFZSn88KrcvpGrRUKhWpnFykSC27_SuKGbTlA2sCuDthysySpOfsPSQqkeMeUntgN3Nak7uebm40YdoKpYpd2Fw967AhAVJrINzGPAHNJm8Ybw=s1600', false, 9, 'Homeeroom (appartement meublé)')
  on conflict do nothing;

  -- [113] APPARTEMENTS MEUBLES Douala - Two-Bedroom Apartment (Deido)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartements-meubles-douala-two-bedroom-apartment-deido',
    'room',
    'published',
    'APPARTEMENTS MEUBLES Douala - Two-Bedroom Apartment',
    'APPARTEMENTS MEUBLES Douala - Two-Bedroom Apartment
Adresse : Douala.
Note Google Maps : 3.5/5 (0 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'deido'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0839,
    9.7312403,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW388200KEt3K9yKrIxDJWy_gOGlO-cLYsxHHGRkDpOV17MJgZ-feL_FNPb-rPt3zHiyAEvHbXvfPGT7e8qFePvgevwEKG9bxZLLMZ5Y29OSOPaVHVoML_wyKy_LzyB9AcJ-iExh08D2h11_qakWCDbnmMeR-6a6N9AYpZxiYHX_rE5YndHrSCJO=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW388200KEt3K9yKrIxDJWy_gOGlO-cLYsxHHGRkDpOV17MJgZ-feL_FNPb-rPt3zHiyAEvHbXvfPGT7e8qFePvgevwEKG9bxZLLMZ5Y29OSOPaVHVoML_wyKy_LzyB9AcJ-iExh08D2h11_qakWCDbnmMeR-6a6N9AYpZxiYHX_rE5YndHrSCJO=s1600', true, 0, 'APPARTEMENTS MEUBLES Douala - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEtiuHEseBOvv8RLEUef9IuP3nz1ryEyVZHjvohAgRSQ6dGqCPL61YsiFy4PrqnJaDhevWbc5beSEXzXhAektxjPealjdsSM4Vj8t1AoFOhrCDVUepEeZInkega1cA4AkKGuet4YLLA6S_H0mqCyHU78U7yiStpYxCFnLohrqiejRAToFh4yJCl=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEtiuHEseBOvv8RLEUef9IuP3nz1ryEyVZHjvohAgRSQ6dGqCPL61YsiFy4PrqnJaDhevWbc5beSEXzXhAektxjPealjdsSM4Vj8t1AoFOhrCDVUepEeZInkega1cA4AkKGuet4YLLA6S_H0mqCyHU78U7yiStpYxCFnLohrqiejRAToFh4yJCl=s1600', false, 1, 'APPARTEMENTS MEUBLES Douala - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFu462dxmCXN8Q4IfVRH9VTOTN3fKwb3yUhhaNdkbwahc_6-CXf1nbjl3vkHB4A4TlIFY_P4HcfbLGv50Kpom2rbmoqFMyGVM5LdVO2o-KL7OLvH8aOPbNR7GwWjhPPJon2KjAvYQ1-mFWC9q5DCmqwBesk44Yy8EZOCdEtP_V0qERa169n6C4=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFu462dxmCXN8Q4IfVRH9VTOTN3fKwb3yUhhaNdkbwahc_6-CXf1nbjl3vkHB4A4TlIFY_P4HcfbLGv50Kpom2rbmoqFMyGVM5LdVO2o-KL7OLvH8aOPbNR7GwWjhPPJon2KjAvYQ1-mFWC9q5DCmqwBesk44Yy8EZOCdEtP_V0qERa169n6C4=s1600', false, 2, 'APPARTEMENTS MEUBLES Douala - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFXLJ5G71EwI75Q2UlP4hue4Jw6jYUOk7gvRPtIbouqrZlRjwkUMXWue7QUkEVvhQR3HHCYbSA16QYkMf7YfcklozHahyET2QC_O_2sF-ZQqE-YRTcmKnh2ZzvU_TXdFwMK--nPo3wv4sGpoKDVrdyhPp9RzFNFxRwDwntqmavcyRYDJOGPGhnZcA=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFXLJ5G71EwI75Q2UlP4hue4Jw6jYUOk7gvRPtIbouqrZlRjwkUMXWue7QUkEVvhQR3HHCYbSA16QYkMf7YfcklozHahyET2QC_O_2sF-ZQqE-YRTcmKnh2ZzvU_TXdFwMK--nPo3wv4sGpoKDVrdyhPp9RzFNFxRwDwntqmavcyRYDJOGPGhnZcA=s1600', false, 3, 'APPARTEMENTS MEUBLES Douala - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFIBjQ_qFfuayDqTQ8ZBsTdIMhzSqriYEUfPhPw5wthW6fA7ykSu3r2VZTIIQ2IWZnjDdGeQKGGaWSCUJ8mHTMlMVUFH8IqsjNxhy_6IBNa3rwLETPYfgOM726526yKvBKHXOXWMFD2WLXWADycPcveNyegFhxoUb5FDNTAej-rOo8EIcV0ZpQ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFIBjQ_qFfuayDqTQ8ZBsTdIMhzSqriYEUfPhPw5wthW6fA7ykSu3r2VZTIIQ2IWZnjDdGeQKGGaWSCUJ8mHTMlMVUFH8IqsjNxhy_6IBNa3rwLETPYfgOM726526yKvBKHXOXWMFD2WLXWADycPcveNyegFhxoUb5FDNTAej-rOo8EIcV0ZpQ=s1600', false, 4, 'APPARTEMENTS MEUBLES Douala - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFW7tii2x0Y2BEmxAjtbsuHzHQIMvdCWxzjXR27h6VDvnN36PgWm2yljXrBu78rbygNk9FibqDDQ-9p2dl2XCC92waVjgU0Mx27B_sksGL6QNWb6GWxbAVSJWL_9J6fu4_VqkeS-lgX3MRDPP0H6pysbzPE-5Qb4LSRXLk8jj0nSS5YTM9odRzN6A=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFW7tii2x0Y2BEmxAjtbsuHzHQIMvdCWxzjXR27h6VDvnN36PgWm2yljXrBu78rbygNk9FibqDDQ-9p2dl2XCC92waVjgU0Mx27B_sksGL6QNWb6GWxbAVSJWL_9J6fu4_VqkeS-lgX3MRDPP0H6pysbzPE-5Qb4LSRXLk8jj0nSS5YTM9odRzN6A=s1600', false, 5, 'APPARTEMENTS MEUBLES Douala - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW388200KEt3K9yKrIxDJWy_gOGlO-cLYsxHHGRkDpOV17MJgZ-feL_FNPb-rPt3zHiyAEvHbXvfPGT7e8qFePvgevwEKG9bxZLLMZ5Y29OSOPaVHVoML_wyKy_LzyB9AcJ-iExh08D2h11_qakWCDbnmMeR-6a6N9AYpZxiYHX_rE5YndHrSCJO=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW388200KEt3K9yKrIxDJWy_gOGlO-cLYsxHHGRkDpOV17MJgZ-feL_FNPb-rPt3zHiyAEvHbXvfPGT7e8qFePvgevwEKG9bxZLLMZ5Y29OSOPaVHVoML_wyKy_LzyB9AcJ-iExh08D2h11_qakWCDbnmMeR-6a6N9AYpZxiYHX_rE5YndHrSCJO=s1600-p-k-no', false, 6, 'APPARTEMENTS MEUBLES Douala - Two-Bedroom Apartment')
  on conflict do nothing;

  -- [114] Aud’Meublé Bessengue (Deido)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'aud-meuble-bessengue-deido',
    'apartment',
    'published',
    'Aud’Meublé Bessengue',
    'Aud’Meublé Bessengue
Catégorie : Location d''appartement de vacances.
Adresse : 3P46+R96, Douala.
Contact / WhatsApp : +33651448620.
Note Google Maps : 5/5 (1 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Romeo Same, note 5/5)
- "Note sans commentaire écrit." (Romeo Same, note 5/5)
- "Note sans commentaire écrit." (Romeo Same, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'deido'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3P46+R96, Douala',
    4.0570375,
    9.7108906,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdewUHx7KUSDKJ_Q3XZFcmUl2bzavmm5ka-bZoCjR20psXKf3AyaUqMvLaeNbrFg-Z3aZCgwYw91_53AasFRTaCoGiOIBi7p3yEQpy_0BFy4WnENQGrVrQeg2QUAEUWkHI0AFj2YdV5N75w=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdewUHx7KUSDKJ_Q3XZFcmUl2bzavmm5ka-bZoCjR20psXKf3AyaUqMvLaeNbrFg-Z3aZCgwYw91_53AasFRTaCoGiOIBi7p3yEQpy_0BFy4WnENQGrVrQeg2QUAEUWkHI0AFj2YdV5N75w=s1600', true, 0, 'Aud’Meublé Bessengue')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S8n1cN6vieMGSTDK-RJTkQaNb4OOQfuftvRkXKs1Lr8sVbpSfHdj5X9CxJnO1aLLdFnGbvLW0m9VS7_6b8j3pwTC-1h4HEatMKUX63FQEemQ10QPgKF-kkJzt2gifFOxhWe9Qy7XdR03ue=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S8n1cN6vieMGSTDK-RJTkQaNb4OOQfuftvRkXKs1Lr8sVbpSfHdj5X9CxJnO1aLLdFnGbvLW0m9VS7_6b8j3pwTC-1h4HEatMKUX63FQEemQ10QPgKF-kkJzt2gifFOxhWe9Qy7XdR03ue=s1600', false, 1, 'Aud’Meublé Bessengue')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q6Zlg8mZfl73a-voAN4GoUzxs35P8RBi1GcRYGRBdr1u4ho3-d0rjRltm3FFMfJTuwIKpcbc_ESBbn0HGfgr9uu6XYtdkdw2_NEH7yAmPkKIKr0SOixrxtxrzvXdlhrLYSQECeEqnWcDQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q6Zlg8mZfl73a-voAN4GoUzxs35P8RBi1GcRYGRBdr1u4ho3-d0rjRltm3FFMfJTuwIKpcbc_ESBbn0HGfgr9uu6XYtdkdw2_NEH7yAmPkKIKr0SOixrxtxrzvXdlhrLYSQECeEqnWcDQ=s1600', false, 2, 'Aud’Meublé Bessengue')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S9ifDc5I-B8epor2Y_cTadvzcKpjAfZUKJBAuxn5J8oBQ_qBzaHIYf0ufTMuqe4jNSJPOf0sHy3aKRP3AKUfXSIWhKO0olR9a5V5MVBiuyVRW_Vl0M2JYbI82thDVkUfId74OSYW7-l1zW=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S9ifDc5I-B8epor2Y_cTadvzcKpjAfZUKJBAuxn5J8oBQ_qBzaHIYf0ufTMuqe4jNSJPOf0sHy3aKRP3AKUfXSIWhKO0olR9a5V5MVBiuyVRW_Vl0M2JYbI82thDVkUfId74OSYW7-l1zW=s1600', false, 3, 'Aud’Meublé Bessengue')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TmPJYxN6OAxvLbDkEztXh00-ZCWxZ901ErHKHCb0jWMwEBG2CvLfA5yTunET3ffcvAdsZ13iADMJy_1WpzWFlgqmtr0MzQJAn1yaiSYt1ezPmm1ASj3FjgPOdw6XmidyPAIJsf-Pm_7oTF=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TmPJYxN6OAxvLbDkEztXh00-ZCWxZ901ErHKHCb0jWMwEBG2CvLfA5yTunET3ffcvAdsZ13iADMJy_1WpzWFlgqmtr0MzQJAn1yaiSYt1ezPmm1ASj3FjgPOdw6XmidyPAIJsf-Pm_7oTF=s1600', false, 4, 'Aud’Meublé Bessengue')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QznYDKVdjAw4pAKU787wNbbUsM8F2ynXKhpOxNgl_M7cvoKQ-_0Mw6UNld-8wpb97bw4f74ARyGunxf54NjhcpnXt65kMTqzJ2tazAxFio1AlQLJmVS3vSu-BhzkWupcTJeoc6QSODvpZf=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QznYDKVdjAw4pAKU787wNbbUsM8F2ynXKhpOxNgl_M7cvoKQ-_0Mw6UNld-8wpb97bw4f74ARyGunxf54NjhcpnXt65kMTqzJ2tazAxFio1AlQLJmVS3vSu-BhzkWupcTJeoc6QSODvpZf=s1600', false, 5, 'Aud’Meublé Bessengue')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RQMj9LpeKAOb0xN4nI97SzV2rGzURnPQJLjQVLiVdcnQsQSdxlXwX2OVqspKj-cN59YMmliTJIHvfab9hXO737qQfbotjuaaArw5EFxSXrMa9-R8RdDUphCD5lr1qQ1Y37K8NokUZnP5E=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RQMj9LpeKAOb0xN4nI97SzV2rGzURnPQJLjQVLiVdcnQsQSdxlXwX2OVqspKj-cN59YMmliTJIHvfab9hXO737qQfbotjuaaArw5EFxSXrMa9-R8RdDUphCD5lr1qQ1Y37K8NokUZnP5E=s1600', false, 6, 'Aud’Meublé Bessengue')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdewUHx7KUSDKJ_Q3XZFcmUl2bzavmm5ka-bZoCjR20psXKf3AyaUqMvLaeNbrFg-Z3aZCgwYw91_53AasFRTaCoGiOIBi7p3yEQpy_0BFy4WnENQGrVrQeg2QUAEUWkHI0AFj2YdV5N75w=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdewUHx7KUSDKJ_Q3XZFcmUl2bzavmm5ka-bZoCjR20psXKf3AyaUqMvLaeNbrFg-Z3aZCgwYw91_53AasFRTaCoGiOIBi7p3yEQpy_0BFy4WnENQGrVrQeg2QUAEUWkHI0AFj2YdV5N75w=s1600-p-k-no', false, 7, 'Aud’Meublé Bessengue')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a/ACg8ocJOG7hQwXVRRBXGmEDjPOCb6mxYDI9-bHPL0nWB2XCLqWfF3w=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a/ACg8ocJOG7hQwXVRRBXGmEDjPOCb6mxYDI9-bHPL0nWB2XCLqWfF3w=s1600-p-k-no-mo', false, 8, 'Aud’Meublé Bessengue')
  on conflict do nothing;

  -- [115] Résidence TOMEDI (Deido)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-tomedi-deido',
    'apartment',
    'published',
    'Résidence TOMEDI',
    'Résidence TOMEDI
Adresse : 3P76+XFG Festif et Culturel, Rue Boneyoum, Douala.
Contact / WhatsApp : +237695610044.
Note Google Maps : 5/5 (5 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'deido'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3P76+XFG Festif et Culturel, Rue Boneyoum, Douala',
    4.0649304,
    9.7112183,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  -- [116] Maison (Kotto)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'maison-kotto',
    'apartment',
    'published',
    'Maison',
    'Maison
Catégorie : Résidence.
Adresse : 3P86+445, Rue Kotto, Douala.
Note Google Maps : 5/5 (2 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Appolinaire Tangmo, note 5/5)
- "Note sans commentaire écrit." (Wepong Stephanie, note 5/5)
- "Note sans commentaire écrit." (Appolinaire Tangmo, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'kotto'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3P86+445, Rue Kotto, Douala',
    4.064933,
    9.710351,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/a-/ALV-UjU82s28IwJ9lzumo9VbvKdiZwhY9a8vgqOp-FhCR-Eb3Fv1f8gR=s1600-p-rp-mo-ba12-br100', 'https://lh3.googleusercontent.com/a-/ALV-UjU82s28IwJ9lzumo9VbvKdiZwhY9a8vgqOp-FhCR-Eb3Fv1f8gR=s1600-p-rp-mo-ba12-br100', true, 0, 'Maison')
  on conflict do nothing;

  -- [117] PAO Home meublé (Kotto)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'pao-home-meuble-kotto',
    'apartment',
    'published',
    'PAO Home meublé',
    'PAO Home meublé
Catégorie : Location d''appartement de vacances.
Adresse : 3P76+XFG centre d''état civil, Rue Kotto, Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'kotto'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3P76+XFG centre d''état civil, Rue Kotto, Douala',
    4.0649305,
    9.7112182,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  -- [118] RESIDENCE BELMANN BALI (Bali)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-belmann-bali-bali',
    'apartment',
    'published',
    'RESIDENCE BELMANN BALI',
    'RESIDENCE BELMANN BALI
Catégorie : Appartement avec services.
Adresse : 2MRX+MGP, Douala.
Contact / WhatsApp : +237650207876.
Note Google Maps : 4.3/5 (26 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Jean severin ZOA, note 3/5)
- "Note sans commentaire écrit." (YANA Rodrigue prosper, note 5/5)
- "Note sans commentaire écrit." (Charlotte Devilliers, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bali'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '2MRX+MGP, Douala',
    4.0417071,
    9.6988172,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeZeD6WwxcfN9Evv_lrG2h_rYc6xFif-HoCB6G-tIzOnx3GjlajXG5TeSrjA4XJbLmdO3Ks6Wnsuz4RsVfb4Cs0UgIvX76mQ4Lgh03g-B2UwQNBYmCsRtoUUzkl8-zgVPEfByE=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeZeD6WwxcfN9Evv_lrG2h_rYc6xFif-HoCB6G-tIzOnx3GjlajXG5TeSrjA4XJbLmdO3Ks6Wnsuz4RsVfb4Cs0UgIvX76mQ4Lgh03g-B2UwQNBYmCsRtoUUzkl8-zgVPEfByE=s1600', true, 0, 'RESIDENCE BELMANN BALI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeZeD6WwxcfN9Evv_lrG2h_rYc6xFif-HoCB6G-tIzOnx3GjlajXG5TeSrjA4XJbLmdO3Ks6Wnsuz4RsVfb4Cs0UgIvX76mQ4Lgh03g-B2UwQNBYmCsRtoUUzkl8-zgVPEfByE=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeZeD6WwxcfN9Evv_lrG2h_rYc6xFif-HoCB6G-tIzOnx3GjlajXG5TeSrjA4XJbLmdO3Ks6Wnsuz4RsVfb4Cs0UgIvX76mQ4Lgh03g-B2UwQNBYmCsRtoUUzkl8-zgVPEfByE=s1600-p-k-no', false, 1, 'RESIDENCE BELMANN BALI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SSOybKNXpmlFRG8FccFx3d_tMOqRD0oqQ0Ai2Cnr2Yl0Y5WX-tgutCfuOUZSIZ8zmj88ScAb3K74pbjJICJUhoFtlaO0UXI3dCmk_zeRyzmz457jnTuKSvfPLMGqPrif7gy1c=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SSOybKNXpmlFRG8FccFx3d_tMOqRD0oqQ0Ai2Cnr2Yl0Y5WX-tgutCfuOUZSIZ8zmj88ScAb3K74pbjJICJUhoFtlaO0UXI3dCmk_zeRyzmz457jnTuKSvfPLMGqPrif7gy1c=s1600', false, 2, 'RESIDENCE BELMANN BALI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SZTvjaURVpDFXDae9TJHzeglntUYOtOD3LSIV9IvXpIc-ceLzeVLG-pj-cfGRX6Y7WkRR0hx_xVBRIvU9z74I4vg7GteFUa9isV7yGEv2fY7kd2yKaWe67HZ2_5RsC_2xqJpc=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SZTvjaURVpDFXDae9TJHzeglntUYOtOD3LSIV9IvXpIc-ceLzeVLG-pj-cfGRX6Y7WkRR0hx_xVBRIvU9z74I4vg7GteFUa9isV7yGEv2fY7kd2yKaWe67HZ2_5RsC_2xqJpc=s1600', false, 3, 'RESIDENCE BELMANN BALI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sdh1OYw_sTqUFF8pyJHvkBEpO4cQcnZYcBm1Q4670sku1aXfBmKapBD3ydTDs82JBK-9n_zFkD2ycpWZF9iUXme-TAdFOj83TbOyFGJajIOhJd-9ap97QY_sNjoEJZ5dsnLufo=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sdh1OYw_sTqUFF8pyJHvkBEpO4cQcnZYcBm1Q4670sku1aXfBmKapBD3ydTDs82JBK-9n_zFkD2ycpWZF9iUXme-TAdFOj83TbOyFGJajIOhJd-9ap97QY_sNjoEJZ5dsnLufo=s1600', false, 4, 'RESIDENCE BELMANN BALI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Ru2qXOfVXNMoclnaUY3uQ6DOLafW-wcNGLKeTa6oGZ5ebny5WVACG8xCkMHNF2yQ4EaHW8aQlblLqIuiXIWWVly7NB-fBWsZVX6abLW6Pr4DSsvImePMb7WI6pZhwTNkcbpU4b=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Ru2qXOfVXNMoclnaUY3uQ6DOLafW-wcNGLKeTa6oGZ5ebny5WVACG8xCkMHNF2yQ4EaHW8aQlblLqIuiXIWWVly7NB-fBWsZVX6abLW6Pr4DSsvImePMb7WI6pZhwTNkcbpU4b=s1600', false, 5, 'RESIDENCE BELMANN BALI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RSOyTsr9fGLmpQU3VEevW4-bpYV2AszPvXXcksG_QyaAUQOqtkVoCw02fCEGW4ZDobX5h3x_gmfhdzKHsaoxXbd5Wzyq3Lh6y8d34a8_GyJWnpHNgNxForiX7lM3SPc7IuDB0=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RSOyTsr9fGLmpQU3VEevW4-bpYV2AszPvXXcksG_QyaAUQOqtkVoCw02fCEGW4ZDobX5h3x_gmfhdzKHsaoxXbd5Wzyq3Lh6y8d34a8_GyJWnpHNgNxForiX7lM3SPc7IuDB0=s1600', false, 6, 'RESIDENCE BELMANN BALI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QkRaRiQCuJSmWVCdtVkT-Wf7s_x8Z8ma5907CK0EaPeaEFvB_tDv7AygcRUiq2LdGvaVEGFG0o5pzTNomu4hT7xAcUlUD50XQv0IUhJxQ5c2KR9kpUKcBwT0kMnMeUwQDa4dgB=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QkRaRiQCuJSmWVCdtVkT-Wf7s_x8Z8ma5907CK0EaPeaEFvB_tDv7AygcRUiq2LdGvaVEGFG0o5pzTNomu4hT7xAcUlUD50XQv0IUhJxQ5c2KR9kpUKcBwT0kMnMeUwQDa4dgB=s1600', false, 7, 'RESIDENCE BELMANN BALI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Szv9AJcP78_mQJzRlm898H3HnG51TeySq29RhYSWcBQdfhhPVxmCIbaTzrg37jaeo6OCo8MF2uNMnri0cH9nzChLgl8aNHoI_BSOK-ggDf07iMnC80HeGV8CvSB-oFtp2Sn0Oz2Q=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Szv9AJcP78_mQJzRlm898H3HnG51TeySq29RhYSWcBQdfhhPVxmCIbaTzrg37jaeo6OCo8MF2uNMnri0cH9nzChLgl8aNHoI_BSOK-ggDf07iMnC80HeGV8CvSB-oFtp2Sn0Oz2Q=s1600', false, 8, 'RESIDENCE BELMANN BALI')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SoTezmjzs8hCPGhYmnpUVUWp3HfgMU3rvRF5JcS4Kv2VjUi-4gYbgjEp11-Qg31GHC6S1k_s8tS0Wfas-m9sHqVHPQrig4EZjUL58gGO4TK23mlinapsRclOXitfQ_UTlQRyFk=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SoTezmjzs8hCPGhYmnpUVUWp3HfgMU3rvRF5JcS4Kv2VjUi-4gYbgjEp11-Qg31GHC6S1k_s8tS0Wfas-m9sHqVHPQrig4EZjUL58gGO4TK23mlinapsRclOXitfQ_UTlQRyFk=s1600', false, 9, 'RESIDENCE BELMANN BALI')
  on conflict do nothing;

  -- [119] studio meuble douala bali - One-Bedroom Apartment (Bali)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'studio-meuble-douala-bali-one-bedroom-apartment-bali',
    'studio',
    'published',
    'studio meuble douala bali - One-Bedroom Apartment',
    'studio meuble douala bali - One-Bedroom Apartment
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bali'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0390601,
    9.6937399,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2FSIeYxMJOLOMfNVRyjoqgyOZcFL80Qa4vVxjQEDHHQpQ_hTukwJ6xWBGu4woy36rv9qWeKiQVAQBzVDV4U_bbEhlXIfw2nuL35c2WPyuzzJABtZbeMf5Loaxf8Sx3i0Lo70yhprLiGTv1ivvgm16YpVkSEUIKq2cckM8v5Zy36Zk8k3GSOmKENA=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2FSIeYxMJOLOMfNVRyjoqgyOZcFL80Qa4vVxjQEDHHQpQ_hTukwJ6xWBGu4woy36rv9qWeKiQVAQBzVDV4U_bbEhlXIfw2nuL35c2WPyuzzJABtZbeMf5Loaxf8Sx3i0Lo70yhprLiGTv1ivvgm16YpVkSEUIKq2cckM8v5Zy36Zk8k3GSOmKENA=s1600', true, 0, 'studio meuble douala bali - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2FSIeYxMJOLOMfNVRyjoqgyOZcFL80Qa4vVxjQEDHHQpQ_hTukwJ6xWBGu4woy36rv9qWeKiQVAQBzVDV4U_bbEhlXIfw2nuL35c2WPyuzzJABtZbeMf5Loaxf8Sx3i0Lo70yhprLiGTv1ivvgm16YpVkSEUIKq2cckM8v5Zy36Zk8k3GSOmKENA=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2FSIeYxMJOLOMfNVRyjoqgyOZcFL80Qa4vVxjQEDHHQpQ_hTukwJ6xWBGu4woy36rv9qWeKiQVAQBzVDV4U_bbEhlXIfw2nuL35c2WPyuzzJABtZbeMf5Loaxf8Sx3i0Lo70yhprLiGTv1ivvgm16YpVkSEUIKq2cckM8v5Zy36Zk8k3GSOmKENA=s1600-p-k-no', false, 1, 'studio meuble douala bali - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEIpVk83nXGy3v5R9dvvn__i3uYwlvZRCq9EdRyT6d6QC25AScKlp6razr8mpYeDTY_VSo2b_GBBQKL5ymVTbAE0gHLzmdXjbj1FNeI_D2kRxGx_vz_TRyJjZKbAG3nZFmeU--lzJPGOTyJ8KfWo_U5HP6rxO35iRGZG1Z1P281jfDtUwWzPDF1Ng=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEIpVk83nXGy3v5R9dvvn__i3uYwlvZRCq9EdRyT6d6QC25AScKlp6razr8mpYeDTY_VSo2b_GBBQKL5ymVTbAE0gHLzmdXjbj1FNeI_D2kRxGx_vz_TRyJjZKbAG3nZFmeU--lzJPGOTyJ8KfWo_U5HP6rxO35iRGZG1Z1P281jfDtUwWzPDF1Ng=s1600', false, 2, 'studio meuble douala bali - One-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFhveSNHcgStbR2z9MoADXP-bqBXHKlShaEF-saaz7OCyYPAYvp7bjhy-FMLExgypJnmp24IRfAlr1DKCi-OOp6-GgEDL1IGTc7LKb4w_TgEsIeXHpjroe8SNcOnq9PIPMh95zdyk92PUTC0iWjE71tPGw3KhWpIxhBWg2dFZepmLspjpE4W14G=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFhveSNHcgStbR2z9MoADXP-bqBXHKlShaEF-saaz7OCyYPAYvp7bjhy-FMLExgypJnmp24IRfAlr1DKCi-OOp6-GgEDL1IGTc7LKb4w_TgEsIeXHpjroe8SNcOnq9PIPMh95zdyk92PUTC0iWjE71tPGw3KhWpIxhBWg2dFZepmLspjpE4W14G=s1600', false, 3, 'studio meuble douala bali - One-Bedroom Apartment')
  on conflict do nothing;

  -- [120] P'tit Loft meublé Bali-Gloria (Bali)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'p-tit-loft-meuble-bali-gloria-bali',
    'apartment',
    'published',
    'P''tit Loft meublé Bali-Gloria',
    'P''tit Loft meublé Bali-Gloria
Catégorie : Location d''appartement de vacances.
Adresse : 2MRV+VPM, Boulevard de la République, Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bali'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '2MRV+VPM, Boulevard de la République, Douala',
    4.0422543,
    9.6940935,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  -- [121] Plain pied meublé Bali-Gloria (Bali)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'plain-pied-meuble-bali-gloria-bali',
    'apartment',
    'published',
    'Plain pied meublé Bali-Gloria',
    'Plain pied meublé Bali-Gloria
Catégorie : Location d''appartement de vacances.
Adresse : 2MRV+VG9, Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bali'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '2MRV+VG9, Douala',
    4.0421744,
    9.6938624,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  -- [122] logements Du Cameroun (Bali)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'logements-du-cameroun-bali',
    'apartment',
    'published',
    'logements Du Cameroun',
    'logements Du Cameroun
Catégorie : Agence immobilière.
Adresse : Douala.
Contact / WhatsApp : +237233433607.
Note Google Maps : 3.8/5 (19 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Gabriel Woukam takala, note 4/5)
- "Note sans commentaire écrit." (Lionel CONJUGO BATOMA, note 4/5)
- "Note sans commentaire écrit." (Lycel Carole Charlotte Milla (Chamilla), note 3/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bali'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0381566,
    9.6912543,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcJonpGl4fkV_f37J-FbT9tasK5O_YjGzgkDQ4ydRT7LcOHRPDGM9_gvq5x6Pc1GR85kgYbh2WBuI3yVM4RPnl-tOwVKAVz7yqWd-XTl5Pz5OUv1LJZq_4e_Ji4AowxwKiUXGWn=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcJonpGl4fkV_f37J-FbT9tasK5O_YjGzgkDQ4ydRT7LcOHRPDGM9_gvq5x6Pc1GR85kgYbh2WBuI3yVM4RPnl-tOwVKAVz7yqWd-XTl5Pz5OUv1LJZq_4e_Ji4AowxwKiUXGWn=s1600', true, 0, 'logements Du Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcJonpGl4fkV_f37J-FbT9tasK5O_YjGzgkDQ4ydRT7LcOHRPDGM9_gvq5x6Pc1GR85kgYbh2WBuI3yVM4RPnl-tOwVKAVz7yqWd-XTl5Pz5OUv1LJZq_4e_Ji4AowxwKiUXGWn=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcJonpGl4fkV_f37J-FbT9tasK5O_YjGzgkDQ4ydRT7LcOHRPDGM9_gvq5x6Pc1GR85kgYbh2WBuI3yVM4RPnl-tOwVKAVz7yqWd-XTl5Pz5OUv1LJZq_4e_Ji4AowxwKiUXGWn=s1600-p-k-no', false, 1, 'logements Du Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SQuGQzKeavQssarjjzdaxhdF5QSKFDPrUbuW6C1tLSEOYM-5vOvaCa02vptzt4JHzjPNmZ9f2E2iad9H1C3DSBtgUOMalGim0PDamiTiHUAPKAMjUKYxsjYYUYmRtsbrB4IZSb=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SQuGQzKeavQssarjjzdaxhdF5QSKFDPrUbuW6C1tLSEOYM-5vOvaCa02vptzt4JHzjPNmZ9f2E2iad9H1C3DSBtgUOMalGim0PDamiTiHUAPKAMjUKYxsjYYUYmRtsbrB4IZSb=s1600', false, 2, 'logements Du Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TAk9Spa9GDbRe0fL9kM9TVMF9LgrwFw-DzSTXH2pAaSuAdO708DLIHe6RBIS2XKy1stelPA5juQR-iM5QeR3fI5fMlSpl89MG3Sfxs7I3eTW30izAcg8vt_Eq7SPuUHgVMGDUFZQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TAk9Spa9GDbRe0fL9kM9TVMF9LgrwFw-DzSTXH2pAaSuAdO708DLIHe6RBIS2XKy1stelPA5juQR-iM5QeR3fI5fMlSpl89MG3Sfxs7I3eTW30izAcg8vt_Eq7SPuUHgVMGDUFZQ=s1600', false, 3, 'logements Du Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T_bQrfPFZKcvu08aOSY7M4aTPbGKZPnR4nCdz3rOt2Jb_RgNEMWR6QF5e5RK6zd8hUffij9o-KSPsXlcmccvHUQMOBl4aretr8NuUJuNld09iXZUPEpe5YG49dhWUWUCht5BEGPQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T_bQrfPFZKcvu08aOSY7M4aTPbGKZPnR4nCdz3rOt2Jb_RgNEMWR6QF5e5RK6zd8hUffij9o-KSPsXlcmccvHUQMOBl4aretr8NuUJuNld09iXZUPEpe5YG49dhWUWUCht5BEGPQ=s1600', false, 4, 'logements Du Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a-/ALV-UjU3Okyq8jnGL_otSrm7g7yq_sV9zV1C_WV8yake9GCCcklVZc_0=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a-/ALV-UjU3Okyq8jnGL_otSrm7g7yq_sV9zV1C_WV8yake9GCCcklVZc_0=s1600-p-k-no-mo', false, 5, 'logements Du Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tm49owFqUsZkCb3ZvNjxx7RaeER1vje5d9w2ySa0yJpUw23DZ6cI9zfK6Bq27vXAdENGe2O_r37GocW8LOCgUeX7lNmGYMGtsmL7_eYGlSg86eWuDalBajvDUw_3gTAhuWwJNzvw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tm49owFqUsZkCb3ZvNjxx7RaeER1vje5d9w2ySa0yJpUw23DZ6cI9zfK6Bq27vXAdENGe2O_r37GocW8LOCgUeX7lNmGYMGtsmL7_eYGlSg86eWuDalBajvDUw_3gTAhuWwJNzvw=s1600', false, 6, 'logements Du Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TUggNHYH_3GJTfxBQNe4SYozkbcmB0VSuJXp17OsMB4Jq-vM--3TEgSy1HDLMfvFNMa7MUBhjkbuPoAgSsM9gl3xtDcZe4BlwD_cWTb0HjY6IDsXMCjYiJbcRl3F0aoUgOJh9qZA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TUggNHYH_3GJTfxBQNe4SYozkbcmB0VSuJXp17OsMB4Jq-vM--3TEgSy1HDLMfvFNMa7MUBhjkbuPoAgSsM9gl3xtDcZe4BlwD_cWTb0HjY6IDsXMCjYiJbcRl3F0aoUgOJh9qZA=s1600', false, 7, 'logements Du Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QdeMcEjSVi9IlZB-szFNQYrtzTIlL24QFN8Y21atEcgtUD3c8OuZv7pTuElxMjoEjkNcipue7OJLgZNXKICcFiub02ZH7mPa40u2LlSVftkGda2OcmsGgPYU_3uXpRNd7AMCLCvQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QdeMcEjSVi9IlZB-szFNQYrtzTIlL24QFN8Y21atEcgtUD3c8OuZv7pTuElxMjoEjkNcipue7OJLgZNXKICcFiub02ZH7mPa40u2LlSVftkGda2OcmsGgPYU_3uXpRNd7AMCLCvQ=s1600', false, 8, 'logements Du Cameroun')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tg2tc5bO9_ic-JgntuB2ptDDAUi5g7kgSdJwfagUdAMjUAlW243aexeZTIgXquD03sZhEtHlt4zCWWAdKncUgyzovAp_a-w7DTcP2MPSw1xYGWmbh9qL6mX1FA8sM7hEJWzO2Z1w=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tg2tc5bO9_ic-JgntuB2ptDDAUi5g7kgSdJwfagUdAMjUAlW243aexeZTIgXquD03sZhEtHlt4zCWWAdKncUgyzovAp_a-w7DTcP2MPSw1xYGWmbh9qL6mX1FA8sM7hEJWzO2Z1w=s1600', false, 9, 'logements Du Cameroun')
  on conflict do nothing;

  -- [123] Appartement meublé à louer à Bali, Rue Prince Bell - Two-Bedroom Apartment (Bali)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-a-louer-a-bali-rue-prince-bell-two-bedroom-apartment-bal',
    'room',
    'published',
    'Appartement meublé à louer à Bali, Rue Prince Bell - Two-Bedroom Apartment',
    'Appartement meublé à louer à Bali, Rue Prince Bell - Two-Bedroom Apartment
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bali'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0390401,
    9.6937504,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2chmySFR7ooAkfFc9rFQ7EPqMgvoIBT0ZLc0c9iXocvrZRbpedxCk_Vztf_QUjvDj3yzA_Bdq_GjQ5JOd3pgrMyuhJ1OoM2zvluOacq-Dfx-AeTmIgqrGh9I7k7NI38riiGhJdHcTuYI-J6d5EPLQ08kzaNfbzl9WpZNxmJpmxuTWLy-3cgC_4=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2chmySFR7ooAkfFc9rFQ7EPqMgvoIBT0ZLc0c9iXocvrZRbpedxCk_Vztf_QUjvDj3yzA_Bdq_GjQ5JOd3pgrMyuhJ1OoM2zvluOacq-Dfx-AeTmIgqrGh9I7k7NI38riiGhJdHcTuYI-J6d5EPLQ08kzaNfbzl9WpZNxmJpmxuTWLy-3cgC_4=s1600', true, 0, 'Appartement meublé à louer à Bali, Rue Prince Bell - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFEBsT-Ia0JDI9gNy6J77TSliSd6MzRZU5rUkpMdlP2shn0YoxHu1VyFWF5PhvHyv2tyDKS8ti2acyn-YFUrOEfk4vDPV20vtOSzrPDZ7NPHBv7KhgWzYCZN_i6eq6W18NGPm_CJiqFi081KRpCNOCoIJ9BPdhLZRcYn4vGs-oa9JUCiEIZt9H7=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFEBsT-Ia0JDI9gNy6J77TSliSd6MzRZU5rUkpMdlP2shn0YoxHu1VyFWF5PhvHyv2tyDKS8ti2acyn-YFUrOEfk4vDPV20vtOSzrPDZ7NPHBv7KhgWzYCZN_i6eq6W18NGPm_CJiqFi081KRpCNOCoIJ9BPdhLZRcYn4vGs-oa9JUCiEIZt9H7=s1600', false, 1, 'Appartement meublé à louer à Bali, Rue Prince Bell - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEVMogki4xk9fpm15dsY_AXbWhxdMCfes6Kt61Ph6oXx_NucKaX9sYjfpnleiDYYAqypzsJEbCYbRU-RpJ2pFUcfyU4VBBWZSheSJI8XUGbB0DliKCKW9fRXfk_83MfqFHMl7EDvGeERsWeXPerbkFWkYK6YkS-u2htViDxq9ZaVKMDLJJJiYvq=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEVMogki4xk9fpm15dsY_AXbWhxdMCfes6Kt61Ph6oXx_NucKaX9sYjfpnleiDYYAqypzsJEbCYbRU-RpJ2pFUcfyU4VBBWZSheSJI8XUGbB0DliKCKW9fRXfk_83MfqFHMl7EDvGeERsWeXPerbkFWkYK6YkS-u2htViDxq9ZaVKMDLJJJiYvq=s1600', false, 2, 'Appartement meublé à louer à Bali, Rue Prince Bell - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGBdhCE4HucvoIU-53NYwmKLCeXlfAlRIk6QmCFl1F0ouDsQyvnYtCekDrrs-npmnX2BzDjkHWjGYk3C2yRSJBXaes9cwBLfogfwBDx0en91pqlmnpuhgqOlBXBvvWq2d1i4MKjuGTNHUNuvSQxAvlChzvRQhtve_Qlt3Zbw9lGTbl2Hciuqg7M=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGBdhCE4HucvoIU-53NYwmKLCeXlfAlRIk6QmCFl1F0ouDsQyvnYtCekDrrs-npmnX2BzDjkHWjGYk3C2yRSJBXaes9cwBLfogfwBDx0en91pqlmnpuhgqOlBXBvvWq2d1i4MKjuGTNHUNuvSQxAvlChzvRQhtve_Qlt3Zbw9lGTbl2Hciuqg7M=s1600', false, 3, 'Appartement meublé à louer à Bali, Rue Prince Bell - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhETxwiJzMc2PeSpOtUIwEpyKn9uuUIjininb46M3uV6Ej4zVVYffGcDAVSXQNmJX3WF0V19doHzhCD1RAhBM77gaUQlKXdwRUO9v6ygrQTVMJB15y8gQ0l3NUrPODxCh864tRg7lEnynriDLkD28byi45JLpE7RBNMEat9sm47OHWiITDe5fdE=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhETxwiJzMc2PeSpOtUIwEpyKn9uuUIjininb46M3uV6Ej4zVVYffGcDAVSXQNmJX3WF0V19doHzhCD1RAhBM77gaUQlKXdwRUO9v6ygrQTVMJB15y8gQ0l3NUrPODxCh864tRg7lEnynriDLkD28byi45JLpE7RBNMEat9sm47OHWiITDe5fdE=s1600', false, 4, 'Appartement meublé à louer à Bali, Rue Prince Bell - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFayEuPsK_-x6CoKsfm0CSqZTOsLcGIBnFCmbtmf-Krb8EVwlLOiRLapIg04tVcUN9VCw8UoOPGfiW6usFc1v1KtggbXtTYS1qAbpUuDGr8eqhHG2YqgstSo_T5zxF9Kaz_m0I4HzC9MsVhaSplvH2iliNT3AVTaEjIoHG45lgug0VngndZtxAZ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFayEuPsK_-x6CoKsfm0CSqZTOsLcGIBnFCmbtmf-Krb8EVwlLOiRLapIg04tVcUN9VCw8UoOPGfiW6usFc1v1KtggbXtTYS1qAbpUuDGr8eqhHG2YqgstSo_T5zxF9Kaz_m0I4HzC9MsVhaSplvH2iliNT3AVTaEjIoHG45lgug0VngndZtxAZ=s1600', false, 5, 'Appartement meublé à louer à Bali, Rue Prince Bell - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2chmySFR7ooAkfFc9rFQ7EPqMgvoIBT0ZLc0c9iXocvrZRbpedxCk_Vztf_QUjvDj3yzA_Bdq_GjQ5JOd3pgrMyuhJ1OoM2zvluOacq-Dfx-AeTmIgqrGh9I7k7NI38riiGhJdHcTuYI-J6d5EPLQ08kzaNfbzl9WpZNxmJpmxuTWLy-3cgC_4=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2chmySFR7ooAkfFc9rFQ7EPqMgvoIBT0ZLc0c9iXocvrZRbpedxCk_Vztf_QUjvDj3yzA_Bdq_GjQ5JOd3pgrMyuhJ1OoM2zvluOacq-Dfx-AeTmIgqrGh9I7k7NI38riiGhJdHcTuYI-J6d5EPLQ08kzaNfbzl9WpZNxmJpmxuTWLy-3cgC_4=s1600-p-k-no', false, 6, 'Appartement meublé à louer à Bali, Rue Prince Bell - Two-Bedroom Apartment')
  on conflict do nothing;

  -- [124] IMD Résidence (Bali)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'imd-residence-bali',
    'apartment',
    'published',
    'IMD Résidence',
    'IMD Résidence
Catégorie : Complexe d''appartements meublés.
Adresse : 1321 Rue Bertaut, Douala.
Contact / WhatsApp : +237694820721.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bali'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '1321 Rue Bertaut, Douala',
    4.0379477,
    9.6936307,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeKiwxBx2WeOrgw8d3rSHw3ZLLgSbzIZt4NdhY2K9brsNYs11bLBYxjKGbHOH-isXbXr2eZOULISr9iREKKKGU2RaXgk0qnpona0kExzjuoBbetcLoeNf23JRIcBZOKmfcHGpaf=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeKiwxBx2WeOrgw8d3rSHw3ZLLgSbzIZt4NdhY2K9brsNYs11bLBYxjKGbHOH-isXbXr2eZOULISr9iREKKKGU2RaXgk0qnpona0kExzjuoBbetcLoeNf23JRIcBZOKmfcHGpaf=s1600', true, 0, 'IMD Résidence')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SO_tQJHOMZv5xwgUcwFWk_cNc8OMfA-5xSblBZ5sqdUG3Rghw_H_6J22e2PCzzi13MArQDEcIhSMnoEVsMpxiWeQlNbBh1rddPOcXgtMn_xVzTRhXhmrc4VQqAhKVqtTzP5I-3=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SO_tQJHOMZv5xwgUcwFWk_cNc8OMfA-5xSblBZ5sqdUG3Rghw_H_6J22e2PCzzi13MArQDEcIhSMnoEVsMpxiWeQlNbBh1rddPOcXgtMn_xVzTRhXhmrc4VQqAhKVqtTzP5I-3=s1600', false, 1, 'IMD Résidence')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qz4H-6fYLSsnDXREcABoiFc2pXdHIUfiFkOxastD1YGWydaBVyBUQP_s1F2YN0fi87ljVXdGJ6hrBMOFaKX72W3PfL-1cI72jQaCouG8ZLqsENNjgayE_4OwbDiZ0D_Bny_YcQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qz4H-6fYLSsnDXREcABoiFc2pXdHIUfiFkOxastD1YGWydaBVyBUQP_s1F2YN0fi87ljVXdGJ6hrBMOFaKX72W3PfL-1cI72jQaCouG8ZLqsENNjgayE_4OwbDiZ0D_Bny_YcQ=s1600', false, 2, 'IMD Résidence')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RUfNipRYL9uNmSn6StyFRe6qPMAJzJoacOfuNiuO8mrkGGPF3yfNUotYSoHPs0Vmi0paejTMzj_LcP6Dc8YyIQxNL1PTdNR-hO3qCnr7cs8tNsN-bOiEUARVRWm-idD1wArvd8cA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RUfNipRYL9uNmSn6StyFRe6qPMAJzJoacOfuNiuO8mrkGGPF3yfNUotYSoHPs0Vmi0paejTMzj_LcP6Dc8YyIQxNL1PTdNR-hO3qCnr7cs8tNsN-bOiEUARVRWm-idD1wArvd8cA=s1600', false, 3, 'IMD Résidence')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RGJSksPbTDwk0GXQIFC1eSSGjfBJPcz_XK2J0dFvJgwDUClUXg-n8GNTNI1ygNPr41KAz-LEEBLUrgEAvXef1KxKjmL9-7OaF1g_CWOY-7h5meHBq3eOn6LN75UqPFJhrIyQkcSg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RGJSksPbTDwk0GXQIFC1eSSGjfBJPcz_XK2J0dFvJgwDUClUXg-n8GNTNI1ygNPr41KAz-LEEBLUrgEAvXef1KxKjmL9-7OaF1g_CWOY-7h5meHBq3eOn6LN75UqPFJhrIyQkcSg=s1600', false, 4, 'IMD Résidence')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeKiwxBx2WeOrgw8d3rSHw3ZLLgSbzIZt4NdhY2K9brsNYs11bLBYxjKGbHOH-isXbXr2eZOULISr9iREKKKGU2RaXgk0qnpona0kExzjuoBbetcLoeNf23JRIcBZOKmfcHGpaf=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeKiwxBx2WeOrgw8d3rSHw3ZLLgSbzIZt4NdhY2K9brsNYs11bLBYxjKGbHOH-isXbXr2eZOULISr9iREKKKGU2RaXgk0qnpona0kExzjuoBbetcLoeNf23JRIcBZOKmfcHGpaf=s1600-p-k-no', false, 5, 'IMD Résidence')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a/ACg8ocIw2CfXeXop2ZTRx90YgMHdPClpzZnXUVdVBOS2zlkYWii5FA=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a/ACg8ocIw2CfXeXop2ZTRx90YgMHdPClpzZnXUVdVBOS2zlkYWii5FA=s1600-p-k-no-mo', false, 6, 'IMD Résidence')
  on conflict do nothing;

  -- [125] Résidence meublée idéale pour vacances en famille Douala (Bali)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-meublee-ideale-pour-vacances-en-famille-douala-bali',
    'apartment',
    'published',
    'Résidence meublée idéale pour vacances en famille Douala',
    'Résidence meublée idéale pour vacances en famille Douala
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bali'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0476551,
    9.7030372,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3aZb1AKjTQ29gnUYdfOi_x-iD0y5mSQQ6rkZWfFrkqteK2pBIiQtiR5zMF3VTTnDY7aAd-L22wWFJJFsPAIjL3o7pH-ykUv4oB-0N6gnf2b9Z21Y1DtoNG9OhjR_Fh9qhRqn2IMnEI0yYTmwNCF5gBoKCqi-J2Yawqh8WzGydVrWioO_ReQneUzg=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3aZb1AKjTQ29gnUYdfOi_x-iD0y5mSQQ6rkZWfFrkqteK2pBIiQtiR5zMF3VTTnDY7aAd-L22wWFJJFsPAIjL3o7pH-ykUv4oB-0N6gnf2b9Z21Y1DtoNG9OhjR_Fh9qhRqn2IMnEI0yYTmwNCF5gBoKCqi-J2Yawqh8WzGydVrWioO_ReQneUzg=s1600', true, 0, 'Résidence meublée idéale pour vacances en famille Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3aZb1AKjTQ29gnUYdfOi_x-iD0y5mSQQ6rkZWfFrkqteK2pBIiQtiR5zMF3VTTnDY7aAd-L22wWFJJFsPAIjL3o7pH-ykUv4oB-0N6gnf2b9Z21Y1DtoNG9OhjR_Fh9qhRqn2IMnEI0yYTmwNCF5gBoKCqi-J2Yawqh8WzGydVrWioO_ReQneUzg=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3aZb1AKjTQ29gnUYdfOi_x-iD0y5mSQQ6rkZWfFrkqteK2pBIiQtiR5zMF3VTTnDY7aAd-L22wWFJJFsPAIjL3o7pH-ykUv4oB-0N6gnf2b9Z21Y1DtoNG9OhjR_Fh9qhRqn2IMnEI0yYTmwNCF5gBoKCqi-J2Yawqh8WzGydVrWioO_ReQneUzg=s1600-p-k-no', false, 1, 'Résidence meublée idéale pour vacances en famille Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFgIqjh2yAfC80EKuc4Mt93z7egjXVHlL1mkLJgYy8tVfOvPgB6ckJd5e9egr4kg8ZI6qu8gACAEm-5Brke0Kqky_SHZCuSoIiCfoh-30zvL-iRNp2cjTnG-zoAJFMl4ULQA7NyRB-fg6PwWRXy-5wIj1rUCBfLc2-Bj8lLOgsbSUQ4LNaxkPeHng=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFgIqjh2yAfC80EKuc4Mt93z7egjXVHlL1mkLJgYy8tVfOvPgB6ckJd5e9egr4kg8ZI6qu8gACAEm-5Brke0Kqky_SHZCuSoIiCfoh-30zvL-iRNp2cjTnG-zoAJFMl4ULQA7NyRB-fg6PwWRXy-5wIj1rUCBfLc2-Bj8lLOgsbSUQ4LNaxkPeHng=s1600', false, 2, 'Résidence meublée idéale pour vacances en famille Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHH2JT7-fNdxz15cQ8podU7iq0ykOQSAWxTvMoXn3Y2Pv1tVAVcny-XM-j0BWBq2ELfe9P7w0N-g8hSOkqzERbXLStz8USBaPbgHgt0WVlhtdIE4loaKCXOtPw9-jrybUgHIi9gCtTp0emPBHoPnz_Z2fYcuDSrFXhcMp_oseOKyzxbLpJ2emzi=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHH2JT7-fNdxz15cQ8podU7iq0ykOQSAWxTvMoXn3Y2Pv1tVAVcny-XM-j0BWBq2ELfe9P7w0N-g8hSOkqzERbXLStz8USBaPbgHgt0WVlhtdIE4loaKCXOtPw9-jrybUgHIi9gCtTp0emPBHoPnz_Z2fYcuDSrFXhcMp_oseOKyzxbLpJ2emzi=s1600', false, 3, 'Résidence meublée idéale pour vacances en famille Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHDOFxk_vNYsAWAAH1f9pLMd4sZHQKzn8Frm4huy7ERUHYDpPLg6gAHO8EqxCx0T8wmPZBKZuHE7zAbhZsmEvi5OdpUuYj5AIsufYRFMXWdNhqJlHMoZjJnkEbW91A8QR3cjDapCMdgY9SzPcma4xwQJEkiKYCBWW10sm7iC_Zenos-3FvI1TO9=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHDOFxk_vNYsAWAAH1f9pLMd4sZHQKzn8Frm4huy7ERUHYDpPLg6gAHO8EqxCx0T8wmPZBKZuHE7zAbhZsmEvi5OdpUuYj5AIsufYRFMXWdNhqJlHMoZjJnkEbW91A8QR3cjDapCMdgY9SzPcma4xwQJEkiKYCBWW10sm7iC_Zenos-3FvI1TO9=s1600', false, 4, 'Résidence meublée idéale pour vacances en famille Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFp3l9ZP3UwYpCuq58pH5tH97K-WonJ7IYy8l2cJB6Oan8dBtGIygI5EtBq3DjJvn8LrGasUQMY2ZBX3Zlb0b0jGoSv30gcSwaqg39UN5LC4dPCekgWUxlLyokxNr9_fjBEfjTmtqDFAFMiEFUhjBAUbt-PzfrFiNIR4IlI51sgUr_TBLHy-fOR=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFp3l9ZP3UwYpCuq58pH5tH97K-WonJ7IYy8l2cJB6Oan8dBtGIygI5EtBq3DjJvn8LrGasUQMY2ZBX3Zlb0b0jGoSv30gcSwaqg39UN5LC4dPCekgWUxlLyokxNr9_fjBEfjTmtqDFAFMiEFUhjBAUbt-PzfrFiNIR4IlI51sgUr_TBLHy-fOR=s1600', false, 5, 'Résidence meublée idéale pour vacances en famille Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGK_bnEidu6w3T9FMIX9UZgndhvY-i50Qo3D66YDV74hNNj-gciSYA_PQWnUMCITBFpCrWI_hMlXQCNjyIWd0qdfCDr0nBz_qhWNuZtkoUr4LFEZ4oijhEEJEfIPBIg5DXFGRmh8mOCNv5lXtB-rsO4ineKvJA41CC5VIL8_pN8NAQdi2JngJ3ohw=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGK_bnEidu6w3T9FMIX9UZgndhvY-i50Qo3D66YDV74hNNj-gciSYA_PQWnUMCITBFpCrWI_hMlXQCNjyIWd0qdfCDr0nBz_qhWNuZtkoUr4LFEZ4oijhEEJEfIPBIg5DXFGRmh8mOCNv5lXtB-rsO4ineKvJA41CC5VIL8_pN8NAQdi2JngJ3ohw=s1600', false, 6, 'Résidence meublée idéale pour vacances en famille Douala')
  on conflict do nothing;

  -- [126] Location meublée (Bali)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'location-meublee-bali',
    'apartment',
    'published',
    'Location meublée',
    'Location meublée
Catégorie : Location d''appartement de vacances.
Adresse : 2PG9+28C, Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bali'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '2PG9+28C, Douala',
    4.0256526,
    9.7177582,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  -- [127] meublé Bali - Two-Bedroom Apartment (Bali)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'meuble-bali-two-bedroom-apartment-bali',
    'room',
    'published',
    'meublé Bali - Two-Bedroom Apartment',
    'meublé Bali - Two-Bedroom Apartment
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bali'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0370898,
    9.6986599,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3Hjy4YsjaNzkyf79k2APRtrNxz1ukLckdTh9ZDbmQebcklEEM4Sz28YJ9GdyZQS0p10yH8m1ZquCQumF_7AFvxqmIp4fqkIzXj-O4lAAf-KEwm--dm7XC3eQ3MNPd2H7_Yi7WsOb3pvC4SqGFy5TKx-ZspiDSzJi-KkNGFVBf7I84RxFZmcHJN=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3Hjy4YsjaNzkyf79k2APRtrNxz1ukLckdTh9ZDbmQebcklEEM4Sz28YJ9GdyZQS0p10yH8m1ZquCQumF_7AFvxqmIp4fqkIzXj-O4lAAf-KEwm--dm7XC3eQ3MNPd2H7_Yi7WsOb3pvC4SqGFy5TKx-ZspiDSzJi-KkNGFVBf7I84RxFZmcHJN=s1600', true, 0, 'meublé Bali - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3Hjy4YsjaNzkyf79k2APRtrNxz1ukLckdTh9ZDbmQebcklEEM4Sz28YJ9GdyZQS0p10yH8m1ZquCQumF_7AFvxqmIp4fqkIzXj-O4lAAf-KEwm--dm7XC3eQ3MNPd2H7_Yi7WsOb3pvC4SqGFy5TKx-ZspiDSzJi-KkNGFVBf7I84RxFZmcHJN=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3Hjy4YsjaNzkyf79k2APRtrNxz1ukLckdTh9ZDbmQebcklEEM4Sz28YJ9GdyZQS0p10yH8m1ZquCQumF_7AFvxqmIp4fqkIzXj-O4lAAf-KEwm--dm7XC3eQ3MNPd2H7_Yi7WsOb3pvC4SqGFy5TKx-ZspiDSzJi-KkNGFVBf7I84RxFZmcHJN=s1600-p-k-no', false, 1, 'meublé Bali - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFSfu_41bLVWynS9Iu8umjM4r5L-fJdS6NS-U6XZiTxnQoY5tef5KVOCnmfgw_DnE-U5RIY_GM7C0IqE62ZDVAiX5CGKzX5QwjlOOrUYpxpSYYRiyBbdBAczWV_fvDCXO9j18dRELLiXxOfoaRlynsuZ_udR4dy8Zfoo0I-iWmGyX4Oqm6NA51L=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFSfu_41bLVWynS9Iu8umjM4r5L-fJdS6NS-U6XZiTxnQoY5tef5KVOCnmfgw_DnE-U5RIY_GM7C0IqE62ZDVAiX5CGKzX5QwjlOOrUYpxpSYYRiyBbdBAczWV_fvDCXO9j18dRELLiXxOfoaRlynsuZ_udR4dy8Zfoo0I-iWmGyX4Oqm6NA51L=s1600', false, 2, 'meublé Bali - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHm-PEEgAcMOEhtsbVtxd3R1010wY55iuJU4z8GdavWmRI7uVcNfQNJRJrCaQ-ghr6QG6tk9O20ndnKvn7DNdy7E--I7_i6yBUYKvaG5nPOATYS3J2hOIyN1aiHXP7EO-mUUPTRY7JmB4Dy6ydqZTWR11KeUStFBUzQfgyym3hlF9WOVNPpsR3s=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHm-PEEgAcMOEhtsbVtxd3R1010wY55iuJU4z8GdavWmRI7uVcNfQNJRJrCaQ-ghr6QG6tk9O20ndnKvn7DNdy7E--I7_i6yBUYKvaG5nPOATYS3J2hOIyN1aiHXP7EO-mUUPTRY7JmB4Dy6ydqZTWR11KeUStFBUzQfgyym3hlF9WOVNPpsR3s=s1600', false, 3, 'meublé Bali - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG35RYgKJTICQwg_7de6NAEQulapCDwtvZD8Tu0TJJEebiKmSBW9n-1GcMAAf9qwNXeJg7DzsBLCcATe1iqH-ZngOZrItQ65XWc2RMUE3ITs-kaGTvEC1p3f_JJdL1yp07zvybo1y_b5XY6XOQnCA_MPARZcyH28NOWsTuvZdxPeut4okkHhS9U=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG35RYgKJTICQwg_7de6NAEQulapCDwtvZD8Tu0TJJEebiKmSBW9n-1GcMAAf9qwNXeJg7DzsBLCcATe1iqH-ZngOZrItQ65XWc2RMUE3ITs-kaGTvEC1p3f_JJdL1yp07zvybo1y_b5XY6XOQnCA_MPARZcyH28NOWsTuvZdxPeut4okkHhS9U=s1600', false, 4, 'meublé Bali - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEW4PcH7H1VG2jqhWaD2mOPmaUMuDoQNipS2v2BDy4oYVlGmccMVX-B1nEdFqMZboAEfYzHI_C6AABVKNDXqd6ghRzH2poONrIa-ENkwglw2V14w066-UTtzcooTRg7XY22zIthw_RrgIOudseBbaCbI0-qz9gwGpv1Z16Ut_qIjhdtssC_7Sqn=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEW4PcH7H1VG2jqhWaD2mOPmaUMuDoQNipS2v2BDy4oYVlGmccMVX-B1nEdFqMZboAEfYzHI_C6AABVKNDXqd6ghRzH2poONrIa-ENkwglw2V14w066-UTtzcooTRg7XY22zIthw_RrgIOudseBbaCbI0-qz9gwGpv1Z16Ut_qIjhdtssC_7Sqn=s1600', false, 5, 'meublé Bali - Two-Bedroom Apartment')
  on conflict do nothing;

  -- [128] Appartement meublé MBA (Bali)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-mba-bali',
    'apartment',
    'published',
    'Appartement meublé MBA',
    'Appartement meublé MBA
Catégorie : Résidence hôtelière.
Adresse : Ola axe lourd, Douala.
Contact / WhatsApp : +237658280867.
Note Google Maps : 5/5 (2 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Miguel Wabo, note 5/5)
- "Note sans commentaire écrit." (Judicaël Taga, note 5/5)
- "Note sans commentaire écrit." (Miguel Wabo, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'bali'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Ola axe lourd, Douala',
    4.0181167,
    9.7265606,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLd5PbRBXsSi4jj9N04IJ57javDOO_RSnDLOwsiuD68TuRx7Q9KTVjj8E86v0DvowWIc-ARNsxyI47LHNDv-SigICwT4S0z0i1IIdmf3MiFfvAa1w4ZiXVMhiG3BFwD1rKKDUyV3=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLd5PbRBXsSi4jj9N04IJ57javDOO_RSnDLOwsiuD68TuRx7Q9KTVjj8E86v0DvowWIc-ARNsxyI47LHNDv-SigICwT4S0z0i1IIdmf3MiFfvAa1w4ZiXVMhiG3BFwD1rKKDUyV3=s1600', true, 0, 'Appartement meublé MBA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLd5PbRBXsSi4jj9N04IJ57javDOO_RSnDLOwsiuD68TuRx7Q9KTVjj8E86v0DvowWIc-ARNsxyI47LHNDv-SigICwT4S0z0i1IIdmf3MiFfvAa1w4ZiXVMhiG3BFwD1rKKDUyV3=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLd5PbRBXsSi4jj9N04IJ57javDOO_RSnDLOwsiuD68TuRx7Q9KTVjj8E86v0DvowWIc-ARNsxyI47LHNDv-SigICwT4S0z0i1IIdmf3MiFfvAa1w4ZiXVMhiG3BFwD1rKKDUyV3=s1600-p-k-no', false, 1, 'Appartement meublé MBA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S31yC29tgNIpwtWBvYVBPXoZQ6o75V0Mz4UIxPEXdVYAsDRxox4mfF7J9iqyE8UhYqfUuac3K3OHS6rgOLZHNuUyn0jtEBNeGS1TbKi_OuLCAUSWyrHp6lKCOo42h7ec2xrDsq=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S31yC29tgNIpwtWBvYVBPXoZQ6o75V0Mz4UIxPEXdVYAsDRxox4mfF7J9iqyE8UhYqfUuac3K3OHS6rgOLZHNuUyn0jtEBNeGS1TbKi_OuLCAUSWyrHp6lKCOo42h7ec2xrDsq=s1600', false, 2, 'Appartement meublé MBA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rv10p0aKsqPrDUkC6czyM_7GBF4HSmKCAszLpYfK3-I5mUQNbbm4V1OVIUNuV5i7LrsQsfVRzNv7_z5HntOI8ogcKn8hR_bRkUu6kGRmiYG8_17sjGD1Z7f2-4HAM73lXDXhE=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rv10p0aKsqPrDUkC6czyM_7GBF4HSmKCAszLpYfK3-I5mUQNbbm4V1OVIUNuV5i7LrsQsfVRzNv7_z5HntOI8ogcKn8hR_bRkUu6kGRmiYG8_17sjGD1Z7f2-4HAM73lXDXhE=s1600', false, 3, 'Appartement meublé MBA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SuHxQNN2VVIqBzeSCuvkIOI-2BcAd8qIpJQzpQlt7Lyk29-BBsNjgmwwD9BnjlyOZH4etLKy-agsFlEpIHdRZjaSpJf5-VS-COUf0HXcu65WEHUHmjkBVi0VICy6qABTUVaThavg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SuHxQNN2VVIqBzeSCuvkIOI-2BcAd8qIpJQzpQlt7Lyk29-BBsNjgmwwD9BnjlyOZH4etLKy-agsFlEpIHdRZjaSpJf5-VS-COUf0HXcu65WEHUHmjkBVi0VICy6qABTUVaThavg=s1600', false, 4, 'Appartement meublé MBA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SplssiAT1mVD2DrQ95lDR88JdvNK39_GK_iJylb-gACyN5RFNrY03pi4MMqKHJDoOgG3vaZjk4Z5KkUiR5O_ic9eqhq8Xa9q3L_iQjONWno22TerxCtGPVh5alEfPFVyY8qq2K=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SplssiAT1mVD2DrQ95lDR88JdvNK39_GK_iJylb-gACyN5RFNrY03pi4MMqKHJDoOgG3vaZjk4Z5KkUiR5O_ic9eqhq8Xa9q3L_iQjONWno22TerxCtGPVh5alEfPFVyY8qq2K=s1600', false, 5, 'Appartement meublé MBA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TSu_z5b2h17ZQgktjDKULZ6_H_sjI7CZ_0qk94TW55TFQKv_isuVTflh8iBRNVmfcDKsHO4JUZpS-bGJ9q7nngVYwfbHNi-P0WqMsGVg3j0b-aB1q0BsHPXdvQnSCNWGaF8m39=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TSu_z5b2h17ZQgktjDKULZ6_H_sjI7CZ_0qk94TW55TFQKv_isuVTflh8iBRNVmfcDKsHO4JUZpS-bGJ9q7nngVYwfbHNi-P0WqMsGVg3j0b-aB1q0BsHPXdvQnSCNWGaF8m39=s1600', false, 6, 'Appartement meublé MBA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a-/ALV-UjWvghZo6t1dc4Npkit5nrdOM6StSWia4AOGY8NYWtk2d9qR7CM=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a-/ALV-UjWvghZo6t1dc4Npkit5nrdOM6StSWia4AOGY8NYWtk2d9qR7CM=s1600-p-k-no-mo', false, 7, 'Appartement meublé MBA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TNIe5A8kdBE3dOVG7LnkEUl_-uw0gWQyiSv5tcnd8g9X_zjFBNArkh3YGPyNRdulOwaXlRXPHIQgz5N7E7aJBK3Wfr3nHSItK3iEUtWxUPg6lmmoD6qz4kHMh2K7dVmMThsZbv=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TNIe5A8kdBE3dOVG7LnkEUl_-uw0gWQyiSv5tcnd8g9X_zjFBNArkh3YGPyNRdulOwaXlRXPHIQgz5N7E7aJBK3Wfr3nHSItK3iEUtWxUPg6lmmoD6qz4kHMh2K7dVmMThsZbv=s1600', false, 8, 'Appartement meublé MBA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RXerk4NYPBh72CcW9Brh-wH4t3Bkn7wkGI236JM-UJXUyc_7koQygQgubJw9ctluEmg8LzT9u_bTDEcdJVQjbL0pLGBgJHlAbcm6nZ7oQqGZmuNnacF6T4i-rVBcw703A7YzvSVg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RXerk4NYPBh72CcW9Brh-wH4t3Bkn7wkGI236JM-UJXUyc_7koQygQgubJw9ctluEmg8LzT9u_bTDEcdJVQjbL0pLGBgJHlAbcm6nZ7oQqGZmuNnacF6T4i-rVBcw703A7YzvSVg=s1600', false, 9, 'Appartement meublé MBA')
  on conflict do nothing;

  -- [129] Le Leader des Meublés - Ndogbong (Ndogbong)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'le-leader-des-meubles-ndogbong-ndogbong',
    'apartment',
    'published',
    'Le Leader des Meublés - Ndogbong',
    'Le Leader des Meublés - Ndogbong
Catégorie : Appartement de vacances.
Adresse : Face au commissariat du 10ème (Entrée ENSET, Ndogbong, Douala.
Contact / WhatsApp : +237691751835.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'ndogbong'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Face au commissariat du 10ème (Entrée ENSET, Ndogbong, Douala',
    4.0582585,
    9.744962,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfOn0gv-p6FJYVMzt_4ABAMkIMU0LZAk8xq2hLYMDPgRwB6FRVl7oZIFDV5yB5MdCPlXZg2VH7OepxSUgQvA7Q1GSe-2jchFvMIHZuWMzwIovKw__2c7Lzg9JIyhqtlPg-NTHiQBMWL_-Eo=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfOn0gv-p6FJYVMzt_4ABAMkIMU0LZAk8xq2hLYMDPgRwB6FRVl7oZIFDV5yB5MdCPlXZg2VH7OepxSUgQvA7Q1GSe-2jchFvMIHZuWMzwIovKw__2c7Lzg9JIyhqtlPg-NTHiQBMWL_-Eo=s1600', true, 0, 'Le Leader des Meublés - Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfOn0gv-p6FJYVMzt_4ABAMkIMU0LZAk8xq2hLYMDPgRwB6FRVl7oZIFDV5yB5MdCPlXZg2VH7OepxSUgQvA7Q1GSe-2jchFvMIHZuWMzwIovKw__2c7Lzg9JIyhqtlPg-NTHiQBMWL_-Eo=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfOn0gv-p6FJYVMzt_4ABAMkIMU0LZAk8xq2hLYMDPgRwB6FRVl7oZIFDV5yB5MdCPlXZg2VH7OepxSUgQvA7Q1GSe-2jchFvMIHZuWMzwIovKw__2c7Lzg9JIyhqtlPg-NTHiQBMWL_-Eo=s1600-p-k-no', false, 1, 'Le Leader des Meublés - Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RxmTacTLDaK-bDh-kaGJFJhM7Dnr-2ZrQjblbj6PtCbZzquJoFr-7JZBzMm7kLYV4aGN4swHca1RW9fwsTBkYd4N5KyEZZQN9smRD2q-7hidAn_kGMDrjQ7dHL4czxz_26VoE2QdGdllhX=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RxmTacTLDaK-bDh-kaGJFJhM7Dnr-2ZrQjblbj6PtCbZzquJoFr-7JZBzMm7kLYV4aGN4swHca1RW9fwsTBkYd4N5KyEZZQN9smRD2q-7hidAn_kGMDrjQ7dHL4czxz_26VoE2QdGdllhX=s1600', false, 2, 'Le Leader des Meublés - Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T8125Hf5OK0qUiVL8LCfRTm7Xh_w5VlhPdZ6PQP8LkwhPVImrINj-qXc0bm0eTdmU6ixWYUvC48qBotAqUN2KZ_MPjyfaFLWkpvNQpDxZxcwg6ONpNdR9Ze4k9oBCUJcFlwEcofAjUq-jv=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T8125Hf5OK0qUiVL8LCfRTm7Xh_w5VlhPdZ6PQP8LkwhPVImrINj-qXc0bm0eTdmU6ixWYUvC48qBotAqUN2KZ_MPjyfaFLWkpvNQpDxZxcwg6ONpNdR9Ze4k9oBCUJcFlwEcofAjUq-jv=s1600', false, 3, 'Le Leader des Meublés - Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RV9BgNfPbDpqm9SR3MPmk5hUVqlMm3w3ghUKJKatb0GAhmZ4qfj_Ca6Bym6k9XHNGg7y_kaxwwqHxg4PHVymqSlAtNBcsBApZQ5vyT0OqL45Uw1saBUepAz4ozspXNqLu0A4fg1ycajS0=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RV9BgNfPbDpqm9SR3MPmk5hUVqlMm3w3ghUKJKatb0GAhmZ4qfj_Ca6Bym6k9XHNGg7y_kaxwwqHxg4PHVymqSlAtNBcsBApZQ5vyT0OqL45Uw1saBUepAz4ozspXNqLu0A4fg1ycajS0=s1600', false, 4, 'Le Leader des Meublés - Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q6JWBDCbWksAglBZk7QKBD0vnrfsHdYu52fv6tagzGFFdh3JB-Gs1j2viP3dhLNRteO0WmQMuWz9lLuTO4H9sPrnfR9fRC3gChLZ9fWrtETwLRRGyfbETRVQoGC7R4oIf-oAlxxFcyiTDZ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q6JWBDCbWksAglBZk7QKBD0vnrfsHdYu52fv6tagzGFFdh3JB-Gs1j2viP3dhLNRteO0WmQMuWz9lLuTO4H9sPrnfR9fRC3gChLZ9fWrtETwLRRGyfbETRVQoGC7R4oIf-oAlxxFcyiTDZ=s1600', false, 5, 'Le Leader des Meublés - Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R4yGdeLSg3OS2RvR3F3wjWjpAx_7oj45oz-AZ4PrXLwFIiFRNFfl08JeYkBMChIFs38QpNXXK0YhX5RUSTKzHAhRp5kCMFSxjiJzRNqeZio34cx0ykko6xqVNWKFIeHFRqndtiR-Q7y_t4=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R4yGdeLSg3OS2RvR3F3wjWjpAx_7oj45oz-AZ4PrXLwFIiFRNFfl08JeYkBMChIFs38QpNXXK0YhX5RUSTKzHAhRp5kCMFSxjiJzRNqeZio34cx0ykko6xqVNWKFIeHFRqndtiR-Q7y_t4=s1600', false, 6, 'Le Leader des Meublés - Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QQEF8Hi0w6jRY5cSkSSV8pEUyzH-VGZ7O62nXb2uWziIAdNU-6dRQRaNoeUReRlOltOLqAYVMNDy8ZQHRNlTLy_6s-QfjP6b_Diy9YYOXGSSlJMRG40389c03BiGdNYsH0gafsNyBLq9i7=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QQEF8Hi0w6jRY5cSkSSV8pEUyzH-VGZ7O62nXb2uWziIAdNU-6dRQRaNoeUReRlOltOLqAYVMNDy8ZQHRNlTLy_6s-QfjP6b_Diy9YYOXGSSlJMRG40389c03BiGdNYsH0gafsNyBLq9i7=s1600', false, 7, 'Le Leader des Meublés - Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RW3xeIPCvc0n9ZUlCBHn3cz4zxjM4-GSTOHB2WFumynMSjmYD3A122wQhbEJXwwYviASjEzSRCQbOg8CaAWiRLrt1vOXzftF6XBsJsFc2p6twuJEMv5Ic-nkgVqBUuavSFjrz2md81OSTF=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RW3xeIPCvc0n9ZUlCBHn3cz4zxjM4-GSTOHB2WFumynMSjmYD3A122wQhbEJXwwYviASjEzSRCQbOg8CaAWiRLrt1vOXzftF6XBsJsFc2p6twuJEMv5Ic-nkgVqBUuavSFjrz2md81OSTF=s1600', false, 8, 'Le Leader des Meublés - Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TV103uDDt7zr-j1EjJauOIELTmG-fPEHCoymtogjxbwOhzu5e84zgy4GATXFhaXkuRxURuDY1TdtkelOmp7_E1G6ne63mlNuLyYaIcSsGPoKO42_AquENJNjS_byEfYcHsOf3DfhHxvuRA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TV103uDDt7zr-j1EjJauOIELTmG-fPEHCoymtogjxbwOhzu5e84zgy4GATXFhaXkuRxURuDY1TdtkelOmp7_E1G6ne63mlNuLyYaIcSsGPoKO42_AquENJNjS_byEfYcHsOf3DfhHxvuRA=s1600', false, 9, 'Le Leader des Meublés - Ndogbong')
  on conflict do nothing;

  -- [130] Ndogbong (Ndogbong)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'ndogbong-ndogbong',
    'apartment',
    'published',
    'Ndogbong',
    'Ndogbong
Catégorie : Résidence.
Adresse : 3Q43+JGQ, Douala.
Contact / WhatsApp : +237670140292.
Note Google Maps : 4.2/5 (14 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Marthe Ntemfack, note 5/5)
- "Note sans commentaire écrit." (Hildric Famen, note 5/5)
- "Note sans commentaire écrit." (Everant Fondja, note 4/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'ndogbong'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '3Q43+JGQ, Douala',
    4.0668778,
    9.7495911,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdpPYEV2AsQuVEQRyos_gGoBaz5_i-RBRCYekJMbP8JGRTaxrF_fjTsjvzq31Ec0itnRsVaM9Yfc6xD81i97Zf8WuI7_ne5TEKTr9I6v0ZG4agy802yrSSqn__VcZPEG4TPsCNavTjuht8=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdpPYEV2AsQuVEQRyos_gGoBaz5_i-RBRCYekJMbP8JGRTaxrF_fjTsjvzq31Ec0itnRsVaM9Yfc6xD81i97Zf8WuI7_ne5TEKTr9I6v0ZG4agy802yrSSqn__VcZPEG4TPsCNavTjuht8=s1600', true, 0, 'Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdpPYEV2AsQuVEQRyos_gGoBaz5_i-RBRCYekJMbP8JGRTaxrF_fjTsjvzq31Ec0itnRsVaM9Yfc6xD81i97Zf8WuI7_ne5TEKTr9I6v0ZG4agy802yrSSqn__VcZPEG4TPsCNavTjuht8=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdpPYEV2AsQuVEQRyos_gGoBaz5_i-RBRCYekJMbP8JGRTaxrF_fjTsjvzq31Ec0itnRsVaM9Yfc6xD81i97Zf8WuI7_ne5TEKTr9I6v0ZG4agy802yrSSqn__VcZPEG4TPsCNavTjuht8=s1600-p-k-no', false, 1, 'Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SdHoNvOilRptmZKRFRh1LOxUhkg8Txwf6ggsxvLrqkpx0XZqGC6TrVoiMDQRv2U94jowjwbmtCBY9aYW52FLKIjuZGY5D83VwuorZZ9CJobbfEQ31manYyK-lbL9dsH374ieqoKYZ3czA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SdHoNvOilRptmZKRFRh1LOxUhkg8Txwf6ggsxvLrqkpx0XZqGC6TrVoiMDQRv2U94jowjwbmtCBY9aYW52FLKIjuZGY5D83VwuorZZ9CJobbfEQ31manYyK-lbL9dsH374ieqoKYZ3czA=s1600', false, 2, 'Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TUAhSzCTAXpEVHBTgCI6q6vlr5atHLO5joyg447BrXoueD204iy6RBeBAle-5dQ36PoNGHPuuyN4egN1pgX_VT83Awfd08LqygEpALOnT-x0_wSyLw3fvrJHG8ser0BdEw7EgJ77zZbeMd=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TUAhSzCTAXpEVHBTgCI6q6vlr5atHLO5joyg447BrXoueD204iy6RBeBAle-5dQ36PoNGHPuuyN4egN1pgX_VT83Awfd08LqygEpALOnT-x0_wSyLw3fvrJHG8ser0BdEw7EgJ77zZbeMd=s1600', false, 3, 'Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SWKuEzVwloVDOgXLqywMHipMY0boz2S33tyqU-m-18FrSLALPiu4B4TChmBNMyg8OTdEiLwR029khg58Xbog-0Nb_0yId3ksE8fFzf5r6fIdx8jWRN-teiBPygpqzNIL78UtYGVrjaCCMU=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SWKuEzVwloVDOgXLqywMHipMY0boz2S33tyqU-m-18FrSLALPiu4B4TChmBNMyg8OTdEiLwR029khg58Xbog-0Nb_0yId3ksE8fFzf5r6fIdx8jWRN-teiBPygpqzNIL78UtYGVrjaCCMU=s1600', false, 4, 'Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TF5JSkZog_zWJNlKKV1O0TkaR-h6CmEN7sO0phZRxmKhxXbQKt81-jtkt7fxx46A62CniqCLdVIrssu3i7vdqrSt9v5yOms03hroCscPydb_BZ02cXDzQUr5vUKO4gg9UEO_AYOTt3bo0I=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TF5JSkZog_zWJNlKKV1O0TkaR-h6CmEN7sO0phZRxmKhxXbQKt81-jtkt7fxx46A62CniqCLdVIrssu3i7vdqrSt9v5yOms03hroCscPydb_BZ02cXDzQUr5vUKO4gg9UEO_AYOTt3bo0I=s1600', false, 5, 'Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RwRg-NZ63Y0nlS7Qa-iDyQtLH7Aw0FIGAZU9URlR3wCcXfMzsTfUjinV9kyVTSZ_yUw0QVj_-EWZFT2U-W_yFG5h4Sqhxz4UvifgmE7NezYExv4ZvamGWTRpIKwos_19Xsmt-7MAu_OklI=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RwRg-NZ63Y0nlS7Qa-iDyQtLH7Aw0FIGAZU9URlR3wCcXfMzsTfUjinV9kyVTSZ_yUw0QVj_-EWZFT2U-W_yFG5h4Sqhxz4UvifgmE7NezYExv4ZvamGWTRpIKwos_19Xsmt-7MAu_OklI=s1600', false, 6, 'Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a-/ALV-UjV1vI9tHQXc0ermoQOyUx0nZ-Sv8rZxQ1152dFURunCWVU7yBw=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a-/ALV-UjV1vI9tHQXc0ermoQOyUx0nZ-Sv8rZxQ1152dFURunCWVU7yBw=s1600-p-k-no-mo', false, 7, 'Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rkw9Gw-4GkHte2f1ePh5caxPHe73WyNvNmpazn-o9Pk57o-957v1qoaq27IQ4ks6uLDE6kvDAr6Nek7LA69H1-aM1a8_5QCDHtN_4JM0_kT81osYf1Mnl30fw8x5JGZXsyAmuJDF82lLHX=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rkw9Gw-4GkHte2f1ePh5caxPHe73WyNvNmpazn-o9Pk57o-957v1qoaq27IQ4ks6uLDE6kvDAr6Nek7LA69H1-aM1a8_5QCDHtN_4JM0_kT81osYf1Mnl30fw8x5JGZXsyAmuJDF82lLHX=s1600', false, 8, 'Ndogbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q04xkLp8jFtdaUYSrUJlEtG1NNrMbbR9STY6qGuiJx0jRi5phHR_3PwQfy38dhRVFIc_P5RxFgc7QspqtMlBFGU7wfPRCf5n1tb3jnMuzZHuPWsvqNmxayYCjpElTp1SDILgcXTyp4PO56=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q04xkLp8jFtdaUYSrUJlEtG1NNrMbbR9STY6qGuiJx0jRi5phHR_3PwQfy38dhRVFIc_P5RxFgc7QspqtMlBFGU7wfPRCf5n1tb3jnMuzZHuPWsvqNmxayYCjpElTp1SDILgcXTyp4PO56=s1600', false, 9, 'Ndogbong')
  on conflict do nothing;

  -- [131] Noble Nest Guest House (Ndogbong)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'noble-nest-guest-house-ndogbong',
    'apartment',
    'published',
    'Noble Nest Guest House',
    'Noble Nest Guest House
Catégorie : Appartement de vacances.
Adresse : Ndogbong Carrefour cidadelle, Douala.
Contact / WhatsApp : +237699058265.
Note Google Maps : 5/5 (6 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Ornella Djokam, note 5/5)
- "Note sans commentaire écrit." (Lora Languim, note 5/5)
- "Note sans commentaire écrit." (Doval Mbosso, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'ndogbong'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Ndogbong Carrefour cidadelle, Douala',
    4.0590374,
    9.751758,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLflmfvSEuFJ80NkbYdl17xoeox0_fOpaMvnIdGfK6ZAQVREWf8E-Qf8KrO5Nzr-ycHk56oS5RkoE8qO2mAS3oKcQzAtFNMcjVykI20kMxf68YLlFpDZY2Fp0xyzHhYGqsLGkcxvJgIKqQU=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLflmfvSEuFJ80NkbYdl17xoeox0_fOpaMvnIdGfK6ZAQVREWf8E-Qf8KrO5Nzr-ycHk56oS5RkoE8qO2mAS3oKcQzAtFNMcjVykI20kMxf68YLlFpDZY2Fp0xyzHhYGqsLGkcxvJgIKqQU=s1600', true, 0, 'Noble Nest Guest House')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLflmfvSEuFJ80NkbYdl17xoeox0_fOpaMvnIdGfK6ZAQVREWf8E-Qf8KrO5Nzr-ycHk56oS5RkoE8qO2mAS3oKcQzAtFNMcjVykI20kMxf68YLlFpDZY2Fp0xyzHhYGqsLGkcxvJgIKqQU=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLflmfvSEuFJ80NkbYdl17xoeox0_fOpaMvnIdGfK6ZAQVREWf8E-Qf8KrO5Nzr-ycHk56oS5RkoE8qO2mAS3oKcQzAtFNMcjVykI20kMxf68YLlFpDZY2Fp0xyzHhYGqsLGkcxvJgIKqQU=s1600-p-k-no', false, 1, 'Noble Nest Guest House')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TLkocR9R5tOKF6OHRmwrfQRaW9mdQlX7piZN0pCFdOkTGgNI1878MIgrSdPSYuFfzOoDnBF__sLvDH6Rjt0DjeIKWqB8pz1qcZE-D-wNTRM0bhXMV9DHfmzOYezQauyVx2X8mEqvkIEAc=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TLkocR9R5tOKF6OHRmwrfQRaW9mdQlX7piZN0pCFdOkTGgNI1878MIgrSdPSYuFfzOoDnBF__sLvDH6Rjt0DjeIKWqB8pz1qcZE-D-wNTRM0bhXMV9DHfmzOYezQauyVx2X8mEqvkIEAc=s1600', false, 2, 'Noble Nest Guest House')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TTw4y7bqNXhXQxXyueAN3rYoipDHEZgB9XI5yFGhosp5TEnZWqqluLvnZwmEQA0aHLNBeRNv5brHQjBIpojHcu3XaQFx6cOoFl4kKJaRL2ljfTi-mRR1NhyEa3rIJ1SJBWbeo9yX9QfUUJ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TTw4y7bqNXhXQxXyueAN3rYoipDHEZgB9XI5yFGhosp5TEnZWqqluLvnZwmEQA0aHLNBeRNv5brHQjBIpojHcu3XaQFx6cOoFl4kKJaRL2ljfTi-mRR1NhyEa3rIJ1SJBWbeo9yX9QfUUJ=s1600', false, 3, 'Noble Nest Guest House')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QGNK4adh8EpPYJdFE6dW88YNBd2HtbXPuJNzB-U1oFSTHFkogh9Aa9NgQg_IXt7c7rXViJDn9EELS7YDukJxpeX4WBegJzlxkECl5AvYhnu3aG1G5y5A89BuEt0BRGsOpX5YKbgZjodkrf=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QGNK4adh8EpPYJdFE6dW88YNBd2HtbXPuJNzB-U1oFSTHFkogh9Aa9NgQg_IXt7c7rXViJDn9EELS7YDukJxpeX4WBegJzlxkECl5AvYhnu3aG1G5y5A89BuEt0BRGsOpX5YKbgZjodkrf=s1600', false, 4, 'Noble Nest Guest House')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SX7j1Li4b7ItQjJSjcbJwinhUYNjwM7iSK9CzW-j8ROqjgDEqLUCbsvB-vp8H7S0YFrkXjJm1WBRPK8-XCMOH4Yc_---DsMvs8jT1ZfjZn6sMiOEMdJgMHTQfFyTeJIA3SASdxonM4oArW=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SX7j1Li4b7ItQjJSjcbJwinhUYNjwM7iSK9CzW-j8ROqjgDEqLUCbsvB-vp8H7S0YFrkXjJm1WBRPK8-XCMOH4Yc_---DsMvs8jT1ZfjZn6sMiOEMdJgMHTQfFyTeJIA3SASdxonM4oArW=s1600', false, 5, 'Noble Nest Guest House')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a-/ALV-UjW9E8LKQ7KD7FO88O4PvqlUM1xukVXF-pA1ywrEeRh9M_Cni74=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a-/ALV-UjW9E8LKQ7KD7FO88O4PvqlUM1xukVXF-pA1ywrEeRh9M_Cni74=s1600-p-k-no-mo', false, 6, 'Noble Nest Guest House')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S6uGcEoglYxI0pQSscqnZn0o-A_3VR5vCX7AVfdpz1aEGssHyivPm8Gp1g331kIq2ZPlVQ4AQ3K-lYTpYWBRVy02SOTKDBrzLn5DOqggJKOHS_Me1F89rgxP_fz2j_pMW9aVcXqJkWQpo9=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S6uGcEoglYxI0pQSscqnZn0o-A_3VR5vCX7AVfdpz1aEGssHyivPm8Gp1g331kIq2ZPlVQ4AQ3K-lYTpYWBRVy02SOTKDBrzLn5DOqggJKOHS_Me1F89rgxP_fz2j_pMW9aVcXqJkWQpo9=s1600', false, 7, 'Noble Nest Guest House')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sst6cU_VNGw--XIX02mWrwbj1p7gxzN02t-d_Qowg-8WWflv3-BXfDXlfFELMeBqFX2GYc1Og4BzQW5JUn9NTMgq7u5iOZFRYFy-Lwk8GhwkLPEnxPh94vfGBFwcSFDW7HzJcZY-BNaAnr=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sst6cU_VNGw--XIX02mWrwbj1p7gxzN02t-d_Qowg-8WWflv3-BXfDXlfFELMeBqFX2GYc1Og4BzQW5JUn9NTMgq7u5iOZFRYFy-Lwk8GhwkLPEnxPh94vfGBFwcSFDW7HzJcZY-BNaAnr=s1600', false, 8, 'Noble Nest Guest House')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RvQz6-tLbqd5-QXxbw2E-PM5PgTnfXXulT8d6ifMsHEo31tO75iuQ9b8KA_r2_QFUw4Xk79xvQosQWJgO5l0Zb7qdQ5tjIUpGEUc7c7L0T3R_zNmVD8l8fHdme0wHynsXleT4Xi0U3K3f2=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RvQz6-tLbqd5-QXxbw2E-PM5PgTnfXXulT8d6ifMsHEo31tO75iuQ9b8KA_r2_QFUw4Xk79xvQosQWJgO5l0Zb7qdQ5tjIUpGEUc7c7L0T3R_zNmVD8l8fHdme0wHynsXleT4Xi0U3K3f2=s1600', false, 9, 'Noble Nest Guest House')
  on conflict do nothing;

  -- [132] Studio meublé ndokoti (Ndogbong)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'studio-meuble-ndokoti-ndogbong',
    'studio',
    'published',
    'Studio meublé ndokoti',
    'Studio meublé ndokoti
Catégorie : Location d''appartement de vacances.
Adresse : Belavie Ndokoti, Douala.
Contact / WhatsApp : +237651406283.
Note Google Maps : 5/5 (1 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Marc Eko, note 5/5)
- "Note sans commentaire écrit." (Marc Eko, note 5/5)
- "Note sans commentaire écrit." (Marc Eko, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'ndogbong'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Belavie Ndokoti, Douala',
    4.0437088,
    9.7517953,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcvfOQND_0F692QNVP0yJE2uW68lRgGpIW-oIOAQkOWd6TaNgM8aZDxLXbgcUq8jl4FNmoE_QlRmB5ruS7mgRnb3zuYWLPIMLCvzlJkojrBy3Q_UB7ZejX8iKc4RrmqEEQnqR9OWPFpQcA=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcvfOQND_0F692QNVP0yJE2uW68lRgGpIW-oIOAQkOWd6TaNgM8aZDxLXbgcUq8jl4FNmoE_QlRmB5ruS7mgRnb3zuYWLPIMLCvzlJkojrBy3Q_UB7ZejX8iKc4RrmqEEQnqR9OWPFpQcA=s1600', true, 0, 'Studio meublé ndokoti')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SGU0Sjn_Y_RTpFCL9RMvVhOM8au41YlnFw33ZkOPEveFDy8tyy0RJ45j9_fjpjqW5g_1-2AnAhL56rmt54v4XvwsD_pJbD2f8ibL8oryc1lSgHsiikj_7d9sE647eLPo-lbLpdC1RHZzE=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SGU0Sjn_Y_RTpFCL9RMvVhOM8au41YlnFw33ZkOPEveFDy8tyy0RJ45j9_fjpjqW5g_1-2AnAhL56rmt54v4XvwsD_pJbD2f8ibL8oryc1lSgHsiikj_7d9sE647eLPo-lbLpdC1RHZzE=s1600', false, 1, 'Studio meublé ndokoti')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TKC2lpErdqzJ1pZCc1-jOqvbxOwbOLlqB8YSuVBDO2ITiUQpNw69ICC-4o3eSzeiHPawYAHUykPJcMAwu_0BXRuU0LBHQlHDNxm-plC1oZ4K5q3WIrNM8hgVElRQI53LqcgyFAqXd9uaA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TKC2lpErdqzJ1pZCc1-jOqvbxOwbOLlqB8YSuVBDO2ITiUQpNw69ICC-4o3eSzeiHPawYAHUykPJcMAwu_0BXRuU0LBHQlHDNxm-plC1oZ4K5q3WIrNM8hgVElRQI53LqcgyFAqXd9uaA=s1600', false, 2, 'Studio meublé ndokoti')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S4Ppl25XLg71V8G5CnmvjeWYZeCmEeIRhq_IyisNiTykSI9hewEjYSULwZKcgJ02UjxFAO3VW4-v8jliAqwSd0kYHNM__WwdSZ99V1G2XS4Z7uZUx_VSz7VxeEAVoPF9wCufxP0iaNJybi=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S4Ppl25XLg71V8G5CnmvjeWYZeCmEeIRhq_IyisNiTykSI9hewEjYSULwZKcgJ02UjxFAO3VW4-v8jliAqwSd0kYHNM__WwdSZ99V1G2XS4Z7uZUx_VSz7VxeEAVoPF9wCufxP0iaNJybi=s1600', false, 3, 'Studio meublé ndokoti')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RLDXXXsVTjiCisO_jUfmCeBAjEkm9NMmIt6GU-ZuRQIBYVn6iJq60BaiCu38Bl2h7K39FYdMAjBfpO-41aJPcDPVX4pE6Lh0v74nAsUoyrHvVz50pBagSxFSDGTxHJCY0CpoAyv79ywaiq=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RLDXXXsVTjiCisO_jUfmCeBAjEkm9NMmIt6GU-ZuRQIBYVn6iJq60BaiCu38Bl2h7K39FYdMAjBfpO-41aJPcDPVX4pE6Lh0v74nAsUoyrHvVz50pBagSxFSDGTxHJCY0CpoAyv79ywaiq=s1600', false, 4, 'Studio meublé ndokoti')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcvfOQND_0F692QNVP0yJE2uW68lRgGpIW-oIOAQkOWd6TaNgM8aZDxLXbgcUq8jl4FNmoE_QlRmB5ruS7mgRnb3zuYWLPIMLCvzlJkojrBy3Q_UB7ZejX8iKc4RrmqEEQnqR9OWPFpQcA=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcvfOQND_0F692QNVP0yJE2uW68lRgGpIW-oIOAQkOWd6TaNgM8aZDxLXbgcUq8jl4FNmoE_QlRmB5ruS7mgRnb3zuYWLPIMLCvzlJkojrBy3Q_UB7ZejX8iKc4RrmqEEQnqR9OWPFpQcA=s1600-p-k-no', false, 5, 'Studio meublé ndokoti')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a/ACg8ocIcRDj-swIXcFMk6lYHB4V_ycBbZ9Tx027QOvIEIfs_vm_8uA=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a/ACg8ocIcRDj-swIXcFMk6lYHB4V_ycBbZ9Tx027QOvIEIfs_vm_8uA=s1600-p-k-no-mo', false, 6, 'Studio meublé ndokoti')
  on conflict do nothing;

  -- [133] Résidence Meublée N (Kotto)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-meublee-n-kotto',
    'apartment',
    'published',
    'Résidence Meublée N',
    'Résidence Meublée N
Catégorie : Complexe d''appartements meublés.
Adresse : fin goudron Mbangue, Près du collège NAL, Kotto, Douala.
Contact / WhatsApp : +237680766547.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'kotto'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'fin goudron Mbangue, Près du collège NAL, Kotto, Douala',
    4.101882,
    9.7504053,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLf2boYNkvWVQOU6pjLYxxu76ONjB1rDQ33AuNI1UkCbx2BZsRr08yML9xU9mbTVM8sYaTQvjlWz04UZmwqBjUmcHFUmAVxXMAXhnqEiK5dhW_XYpDlQc-ydYBxDgMElWzi4xJnxygVxqPU=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLf2boYNkvWVQOU6pjLYxxu76ONjB1rDQ33AuNI1UkCbx2BZsRr08yML9xU9mbTVM8sYaTQvjlWz04UZmwqBjUmcHFUmAVxXMAXhnqEiK5dhW_XYpDlQc-ydYBxDgMElWzi4xJnxygVxqPU=s1600', true, 0, 'Résidence Meublée N')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLf2boYNkvWVQOU6pjLYxxu76ONjB1rDQ33AuNI1UkCbx2BZsRr08yML9xU9mbTVM8sYaTQvjlWz04UZmwqBjUmcHFUmAVxXMAXhnqEiK5dhW_XYpDlQc-ydYBxDgMElWzi4xJnxygVxqPU=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLf2boYNkvWVQOU6pjLYxxu76ONjB1rDQ33AuNI1UkCbx2BZsRr08yML9xU9mbTVM8sYaTQvjlWz04UZmwqBjUmcHFUmAVxXMAXhnqEiK5dhW_XYpDlQc-ydYBxDgMElWzi4xJnxygVxqPU=s1600-p-k-no', false, 1, 'Résidence Meublée N')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SVcAe0ke1RQlHPg9gHXSZlot75RlLHzdLmMReQudvJ1y4y_oX5G6SshOk0SdyXg7e5zHHN0HHm6eBnvxy9vDUXWeW1_-uxbC9KK4IuM35AmM6OQ_PwqYthYD3yPg6Yuci3-O3LpIvK03LX=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SVcAe0ke1RQlHPg9gHXSZlot75RlLHzdLmMReQudvJ1y4y_oX5G6SshOk0SdyXg7e5zHHN0HHm6eBnvxy9vDUXWeW1_-uxbC9KK4IuM35AmM6OQ_PwqYthYD3yPg6Yuci3-O3LpIvK03LX=s1600', false, 2, 'Résidence Meublée N')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q7lA01EecdA9cZKSsGzDz4Ee33oqHu9va9DC2v4ZFc-3DTPKicOIR9FfrbWpcJGI6X4RZIuY3-Z9v4orFy3Py2RrAFCg8idbeCFsHW4hHNvstpq6L34u38hObwaykt_ce-KF5S1QR6VMvt=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q7lA01EecdA9cZKSsGzDz4Ee33oqHu9va9DC2v4ZFc-3DTPKicOIR9FfrbWpcJGI6X4RZIuY3-Z9v4orFy3Py2RrAFCg8idbeCFsHW4hHNvstpq6L34u38hObwaykt_ce-KF5S1QR6VMvt=s1600', false, 3, 'Résidence Meublée N')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sr1CPC73HZS225HS1tt6Q7EASHbQ_Qby7QRFL6jTo-0IkZyRpLfaYKaQa4rFB1h-_LBgdLK7mtli_ar9M8RXlLNKkQY9Jd5tnwkewt7ILH1HKY141OYDY20-MM_ieOjdXQQuM5cNIhTngS=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sr1CPC73HZS225HS1tt6Q7EASHbQ_Qby7QRFL6jTo-0IkZyRpLfaYKaQa4rFB1h-_LBgdLK7mtli_ar9M8RXlLNKkQY9Jd5tnwkewt7ILH1HKY141OYDY20-MM_ieOjdXQQuM5cNIhTngS=s1600', false, 4, 'Résidence Meublée N')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, '//lh3.googleusercontent.com/a/ACg8ocIj3syPvijyL9ZWr5Cw8Kepv6v6I95Un89lBbrbfpdPKKAdNg=s1600-p-k-no-mo', '//lh3.googleusercontent.com/a/ACg8ocIj3syPvijyL9ZWr5Cw8Kepv6v6I95Un89lBbrbfpdPKKAdNg=s1600-p-k-no-mo', false, 5, 'Résidence Meublée N')
  on conflict do nothing;

  -- [134] Résidence KN Yassa (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-kn-yassa-yassa',
    'apartment',
    'published',
    'Résidence KN Yassa',
    'Résidence KN Yassa
Catégorie : Complexe d''appartements meublés.
Adresse : entre Total Nkolbong et Neptune, Immeuble BGFI Bank, Yassa, Douala.
Contact / WhatsApp : +237676833513.
Note Google Maps : 4.8/5 (10 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Jd KN, note 5/5)
- "Note sans commentaire écrit." (Mbou Wandji, note 5/5)
- "Note sans commentaire écrit." (Annie Fokou, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'entre Total Nkolbong et Neptune, Immeuble BGFI Bank, Yassa, Douala',
    4.0104448,
    9.7994875,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdSpaoSlgDp11AmVKvDY9q_zc-h4EnLEDvYEEDeK0xHRD-jMEcq0vQoSawHXe4PTvLjoVIxGc2Wp5PcAOgV9Ug4YBJqjubtPQU1JyBRkvNIzBqiRAU7tU1dqOhkHyBxmb5-yrVSSRblWJvH=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdSpaoSlgDp11AmVKvDY9q_zc-h4EnLEDvYEEDeK0xHRD-jMEcq0vQoSawHXe4PTvLjoVIxGc2Wp5PcAOgV9Ug4YBJqjubtPQU1JyBRkvNIzBqiRAU7tU1dqOhkHyBxmb5-yrVSSRblWJvH=s1600', true, 0, 'Résidence KN Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdSpaoSlgDp11AmVKvDY9q_zc-h4EnLEDvYEEDeK0xHRD-jMEcq0vQoSawHXe4PTvLjoVIxGc2Wp5PcAOgV9Ug4YBJqjubtPQU1JyBRkvNIzBqiRAU7tU1dqOhkHyBxmb5-yrVSSRblWJvH=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdSpaoSlgDp11AmVKvDY9q_zc-h4EnLEDvYEEDeK0xHRD-jMEcq0vQoSawHXe4PTvLjoVIxGc2Wp5PcAOgV9Ug4YBJqjubtPQU1JyBRkvNIzBqiRAU7tU1dqOhkHyBxmb5-yrVSSRblWJvH=s1600-p-k-no', false, 1, 'Résidence KN Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QUqbyiXub1_BqVXGVrCEoYeidD5XDI1TjpmdGM9BxLWyalHFpI3wTt5T0vdEaQrAn_Zp76sdej7PoAGe_nfwX6PI7hdphXQttaJxdw---aERaJW3yjriM41jDRvn3A0TDKY5JNLIYQNXpC=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QUqbyiXub1_BqVXGVrCEoYeidD5XDI1TjpmdGM9BxLWyalHFpI3wTt5T0vdEaQrAn_Zp76sdej7PoAGe_nfwX6PI7hdphXQttaJxdw---aERaJW3yjriM41jDRvn3A0TDKY5JNLIYQNXpC=s1600', false, 2, 'Résidence KN Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RTriUdijIpaBVmZufewhxsl0_xFrxdPf0L2v9SYa_8ktzXEEV7QuY5TPWo48IoLp-nN1lIP3dOdC2VebRsafJ80bQ96Zmd3esI5XmKSR-mpwXnu8VJlCDpOtRybI5n5dAICHaNeqsvSqhU=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RTriUdijIpaBVmZufewhxsl0_xFrxdPf0L2v9SYa_8ktzXEEV7QuY5TPWo48IoLp-nN1lIP3dOdC2VebRsafJ80bQ96Zmd3esI5XmKSR-mpwXnu8VJlCDpOtRybI5n5dAICHaNeqsvSqhU=s1600', false, 3, 'Résidence KN Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RW1qw_mun99mNrhpSKFQb0jyw34_37IYxPUQCmz8eFov8EtbcuUhmybxQHMLNBipm4FXVAPjtOxDh8zi-AvBC9nUbeeIhSr8afOuF7YCXQB7cX1gOdk9lKnqKpMOrM0uWzQFwNmyq599Yj=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RW1qw_mun99mNrhpSKFQb0jyw34_37IYxPUQCmz8eFov8EtbcuUhmybxQHMLNBipm4FXVAPjtOxDh8zi-AvBC9nUbeeIhSr8afOuF7YCXQB7cX1gOdk9lKnqKpMOrM0uWzQFwNmyq599Yj=s1600', false, 4, 'Résidence KN Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sj-0XgHCbN3U3vbThQS6y9DxcPmYdML_zXEj1_tW2VTVw5Z74aTKb9avd016qiAj0J_X_zpWcJkPTnQ9WaNXL8JUobZX7zdu1wdxJHU7fTBefFjwqXsL9tAMrhgKCsNrVkbfGR6m-sqx0D=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sj-0XgHCbN3U3vbThQS6y9DxcPmYdML_zXEj1_tW2VTVw5Z74aTKb9avd016qiAj0J_X_zpWcJkPTnQ9WaNXL8JUobZX7zdu1wdxJHU7fTBefFjwqXsL9tAMrhgKCsNrVkbfGR6m-sqx0D=s1600', false, 5, 'Résidence KN Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R6vlkm6LYM2048NoKXSEioxCQrY-UiHPoBM0Fr6sqYL0FWWEmdrKI5ev8skT63eMXnulsD1ew0J_mqbUzKSUzHaL_qv7mR7TeqU_E90igIJfeFxNNaC6QVc8_urjQguoWj4veG66D_vrqk=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R6vlkm6LYM2048NoKXSEioxCQrY-UiHPoBM0Fr6sqYL0FWWEmdrKI5ev8skT63eMXnulsD1ew0J_mqbUzKSUzHaL_qv7mR7TeqU_E90igIJfeFxNNaC6QVc8_urjQguoWj4veG66D_vrqk=s1600', false, 6, 'Résidence KN Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tr7497MieGVPdgGsvq54_5etUu9wo_eU3yFqcNh-qg9vkzVGwS_aSPkJW7R3K35jgD2keMngvccXigvAAjQYcmAswNpgMFH3wOEh_AKTLYk3E0sw2oavSs82UcKV5liwJBViNPOWL-wnX5=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tr7497MieGVPdgGsvq54_5etUu9wo_eU3yFqcNh-qg9vkzVGwS_aSPkJW7R3K35jgD2keMngvccXigvAAjQYcmAswNpgMFH3wOEh_AKTLYk3E0sw2oavSs82UcKV5liwJBViNPOWL-wnX5=s1600', false, 7, 'Résidence KN Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SBmT0i9Cx0GSTQwgQDipW6qtNwh5WNUGSlAgD_M-WwZNLErFqd_s_7WUWrKd22U4UCLh62Oou17ME77e3LGe7WI1kwkiQGyt7t37LJhBb_6axnSVKVfspF_CXexCm38CNMQXs_hgTIFTfp=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SBmT0i9Cx0GSTQwgQDipW6qtNwh5WNUGSlAgD_M-WwZNLErFqd_s_7WUWrKd22U4UCLh62Oou17ME77e3LGe7WI1kwkiQGyt7t37LJhBb_6axnSVKVfspF_CXexCm38CNMQXs_hgTIFTfp=s1600', false, 8, 'Résidence KN Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TMZnZIRYeEETQ_zNp5NDSp0Hf5RKuyek3b1W_b6BkYfKub7_jSkegM0sI70jlb4eBne7mWOfxs87ulq6NJPzgZZkn1BvNwmXIkdTxPq5_k-SWU5SCFCYVL8L113YP5eC2RpZkhSZ387gd4=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TMZnZIRYeEETQ_zNp5NDSp0Hf5RKuyek3b1W_b6BkYfKub7_jSkegM0sI70jlb4eBne7mWOfxs87ulq6NJPzgZZkn1BvNwmXIkdTxPq5_k-SWU5SCFCYVL8L113YP5eC2RpZkhSZ387gd4=s1600', false, 9, 'Résidence KN Yassa')
  on conflict do nothing;

  -- [135] Appartement Meublé à Douala Yassa - Complexe Le Sapphire (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-a-douala-yassa-complexe-le-sapphire-yassa',
    'apartment',
    'published',
    'Appartement Meublé à Douala Yassa - Complexe Le Sapphire',
    'Appartement Meublé à Douala Yassa - Complexe Le Sapphire',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Yassa',
    3.9707861,
    9.8132477,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1uvDk729dqugYot_1k3029oY-YZI7VPKHdVdUTlO0FKiMMjgKFo_auUSml7SMiRAPk6JddicUGFD0DOvf01uF6vsv0DkRnzKM1sz8ik8N5llgZ1XCm7paMntJQNxW1wRtgf91NUHH6_IRR0qlIGY7qNM-oUab1-ylw1VQFeTOVBu52TSKpiWa9oA=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1uvDk729dqugYot_1k3029oY-YZI7VPKHdVdUTlO0FKiMMjgKFo_auUSml7SMiRAPk6JddicUGFD0DOvf01uF6vsv0DkRnzKM1sz8ik8N5llgZ1XCm7paMntJQNxW1wRtgf91NUHH6_IRR0qlIGY7qNM-oUab1-ylw1VQFeTOVBu52TSKpiWa9oA=s1600', true, 0, 'Appartement Meublé à Douala Yassa - Complexe Le Sapphire')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1uvDk729dqugYot_1k3029oY-YZI7VPKHdVdUTlO0FKiMMjgKFo_auUSml7SMiRAPk6JddicUGFD0DOvf01uF6vsv0DkRnzKM1sz8ik8N5llgZ1XCm7paMntJQNxW1wRtgf91NUHH6_IRR0qlIGY7qNM-oUab1-ylw1VQFeTOVBu52TSKpiWa9oA=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW1uvDk729dqugYot_1k3029oY-YZI7VPKHdVdUTlO0FKiMMjgKFo_auUSml7SMiRAPk6JddicUGFD0DOvf01uF6vsv0DkRnzKM1sz8ik8N5llgZ1XCm7paMntJQNxW1wRtgf91NUHH6_IRR0qlIGY7qNM-oUab1-ylw1VQFeTOVBu52TSKpiWa9oA=s1600-p-k-no', false, 1, 'Appartement Meublé à Douala Yassa - Complexe Le Sapphire')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGvkpC0-BhQugPamtUj9vGicweABvqzlS5SCA2mX_bZggtz7_b5Krj58PsOH71h6G9KEjsBj5hLplrJHU8mQ4bZVHZfBho_C3TbVzOhKinEoNFs0V1_Yq6-ihX_4aJdWHsHpcTv-2CwXb6Wz_L1cW2NRmGAgEWKy2GKh16kGco9Ug1tKrp_Scbe-w=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGvkpC0-BhQugPamtUj9vGicweABvqzlS5SCA2mX_bZggtz7_b5Krj58PsOH71h6G9KEjsBj5hLplrJHU8mQ4bZVHZfBho_C3TbVzOhKinEoNFs0V1_Yq6-ihX_4aJdWHsHpcTv-2CwXb6Wz_L1cW2NRmGAgEWKy2GKh16kGco9Ug1tKrp_Scbe-w=s1600', false, 2, 'Appartement Meublé à Douala Yassa - Complexe Le Sapphire')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGvkpC0-BhQugPamtUj9vGicweABvqzlS5SCA2mX_bZggtz7_b5Krj58PsOH71h6G9KEjsBj5hLplrJHU8mQ4bZVHZfBho_C3TbVzOhKinEoNFs0V1_Yq6-ihX_4aJdWHsHpcTv-2CwXb6Wz_L1cW2NRmGAgEWKy2GKh16kGco9Ug1tKrp_Scbe-w=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGvkpC0-BhQugPamtUj9vGicweABvqzlS5SCA2mX_bZggtz7_b5Krj58PsOH71h6G9KEjsBj5hLplrJHU8mQ4bZVHZfBho_C3TbVzOhKinEoNFs0V1_Yq6-ihX_4aJdWHsHpcTv-2CwXb6Wz_L1cW2NRmGAgEWKy2GKh16kGco9Ug1tKrp_Scbe-w=s1600-n-k-no', false, 3, 'Appartement Meublé à Douala Yassa - Complexe Le Sapphire')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG6BFVVmA8otM2Bjs_E10gd8gkQwnoy4Pcn1zKSKO_gcOnIhBcfk0pFVtHp6GKHeQZ5RiE8GnPJWYZXaphCC0yoIWysB_8zDVp2tEDWDIKmVgC2n5W8W2u5gvk8E2KkJi_UNzuZRy6KAwvnx1iv9XNorylFL_VhLe-741Aqjetq_Xa6f5TmpHo=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG6BFVVmA8otM2Bjs_E10gd8gkQwnoy4Pcn1zKSKO_gcOnIhBcfk0pFVtHp6GKHeQZ5RiE8GnPJWYZXaphCC0yoIWysB_8zDVp2tEDWDIKmVgC2n5W8W2u5gvk8E2KkJi_UNzuZRy6KAwvnx1iv9XNorylFL_VhLe-741Aqjetq_Xa6f5TmpHo=s1600', false, 4, 'Appartement Meublé à Douala Yassa - Complexe Le Sapphire')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG6BFVVmA8otM2Bjs_E10gd8gkQwnoy4Pcn1zKSKO_gcOnIhBcfk0pFVtHp6GKHeQZ5RiE8GnPJWYZXaphCC0yoIWysB_8zDVp2tEDWDIKmVgC2n5W8W2u5gvk8E2KkJi_UNzuZRy6KAwvnx1iv9XNorylFL_VhLe-741Aqjetq_Xa6f5TmpHo=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG6BFVVmA8otM2Bjs_E10gd8gkQwnoy4Pcn1zKSKO_gcOnIhBcfk0pFVtHp6GKHeQZ5RiE8GnPJWYZXaphCC0yoIWysB_8zDVp2tEDWDIKmVgC2n5W8W2u5gvk8E2KkJi_UNzuZRy6KAwvnx1iv9XNorylFL_VhLe-741Aqjetq_Xa6f5TmpHo=s1600-n-k-no', false, 5, 'Appartement Meublé à Douala Yassa - Complexe Le Sapphire')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhECye4VX53lDe87cBAJmPFZOUrJE1mlay4Tn4ZLIEsa8fCTdk0CORPPCg5LPYXMO5CzKwsx82EdpmcK1WjHJOgZvcq6GDJgy2CwDLomeg8R88RqtRPr9A0wEe20JLdeioFnaq8gjiTNjGwDTRHr4QwYLfd6655sg15GwIxQ2Nbi6KzAD8nDC8SW1A=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhECye4VX53lDe87cBAJmPFZOUrJE1mlay4Tn4ZLIEsa8fCTdk0CORPPCg5LPYXMO5CzKwsx82EdpmcK1WjHJOgZvcq6GDJgy2CwDLomeg8R88RqtRPr9A0wEe20JLdeioFnaq8gjiTNjGwDTRHr4QwYLfd6655sg15GwIxQ2Nbi6KzAD8nDC8SW1A=s1600', false, 6, 'Appartement Meublé à Douala Yassa - Complexe Le Sapphire')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhECye4VX53lDe87cBAJmPFZOUrJE1mlay4Tn4ZLIEsa8fCTdk0CORPPCg5LPYXMO5CzKwsx82EdpmcK1WjHJOgZvcq6GDJgy2CwDLomeg8R88RqtRPr9A0wEe20JLdeioFnaq8gjiTNjGwDTRHr4QwYLfd6655sg15GwIxQ2Nbi6KzAD8nDC8SW1A=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhECye4VX53lDe87cBAJmPFZOUrJE1mlay4Tn4ZLIEsa8fCTdk0CORPPCg5LPYXMO5CzKwsx82EdpmcK1WjHJOgZvcq6GDJgy2CwDLomeg8R88RqtRPr9A0wEe20JLdeioFnaq8gjiTNjGwDTRHr4QwYLfd6655sg15GwIxQ2Nbi6KzAD8nDC8SW1A=s1600-n-k-no', false, 7, 'Appartement Meublé à Douala Yassa - Complexe Le Sapphire')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG3JLh4uXcTRRIluIwmVnSadzzKAGJMbXkvDhuXswTq4m2VXPoWwuzHDLn0ResYi_S6-up8_BS8VVOkXXmZ78XR2NJHLyC5PouAk4tgAu1uoH9gk73HSYxp8_ZgqrLyU2Nkt39MIwpTPvVKQgKTFE6KUBZqQaQOai1YdU8E51MNl3dXrog3vbYn=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG3JLh4uXcTRRIluIwmVnSadzzKAGJMbXkvDhuXswTq4m2VXPoWwuzHDLn0ResYi_S6-up8_BS8VVOkXXmZ78XR2NJHLyC5PouAk4tgAu1uoH9gk73HSYxp8_ZgqrLyU2Nkt39MIwpTPvVKQgKTFE6KUBZqQaQOai1YdU8E51MNl3dXrog3vbYn=s1600', false, 8, 'Appartement Meublé à Douala Yassa - Complexe Le Sapphire')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG3JLh4uXcTRRIluIwmVnSadzzKAGJMbXkvDhuXswTq4m2VXPoWwuzHDLn0ResYi_S6-up8_BS8VVOkXXmZ78XR2NJHLyC5PouAk4tgAu1uoH9gk73HSYxp8_ZgqrLyU2Nkt39MIwpTPvVKQgKTFE6KUBZqQaQOai1YdU8E51MNl3dXrog3vbYn=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG3JLh4uXcTRRIluIwmVnSadzzKAGJMbXkvDhuXswTq4m2VXPoWwuzHDLn0ResYi_S6-up8_BS8VVOkXXmZ78XR2NJHLyC5PouAk4tgAu1uoH9gk73HSYxp8_ZgqrLyU2Nkt39MIwpTPvVKQgKTFE6KUBZqQaQOai1YdU8E51MNl3dXrog3vbYn=s1600-n-k-no', false, 9, 'Appartement Meublé à Douala Yassa - Complexe Le Sapphire')
  on conflict do nothing;

  -- [136] Résidence Meublée CYMAT (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-meublee-cymat-yassa',
    'apartment',
    'published',
    'Résidence Meublée CYMAT',
    'Résidence Meublée CYMAT
Catégorie : Complexe d''appartements meublés.
Adresse : Carrefour Yatchika, Yassa, Douala.
Contact / WhatsApp : +237651946035.
Note Google Maps : 4.7/5 (3 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Germain Eboutou, note 4/5)
- "Note sans commentaire écrit." (Thierry Monthe, note 5/5)
- "Note sans commentaire écrit." (Mathurin Wamba, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Carrefour Yatchika, Yassa, Douala',
    3.9754032,
    9.7988992,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfakXaF085OS1JGXE8VA1V9N6RZE6Vhg-GNFwih2n9mnKgocQBuIjMZSNfCgHA4t_WJ6Xkr0ewfwLdT0XAl-mp0kxAI7dEEAbREjf2m853VtSJciCtMEQa5IJJoyDA7zxqU5t-lH2ZFQ1ZN=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfakXaF085OS1JGXE8VA1V9N6RZE6Vhg-GNFwih2n9mnKgocQBuIjMZSNfCgHA4t_WJ6Xkr0ewfwLdT0XAl-mp0kxAI7dEEAbREjf2m853VtSJciCtMEQa5IJJoyDA7zxqU5t-lH2ZFQ1ZN=s1600', true, 0, 'Résidence Meublée CYMAT')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfakXaF085OS1JGXE8VA1V9N6RZE6Vhg-GNFwih2n9mnKgocQBuIjMZSNfCgHA4t_WJ6Xkr0ewfwLdT0XAl-mp0kxAI7dEEAbREjf2m853VtSJciCtMEQa5IJJoyDA7zxqU5t-lH2ZFQ1ZN=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfakXaF085OS1JGXE8VA1V9N6RZE6Vhg-GNFwih2n9mnKgocQBuIjMZSNfCgHA4t_WJ6Xkr0ewfwLdT0XAl-mp0kxAI7dEEAbREjf2m853VtSJciCtMEQa5IJJoyDA7zxqU5t-lH2ZFQ1ZN=s1600-p-k-no', false, 1, 'Résidence Meublée CYMAT')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S20rHBvcfoY8u_zOy696caIIUG9UbwLjF7UEFfA-izkj-qTMtxToq9cYhyfiM_QgXxhkCoOKbk373ezansEBa7keOL0JI5BTQ9o3jicd--DvRBxMLP0bXKUvrVB4gUr3O1d1E9jbfCt0Lm=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S20rHBvcfoY8u_zOy696caIIUG9UbwLjF7UEFfA-izkj-qTMtxToq9cYhyfiM_QgXxhkCoOKbk373ezansEBa7keOL0JI5BTQ9o3jicd--DvRBxMLP0bXKUvrVB4gUr3O1d1E9jbfCt0Lm=s1600', false, 2, 'Résidence Meublée CYMAT')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S20rHBvcfoY8u_zOy696caIIUG9UbwLjF7UEFfA-izkj-qTMtxToq9cYhyfiM_QgXxhkCoOKbk373ezansEBa7keOL0JI5BTQ9o3jicd--DvRBxMLP0bXKUvrVB4gUr3O1d1E9jbfCt0Lm=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S20rHBvcfoY8u_zOy696caIIUG9UbwLjF7UEFfA-izkj-qTMtxToq9cYhyfiM_QgXxhkCoOKbk373ezansEBa7keOL0JI5BTQ9o3jicd--DvRBxMLP0bXKUvrVB4gUr3O1d1E9jbfCt0Lm=s1600-n-k-no', false, 3, 'Résidence Meublée CYMAT')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TzpxY6rjUOyNGlPfMSwRAs05wfH9yzULWgZlaf8Z6I_8rc89blPiLPX1P6VP-62mJNUCDen2MzMeIkyNOIdeba6KojUF6nBYAg-hK0yQdChn9erN2r_vyCUGg-EvjhRiT1G3mHmrjWfYVi=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TzpxY6rjUOyNGlPfMSwRAs05wfH9yzULWgZlaf8Z6I_8rc89blPiLPX1P6VP-62mJNUCDen2MzMeIkyNOIdeba6KojUF6nBYAg-hK0yQdChn9erN2r_vyCUGg-EvjhRiT1G3mHmrjWfYVi=s1600', false, 4, 'Résidence Meublée CYMAT')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TzpxY6rjUOyNGlPfMSwRAs05wfH9yzULWgZlaf8Z6I_8rc89blPiLPX1P6VP-62mJNUCDen2MzMeIkyNOIdeba6KojUF6nBYAg-hK0yQdChn9erN2r_vyCUGg-EvjhRiT1G3mHmrjWfYVi=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TzpxY6rjUOyNGlPfMSwRAs05wfH9yzULWgZlaf8Z6I_8rc89blPiLPX1P6VP-62mJNUCDen2MzMeIkyNOIdeba6KojUF6nBYAg-hK0yQdChn9erN2r_vyCUGg-EvjhRiT1G3mHmrjWfYVi=s1600-n-k-no', false, 5, 'Résidence Meublée CYMAT')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RoqAIvRA8RpcD7DT-hGbpqHPB_qckEJgf8hng1cd-vsuHYjxrnrcPy5hV6e96BTfTRO6R6yI4J-uvSOjrYBMMSVjOKl2yRpAr-B0c3HgLglqAHLJeotEgmQlibSmgu9tmCNf6xM_Lz8ZFz=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RoqAIvRA8RpcD7DT-hGbpqHPB_qckEJgf8hng1cd-vsuHYjxrnrcPy5hV6e96BTfTRO6R6yI4J-uvSOjrYBMMSVjOKl2yRpAr-B0c3HgLglqAHLJeotEgmQlibSmgu9tmCNf6xM_Lz8ZFz=s1600', false, 6, 'Résidence Meublée CYMAT')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RoqAIvRA8RpcD7DT-hGbpqHPB_qckEJgf8hng1cd-vsuHYjxrnrcPy5hV6e96BTfTRO6R6yI4J-uvSOjrYBMMSVjOKl2yRpAr-B0c3HgLglqAHLJeotEgmQlibSmgu9tmCNf6xM_Lz8ZFz=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RoqAIvRA8RpcD7DT-hGbpqHPB_qckEJgf8hng1cd-vsuHYjxrnrcPy5hV6e96BTfTRO6R6yI4J-uvSOjrYBMMSVjOKl2yRpAr-B0c3HgLglqAHLJeotEgmQlibSmgu9tmCNf6xM_Lz8ZFz=s1600-n-k-no', false, 7, 'Résidence Meublée CYMAT')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TuvZRi7k_0qYUVIoNqA0b5Eus8vhMr2dqDtwxMZmmacARBMdglRblkxlPmCQMqhjekJjdIO6972Oo8qpN2ctpGGZwqYL2ksWtO-rHw-55sVT6E9AChzAKIYddP65J20Zdmhw1UAkdgkeI=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TuvZRi7k_0qYUVIoNqA0b5Eus8vhMr2dqDtwxMZmmacARBMdglRblkxlPmCQMqhjekJjdIO6972Oo8qpN2ctpGGZwqYL2ksWtO-rHw-55sVT6E9AChzAKIYddP65J20Zdmhw1UAkdgkeI=s1600', false, 8, 'Résidence Meublée CYMAT')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TuvZRi7k_0qYUVIoNqA0b5Eus8vhMr2dqDtwxMZmmacARBMdglRblkxlPmCQMqhjekJjdIO6972Oo8qpN2ctpGGZwqYL2ksWtO-rHw-55sVT6E9AChzAKIYddP65J20Zdmhw1UAkdgkeI=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TuvZRi7k_0qYUVIoNqA0b5Eus8vhMr2dqDtwxMZmmacARBMdglRblkxlPmCQMqhjekJjdIO6972Oo8qpN2ctpGGZwqYL2ksWtO-rHw-55sVT6E9AChzAKIYddP65J20Zdmhw1UAkdgkeI=s1600-n-k-no', false, 9, 'Résidence Meublée CYMAT')
  on conflict do nothing;

  -- [137] Appartement meublé â Yassa - Two-Bedroom Apartment (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartement-meuble-a-yassa-two-bedroom-apartment-yassa',
    'room',
    'published',
    'Appartement meublé â Yassa - Two-Bedroom Apartment',
    'Appartement meublé â Yassa - Two-Bedroom Apartment
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0198598,
    9.7946301,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2RaMsUr6LurI1c8bhowrp_MG25PXS29Hs9qsNgX6sHmmXR0YhI9DyTmlfb37-Ml2pO5x2d90XToR16sW5ejM_wvmIaWsGJWmnFqOVVGt69cDoPoEskEXssmhEFenWUAPtDp1wbt_cy_f2wri8VzQEcOTcQ275bPIw5NZMRcES4Wk4qFQl-HfzH=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2RaMsUr6LurI1c8bhowrp_MG25PXS29Hs9qsNgX6sHmmXR0YhI9DyTmlfb37-Ml2pO5x2d90XToR16sW5ejM_wvmIaWsGJWmnFqOVVGt69cDoPoEskEXssmhEFenWUAPtDp1wbt_cy_f2wri8VzQEcOTcQ275bPIw5NZMRcES4Wk4qFQl-HfzH=s1600', true, 0, 'Appartement meublé â Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2RaMsUr6LurI1c8bhowrp_MG25PXS29Hs9qsNgX6sHmmXR0YhI9DyTmlfb37-Ml2pO5x2d90XToR16sW5ejM_wvmIaWsGJWmnFqOVVGt69cDoPoEskEXssmhEFenWUAPtDp1wbt_cy_f2wri8VzQEcOTcQ275bPIw5NZMRcES4Wk4qFQl-HfzH=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2RaMsUr6LurI1c8bhowrp_MG25PXS29Hs9qsNgX6sHmmXR0YhI9DyTmlfb37-Ml2pO5x2d90XToR16sW5ejM_wvmIaWsGJWmnFqOVVGt69cDoPoEskEXssmhEFenWUAPtDp1wbt_cy_f2wri8VzQEcOTcQ275bPIw5NZMRcES4Wk4qFQl-HfzH=s1600-p-k-no', false, 1, 'Appartement meublé â Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG62stZXaQGiEU1-EC0mycTvQjyyyY4Mu__AVU1ZZxvBAqSGwxJL22BVxL6HRrPLKeywp4qMS-TI7KUUdH6aQqlmcbUtyZmpcUWGjO5IwmaVUz5betnOFJiXvqHr83oFi3vBxGMCUj-P427oUxEttZ1-1K2TyDZs7FjwWjabLB3N6ssg3ZtTK52=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG62stZXaQGiEU1-EC0mycTvQjyyyY4Mu__AVU1ZZxvBAqSGwxJL22BVxL6HRrPLKeywp4qMS-TI7KUUdH6aQqlmcbUtyZmpcUWGjO5IwmaVUz5betnOFJiXvqHr83oFi3vBxGMCUj-P427oUxEttZ1-1K2TyDZs7FjwWjabLB3N6ssg3ZtTK52=s1600', false, 2, 'Appartement meublé â Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHmPGkRSqhKo7PDkfPfLXl13JhoHCrhyUUffFyPJTjqTdTPZHGIlao2UPCAVhzZ7dbKTTparC5FjUimrMMjbCZqcctw9IfCIXYUKDABAtQRKnyrodek2dpZRZuVthKCpQt009StbrZJnLHKa_oRggmQxiFvkFwf3GXvbD0JwxwWQC-NrRxslG2a=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHmPGkRSqhKo7PDkfPfLXl13JhoHCrhyUUffFyPJTjqTdTPZHGIlao2UPCAVhzZ7dbKTTparC5FjUimrMMjbCZqcctw9IfCIXYUKDABAtQRKnyrodek2dpZRZuVthKCpQt009StbrZJnLHKa_oRggmQxiFvkFwf3GXvbD0JwxwWQC-NrRxslG2a=s1600', false, 3, 'Appartement meublé â Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHFilBwwZDTdmKecOPFYWzfjeyv9xMgoGt7DsLPaxVZlqxpsF5EiIRAmX1D4yzudwKDeQgh_g2lV8g3x8ZHh9J7zQoY3kHH3hSAfowewVqVqglz37-EGZ1EPZ9KVHnpnjNMsv_AyKkW68tb-J27VlC5Bs2H4wVsZ4T_uXinoDjRcKKdO2shNZDd=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHFilBwwZDTdmKecOPFYWzfjeyv9xMgoGt7DsLPaxVZlqxpsF5EiIRAmX1D4yzudwKDeQgh_g2lV8g3x8ZHh9J7zQoY3kHH3hSAfowewVqVqglz37-EGZ1EPZ9KVHnpnjNMsv_AyKkW68tb-J27VlC5Bs2H4wVsZ4T_uXinoDjRcKKdO2shNZDd=s1600', false, 4, 'Appartement meublé â Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGKnoTg47Bsatm8aDv6q5K2I9ZqUFUb6TRkvrojekqPUX1PRtNlDRg7UaG8oxoFpBsWK2mCfQkQ4nVqvUtlp4vJUus4fRdbwsagxm6gGd6TaM6aTp5TU-WVWId_P1ylptzNy4ytVAdbjNmmlISz6VF36olBRKRz4_Jrq9mkcqjppWbcUqY5_Ps=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGKnoTg47Bsatm8aDv6q5K2I9ZqUFUb6TRkvrojekqPUX1PRtNlDRg7UaG8oxoFpBsWK2mCfQkQ4nVqvUtlp4vJUus4fRdbwsagxm6gGd6TaM6aTp5TU-WVWId_P1ylptzNy4ytVAdbjNmmlISz6VF36olBRKRz4_Jrq9mkcqjppWbcUqY5_Ps=s1600', false, 5, 'Appartement meublé â Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG62stZXaQGiEU1-EC0mycTvQjyyyY4Mu__AVU1ZZxvBAqSGwxJL22BVxL6HRrPLKeywp4qMS-TI7KUUdH6aQqlmcbUtyZmpcUWGjO5IwmaVUz5betnOFJiXvqHr83oFi3vBxGMCUj-P427oUxEttZ1-1K2TyDZs7FjwWjabLB3N6ssg3ZtTK52=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG62stZXaQGiEU1-EC0mycTvQjyyyY4Mu__AVU1ZZxvBAqSGwxJL22BVxL6HRrPLKeywp4qMS-TI7KUUdH6aQqlmcbUtyZmpcUWGjO5IwmaVUz5betnOFJiXvqHr83oFi3vBxGMCUj-P427oUxEttZ1-1K2TyDZs7FjwWjabLB3N6ssg3ZtTK52=s1600-n-k-no', false, 6, 'Appartement meublé â Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHmPGkRSqhKo7PDkfPfLXl13JhoHCrhyUUffFyPJTjqTdTPZHGIlao2UPCAVhzZ7dbKTTparC5FjUimrMMjbCZqcctw9IfCIXYUKDABAtQRKnyrodek2dpZRZuVthKCpQt009StbrZJnLHKa_oRggmQxiFvkFwf3GXvbD0JwxwWQC-NrRxslG2a=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHmPGkRSqhKo7PDkfPfLXl13JhoHCrhyUUffFyPJTjqTdTPZHGIlao2UPCAVhzZ7dbKTTparC5FjUimrMMjbCZqcctw9IfCIXYUKDABAtQRKnyrodek2dpZRZuVthKCpQt009StbrZJnLHKa_oRggmQxiFvkFwf3GXvbD0JwxwWQC-NrRxslG2a=s1600-n-k-no', false, 7, 'Appartement meublé â Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHFilBwwZDTdmKecOPFYWzfjeyv9xMgoGt7DsLPaxVZlqxpsF5EiIRAmX1D4yzudwKDeQgh_g2lV8g3x8ZHh9J7zQoY3kHH3hSAfowewVqVqglz37-EGZ1EPZ9KVHnpnjNMsv_AyKkW68tb-J27VlC5Bs2H4wVsZ4T_uXinoDjRcKKdO2shNZDd=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHFilBwwZDTdmKecOPFYWzfjeyv9xMgoGt7DsLPaxVZlqxpsF5EiIRAmX1D4yzudwKDeQgh_g2lV8g3x8ZHh9J7zQoY3kHH3hSAfowewVqVqglz37-EGZ1EPZ9KVHnpnjNMsv_AyKkW68tb-J27VlC5Bs2H4wVsZ4T_uXinoDjRcKKdO2shNZDd=s1600-n-k-no', false, 8, 'Appartement meublé â Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGKnoTg47Bsatm8aDv6q5K2I9ZqUFUb6TRkvrojekqPUX1PRtNlDRg7UaG8oxoFpBsWK2mCfQkQ4nVqvUtlp4vJUus4fRdbwsagxm6gGd6TaM6aTp5TU-WVWId_P1ylptzNy4ytVAdbjNmmlISz6VF36olBRKRz4_Jrq9mkcqjppWbcUqY5_Ps=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGKnoTg47Bsatm8aDv6q5K2I9ZqUFUb6TRkvrojekqPUX1PRtNlDRg7UaG8oxoFpBsWK2mCfQkQ4nVqvUtlp4vJUus4fRdbwsagxm6gGd6TaM6aTp5TU-WVWId_P1ylptzNy4ytVAdbjNmmlISz6VF36olBRKRz4_Jrq9mkcqjppWbcUqY5_Ps=s1600-n-k-no', false, 9, 'Appartement meublé â Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  -- [138] Douala Yassa Maetur (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'douala-yassa-maetur-yassa',
    'apartment',
    'published',
    'Douala Yassa Maetur',
    'Douala Yassa Maetur
Catégorie : Location d''appartement de vacances.
Adresse : 2R82+Q66 entré maetur, Yassa, Douala.
Note Google Maps : 3.9/5 (37 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Jojo Spenceur, note 5/5)
- "Note sans commentaire écrit." (john peter db, note 5/5)
- "Note sans commentaire écrit." (Aubin Tebu, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '2R82+Q66 entré maetur, Yassa, Douala',
    4.0157477,
    9.7969087,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcl3Av8_8fguPP7Yo_eaiBL0id64niJiYpnatr7QgbgNar6rhUonYy4Wn0ANtFX9r0Qyjhhw8pm8oY-i9m9uyLrTfPGmGAiTIHjFIlMLYeEJW8sWjSTKsBbHC7HaG1lXx-LC69cYX2fESdY=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcl3Av8_8fguPP7Yo_eaiBL0id64niJiYpnatr7QgbgNar6rhUonYy4Wn0ANtFX9r0Qyjhhw8pm8oY-i9m9uyLrTfPGmGAiTIHjFIlMLYeEJW8sWjSTKsBbHC7HaG1lXx-LC69cYX2fESdY=s1600', true, 0, 'Douala Yassa Maetur')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLcl3Av8_8fguPP7Yo_eaiBL0id64niJiYpnatr7QgbgNar6rhUonYy4Wn0ANtFX9r0Qyjhhw8pm8oY-i9m9uyLrTfPGmGAiTIHjFIlMLYeEJW8sWjSTKsBbHC7HaG1lXx-LC69cYX2fESdY=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLcl3Av8_8fguPP7Yo_eaiBL0id64niJiYpnatr7QgbgNar6rhUonYy4Wn0ANtFX9r0Qyjhhw8pm8oY-i9m9uyLrTfPGmGAiTIHjFIlMLYeEJW8sWjSTKsBbHC7HaG1lXx-LC69cYX2fESdY=s1600-p-k-no', false, 1, 'Douala Yassa Maetur')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SrWaVb4VpdEI_3fSyVoLoST1PNFUEer9lHuY5-8yl45NRdwTRWCQ-szh5i1LHguoXV2jfDJrw1lRXAwwRZyFLdGIUtBS1OJa4iYUucQgAnjziXZ8X4xyP333ikTCEQL9eJ6OEapToDhYkG=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SrWaVb4VpdEI_3fSyVoLoST1PNFUEer9lHuY5-8yl45NRdwTRWCQ-szh5i1LHguoXV2jfDJrw1lRXAwwRZyFLdGIUtBS1OJa4iYUucQgAnjziXZ8X4xyP333ikTCEQL9eJ6OEapToDhYkG=s1600', false, 2, 'Douala Yassa Maetur')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SrWaVb4VpdEI_3fSyVoLoST1PNFUEer9lHuY5-8yl45NRdwTRWCQ-szh5i1LHguoXV2jfDJrw1lRXAwwRZyFLdGIUtBS1OJa4iYUucQgAnjziXZ8X4xyP333ikTCEQL9eJ6OEapToDhYkG=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SrWaVb4VpdEI_3fSyVoLoST1PNFUEer9lHuY5-8yl45NRdwTRWCQ-szh5i1LHguoXV2jfDJrw1lRXAwwRZyFLdGIUtBS1OJa4iYUucQgAnjziXZ8X4xyP333ikTCEQL9eJ6OEapToDhYkG=s1600-n-k-no', false, 3, 'Douala Yassa Maetur')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S6sQE-_gpizGvxxxoAWo2zJ0a2BuxtodvVnRP40nUAB8wwXcAGAQu19k3_WW-A5ZdxQUfb1xW6PkNOvl2kxkT5BmVfJGalv0G9oLASvSWLbJ04eyWXLlq3qxP5ZgDdTAvq6JfUgBo8Wzis=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S6sQE-_gpizGvxxxoAWo2zJ0a2BuxtodvVnRP40nUAB8wwXcAGAQu19k3_WW-A5ZdxQUfb1xW6PkNOvl2kxkT5BmVfJGalv0G9oLASvSWLbJ04eyWXLlq3qxP5ZgDdTAvq6JfUgBo8Wzis=s1600', false, 4, 'Douala Yassa Maetur')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S6sQE-_gpizGvxxxoAWo2zJ0a2BuxtodvVnRP40nUAB8wwXcAGAQu19k3_WW-A5ZdxQUfb1xW6PkNOvl2kxkT5BmVfJGalv0G9oLASvSWLbJ04eyWXLlq3qxP5ZgDdTAvq6JfUgBo8Wzis=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S6sQE-_gpizGvxxxoAWo2zJ0a2BuxtodvVnRP40nUAB8wwXcAGAQu19k3_WW-A5ZdxQUfb1xW6PkNOvl2kxkT5BmVfJGalv0G9oLASvSWLbJ04eyWXLlq3qxP5ZgDdTAvq6JfUgBo8Wzis=s1600-n-k-no', false, 5, 'Douala Yassa Maetur')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sf3HnHaw0K0sxLdQDL8OyUPUjSJKeVm0w6e1cfLsvRLuVbEmLZ7h3VrdCBu7LTXYHbRvM0alHcKsdAjFJ68wXvjpRxmfEB3wG9ICgXyzvk-cGZIHoy0ffM8f9JS4bxqCH2HvlFXTroHctD=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sf3HnHaw0K0sxLdQDL8OyUPUjSJKeVm0w6e1cfLsvRLuVbEmLZ7h3VrdCBu7LTXYHbRvM0alHcKsdAjFJ68wXvjpRxmfEB3wG9ICgXyzvk-cGZIHoy0ffM8f9JS4bxqCH2HvlFXTroHctD=s1600', false, 6, 'Douala Yassa Maetur')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sf3HnHaw0K0sxLdQDL8OyUPUjSJKeVm0w6e1cfLsvRLuVbEmLZ7h3VrdCBu7LTXYHbRvM0alHcKsdAjFJ68wXvjpRxmfEB3wG9ICgXyzvk-cGZIHoy0ffM8f9JS4bxqCH2HvlFXTroHctD=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sf3HnHaw0K0sxLdQDL8OyUPUjSJKeVm0w6e1cfLsvRLuVbEmLZ7h3VrdCBu7LTXYHbRvM0alHcKsdAjFJ68wXvjpRxmfEB3wG9ICgXyzvk-cGZIHoy0ffM8f9JS4bxqCH2HvlFXTroHctD=s1600-n-k-no', false, 7, 'Douala Yassa Maetur')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TOsOOFWDHUZmysKv7qsnRnmNxUk6-WIoSwFqvLS8gGsmA8t1AHCuHsF4ptAyK3DEV1fy8sio-76YPvLbIX2-t9jRaNy3uvULJb1ZyEy0KTe0hreAdsS6_I_ngh7ZeXbRQazSQofVAfz1k=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TOsOOFWDHUZmysKv7qsnRnmNxUk6-WIoSwFqvLS8gGsmA8t1AHCuHsF4ptAyK3DEV1fy8sio-76YPvLbIX2-t9jRaNy3uvULJb1ZyEy0KTe0hreAdsS6_I_ngh7ZeXbRQazSQofVAfz1k=s1600', false, 8, 'Douala Yassa Maetur')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TOsOOFWDHUZmysKv7qsnRnmNxUk6-WIoSwFqvLS8gGsmA8t1AHCuHsF4ptAyK3DEV1fy8sio-76YPvLbIX2-t9jRaNy3uvULJb1ZyEy0KTe0hreAdsS6_I_ngh7ZeXbRQazSQofVAfz1k=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TOsOOFWDHUZmysKv7qsnRnmNxUk6-WIoSwFqvLS8gGsmA8t1AHCuHsF4ptAyK3DEV1fy8sio-76YPvLbIX2-t9jRaNy3uvULJb1ZyEy0KTe0hreAdsS6_I_ngh7ZeXbRQazSQofVAfz1k=s1600-n-k-no', false, 9, 'Douala Yassa Maetur')
  on conflict do nothing;

  -- [139] Studio meublé - Condo - WILMA HOUSE appartements meublés - YASSA - DOUALA (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'studio-meuble-condo-wilma-house-appartements-meubles-yassa-douala-yassa',
    'studio',
    'published',
    'Studio meublé - Condo - WILMA HOUSE appartements meublés - YASSA - DOUALA',
    'Studio meublé - Condo - WILMA HOUSE appartements meublés - YASSA - DOUALA
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    3.9899621,
    9.7974167,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW04ASSxG0eCoBtxJHkZ-aGgXCIw8iAxgbyrVxnicJO1paUs-Bd91HsKJD4WZErVVr3iM8Qo0uAQA7wRIUb0V2cc-p8-q5HhHerwDCE_gvupSqWe_THDx4p5wRwxAHsf_-A2rYtXkAKlleBgs4KJUQe3x4npX-KNs6PHsg_hNgBBiCLBMopl0_Y=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW04ASSxG0eCoBtxJHkZ-aGgXCIw8iAxgbyrVxnicJO1paUs-Bd91HsKJD4WZErVVr3iM8Qo0uAQA7wRIUb0V2cc-p8-q5HhHerwDCE_gvupSqWe_THDx4p5wRwxAHsf_-A2rYtXkAKlleBgs4KJUQe3x4npX-KNs6PHsg_hNgBBiCLBMopl0_Y=s1600', true, 0, 'Studio meublé - Condo - WILMA HOUSE appartements meublés - YASSA - DOUALA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW04ASSxG0eCoBtxJHkZ-aGgXCIw8iAxgbyrVxnicJO1paUs-Bd91HsKJD4WZErVVr3iM8Qo0uAQA7wRIUb0V2cc-p8-q5HhHerwDCE_gvupSqWe_THDx4p5wRwxAHsf_-A2rYtXkAKlleBgs4KJUQe3x4npX-KNs6PHsg_hNgBBiCLBMopl0_Y=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW04ASSxG0eCoBtxJHkZ-aGgXCIw8iAxgbyrVxnicJO1paUs-Bd91HsKJD4WZErVVr3iM8Qo0uAQA7wRIUb0V2cc-p8-q5HhHerwDCE_gvupSqWe_THDx4p5wRwxAHsf_-A2rYtXkAKlleBgs4KJUQe3x4npX-KNs6PHsg_hNgBBiCLBMopl0_Y=s1600-p-k-no', false, 1, 'Studio meublé - Condo - WILMA HOUSE appartements meublés - YASSA - DOUALA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHFflHP9EDGZrO3ah02psTvAcehplyDRecDZ3OSbR6KH8U2V43E0s_hq6MdOVBlhFzWUZiO3XOjXgVTTp0M8JbpH1NG_FpQkKnmJuvyAiEuy1gIgI2XcjGQV5K7SUfbM5mVBgUPe9OsHdUnR5DztHns-O-UTANLqkl71onDrz5PeFfZctI1_U8=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHFflHP9EDGZrO3ah02psTvAcehplyDRecDZ3OSbR6KH8U2V43E0s_hq6MdOVBlhFzWUZiO3XOjXgVTTp0M8JbpH1NG_FpQkKnmJuvyAiEuy1gIgI2XcjGQV5K7SUfbM5mVBgUPe9OsHdUnR5DztHns-O-UTANLqkl71onDrz5PeFfZctI1_U8=s1600', false, 2, 'Studio meublé - Condo - WILMA HOUSE appartements meublés - YASSA - DOUALA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHFflHP9EDGZrO3ah02psTvAcehplyDRecDZ3OSbR6KH8U2V43E0s_hq6MdOVBlhFzWUZiO3XOjXgVTTp0M8JbpH1NG_FpQkKnmJuvyAiEuy1gIgI2XcjGQV5K7SUfbM5mVBgUPe9OsHdUnR5DztHns-O-UTANLqkl71onDrz5PeFfZctI1_U8=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHFflHP9EDGZrO3ah02psTvAcehplyDRecDZ3OSbR6KH8U2V43E0s_hq6MdOVBlhFzWUZiO3XOjXgVTTp0M8JbpH1NG_FpQkKnmJuvyAiEuy1gIgI2XcjGQV5K7SUfbM5mVBgUPe9OsHdUnR5DztHns-O-UTANLqkl71onDrz5PeFfZctI1_U8=s1600-n-k-no', false, 3, 'Studio meublé - Condo - WILMA HOUSE appartements meublés - YASSA - DOUALA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHqCM6rQAYCHvZAr04cRkWUqVrLMjXtcgqxRR1L5t9oiRT-xmBFPX0wkFNPzqDdJS8divEC0lPuQ1DDSzkLB2WVvCm-ToYB0iY8MfkYc-4c7tJoMZ6oZUN92PiNJonTX5kxm3Nz-sdv43gNBZCb4tKATU-rMmNgWrWVQk2bhk3SyR_z3fJQlyad=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHqCM6rQAYCHvZAr04cRkWUqVrLMjXtcgqxRR1L5t9oiRT-xmBFPX0wkFNPzqDdJS8divEC0lPuQ1DDSzkLB2WVvCm-ToYB0iY8MfkYc-4c7tJoMZ6oZUN92PiNJonTX5kxm3Nz-sdv43gNBZCb4tKATU-rMmNgWrWVQk2bhk3SyR_z3fJQlyad=s1600', false, 4, 'Studio meublé - Condo - WILMA HOUSE appartements meublés - YASSA - DOUALA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHqCM6rQAYCHvZAr04cRkWUqVrLMjXtcgqxRR1L5t9oiRT-xmBFPX0wkFNPzqDdJS8divEC0lPuQ1DDSzkLB2WVvCm-ToYB0iY8MfkYc-4c7tJoMZ6oZUN92PiNJonTX5kxm3Nz-sdv43gNBZCb4tKATU-rMmNgWrWVQk2bhk3SyR_z3fJQlyad=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHqCM6rQAYCHvZAr04cRkWUqVrLMjXtcgqxRR1L5t9oiRT-xmBFPX0wkFNPzqDdJS8divEC0lPuQ1DDSzkLB2WVvCm-ToYB0iY8MfkYc-4c7tJoMZ6oZUN92PiNJonTX5kxm3Nz-sdv43gNBZCb4tKATU-rMmNgWrWVQk2bhk3SyR_z3fJQlyad=s1600-n-k-no', false, 5, 'Studio meublé - Condo - WILMA HOUSE appartements meublés - YASSA - DOUALA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhF2MTBkVQgjkzXPTWgGRItiWVdj-O-_C3A1vKFpxHOcL0bVrzNCH27hGzmnRMZkV0uevnT2od6RXkh51Z7VROfNQ48iQneztPd28QxY-WxiFJ_roKzhQ1BnwNXsD9DYT8lt9DW1Thh6oW4Nsp8Smsj2Ws3HlLH8hD3N3ZzDbM_bIwtY2unCC6xD=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhF2MTBkVQgjkzXPTWgGRItiWVdj-O-_C3A1vKFpxHOcL0bVrzNCH27hGzmnRMZkV0uevnT2od6RXkh51Z7VROfNQ48iQneztPd28QxY-WxiFJ_roKzhQ1BnwNXsD9DYT8lt9DW1Thh6oW4Nsp8Smsj2Ws3HlLH8hD3N3ZzDbM_bIwtY2unCC6xD=s1600', false, 6, 'Studio meublé - Condo - WILMA HOUSE appartements meublés - YASSA - DOUALA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhF2MTBkVQgjkzXPTWgGRItiWVdj-O-_C3A1vKFpxHOcL0bVrzNCH27hGzmnRMZkV0uevnT2od6RXkh51Z7VROfNQ48iQneztPd28QxY-WxiFJ_roKzhQ1BnwNXsD9DYT8lt9DW1Thh6oW4Nsp8Smsj2Ws3HlLH8hD3N3ZzDbM_bIwtY2unCC6xD=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhF2MTBkVQgjkzXPTWgGRItiWVdj-O-_C3A1vKFpxHOcL0bVrzNCH27hGzmnRMZkV0uevnT2od6RXkh51Z7VROfNQ48iQneztPd28QxY-WxiFJ_roKzhQ1BnwNXsD9DYT8lt9DW1Thh6oW4Nsp8Smsj2Ws3HlLH8hD3N3ZzDbM_bIwtY2unCC6xD=s1600-n-k-no', false, 7, 'Studio meublé - Condo - WILMA HOUSE appartements meublés - YASSA - DOUALA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEdkPF-m69i4ZjWebUTNvsKP1uXUxylhe0_N2n04VAyzbqfwmGZXZ0L8FZrrtpLLGUn1A5J3dZP6ZnTIi9yBRrmx_5vrDKeQHdoEZubEZ3_QTKFCJXWWYmWo22cJIs1XCulwu_KNBn4t8qiBsfBugXX09PrWxs__jC98DycTK01xplugxd0cr6x=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEdkPF-m69i4ZjWebUTNvsKP1uXUxylhe0_N2n04VAyzbqfwmGZXZ0L8FZrrtpLLGUn1A5J3dZP6ZnTIi9yBRrmx_5vrDKeQHdoEZubEZ3_QTKFCJXWWYmWo22cJIs1XCulwu_KNBn4t8qiBsfBugXX09PrWxs__jC98DycTK01xplugxd0cr6x=s1600', false, 8, 'Studio meublé - Condo - WILMA HOUSE appartements meublés - YASSA - DOUALA')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEdkPF-m69i4ZjWebUTNvsKP1uXUxylhe0_N2n04VAyzbqfwmGZXZ0L8FZrrtpLLGUn1A5J3dZP6ZnTIi9yBRrmx_5vrDKeQHdoEZubEZ3_QTKFCJXWWYmWo22cJIs1XCulwu_KNBn4t8qiBsfBugXX09PrWxs__jC98DycTK01xplugxd0cr6x=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEdkPF-m69i4ZjWebUTNvsKP1uXUxylhe0_N2n04VAyzbqfwmGZXZ0L8FZrrtpLLGUn1A5J3dZP6ZnTIi9yBRrmx_5vrDKeQHdoEZubEZ3_QTKFCJXWWYmWo22cJIs1XCulwu_KNBn4t8qiBsfBugXX09PrWxs__jC98DycTK01xplugxd0cr6x=s1600-n-k-no', false, 9, 'Studio meublé - Condo - WILMA HOUSE appartements meublés - YASSA - DOUALA')
  on conflict do nothing;

  -- [140] pk 21 nkolbong (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'pk-21-nkolbong-yassa',
    'apartment',
    'published',
    'pk 21 nkolbong',
    'pk 21 nkolbong
Catégorie : Édifice à appartements.
Adresse : XRM7+G2, Douala.
Note Google Maps : 4.4/5 (17 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Junior Kamdem, note 5/5)
- "Note sans commentaire écrit." (Jorel Styve Tekam, note 4/5)
- "Note sans commentaire écrit." (Ngo oth Françoise, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'XRM7+G2, Douala',
    3.9849368,
    9.8128907,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfXlIOOH4QnXZCdmhXjiJ5oqb51Yu-rbMnfWT6IQL0fkvtZUAp7idmuVWFNrAqO5MyV-4gRkjlk5FkAfQ6ArxJ5wnfX5In2NPu00jmOdU8FGYCoBEugM70-RdoNCzIGjW9mR6o8dV9mHhPK=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfXlIOOH4QnXZCdmhXjiJ5oqb51Yu-rbMnfWT6IQL0fkvtZUAp7idmuVWFNrAqO5MyV-4gRkjlk5FkAfQ6ArxJ5wnfX5In2NPu00jmOdU8FGYCoBEugM70-RdoNCzIGjW9mR6o8dV9mHhPK=s1600', true, 0, 'pk 21 nkolbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfXlIOOH4QnXZCdmhXjiJ5oqb51Yu-rbMnfWT6IQL0fkvtZUAp7idmuVWFNrAqO5MyV-4gRkjlk5FkAfQ6ArxJ5wnfX5In2NPu00jmOdU8FGYCoBEugM70-RdoNCzIGjW9mR6o8dV9mHhPK=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfXlIOOH4QnXZCdmhXjiJ5oqb51Yu-rbMnfWT6IQL0fkvtZUAp7idmuVWFNrAqO5MyV-4gRkjlk5FkAfQ6ArxJ5wnfX5In2NPu00jmOdU8FGYCoBEugM70-RdoNCzIGjW9mR6o8dV9mHhPK=s1600-p-k-no', false, 1, 'pk 21 nkolbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RCDlZ0ZCoZD3xkWhDnHT2tsaFI0VRRnHvzTxk1k2Qm47_imGzn1XXKGXHpndw4UvGkXoVURVFCsCfEDBKR6CiWqXlVzWkrh5_rxdRRYCbVXYQ_8pdWH0mfvs5Guo_y2iFyMvNDFH_5U2lQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RCDlZ0ZCoZD3xkWhDnHT2tsaFI0VRRnHvzTxk1k2Qm47_imGzn1XXKGXHpndw4UvGkXoVURVFCsCfEDBKR6CiWqXlVzWkrh5_rxdRRYCbVXYQ_8pdWH0mfvs5Guo_y2iFyMvNDFH_5U2lQ=s1600', false, 2, 'pk 21 nkolbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RCDlZ0ZCoZD3xkWhDnHT2tsaFI0VRRnHvzTxk1k2Qm47_imGzn1XXKGXHpndw4UvGkXoVURVFCsCfEDBKR6CiWqXlVzWkrh5_rxdRRYCbVXYQ_8pdWH0mfvs5Guo_y2iFyMvNDFH_5U2lQ=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RCDlZ0ZCoZD3xkWhDnHT2tsaFI0VRRnHvzTxk1k2Qm47_imGzn1XXKGXHpndw4UvGkXoVURVFCsCfEDBKR6CiWqXlVzWkrh5_rxdRRYCbVXYQ_8pdWH0mfvs5Guo_y2iFyMvNDFH_5U2lQ=s1600-n-k-no', false, 3, 'pk 21 nkolbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T22LcHKJoSzxBzpuIfWt-l0nUkRSDMKALUtlWyfGjlGOTSs8IanGTChDsb0pL6lGzQdDnYEbyqo4ky30WUd-yI1q0IxU7_VBtOzrZdOoN2ytL6volppyXP7jS50X0Ll6JLvLYX=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T22LcHKJoSzxBzpuIfWt-l0nUkRSDMKALUtlWyfGjlGOTSs8IanGTChDsb0pL6lGzQdDnYEbyqo4ky30WUd-yI1q0IxU7_VBtOzrZdOoN2ytL6volppyXP7jS50X0Ll6JLvLYX=s1600', false, 4, 'pk 21 nkolbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T22LcHKJoSzxBzpuIfWt-l0nUkRSDMKALUtlWyfGjlGOTSs8IanGTChDsb0pL6lGzQdDnYEbyqo4ky30WUd-yI1q0IxU7_VBtOzrZdOoN2ytL6volppyXP7jS50X0Ll6JLvLYX=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T22LcHKJoSzxBzpuIfWt-l0nUkRSDMKALUtlWyfGjlGOTSs8IanGTChDsb0pL6lGzQdDnYEbyqo4ky30WUd-yI1q0IxU7_VBtOzrZdOoN2ytL6volppyXP7jS50X0Ll6JLvLYX=s1600-n-k-no', false, 5, 'pk 21 nkolbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QITEyB8Axrh3RQ7hwq_NxnrZHbyesg_buCiSN8ViHtZUWsnA02yeVRtAXUaBv8KQtgB6dfLHZ2j_qlo5a_2mflivbVVIG77mT9_2Y8-xAMrQMJKGv40X2vcvXk4qv2KKU976l9=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QITEyB8Axrh3RQ7hwq_NxnrZHbyesg_buCiSN8ViHtZUWsnA02yeVRtAXUaBv8KQtgB6dfLHZ2j_qlo5a_2mflivbVVIG77mT9_2Y8-xAMrQMJKGv40X2vcvXk4qv2KKU976l9=s1600', false, 6, 'pk 21 nkolbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QITEyB8Axrh3RQ7hwq_NxnrZHbyesg_buCiSN8ViHtZUWsnA02yeVRtAXUaBv8KQtgB6dfLHZ2j_qlo5a_2mflivbVVIG77mT9_2Y8-xAMrQMJKGv40X2vcvXk4qv2KKU976l9=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QITEyB8Axrh3RQ7hwq_NxnrZHbyesg_buCiSN8ViHtZUWsnA02yeVRtAXUaBv8KQtgB6dfLHZ2j_qlo5a_2mflivbVVIG77mT9_2Y8-xAMrQMJKGv40X2vcvXk4qv2KKU976l9=s1600-n-k-no', false, 7, 'pk 21 nkolbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qn4QOkQgy64nh0U9ZNN4Z8R96JoaLssmM8fpGeUCJVwVXxH_9Kjg3332Deu7jh3Lwt9CoDLwWyGlSwKwEn5BYDcdHHa51jlKK0Eq6rRMoX_Hhrx-zbVXcyY74toZagOKIDO1QWjw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qn4QOkQgy64nh0U9ZNN4Z8R96JoaLssmM8fpGeUCJVwVXxH_9Kjg3332Deu7jh3Lwt9CoDLwWyGlSwKwEn5BYDcdHHa51jlKK0Eq6rRMoX_Hhrx-zbVXcyY74toZagOKIDO1QWjw=s1600', false, 8, 'pk 21 nkolbong')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qn4QOkQgy64nh0U9ZNN4Z8R96JoaLssmM8fpGeUCJVwVXxH_9Kjg3332Deu7jh3Lwt9CoDLwWyGlSwKwEn5BYDcdHHa51jlKK0Eq6rRMoX_Hhrx-zbVXcyY74toZagOKIDO1QWjw=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qn4QOkQgy64nh0U9ZNN4Z8R96JoaLssmM8fpGeUCJVwVXxH_9Kjg3332Deu7jh3Lwt9CoDLwWyGlSwKwEn5BYDcdHHa51jlKK0Eq6rRMoX_Hhrx-zbVXcyY74toZagOKIDO1QWjw=s1600-n-k-no', false, 9, 'pk 21 nkolbong')
  on conflict do nothing;

  -- [141] Refuge Des Princes (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'refuge-des-princes-yassa',
    'apartment',
    'published',
    'Refuge Des Princes',
    'Refuge Des Princes
Adresse : Scierie de Yatchika, Yassa, Douala.
Contact / WhatsApp : +237699493949.
Note Google Maps : 4.7/5 (15 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Scierie de Yatchika, Yassa, Douala',
    3.9723036,
    9.7991191,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLctreLwMxphSvgOMMum-LxlDhLznJBWx2_IQaDr8lFyejJtwlTfY_Sl2dOzIRALb4_1vuAuhpd_-9XREfywI1QeQGHuipkOGFn7n8qviVOO8ytCVSTZhhGPBQHt2bfQlUsMa8Fbq9aaVGyn=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLctreLwMxphSvgOMMum-LxlDhLznJBWx2_IQaDr8lFyejJtwlTfY_Sl2dOzIRALb4_1vuAuhpd_-9XREfywI1QeQGHuipkOGFn7n8qviVOO8ytCVSTZhhGPBQHt2bfQlUsMa8Fbq9aaVGyn=s1600', true, 0, 'Refuge Des Princes')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLctreLwMxphSvgOMMum-LxlDhLznJBWx2_IQaDr8lFyejJtwlTfY_Sl2dOzIRALb4_1vuAuhpd_-9XREfywI1QeQGHuipkOGFn7n8qviVOO8ytCVSTZhhGPBQHt2bfQlUsMa8Fbq9aaVGyn=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLctreLwMxphSvgOMMum-LxlDhLznJBWx2_IQaDr8lFyejJtwlTfY_Sl2dOzIRALb4_1vuAuhpd_-9XREfywI1QeQGHuipkOGFn7n8qviVOO8ytCVSTZhhGPBQHt2bfQlUsMa8Fbq9aaVGyn=s1600-p-k-no', false, 1, 'Refuge Des Princes')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SqL1t9Bde3cYv5rDkbIVNb8c6axV2CWle5jPz5PHbzPOLLJKL8N8dWHxlpRAKd9DtIOaQmk__zjaFY5MaVTjKQslGSJJrJC3n2b6eEN6PlyGBpxii-tbFGY02fc5ZqCGUt5rqzhMMX73bE=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SqL1t9Bde3cYv5rDkbIVNb8c6axV2CWle5jPz5PHbzPOLLJKL8N8dWHxlpRAKd9DtIOaQmk__zjaFY5MaVTjKQslGSJJrJC3n2b6eEN6PlyGBpxii-tbFGY02fc5ZqCGUt5rqzhMMX73bE=s1600', false, 2, 'Refuge Des Princes')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SqL1t9Bde3cYv5rDkbIVNb8c6axV2CWle5jPz5PHbzPOLLJKL8N8dWHxlpRAKd9DtIOaQmk__zjaFY5MaVTjKQslGSJJrJC3n2b6eEN6PlyGBpxii-tbFGY02fc5ZqCGUt5rqzhMMX73bE=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SqL1t9Bde3cYv5rDkbIVNb8c6axV2CWle5jPz5PHbzPOLLJKL8N8dWHxlpRAKd9DtIOaQmk__zjaFY5MaVTjKQslGSJJrJC3n2b6eEN6PlyGBpxii-tbFGY02fc5ZqCGUt5rqzhMMX73bE=s1600-n-k-no', false, 3, 'Refuge Des Princes')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TIZUziseGFAlx9s69g3WucSwSp70uX2qazsbPyuSzztYFkm3ws2NJcDeBstzzhYb_0nKOGIo11pIH2hDlT3-LmPO6Z0bqyjy91V-Do-AOHqH5n8YKDwK8QsgZClLnUW46LhUjNLvIJXCQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TIZUziseGFAlx9s69g3WucSwSp70uX2qazsbPyuSzztYFkm3ws2NJcDeBstzzhYb_0nKOGIo11pIH2hDlT3-LmPO6Z0bqyjy91V-Do-AOHqH5n8YKDwK8QsgZClLnUW46LhUjNLvIJXCQ=s1600', false, 4, 'Refuge Des Princes')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TIZUziseGFAlx9s69g3WucSwSp70uX2qazsbPyuSzztYFkm3ws2NJcDeBstzzhYb_0nKOGIo11pIH2hDlT3-LmPO6Z0bqyjy91V-Do-AOHqH5n8YKDwK8QsgZClLnUW46LhUjNLvIJXCQ=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TIZUziseGFAlx9s69g3WucSwSp70uX2qazsbPyuSzztYFkm3ws2NJcDeBstzzhYb_0nKOGIo11pIH2hDlT3-LmPO6Z0bqyjy91V-Do-AOHqH5n8YKDwK8QsgZClLnUW46LhUjNLvIJXCQ=s1600-n-k-no', false, 5, 'Refuge Des Princes')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QeOBeB17DBcAAU4UFn2r_bw_mx23ok1Ts_iBsi0A-JS0eZ15eNldYBTe4NeeRUwJuGlfPh6mvXWRz0e-zVpTj5RdoX0YELoxKxF4PE6iV7Vld4LIP3uMJoj8XSaHWTPdJ5GSbwJKcm-ig=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QeOBeB17DBcAAU4UFn2r_bw_mx23ok1Ts_iBsi0A-JS0eZ15eNldYBTe4NeeRUwJuGlfPh6mvXWRz0e-zVpTj5RdoX0YELoxKxF4PE6iV7Vld4LIP3uMJoj8XSaHWTPdJ5GSbwJKcm-ig=s1600', false, 6, 'Refuge Des Princes')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QeOBeB17DBcAAU4UFn2r_bw_mx23ok1Ts_iBsi0A-JS0eZ15eNldYBTe4NeeRUwJuGlfPh6mvXWRz0e-zVpTj5RdoX0YELoxKxF4PE6iV7Vld4LIP3uMJoj8XSaHWTPdJ5GSbwJKcm-ig=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QeOBeB17DBcAAU4UFn2r_bw_mx23ok1Ts_iBsi0A-JS0eZ15eNldYBTe4NeeRUwJuGlfPh6mvXWRz0e-zVpTj5RdoX0YELoxKxF4PE6iV7Vld4LIP3uMJoj8XSaHWTPdJ5GSbwJKcm-ig=s1600-n-k-no', false, 7, 'Refuge Des Princes')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S6KO0nUe1dpoHwFlRpj20ABsC3QRirI5PbeLtc-Be574yPed6A-zz2FdqgdlKF5U6e39wZ5jCwy-OACAKh646mo7uOjnq4nxMczz6k1_EgEeqBWK39jzAftpb0U6pVC7NmvJiJYw7TSYZ9=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S6KO0nUe1dpoHwFlRpj20ABsC3QRirI5PbeLtc-Be574yPed6A-zz2FdqgdlKF5U6e39wZ5jCwy-OACAKh646mo7uOjnq4nxMczz6k1_EgEeqBWK39jzAftpb0U6pVC7NmvJiJYw7TSYZ9=s1600', false, 8, 'Refuge Des Princes')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S6KO0nUe1dpoHwFlRpj20ABsC3QRirI5PbeLtc-Be574yPed6A-zz2FdqgdlKF5U6e39wZ5jCwy-OACAKh646mo7uOjnq4nxMczz6k1_EgEeqBWK39jzAftpb0U6pVC7NmvJiJYw7TSYZ9=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S6KO0nUe1dpoHwFlRpj20ABsC3QRirI5PbeLtc-Be574yPed6A-zz2FdqgdlKF5U6e39wZ5jCwy-OACAKh646mo7uOjnq4nxMczz6k1_EgEeqBWK39jzAftpb0U6pVC7NmvJiJYw7TSYZ9=s1600-n-k-no', false, 9, 'Refuge Des Princes')
  on conflict do nothing;

  -- [142] Studio Meublé Yassa - One-Bedroom House (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'studio-meuble-yassa-one-bedroom-house-yassa',
    'studio',
    'published',
    'Studio Meublé Yassa - One-Bedroom House',
    'Studio Meublé Yassa - One-Bedroom House
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    3.98494,
    9.8128901,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2mXVRfEcAb-KxRbKNf05IZ3agB7jiATApOpAFhojtIpXZW1eYMNUTz8JVdRyiYEZC-Fh-LHkAdFDwY0ZJjCX9NLQj-5NgyZ93bIDqGi7MWqbsA-CoFg3hBq3pr-lWmDZNt5yQSCWhp07CHazaZt2cFuSi6tt0O20RGvIrQp6r3Rb6tOrOoWclhig=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2mXVRfEcAb-KxRbKNf05IZ3agB7jiATApOpAFhojtIpXZW1eYMNUTz8JVdRyiYEZC-Fh-LHkAdFDwY0ZJjCX9NLQj-5NgyZ93bIDqGi7MWqbsA-CoFg3hBq3pr-lWmDZNt5yQSCWhp07CHazaZt2cFuSi6tt0O20RGvIrQp6r3Rb6tOrOoWclhig=s1600', true, 0, 'Studio Meublé Yassa - One-Bedroom House')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2mXVRfEcAb-KxRbKNf05IZ3agB7jiATApOpAFhojtIpXZW1eYMNUTz8JVdRyiYEZC-Fh-LHkAdFDwY0ZJjCX9NLQj-5NgyZ93bIDqGi7MWqbsA-CoFg3hBq3pr-lWmDZNt5yQSCWhp07CHazaZt2cFuSi6tt0O20RGvIrQp6r3Rb6tOrOoWclhig=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2mXVRfEcAb-KxRbKNf05IZ3agB7jiATApOpAFhojtIpXZW1eYMNUTz8JVdRyiYEZC-Fh-LHkAdFDwY0ZJjCX9NLQj-5NgyZ93bIDqGi7MWqbsA-CoFg3hBq3pr-lWmDZNt5yQSCWhp07CHazaZt2cFuSi6tt0O20RGvIrQp6r3Rb6tOrOoWclhig=s1600-p-k-no', false, 1, 'Studio Meublé Yassa - One-Bedroom House')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFAO9O9HSxyKg2pu70PODcMMB2dww9hCXJJHsECI6p6OVPruONjxRbZXwzzldgWXxa6yxfHug0gzk468UTX64tZ_LQG69KQooXW6e2o4PqZS8yOOfwT8drj3BG-7KAwdCXXD7g5415FKjHcnKYzR-6iAva2Q7CeWqlRbWX9UNlS2wJg7wu_SNfmNQ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFAO9O9HSxyKg2pu70PODcMMB2dww9hCXJJHsECI6p6OVPruONjxRbZXwzzldgWXxa6yxfHug0gzk468UTX64tZ_LQG69KQooXW6e2o4PqZS8yOOfwT8drj3BG-7KAwdCXXD7g5415FKjHcnKYzR-6iAva2Q7CeWqlRbWX9UNlS2wJg7wu_SNfmNQ=s1600', false, 2, 'Studio Meublé Yassa - One-Bedroom House')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFAO9O9HSxyKg2pu70PODcMMB2dww9hCXJJHsECI6p6OVPruONjxRbZXwzzldgWXxa6yxfHug0gzk468UTX64tZ_LQG69KQooXW6e2o4PqZS8yOOfwT8drj3BG-7KAwdCXXD7g5415FKjHcnKYzR-6iAva2Q7CeWqlRbWX9UNlS2wJg7wu_SNfmNQ=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFAO9O9HSxyKg2pu70PODcMMB2dww9hCXJJHsECI6p6OVPruONjxRbZXwzzldgWXxa6yxfHug0gzk468UTX64tZ_LQG69KQooXW6e2o4PqZS8yOOfwT8drj3BG-7KAwdCXXD7g5415FKjHcnKYzR-6iAva2Q7CeWqlRbWX9UNlS2wJg7wu_SNfmNQ=s1600-n-k-no', false, 3, 'Studio Meublé Yassa - One-Bedroom House')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHVg2n2YDvb3ZbeyC_Rerj-HNjwY0qT_KUsFMySYcx41AvCWMy_0-6xGkVtGv57YoKBNta-mMck57rOt6HsKagLIjuvj68QtXeq20CIuYrzOuVdQy_PRxTOWDyP3IjhHygUz76md5mfA-lTPn8FOgIsQyVEzKairKwsdkEzwUPva3qT3GXm3D9vkw=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHVg2n2YDvb3ZbeyC_Rerj-HNjwY0qT_KUsFMySYcx41AvCWMy_0-6xGkVtGv57YoKBNta-mMck57rOt6HsKagLIjuvj68QtXeq20CIuYrzOuVdQy_PRxTOWDyP3IjhHygUz76md5mfA-lTPn8FOgIsQyVEzKairKwsdkEzwUPva3qT3GXm3D9vkw=s1600', false, 4, 'Studio Meublé Yassa - One-Bedroom House')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHVg2n2YDvb3ZbeyC_Rerj-HNjwY0qT_KUsFMySYcx41AvCWMy_0-6xGkVtGv57YoKBNta-mMck57rOt6HsKagLIjuvj68QtXeq20CIuYrzOuVdQy_PRxTOWDyP3IjhHygUz76md5mfA-lTPn8FOgIsQyVEzKairKwsdkEzwUPva3qT3GXm3D9vkw=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHVg2n2YDvb3ZbeyC_Rerj-HNjwY0qT_KUsFMySYcx41AvCWMy_0-6xGkVtGv57YoKBNta-mMck57rOt6HsKagLIjuvj68QtXeq20CIuYrzOuVdQy_PRxTOWDyP3IjhHygUz76md5mfA-lTPn8FOgIsQyVEzKairKwsdkEzwUPva3qT3GXm3D9vkw=s1600-n-k-no', false, 5, 'Studio Meublé Yassa - One-Bedroom House')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHRLEDj3Cauxa0zKxissFeOiB5h5v7KWuZmnoyQmtL-MF8pq1P64t72W5XIkUEQHaSL3Ih6U8y1DKCpXh8gQ3f8Usw6Fp1YbRNcoaxcO9PB1vy54O6V0BSrLvgHj1nqOgs7G7YX4hU0fiSOPlUY7iDU9OwI4r_TrYvpH9M7M-LiVYkXoVOPJkYT=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHRLEDj3Cauxa0zKxissFeOiB5h5v7KWuZmnoyQmtL-MF8pq1P64t72W5XIkUEQHaSL3Ih6U8y1DKCpXh8gQ3f8Usw6Fp1YbRNcoaxcO9PB1vy54O6V0BSrLvgHj1nqOgs7G7YX4hU0fiSOPlUY7iDU9OwI4r_TrYvpH9M7M-LiVYkXoVOPJkYT=s1600', false, 6, 'Studio Meublé Yassa - One-Bedroom House')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHRLEDj3Cauxa0zKxissFeOiB5h5v7KWuZmnoyQmtL-MF8pq1P64t72W5XIkUEQHaSL3Ih6U8y1DKCpXh8gQ3f8Usw6Fp1YbRNcoaxcO9PB1vy54O6V0BSrLvgHj1nqOgs7G7YX4hU0fiSOPlUY7iDU9OwI4r_TrYvpH9M7M-LiVYkXoVOPJkYT=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHRLEDj3Cauxa0zKxissFeOiB5h5v7KWuZmnoyQmtL-MF8pq1P64t72W5XIkUEQHaSL3Ih6U8y1DKCpXh8gQ3f8Usw6Fp1YbRNcoaxcO9PB1vy54O6V0BSrLvgHj1nqOgs7G7YX4hU0fiSOPlUY7iDU9OwI4r_TrYvpH9M7M-LiVYkXoVOPJkYT=s1600-n-k-no', false, 7, 'Studio Meublé Yassa - One-Bedroom House')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhE9nfnN9fL7QMtK7lMZwF9xVHvdvsgB5axZSiQ50rkCoTv67SiwYb6FBeJrZoJVhD8WFFCgTqhtdFYblLjMbBdWysh2thi1sumXk-eExCHmIBNFDurNMGYdrIp07dREACMlAkkwbcwXsGfSKYfiA-llqrnMHmKEWCOwMfgPB5PQ0iU5dcgPZw92=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhE9nfnN9fL7QMtK7lMZwF9xVHvdvsgB5axZSiQ50rkCoTv67SiwYb6FBeJrZoJVhD8WFFCgTqhtdFYblLjMbBdWysh2thi1sumXk-eExCHmIBNFDurNMGYdrIp07dREACMlAkkwbcwXsGfSKYfiA-llqrnMHmKEWCOwMfgPB5PQ0iU5dcgPZw92=s1600', false, 8, 'Studio Meublé Yassa - One-Bedroom House')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhE9nfnN9fL7QMtK7lMZwF9xVHvdvsgB5axZSiQ50rkCoTv67SiwYb6FBeJrZoJVhD8WFFCgTqhtdFYblLjMbBdWysh2thi1sumXk-eExCHmIBNFDurNMGYdrIp07dREACMlAkkwbcwXsGfSKYfiA-llqrnMHmKEWCOwMfgPB5PQ0iU5dcgPZw92=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhE9nfnN9fL7QMtK7lMZwF9xVHvdvsgB5axZSiQ50rkCoTv67SiwYb6FBeJrZoJVhD8WFFCgTqhtdFYblLjMbBdWysh2thi1sumXk-eExCHmIBNFDurNMGYdrIp07dREACMlAkkwbcwXsGfSKYfiA-llqrnMHmKEWCOwMfgPB5PQ0iU5dcgPZw92=s1600-n-k-no', false, 9, 'Studio Meublé Yassa - One-Bedroom House')
  on conflict do nothing;

  -- [143] Malaysia Meublée Lounge (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'malaysia-meublee-lounge-yassa',
    'apartment',
    'published',
    'Malaysia Meublée Lounge',
    'Malaysia Meublée Lounge
Catégorie : Résidence hôtelière.
Adresse : 15m avant les Logements Sociaux et 100m après Enéo, Carrefour Soya, Yassa, Douala.
Contact / WhatsApp : +237676192084.
Note Google Maps : 5/5 (1 avis).

Avis clients récents :
- "Note sans commentaire écrit." (rossini fontsa, note 5/5)
- "Note sans commentaire écrit." (rossini fontsa, note 5/5)
- "Note sans commentaire écrit." (rossini fontsa, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '15m avant les Logements Sociaux et 100m après Enéo, Carrefour Soya, Yassa, Douala',
    4.0072038,
    9.7947801,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfhD5tFWBs7allIkxpPnFT4okCt-DqHHkW8EOaJt4pE9D8oLUEzBr0P5RNHE1R60EO9kvc3DJk9F78d4f4ngNsTSZOUlr8VLc7SSFm42Gia8-Rk2lU9BVk_T2Pr8X-FhASMYtDAy2FSu73z=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfhD5tFWBs7allIkxpPnFT4okCt-DqHHkW8EOaJt4pE9D8oLUEzBr0P5RNHE1R60EO9kvc3DJk9F78d4f4ngNsTSZOUlr8VLc7SSFm42Gia8-Rk2lU9BVk_T2Pr8X-FhASMYtDAy2FSu73z=s1600', true, 0, 'Malaysia Meublée Lounge')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLfhD5tFWBs7allIkxpPnFT4okCt-DqHHkW8EOaJt4pE9D8oLUEzBr0P5RNHE1R60EO9kvc3DJk9F78d4f4ngNsTSZOUlr8VLc7SSFm42Gia8-Rk2lU9BVk_T2Pr8X-FhASMYtDAy2FSu73z=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLfhD5tFWBs7allIkxpPnFT4okCt-DqHHkW8EOaJt4pE9D8oLUEzBr0P5RNHE1R60EO9kvc3DJk9F78d4f4ngNsTSZOUlr8VLc7SSFm42Gia8-Rk2lU9BVk_T2Pr8X-FhASMYtDAy2FSu73z=s1600-p-k-no', false, 1, 'Malaysia Meublée Lounge')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QZM_hU6b3Se8YFtf9ctxD4dKkfccXtGdRMYtz8yXhlJqxU7TE-A5wZIYN0Kf6xX9uNS-FmzsUfLwpJZIVTTzaicxXP1RO1Ors7TFN6hKJWbVKNvF_BiACqL6zlbw18u_iQv5GPdj5wb4gU=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QZM_hU6b3Se8YFtf9ctxD4dKkfccXtGdRMYtz8yXhlJqxU7TE-A5wZIYN0Kf6xX9uNS-FmzsUfLwpJZIVTTzaicxXP1RO1Ors7TFN6hKJWbVKNvF_BiACqL6zlbw18u_iQv5GPdj5wb4gU=s1600', false, 2, 'Malaysia Meublée Lounge')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QZM_hU6b3Se8YFtf9ctxD4dKkfccXtGdRMYtz8yXhlJqxU7TE-A5wZIYN0Kf6xX9uNS-FmzsUfLwpJZIVTTzaicxXP1RO1Ors7TFN6hKJWbVKNvF_BiACqL6zlbw18u_iQv5GPdj5wb4gU=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QZM_hU6b3Se8YFtf9ctxD4dKkfccXtGdRMYtz8yXhlJqxU7TE-A5wZIYN0Kf6xX9uNS-FmzsUfLwpJZIVTTzaicxXP1RO1Ors7TFN6hKJWbVKNvF_BiACqL6zlbw18u_iQv5GPdj5wb4gU=s1600-n-k-no', false, 3, 'Malaysia Meublée Lounge')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R8_n9GXkavH88msYhlEAWS9W5Ya-f1wEbg1DCEDo4ZfR_pPvEoLgeXujQDoHpXEyGMtptjAsDK8rZp0jng60CTtrmm71TJ7-qPoIAtDIAFqlvn4BVJmh14L9dd6IJwFMNZTnkAJO3oDWc=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R8_n9GXkavH88msYhlEAWS9W5Ya-f1wEbg1DCEDo4ZfR_pPvEoLgeXujQDoHpXEyGMtptjAsDK8rZp0jng60CTtrmm71TJ7-qPoIAtDIAFqlvn4BVJmh14L9dd6IJwFMNZTnkAJO3oDWc=s1600', false, 4, 'Malaysia Meublée Lounge')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R8_n9GXkavH88msYhlEAWS9W5Ya-f1wEbg1DCEDo4ZfR_pPvEoLgeXujQDoHpXEyGMtptjAsDK8rZp0jng60CTtrmm71TJ7-qPoIAtDIAFqlvn4BVJmh14L9dd6IJwFMNZTnkAJO3oDWc=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R8_n9GXkavH88msYhlEAWS9W5Ya-f1wEbg1DCEDo4ZfR_pPvEoLgeXujQDoHpXEyGMtptjAsDK8rZp0jng60CTtrmm71TJ7-qPoIAtDIAFqlvn4BVJmh14L9dd6IJwFMNZTnkAJO3oDWc=s1600-n-k-no', false, 5, 'Malaysia Meublée Lounge')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QcmutjbDNvZWtSgWBUtAWNshpr4Wp1O_6tQGermVV_H3htHMKorqDqINOZAsC5YA7zbl-Z3-Pu1mbKIZ1estgpHpBPukjCX2V65zAOUt7o_VWyMzWtskdqcxgnIFjyvW17xgkGkWuOCowT=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QcmutjbDNvZWtSgWBUtAWNshpr4Wp1O_6tQGermVV_H3htHMKorqDqINOZAsC5YA7zbl-Z3-Pu1mbKIZ1estgpHpBPukjCX2V65zAOUt7o_VWyMzWtskdqcxgnIFjyvW17xgkGkWuOCowT=s1600', false, 6, 'Malaysia Meublée Lounge')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QcmutjbDNvZWtSgWBUtAWNshpr4Wp1O_6tQGermVV_H3htHMKorqDqINOZAsC5YA7zbl-Z3-Pu1mbKIZ1estgpHpBPukjCX2V65zAOUt7o_VWyMzWtskdqcxgnIFjyvW17xgkGkWuOCowT=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QcmutjbDNvZWtSgWBUtAWNshpr4Wp1O_6tQGermVV_H3htHMKorqDqINOZAsC5YA7zbl-Z3-Pu1mbKIZ1estgpHpBPukjCX2V65zAOUt7o_VWyMzWtskdqcxgnIFjyvW17xgkGkWuOCowT=s1600-n-k-no', false, 7, 'Malaysia Meublée Lounge')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S-ZhkomC72OGYCBv8KQppCdte8Fplo6F2FzR7KJLQEZbXYhWFGYcr5IPRUTRmttqRM32ZaWkmlt2jMrxyRzaWcy5bz7yiI2Kcdcljllip0oF2AlsrIwXSaXRxbc-ycVScyxzuyp0RUiaE=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S-ZhkomC72OGYCBv8KQppCdte8Fplo6F2FzR7KJLQEZbXYhWFGYcr5IPRUTRmttqRM32ZaWkmlt2jMrxyRzaWcy5bz7yiI2Kcdcljllip0oF2AlsrIwXSaXRxbc-ycVScyxzuyp0RUiaE=s1600', false, 8, 'Malaysia Meublée Lounge')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S-ZhkomC72OGYCBv8KQppCdte8Fplo6F2FzR7KJLQEZbXYhWFGYcr5IPRUTRmttqRM32ZaWkmlt2jMrxyRzaWcy5bz7yiI2Kcdcljllip0oF2AlsrIwXSaXRxbc-ycVScyxzuyp0RUiaE=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S-ZhkomC72OGYCBv8KQppCdte8Fplo6F2FzR7KJLQEZbXYhWFGYcr5IPRUTRmttqRM32ZaWkmlt2jMrxyRzaWcy5bz7yiI2Kcdcljllip0oF2AlsrIwXSaXRxbc-ycVScyxzuyp0RUiaE=s1600-n-k-no', false, 9, 'Malaysia Meublée Lounge')
  on conflict do nothing;

  -- [144] Résidence KNM (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'residence-knm-yassa',
    'apartment',
    'published',
    'Résidence KNM',
    'Résidence KNM
Catégorie : Complexe d''appartements meublés.
Adresse : 676833513 /657300242/ 699904927 Douala, Yassa.
Note Google Maps : 3.9/5 (7 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Enikess Leroy, note 4/5)
- "Note sans commentaire écrit." (Elodie Ntsayo, note 4/5)
- "Note sans commentaire écrit." (Joelle Nancy, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '676833513 /657300242/ 699904927 Douala, Yassa',
    3.9635262,
    9.8127065,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLco-fu92nniyqH5bFjB5d1WxGg7FlJeE5gwnJn6bIpb6nFcyB6YBioD1z-WIyG74tAGwE2-iFIklHgmIpRX7UwvtZxNeQ4q-8cPLuuqVE-WiLAqgwBbOR0TPzMXEpoyBFjfHlq3ew=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLco-fu92nniyqH5bFjB5d1WxGg7FlJeE5gwnJn6bIpb6nFcyB6YBioD1z-WIyG74tAGwE2-iFIklHgmIpRX7UwvtZxNeQ4q-8cPLuuqVE-WiLAqgwBbOR0TPzMXEpoyBFjfHlq3ew=s1600', true, 0, 'Résidence KNM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLco-fu92nniyqH5bFjB5d1WxGg7FlJeE5gwnJn6bIpb6nFcyB6YBioD1z-WIyG74tAGwE2-iFIklHgmIpRX7UwvtZxNeQ4q-8cPLuuqVE-WiLAqgwBbOR0TPzMXEpoyBFjfHlq3ew=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLco-fu92nniyqH5bFjB5d1WxGg7FlJeE5gwnJn6bIpb6nFcyB6YBioD1z-WIyG74tAGwE2-iFIklHgmIpRX7UwvtZxNeQ4q-8cPLuuqVE-WiLAqgwBbOR0TPzMXEpoyBFjfHlq3ew=s1600-p-k-no', false, 1, 'Résidence KNM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q5LXj8hFKT4zXDAG-aHzKssCEfKv8RU5__8lbodfQuCkVwzP6qpvNT2a20VSVaJAnd2CLuexn_WomFJT7sAOtAS1R0yhje8Z-sZwYOE2a_JHKM5VPU6LWF_MqwFN5klCCFRaKl-w=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q5LXj8hFKT4zXDAG-aHzKssCEfKv8RU5__8lbodfQuCkVwzP6qpvNT2a20VSVaJAnd2CLuexn_WomFJT7sAOtAS1R0yhje8Z-sZwYOE2a_JHKM5VPU6LWF_MqwFN5klCCFRaKl-w=s1600', false, 2, 'Résidence KNM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q5LXj8hFKT4zXDAG-aHzKssCEfKv8RU5__8lbodfQuCkVwzP6qpvNT2a20VSVaJAnd2CLuexn_WomFJT7sAOtAS1R0yhje8Z-sZwYOE2a_JHKM5VPU6LWF_MqwFN5klCCFRaKl-w=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Q5LXj8hFKT4zXDAG-aHzKssCEfKv8RU5__8lbodfQuCkVwzP6qpvNT2a20VSVaJAnd2CLuexn_WomFJT7sAOtAS1R0yhje8Z-sZwYOE2a_JHKM5VPU6LWF_MqwFN5klCCFRaKl-w=s1600-n-k-no', false, 3, 'Résidence KNM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sv6rmpBAy5HpADAscWfTQqex4Pvbb3i8NGu0tR3u6dtRKj2uzEqGmGQu2WS8R678ouZK7nStHu9r50rHxRuCbFZB7mPP0eKWXBdT16QenR8LdqlmodNc-huTrZsnsaIBaUVZAsHg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sv6rmpBAy5HpADAscWfTQqex4Pvbb3i8NGu0tR3u6dtRKj2uzEqGmGQu2WS8R678ouZK7nStHu9r50rHxRuCbFZB7mPP0eKWXBdT16QenR8LdqlmodNc-huTrZsnsaIBaUVZAsHg=s1600', false, 4, 'Résidence KNM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sv6rmpBAy5HpADAscWfTQqex4Pvbb3i8NGu0tR3u6dtRKj2uzEqGmGQu2WS8R678ouZK7nStHu9r50rHxRuCbFZB7mPP0eKWXBdT16QenR8LdqlmodNc-huTrZsnsaIBaUVZAsHg=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sv6rmpBAy5HpADAscWfTQqex4Pvbb3i8NGu0tR3u6dtRKj2uzEqGmGQu2WS8R678ouZK7nStHu9r50rHxRuCbFZB7mPP0eKWXBdT16QenR8LdqlmodNc-huTrZsnsaIBaUVZAsHg=s1600-n-k-no', false, 5, 'Résidence KNM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TO5aZLkHkeHA0MDa5vm85OS28oG2othPlSBEILccQc6U-gReXlYV78__v6wGrM1x4UQ3ldPk1dGgPFAkw-0uvokil-BEn94wFo61Y6EiV2-mRVe8YB0xdjLe5bp2QCwOLIWUoqLA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TO5aZLkHkeHA0MDa5vm85OS28oG2othPlSBEILccQc6U-gReXlYV78__v6wGrM1x4UQ3ldPk1dGgPFAkw-0uvokil-BEn94wFo61Y6EiV2-mRVe8YB0xdjLe5bp2QCwOLIWUoqLA=s1600', false, 6, 'Résidence KNM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TO5aZLkHkeHA0MDa5vm85OS28oG2othPlSBEILccQc6U-gReXlYV78__v6wGrM1x4UQ3ldPk1dGgPFAkw-0uvokil-BEn94wFo61Y6EiV2-mRVe8YB0xdjLe5bp2QCwOLIWUoqLA=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TO5aZLkHkeHA0MDa5vm85OS28oG2othPlSBEILccQc6U-gReXlYV78__v6wGrM1x4UQ3ldPk1dGgPFAkw-0uvokil-BEn94wFo61Y6EiV2-mRVe8YB0xdjLe5bp2QCwOLIWUoqLA=s1600-n-k-no', false, 7, 'Résidence KNM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9ROLAW5aAFTHrncSKt1eF7hrnULtlG08LS-NqNZDFPOb0adsKSrxa5AaNAMfAA9lPCfZqBxbW3uaD9r9RWc_6fIgh7HMa7LGWMCeq7fVvu3RL-s5fkBvBXUGAcL412bIBZQDxA59g=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9ROLAW5aAFTHrncSKt1eF7hrnULtlG08LS-NqNZDFPOb0adsKSrxa5AaNAMfAA9lPCfZqBxbW3uaD9r9RWc_6fIgh7HMa7LGWMCeq7fVvu3RL-s5fkBvBXUGAcL412bIBZQDxA59g=s1600', false, 8, 'Résidence KNM')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9ROLAW5aAFTHrncSKt1eF7hrnULtlG08LS-NqNZDFPOb0adsKSrxa5AaNAMfAA9lPCfZqBxbW3uaD9r9RWc_6fIgh7HMa7LGWMCeq7fVvu3RL-s5fkBvBXUGAcL412bIBZQDxA59g=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9ROLAW5aAFTHrncSKt1eF7hrnULtlG08LS-NqNZDFPOb0adsKSrxa5AaNAMfAA9lPCfZqBxbW3uaD9r9RWc_6fIgh7HMa7LGWMCeq7fVvu3RL-s5fkBvBXUGAcL412bIBZQDxA59g=s1600-n-k-no', false, 9, 'Résidence KNM')
  on conflict do nothing;

  -- [145] Transit Lodge Douala (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'transit-lodge-douala-yassa',
    'apartment',
    'published',
    'Transit Lodge Douala',
    'Transit Lodge Douala
Catégorie : Complexe d''appartements meublés.
Adresse : Chefferie Banga Bakoko, Face Station Neptune Yassa, Douala.
Contact / WhatsApp : +237654172552.
Note Google Maps : 5/5 (4 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Gaspard Fanzeu, note 5/5)
- "Note sans commentaire écrit." (Claude EDUMA, note 5/5)
- "Note sans commentaire écrit." (Renaud Obama, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Chefferie Banga Bakoko, Face Station Neptune Yassa, Douala',
    4.0066961,
    9.8029595,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdokiZvBmXBCnU1jb3WlFAzkNZ0yJroIpgIN07a6UDHRcqOOtKfIFKv9UNRzd6fcsjz_DEg6xMXOFf5T6I3PdYHeyEDyJDaGjAM2XivwWcrpnzGQP8SN6xrp6hRJm9e-yYCz9T_WCQcnhsv=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdokiZvBmXBCnU1jb3WlFAzkNZ0yJroIpgIN07a6UDHRcqOOtKfIFKv9UNRzd6fcsjz_DEg6xMXOFf5T6I3PdYHeyEDyJDaGjAM2XivwWcrpnzGQP8SN6xrp6hRJm9e-yYCz9T_WCQcnhsv=s1600', true, 0, 'Transit Lodge Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdokiZvBmXBCnU1jb3WlFAzkNZ0yJroIpgIN07a6UDHRcqOOtKfIFKv9UNRzd6fcsjz_DEg6xMXOFf5T6I3PdYHeyEDyJDaGjAM2XivwWcrpnzGQP8SN6xrp6hRJm9e-yYCz9T_WCQcnhsv=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdokiZvBmXBCnU1jb3WlFAzkNZ0yJroIpgIN07a6UDHRcqOOtKfIFKv9UNRzd6fcsjz_DEg6xMXOFf5T6I3PdYHeyEDyJDaGjAM2XivwWcrpnzGQP8SN6xrp6hRJm9e-yYCz9T_WCQcnhsv=s1600-p-k-no', false, 1, 'Transit Lodge Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qk5WP3u0FMbheM-_59eEtOnzm2fhlaTyz7R95Fbw_vVh0aIX_cwvrMhJlKECIPSGlIRoIe0FX6vt_uvrv-ePo5SxbZpXkLmiHyKXUe321QmguJxG5zxAggJrFVh7oiT8cgzKCiQYYzUli_=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qk5WP3u0FMbheM-_59eEtOnzm2fhlaTyz7R95Fbw_vVh0aIX_cwvrMhJlKECIPSGlIRoIe0FX6vt_uvrv-ePo5SxbZpXkLmiHyKXUe321QmguJxG5zxAggJrFVh7oiT8cgzKCiQYYzUli_=s1600', false, 2, 'Transit Lodge Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qk5WP3u0FMbheM-_59eEtOnzm2fhlaTyz7R95Fbw_vVh0aIX_cwvrMhJlKECIPSGlIRoIe0FX6vt_uvrv-ePo5SxbZpXkLmiHyKXUe321QmguJxG5zxAggJrFVh7oiT8cgzKCiQYYzUli_=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Qk5WP3u0FMbheM-_59eEtOnzm2fhlaTyz7R95Fbw_vVh0aIX_cwvrMhJlKECIPSGlIRoIe0FX6vt_uvrv-ePo5SxbZpXkLmiHyKXUe321QmguJxG5zxAggJrFVh7oiT8cgzKCiQYYzUli_=s1600-n-k-no', false, 3, 'Transit Lodge Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rqa6yfxzZ_BqyE9WyvXCaVYLNGQkaXMgsPNO0nuifOjB8ODkSwiHkixqF03oRgAE7IbcrayFc4aXZIaFTSllQDh5CgN3Ru3WZLcR7qUmjZrHuL6mVK5UQsE9jXi5zk98nPbx8aJPLaKX4s=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rqa6yfxzZ_BqyE9WyvXCaVYLNGQkaXMgsPNO0nuifOjB8ODkSwiHkixqF03oRgAE7IbcrayFc4aXZIaFTSllQDh5CgN3Ru3WZLcR7qUmjZrHuL6mVK5UQsE9jXi5zk98nPbx8aJPLaKX4s=s1600', false, 4, 'Transit Lodge Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rqa6yfxzZ_BqyE9WyvXCaVYLNGQkaXMgsPNO0nuifOjB8ODkSwiHkixqF03oRgAE7IbcrayFc4aXZIaFTSllQDh5CgN3Ru3WZLcR7qUmjZrHuL6mVK5UQsE9jXi5zk98nPbx8aJPLaKX4s=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rqa6yfxzZ_BqyE9WyvXCaVYLNGQkaXMgsPNO0nuifOjB8ODkSwiHkixqF03oRgAE7IbcrayFc4aXZIaFTSllQDh5CgN3Ru3WZLcR7qUmjZrHuL6mVK5UQsE9jXi5zk98nPbx8aJPLaKX4s=s1600-n-k-no', false, 5, 'Transit Lodge Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TrMkhk7RlKRzbbMwyRu7zF0jZxsqROpYnSV_TKUowo_4QC6WUAikaa6i7Vnp3Ot0SbRi7DPUvKP8NSJ9w7p07bDFsa7OWHbtxmItG73Rk-qyEAAQK3NezUfQQiuJTP9_8iRNxqCRi-oKKG=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TrMkhk7RlKRzbbMwyRu7zF0jZxsqROpYnSV_TKUowo_4QC6WUAikaa6i7Vnp3Ot0SbRi7DPUvKP8NSJ9w7p07bDFsa7OWHbtxmItG73Rk-qyEAAQK3NezUfQQiuJTP9_8iRNxqCRi-oKKG=s1600', false, 6, 'Transit Lodge Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TrMkhk7RlKRzbbMwyRu7zF0jZxsqROpYnSV_TKUowo_4QC6WUAikaa6i7Vnp3Ot0SbRi7DPUvKP8NSJ9w7p07bDFsa7OWHbtxmItG73Rk-qyEAAQK3NezUfQQiuJTP9_8iRNxqCRi-oKKG=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TrMkhk7RlKRzbbMwyRu7zF0jZxsqROpYnSV_TKUowo_4QC6WUAikaa6i7Vnp3Ot0SbRi7DPUvKP8NSJ9w7p07bDFsa7OWHbtxmItG73Rk-qyEAAQK3NezUfQQiuJTP9_8iRNxqCRi-oKKG=s1600-n-k-no', false, 7, 'Transit Lodge Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RAxgjH9D3_BiBRAjE0xvzcRW_q-ySd_K2e-KCDWftUboSdRB5kt8TgCVOwE9eDtFxiONTamVZjozcWjjqVxdqNzsEIZdAgR2OeKZ9GbAKm4SZ9J2dnxfo4s0abQ2sRmShxeBb2tGcNWE0Q=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RAxgjH9D3_BiBRAjE0xvzcRW_q-ySd_K2e-KCDWftUboSdRB5kt8TgCVOwE9eDtFxiONTamVZjozcWjjqVxdqNzsEIZdAgR2OeKZ9GbAKm4SZ9J2dnxfo4s0abQ2sRmShxeBb2tGcNWE0Q=s1600', false, 8, 'Transit Lodge Douala')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RAxgjH9D3_BiBRAjE0xvzcRW_q-ySd_K2e-KCDWftUboSdRB5kt8TgCVOwE9eDtFxiONTamVZjozcWjjqVxdqNzsEIZdAgR2OeKZ9GbAKm4SZ9J2dnxfo4s0abQ2sRmShxeBb2tGcNWE0Q=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RAxgjH9D3_BiBRAjE0xvzcRW_q-ySd_K2e-KCDWftUboSdRB5kt8TgCVOwE9eDtFxiONTamVZjozcWjjqVxdqNzsEIZdAgR2OeKZ9GbAKm4SZ9J2dnxfo4s0abQ2sRmShxeBb2tGcNWE0Q=s1600-n-k-no', false, 9, 'Transit Lodge Douala')
  on conflict do nothing;

  -- [146] Dom City appartement et chambres meublés Yassa Douala - Two-Bedroom Apartment With Balcony And Terrace (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'dom-city-appartement-et-chambres-meubles-yassa-douala-two-bedroom-apartment',
    'room',
    'published',
    'Dom City appartement et chambres meublés Yassa Douala - Two-Bedroom Apartment With Balcony And Terrace',
    'Dom City appartement et chambres meublés Yassa Douala - Two-Bedroom Apartment With Balcony And Terrace
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    3.9946,
    9.7783404,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2PjOh_28hM-W75VhnA9wAtvSv41sHhlDXcHquZzZ53eJXYTTMasKVxRKyFMsZN4EfTqC_FSq_HDdEqWL7epJg3DtJfXsoVOez2Kt8hKjKyPoLceuw7sLRlof2KlRyUsnmyEcE02-Hv6ze8AfNWz5Ryru6oq4YUdwlyJl98VODwxauUBY3hh9YBVw=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2PjOh_28hM-W75VhnA9wAtvSv41sHhlDXcHquZzZ53eJXYTTMasKVxRKyFMsZN4EfTqC_FSq_HDdEqWL7epJg3DtJfXsoVOez2Kt8hKjKyPoLceuw7sLRlof2KlRyUsnmyEcE02-Hv6ze8AfNWz5Ryru6oq4YUdwlyJl98VODwxauUBY3hh9YBVw=s1600', true, 0, 'Dom City appartement et chambres meublés Yassa Douala - Two-Bedroom Apartment With Balcony And Terrace')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2PjOh_28hM-W75VhnA9wAtvSv41sHhlDXcHquZzZ53eJXYTTMasKVxRKyFMsZN4EfTqC_FSq_HDdEqWL7epJg3DtJfXsoVOez2Kt8hKjKyPoLceuw7sLRlof2KlRyUsnmyEcE02-Hv6ze8AfNWz5Ryru6oq4YUdwlyJl98VODwxauUBY3hh9YBVw=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2PjOh_28hM-W75VhnA9wAtvSv41sHhlDXcHquZzZ53eJXYTTMasKVxRKyFMsZN4EfTqC_FSq_HDdEqWL7epJg3DtJfXsoVOez2Kt8hKjKyPoLceuw7sLRlof2KlRyUsnmyEcE02-Hv6ze8AfNWz5Ryru6oq4YUdwlyJl98VODwxauUBY3hh9YBVw=s1600-p-k-no', false, 1, 'Dom City appartement et chambres meublés Yassa Douala - Two-Bedroom Apartment With Balcony And Terrace')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGd_TzGjJRNE6KjUcrfBnEd_serwJwqVs4_z85_wRlTu4UTBCJX8kYB0Cilur2pStfhBpT5iUb9RfQiN9wjvJtXwN5cx4Ok5-KVgRnM0Fmh1RtUTM43aRW0hBHCKGEF840d0evOPLAXK7dQOZPtjfpQU8_kZCwDMg5zFWnO9YXLKCXgOQhtJV0wQg=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGd_TzGjJRNE6KjUcrfBnEd_serwJwqVs4_z85_wRlTu4UTBCJX8kYB0Cilur2pStfhBpT5iUb9RfQiN9wjvJtXwN5cx4Ok5-KVgRnM0Fmh1RtUTM43aRW0hBHCKGEF840d0evOPLAXK7dQOZPtjfpQU8_kZCwDMg5zFWnO9YXLKCXgOQhtJV0wQg=s1600', false, 2, 'Dom City appartement et chambres meublés Yassa Douala - Two-Bedroom Apartment With Balcony And Terrace')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGd_TzGjJRNE6KjUcrfBnEd_serwJwqVs4_z85_wRlTu4UTBCJX8kYB0Cilur2pStfhBpT5iUb9RfQiN9wjvJtXwN5cx4Ok5-KVgRnM0Fmh1RtUTM43aRW0hBHCKGEF840d0evOPLAXK7dQOZPtjfpQU8_kZCwDMg5zFWnO9YXLKCXgOQhtJV0wQg=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGd_TzGjJRNE6KjUcrfBnEd_serwJwqVs4_z85_wRlTu4UTBCJX8kYB0Cilur2pStfhBpT5iUb9RfQiN9wjvJtXwN5cx4Ok5-KVgRnM0Fmh1RtUTM43aRW0hBHCKGEF840d0evOPLAXK7dQOZPtjfpQU8_kZCwDMg5zFWnO9YXLKCXgOQhtJV0wQg=s1600-n-k-no', false, 3, 'Dom City appartement et chambres meublés Yassa Douala - Two-Bedroom Apartment With Balcony And Terrace')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFbOZ_x8hDZ2Ua6--Cz9jSOVuQ4CKxbAPaKcrU0YeeM-hF-ZOOacHYK467HZ5jMdAWdP4iRE10D_thH1AkwEWUu_mhYVbtqELtXrZqX2944whtOFNP-4wkfWHXOVxQF3yXHxzbFQceljHPKxvOsL6DJiFCnDc98THv3A8VHigkKrNZX6uL5c1A=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFbOZ_x8hDZ2Ua6--Cz9jSOVuQ4CKxbAPaKcrU0YeeM-hF-ZOOacHYK467HZ5jMdAWdP4iRE10D_thH1AkwEWUu_mhYVbtqELtXrZqX2944whtOFNP-4wkfWHXOVxQF3yXHxzbFQceljHPKxvOsL6DJiFCnDc98THv3A8VHigkKrNZX6uL5c1A=s1600', false, 4, 'Dom City appartement et chambres meublés Yassa Douala - Two-Bedroom Apartment With Balcony And Terrace')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFbOZ_x8hDZ2Ua6--Cz9jSOVuQ4CKxbAPaKcrU0YeeM-hF-ZOOacHYK467HZ5jMdAWdP4iRE10D_thH1AkwEWUu_mhYVbtqELtXrZqX2944whtOFNP-4wkfWHXOVxQF3yXHxzbFQceljHPKxvOsL6DJiFCnDc98THv3A8VHigkKrNZX6uL5c1A=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFbOZ_x8hDZ2Ua6--Cz9jSOVuQ4CKxbAPaKcrU0YeeM-hF-ZOOacHYK467HZ5jMdAWdP4iRE10D_thH1AkwEWUu_mhYVbtqELtXrZqX2944whtOFNP-4wkfWHXOVxQF3yXHxzbFQceljHPKxvOsL6DJiFCnDc98THv3A8VHigkKrNZX6uL5c1A=s1600-n-k-no', false, 5, 'Dom City appartement et chambres meublés Yassa Douala - Two-Bedroom Apartment With Balcony And Terrace')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEZ6LrgHtIl8TbZMJo9RPIh4ZJjilHWBlGpZPSn-a7zidEfmTTj8mgXtdqAqBSyc6Cx7wlmRV6rEUf8oglBwFn62Szqx6lC4E0fkj0BsFID8q2eJSS4-SsJsxutHoZVq7us0n3i3qZ8xhrkKm2nITjB6DSExfUif93pqgVXiCXGO9GQTOJCEN9tOQ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEZ6LrgHtIl8TbZMJo9RPIh4ZJjilHWBlGpZPSn-a7zidEfmTTj8mgXtdqAqBSyc6Cx7wlmRV6rEUf8oglBwFn62Szqx6lC4E0fkj0BsFID8q2eJSS4-SsJsxutHoZVq7us0n3i3qZ8xhrkKm2nITjB6DSExfUif93pqgVXiCXGO9GQTOJCEN9tOQ=s1600', false, 6, 'Dom City appartement et chambres meublés Yassa Douala - Two-Bedroom Apartment With Balcony And Terrace')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEZ6LrgHtIl8TbZMJo9RPIh4ZJjilHWBlGpZPSn-a7zidEfmTTj8mgXtdqAqBSyc6Cx7wlmRV6rEUf8oglBwFn62Szqx6lC4E0fkj0BsFID8q2eJSS4-SsJsxutHoZVq7us0n3i3qZ8xhrkKm2nITjB6DSExfUif93pqgVXiCXGO9GQTOJCEN9tOQ=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEZ6LrgHtIl8TbZMJo9RPIh4ZJjilHWBlGpZPSn-a7zidEfmTTj8mgXtdqAqBSyc6Cx7wlmRV6rEUf8oglBwFn62Szqx6lC4E0fkj0BsFID8q2eJSS4-SsJsxutHoZVq7us0n3i3qZ8xhrkKm2nITjB6DSExfUif93pqgVXiCXGO9GQTOJCEN9tOQ=s1600-n-k-no', false, 7, 'Dom City appartement et chambres meublés Yassa Douala - Two-Bedroom Apartment With Balcony And Terrace')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhETSZrWO1KI9tWRMepvUUEmEif71fAkdfn-tiO23W27j-fpT4n5fIBhAeag4KXhgI11HHhnrKIplUFQWWuuPD5wnN7-209GJdV-MpCGTWtLuuvUYm4ynNVCIGP1Q8OD6B0DILX_EYQKW4gCxkcmozTdGuG4mbl-mgHLgThix7OszAq70f3ZPschZg=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhETSZrWO1KI9tWRMepvUUEmEif71fAkdfn-tiO23W27j-fpT4n5fIBhAeag4KXhgI11HHhnrKIplUFQWWuuPD5wnN7-209GJdV-MpCGTWtLuuvUYm4ynNVCIGP1Q8OD6B0DILX_EYQKW4gCxkcmozTdGuG4mbl-mgHLgThix7OszAq70f3ZPschZg=s1600', false, 8, 'Dom City appartement et chambres meublés Yassa Douala - Two-Bedroom Apartment With Balcony And Terrace')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhETSZrWO1KI9tWRMepvUUEmEif71fAkdfn-tiO23W27j-fpT4n5fIBhAeag4KXhgI11HHhnrKIplUFQWWuuPD5wnN7-209GJdV-MpCGTWtLuuvUYm4ynNVCIGP1Q8OD6B0DILX_EYQKW4gCxkcmozTdGuG4mbl-mgHLgThix7OszAq70f3ZPschZg=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhETSZrWO1KI9tWRMepvUUEmEif71fAkdfn-tiO23W27j-fpT4n5fIBhAeag4KXhgI11HHhnrKIplUFQWWuuPD5wnN7-209GJdV-MpCGTWtLuuvUYm4ynNVCIGP1Q8OD6B0DILX_EYQKW4gCxkcmozTdGuG4mbl-mgHLgThix7OszAq70f3ZPschZg=s1600-n-k-no', false, 9, 'Dom City appartement et chambres meublés Yassa Douala - Two-Bedroom Apartment With Balcony And Terrace')
  on conflict do nothing;

  -- [147] Appartements - Condos Meublés - Yassa Douala - WILMA HOUSE Comme chez vous (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'appartements-condos-meubles-yassa-douala-wilma-house-comme-chez-vous-yassa',
    'apartment',
    'published',
    'Appartements - Condos Meublés - Yassa Douala - WILMA HOUSE Comme chez vous',
    'Appartements - Condos Meublés - Yassa Douala - WILMA HOUSE Comme chez vous
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    3.9899621,
    9.7974167,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2Emc4w_EKhTqm7io_395JtjYiXePJGKqCJKaVDvVxVAW3k1DIhWcinlcuTYcsg1NOweV7wcNf1zgkC2GLdnbsYJbPapC2fskzN7IbJgPsAXa6BkFs3xjZHhWdeNaGAELijykR0pkXrMdEmDZmH087n0LGSDfPq4Mbt86k3eTl6NMrj6X71hUcU=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2Emc4w_EKhTqm7io_395JtjYiXePJGKqCJKaVDvVxVAW3k1DIhWcinlcuTYcsg1NOweV7wcNf1zgkC2GLdnbsYJbPapC2fskzN7IbJgPsAXa6BkFs3xjZHhWdeNaGAELijykR0pkXrMdEmDZmH087n0LGSDfPq4Mbt86k3eTl6NMrj6X71hUcU=s1600', true, 0, 'Appartements - Condos Meublés - Yassa Douala - WILMA HOUSE Comme chez vous')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2Emc4w_EKhTqm7io_395JtjYiXePJGKqCJKaVDvVxVAW3k1DIhWcinlcuTYcsg1NOweV7wcNf1zgkC2GLdnbsYJbPapC2fskzN7IbJgPsAXa6BkFs3xjZHhWdeNaGAELijykR0pkXrMdEmDZmH087n0LGSDfPq4Mbt86k3eTl6NMrj6X71hUcU=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW2Emc4w_EKhTqm7io_395JtjYiXePJGKqCJKaVDvVxVAW3k1DIhWcinlcuTYcsg1NOweV7wcNf1zgkC2GLdnbsYJbPapC2fskzN7IbJgPsAXa6BkFs3xjZHhWdeNaGAELijykR0pkXrMdEmDZmH087n0LGSDfPq4Mbt86k3eTl6NMrj6X71hUcU=s1600-p-k-no', false, 1, 'Appartements - Condos Meublés - Yassa Douala - WILMA HOUSE Comme chez vous')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHAB0Ers-FwpCLgFdLezjwujOMniHmSWZjiP1dL3gCxVmdq3WlUYkNuR62jFg1yMXOukw_dwu742pGZ4pCuj4Y18kbZcbppsTDApkbn2y8T6ceEcRyCil198KNj4BJuo89y_acR_tYSdm_E7kFeTsvM_G35hFnAWchurBiBk2IRWY60dagze3Ey=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHAB0Ers-FwpCLgFdLezjwujOMniHmSWZjiP1dL3gCxVmdq3WlUYkNuR62jFg1yMXOukw_dwu742pGZ4pCuj4Y18kbZcbppsTDApkbn2y8T6ceEcRyCil198KNj4BJuo89y_acR_tYSdm_E7kFeTsvM_G35hFnAWchurBiBk2IRWY60dagze3Ey=s1600', false, 2, 'Appartements - Condos Meublés - Yassa Douala - WILMA HOUSE Comme chez vous')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHAB0Ers-FwpCLgFdLezjwujOMniHmSWZjiP1dL3gCxVmdq3WlUYkNuR62jFg1yMXOukw_dwu742pGZ4pCuj4Y18kbZcbppsTDApkbn2y8T6ceEcRyCil198KNj4BJuo89y_acR_tYSdm_E7kFeTsvM_G35hFnAWchurBiBk2IRWY60dagze3Ey=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHAB0Ers-FwpCLgFdLezjwujOMniHmSWZjiP1dL3gCxVmdq3WlUYkNuR62jFg1yMXOukw_dwu742pGZ4pCuj4Y18kbZcbppsTDApkbn2y8T6ceEcRyCil198KNj4BJuo89y_acR_tYSdm_E7kFeTsvM_G35hFnAWchurBiBk2IRWY60dagze3Ey=s1600-n-k-no', false, 3, 'Appartements - Condos Meublés - Yassa Douala - WILMA HOUSE Comme chez vous')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEmfXV6ncWZmc8dxjl5kM1RnPjz7I7Pfbh2zBzjY0w8gEXqC_jpyTL10ntbYxRnVTlDuHp21Cz80hngOClwZgMuTpXBP6a4mKfaynNaRDQcojKO_UZp-UWYFQPDTAjfFODkXyySdGzsDNKaLEsJa9fKT2WGLHP6vvjsi9vVpP-RIbnGEC6Ml4Q=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEmfXV6ncWZmc8dxjl5kM1RnPjz7I7Pfbh2zBzjY0w8gEXqC_jpyTL10ntbYxRnVTlDuHp21Cz80hngOClwZgMuTpXBP6a4mKfaynNaRDQcojKO_UZp-UWYFQPDTAjfFODkXyySdGzsDNKaLEsJa9fKT2WGLHP6vvjsi9vVpP-RIbnGEC6Ml4Q=s1600', false, 4, 'Appartements - Condos Meublés - Yassa Douala - WILMA HOUSE Comme chez vous')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEmfXV6ncWZmc8dxjl5kM1RnPjz7I7Pfbh2zBzjY0w8gEXqC_jpyTL10ntbYxRnVTlDuHp21Cz80hngOClwZgMuTpXBP6a4mKfaynNaRDQcojKO_UZp-UWYFQPDTAjfFODkXyySdGzsDNKaLEsJa9fKT2WGLHP6vvjsi9vVpP-RIbnGEC6Ml4Q=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEmfXV6ncWZmc8dxjl5kM1RnPjz7I7Pfbh2zBzjY0w8gEXqC_jpyTL10ntbYxRnVTlDuHp21Cz80hngOClwZgMuTpXBP6a4mKfaynNaRDQcojKO_UZp-UWYFQPDTAjfFODkXyySdGzsDNKaLEsJa9fKT2WGLHP6vvjsi9vVpP-RIbnGEC6Ml4Q=s1600-n-k-no', false, 5, 'Appartements - Condos Meublés - Yassa Douala - WILMA HOUSE Comme chez vous')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFsCXdc2kfgBOV4Xlxu-Bl_vLXHGDrwo_g9Crnamkygq5FGO8rap2V3bJPzr_8yT0w7VV8-AThOmM5PQK26gMdO_JOtWRmTG-qssNkoFZFsSOvgOOv4Od_naqBGROp0NPjb0rLuIpfvRoPo63Ji29b3kElPp6TWFu0p6NBhTCTorZYJ1SIGdKoLIQ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFsCXdc2kfgBOV4Xlxu-Bl_vLXHGDrwo_g9Crnamkygq5FGO8rap2V3bJPzr_8yT0w7VV8-AThOmM5PQK26gMdO_JOtWRmTG-qssNkoFZFsSOvgOOv4Od_naqBGROp0NPjb0rLuIpfvRoPo63Ji29b3kElPp6TWFu0p6NBhTCTorZYJ1SIGdKoLIQ=s1600', false, 6, 'Appartements - Condos Meublés - Yassa Douala - WILMA HOUSE Comme chez vous')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFsCXdc2kfgBOV4Xlxu-Bl_vLXHGDrwo_g9Crnamkygq5FGO8rap2V3bJPzr_8yT0w7VV8-AThOmM5PQK26gMdO_JOtWRmTG-qssNkoFZFsSOvgOOv4Od_naqBGROp0NPjb0rLuIpfvRoPo63Ji29b3kElPp6TWFu0p6NBhTCTorZYJ1SIGdKoLIQ=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFsCXdc2kfgBOV4Xlxu-Bl_vLXHGDrwo_g9Crnamkygq5FGO8rap2V3bJPzr_8yT0w7VV8-AThOmM5PQK26gMdO_JOtWRmTG-qssNkoFZFsSOvgOOv4Od_naqBGROp0NPjb0rLuIpfvRoPo63Ji29b3kElPp6TWFu0p6NBhTCTorZYJ1SIGdKoLIQ=s1600-n-k-no', false, 7, 'Appartements - Condos Meublés - Yassa Douala - WILMA HOUSE Comme chez vous')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGaV-SpnGOUTET0qZR5x74FVqkPFWRkyPqlBXw6Sy9Q0n7K4cFpPSse3mhG6LVLSDhn2dmTEWMJ36bHvhqwV8ymCH2QjbPAs0BtoSq58ZoPb5DyHojUSlRdREBgpLMy7P2mG4pehXnWNpwINrtSP6lexgu1P2ut3IoLgXIuC_t_FiFthRVtfjyW=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGaV-SpnGOUTET0qZR5x74FVqkPFWRkyPqlBXw6Sy9Q0n7K4cFpPSse3mhG6LVLSDhn2dmTEWMJ36bHvhqwV8ymCH2QjbPAs0BtoSq58ZoPb5DyHojUSlRdREBgpLMy7P2mG4pehXnWNpwINrtSP6lexgu1P2ut3IoLgXIuC_t_FiFthRVtfjyW=s1600', false, 8, 'Appartements - Condos Meublés - Yassa Douala - WILMA HOUSE Comme chez vous')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGaV-SpnGOUTET0qZR5x74FVqkPFWRkyPqlBXw6Sy9Q0n7K4cFpPSse3mhG6LVLSDhn2dmTEWMJ36bHvhqwV8ymCH2QjbPAs0BtoSq58ZoPb5DyHojUSlRdREBgpLMy7P2mG4pehXnWNpwINrtSP6lexgu1P2ut3IoLgXIuC_t_FiFthRVtfjyW=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGaV-SpnGOUTET0qZR5x74FVqkPFWRkyPqlBXw6Sy9Q0n7K4cFpPSse3mhG6LVLSDhn2dmTEWMJ36bHvhqwV8ymCH2QjbPAs0BtoSq58ZoPb5DyHojUSlRdREBgpLMy7P2mG4pehXnWNpwINrtSP6lexgu1P2ut3IoLgXIuC_t_FiFthRVtfjyW=s1600-n-k-no', false, 9, 'Appartements - Condos Meublés - Yassa Douala - WILMA HOUSE Comme chez vous')
  on conflict do nothing;

  -- [148] Studio meublé Dom City Yassa Ari. (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'studio-meuble-dom-city-yassa-ari-yassa',
    'studio',
    'published',
    'Studio meublé Dom City Yassa Ari.',
    'Studio meublé Dom City Yassa Ari.
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.05017,
    9.7705002,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3tTYiyK-vIKCPXX6oI54adbR2YXMp71_0y0rkW5WO2aLPZEQO_aL9cIWK6IAs23NRuc0OJXVxkjoA3IAbBSpsF8k4Z3nXC9rM5liz2DlDruqAc-FvSEEE7pfoJk-4jdeMeZOwgMAn0NTkjzvtSF_RwPwGNXg4tbucWCPj-mrX4whJyqL5UifWX=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3tTYiyK-vIKCPXX6oI54adbR2YXMp71_0y0rkW5WO2aLPZEQO_aL9cIWK6IAs23NRuc0OJXVxkjoA3IAbBSpsF8k4Z3nXC9rM5liz2DlDruqAc-FvSEEE7pfoJk-4jdeMeZOwgMAn0NTkjzvtSF_RwPwGNXg4tbucWCPj-mrX4whJyqL5UifWX=s1600', true, 0, 'Studio meublé Dom City Yassa Ari.')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3tTYiyK-vIKCPXX6oI54adbR2YXMp71_0y0rkW5WO2aLPZEQO_aL9cIWK6IAs23NRuc0OJXVxkjoA3IAbBSpsF8k4Z3nXC9rM5liz2DlDruqAc-FvSEEE7pfoJk-4jdeMeZOwgMAn0NTkjzvtSF_RwPwGNXg4tbucWCPj-mrX4whJyqL5UifWX=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3tTYiyK-vIKCPXX6oI54adbR2YXMp71_0y0rkW5WO2aLPZEQO_aL9cIWK6IAs23NRuc0OJXVxkjoA3IAbBSpsF8k4Z3nXC9rM5liz2DlDruqAc-FvSEEE7pfoJk-4jdeMeZOwgMAn0NTkjzvtSF_RwPwGNXg4tbucWCPj-mrX4whJyqL5UifWX=s1600-p-k-no', false, 1, 'Studio meublé Dom City Yassa Ari.')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEXZj_N6Lo_plCvtTDb9_8pfowv5FBTprSCavHBo9fY44XQA-_gndz9zB91oeRujq57zkTY_1_LvtybeXWd1zLke9dZY9rFwtTXzMf2wZ3-EVEj_efhz4sazICvwIhdS1ativ35ZPuWFhXVbd1ZDls5yprxpz3wSX_NFEsEPZTwBkdb7uUdl5n9=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEXZj_N6Lo_plCvtTDb9_8pfowv5FBTprSCavHBo9fY44XQA-_gndz9zB91oeRujq57zkTY_1_LvtybeXWd1zLke9dZY9rFwtTXzMf2wZ3-EVEj_efhz4sazICvwIhdS1ativ35ZPuWFhXVbd1ZDls5yprxpz3wSX_NFEsEPZTwBkdb7uUdl5n9=s1600', false, 2, 'Studio meublé Dom City Yassa Ari.')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEXZj_N6Lo_plCvtTDb9_8pfowv5FBTprSCavHBo9fY44XQA-_gndz9zB91oeRujq57zkTY_1_LvtybeXWd1zLke9dZY9rFwtTXzMf2wZ3-EVEj_efhz4sazICvwIhdS1ativ35ZPuWFhXVbd1ZDls5yprxpz3wSX_NFEsEPZTwBkdb7uUdl5n9=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEXZj_N6Lo_plCvtTDb9_8pfowv5FBTprSCavHBo9fY44XQA-_gndz9zB91oeRujq57zkTY_1_LvtybeXWd1zLke9dZY9rFwtTXzMf2wZ3-EVEj_efhz4sazICvwIhdS1ativ35ZPuWFhXVbd1ZDls5yprxpz3wSX_NFEsEPZTwBkdb7uUdl5n9=s1600-n-k-no', false, 3, 'Studio meublé Dom City Yassa Ari.')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhE9yHbho54aEXNlpLIxuAs6crs8Emte-kRVnQXRXTnx6QUBEnxXywi953P-AWbILSfywd-v5Jcm2fQ9VgEWP3N1l7T_iiqM_6X1FIwCO-2KDFp8Kb5C-dZxR9bBDVT-NYs9Dv4GcxOegz_ZMCOiay-y3pXZ7t_rmwlLiKgOdlqRWCphhqY6sRfKZQ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhE9yHbho54aEXNlpLIxuAs6crs8Emte-kRVnQXRXTnx6QUBEnxXywi953P-AWbILSfywd-v5Jcm2fQ9VgEWP3N1l7T_iiqM_6X1FIwCO-2KDFp8Kb5C-dZxR9bBDVT-NYs9Dv4GcxOegz_ZMCOiay-y3pXZ7t_rmwlLiKgOdlqRWCphhqY6sRfKZQ=s1600', false, 4, 'Studio meublé Dom City Yassa Ari.')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhE9yHbho54aEXNlpLIxuAs6crs8Emte-kRVnQXRXTnx6QUBEnxXywi953P-AWbILSfywd-v5Jcm2fQ9VgEWP3N1l7T_iiqM_6X1FIwCO-2KDFp8Kb5C-dZxR9bBDVT-NYs9Dv4GcxOegz_ZMCOiay-y3pXZ7t_rmwlLiKgOdlqRWCphhqY6sRfKZQ=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhE9yHbho54aEXNlpLIxuAs6crs8Emte-kRVnQXRXTnx6QUBEnxXywi953P-AWbILSfywd-v5Jcm2fQ9VgEWP3N1l7T_iiqM_6X1FIwCO-2KDFp8Kb5C-dZxR9bBDVT-NYs9Dv4GcxOegz_ZMCOiay-y3pXZ7t_rmwlLiKgOdlqRWCphhqY6sRfKZQ=s1600-n-k-no', false, 5, 'Studio meublé Dom City Yassa Ari.')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG9YQgIEqDfC4hH84J72wUdIVrrSF0y1yGAmkEg8jlTCnOM7oFwxBzwEE-7Vh3MFpd6mKph9Zz1Q2rV3dRaziEAxfIM3_4Q3JQLm39FUwTFRVNdrynQaK1Z_siBv54Mx0r95bsJk8YKQZi4xFl0ITh8klb8S9nQcCFlQVnhCeov3jrgyHLlBPR8=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG9YQgIEqDfC4hH84J72wUdIVrrSF0y1yGAmkEg8jlTCnOM7oFwxBzwEE-7Vh3MFpd6mKph9Zz1Q2rV3dRaziEAxfIM3_4Q3JQLm39FUwTFRVNdrynQaK1Z_siBv54Mx0r95bsJk8YKQZi4xFl0ITh8klb8S9nQcCFlQVnhCeov3jrgyHLlBPR8=s1600', false, 6, 'Studio meublé Dom City Yassa Ari.')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG9YQgIEqDfC4hH84J72wUdIVrrSF0y1yGAmkEg8jlTCnOM7oFwxBzwEE-7Vh3MFpd6mKph9Zz1Q2rV3dRaziEAxfIM3_4Q3JQLm39FUwTFRVNdrynQaK1Z_siBv54Mx0r95bsJk8YKQZi4xFl0ITh8klb8S9nQcCFlQVnhCeov3jrgyHLlBPR8=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhG9YQgIEqDfC4hH84J72wUdIVrrSF0y1yGAmkEg8jlTCnOM7oFwxBzwEE-7Vh3MFpd6mKph9Zz1Q2rV3dRaziEAxfIM3_4Q3JQLm39FUwTFRVNdrynQaK1Z_siBv54Mx0r95bsJk8YKQZi4xFl0ITh8klb8S9nQcCFlQVnhCeov3jrgyHLlBPR8=s1600-n-k-no', false, 7, 'Studio meublé Dom City Yassa Ari.')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEJIXdZ9QpbEUxmkIHfvy2iUh7m16B8ytYnOBpMKoG0_D9ZQncP96AzGZ-p9G6HYBiWeH1o3gUV9chaXJpALfyoacU9V-159Z4B5evX3S-LfIAmYq45Houfr7yIUJ11jdhuoAHiPBsqwA4KfqsfLlmydbkt3VeWuU0739LRT-bSL9B9rVT_pLsb=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEJIXdZ9QpbEUxmkIHfvy2iUh7m16B8ytYnOBpMKoG0_D9ZQncP96AzGZ-p9G6HYBiWeH1o3gUV9chaXJpALfyoacU9V-159Z4B5evX3S-LfIAmYq45Houfr7yIUJ11jdhuoAHiPBsqwA4KfqsfLlmydbkt3VeWuU0739LRT-bSL9B9rVT_pLsb=s1600', false, 8, 'Studio meublé Dom City Yassa Ari.')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEJIXdZ9QpbEUxmkIHfvy2iUh7m16B8ytYnOBpMKoG0_D9ZQncP96AzGZ-p9G6HYBiWeH1o3gUV9chaXJpALfyoacU9V-159Z4B5evX3S-LfIAmYq45Houfr7yIUJ11jdhuoAHiPBsqwA4KfqsfLlmydbkt3VeWuU0739LRT-bSL9B9rVT_pLsb=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEJIXdZ9QpbEUxmkIHfvy2iUh7m16B8ytYnOBpMKoG0_D9ZQncP96AzGZ-p9G6HYBiWeH1o3gUV9chaXJpALfyoacU9V-159Z4B5evX3S-LfIAmYq45Houfr7yIUJ11jdhuoAHiPBsqwA4KfqsfLlmydbkt3VeWuU0739LRT-bSL9B9rVT_pLsb=s1600-n-k-no', false, 9, 'Studio meublé Dom City Yassa Ari.')
  on conflict do nothing;

  -- [149] Complexe Meublé PEPON (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'complexe-meuble-pepon-yassa',
    'apartment',
    'published',
    'Complexe Meublé PEPON',
    'Complexe Meublé PEPON
Adresse : Bocom 1 A 200m de l’axe lourd Dla-Ydé, Immeuble PEPON. Carrefour Yassa, derrière Station, Douala.
Contact / WhatsApp : +237654029998.
Note Google Maps : 4.6/5 (10 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Bocom 1 A 200m de l’axe lourd Dla-Ydé, Immeuble PEPON. Carrefour Yassa, derrière Station, Douala',
    3.9971584,
    9.8142306,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLesC_XoEUkZ77qHHwr0Dije3j_2S_UWV9eYSLScyveVusbX_KQKcvufc-QJyu4R52tXWVnRxbq6072Ctpq9pw8-dueSdC5ueXhtAjeTy4iqQPr2apkcPVMw66PKZGCPjm6b-1yKYQ=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLesC_XoEUkZ77qHHwr0Dije3j_2S_UWV9eYSLScyveVusbX_KQKcvufc-QJyu4R52tXWVnRxbq6072Ctpq9pw8-dueSdC5ueXhtAjeTy4iqQPr2apkcPVMw66PKZGCPjm6b-1yKYQ=s1600', true, 0, 'Complexe Meublé PEPON')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLesC_XoEUkZ77qHHwr0Dije3j_2S_UWV9eYSLScyveVusbX_KQKcvufc-QJyu4R52tXWVnRxbq6072Ctpq9pw8-dueSdC5ueXhtAjeTy4iqQPr2apkcPVMw66PKZGCPjm6b-1yKYQ=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLesC_XoEUkZ77qHHwr0Dije3j_2S_UWV9eYSLScyveVusbX_KQKcvufc-QJyu4R52tXWVnRxbq6072Ctpq9pw8-dueSdC5ueXhtAjeTy4iqQPr2apkcPVMw66PKZGCPjm6b-1yKYQ=s1600-p-k-no', false, 1, 'Complexe Meublé PEPON')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rmz0KIVfhZwvUomIX90adsEW8VcVhcdwGNdMVdoQo_7_zEK2yDTIzcU5SEFd7iVXG_M6rZs3Tzz_kfObdaIFNwpY1dn55jGQarqKk2MRlo754wU_sck4RsUsmC9lV7kt-A3n0vTQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rmz0KIVfhZwvUomIX90adsEW8VcVhcdwGNdMVdoQo_7_zEK2yDTIzcU5SEFd7iVXG_M6rZs3Tzz_kfObdaIFNwpY1dn55jGQarqKk2MRlo754wU_sck4RsUsmC9lV7kt-A3n0vTQ=s1600', false, 2, 'Complexe Meublé PEPON')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rmz0KIVfhZwvUomIX90adsEW8VcVhcdwGNdMVdoQo_7_zEK2yDTIzcU5SEFd7iVXG_M6rZs3Tzz_kfObdaIFNwpY1dn55jGQarqKk2MRlo754wU_sck4RsUsmC9lV7kt-A3n0vTQ=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rmz0KIVfhZwvUomIX90adsEW8VcVhcdwGNdMVdoQo_7_zEK2yDTIzcU5SEFd7iVXG_M6rZs3Tzz_kfObdaIFNwpY1dn55jGQarqKk2MRlo754wU_sck4RsUsmC9lV7kt-A3n0vTQ=s1600-n-k-no', false, 3, 'Complexe Meublé PEPON')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tkru40pvciKFN_BZt6rH9M27c5JuwbnfhwkSOzhlNJtP-lETpv5pK2NF3OtUmRvokdNuk2RVbVN54by9pOYC4PX8jU5FaX2AjiyQFzgupAyj5YlCRWZ0VTulZpJcGXqjoR0nA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tkru40pvciKFN_BZt6rH9M27c5JuwbnfhwkSOzhlNJtP-lETpv5pK2NF3OtUmRvokdNuk2RVbVN54by9pOYC4PX8jU5FaX2AjiyQFzgupAyj5YlCRWZ0VTulZpJcGXqjoR0nA=s1600', false, 4, 'Complexe Meublé PEPON')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tkru40pvciKFN_BZt6rH9M27c5JuwbnfhwkSOzhlNJtP-lETpv5pK2NF3OtUmRvokdNuk2RVbVN54by9pOYC4PX8jU5FaX2AjiyQFzgupAyj5YlCRWZ0VTulZpJcGXqjoR0nA=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Tkru40pvciKFN_BZt6rH9M27c5JuwbnfhwkSOzhlNJtP-lETpv5pK2NF3OtUmRvokdNuk2RVbVN54by9pOYC4PX8jU5FaX2AjiyQFzgupAyj5YlCRWZ0VTulZpJcGXqjoR0nA=s1600-n-k-no', false, 5, 'Complexe Meublé PEPON')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SbdPcLdWLbqAj2hMgt83q_q4uMG8_X9vvNW0gt1AVkJShX_xY-llGrWhT8Er6ygl7p3cEQYzAztPlwwf61obyXO60ThvxWb8Cdi4VdQyjxAuSlwXFTNohQlztCVr5bqTOhIFhpoQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SbdPcLdWLbqAj2hMgt83q_q4uMG8_X9vvNW0gt1AVkJShX_xY-llGrWhT8Er6ygl7p3cEQYzAztPlwwf61obyXO60ThvxWb8Cdi4VdQyjxAuSlwXFTNohQlztCVr5bqTOhIFhpoQ=s1600', false, 6, 'Complexe Meublé PEPON')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SbdPcLdWLbqAj2hMgt83q_q4uMG8_X9vvNW0gt1AVkJShX_xY-llGrWhT8Er6ygl7p3cEQYzAztPlwwf61obyXO60ThvxWb8Cdi4VdQyjxAuSlwXFTNohQlztCVr5bqTOhIFhpoQ=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SbdPcLdWLbqAj2hMgt83q_q4uMG8_X9vvNW0gt1AVkJShX_xY-llGrWhT8Er6ygl7p3cEQYzAztPlwwf61obyXO60ThvxWb8Cdi4VdQyjxAuSlwXFTNohQlztCVr5bqTOhIFhpoQ=s1600-n-k-no', false, 7, 'Complexe Meublé PEPON')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T3nMIGeckJgX2IxMy0z_5Ztpsd9QI93wNeDXn3EWVnYw_adpCwdx0XsJxxBQOu11OeLvnKEXFVbBHtBfWSsxYf7Iba0-HHVumfSCPFvRlNlJdkKTb92VDm3HMaA9b-M-URV6HjAg=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T3nMIGeckJgX2IxMy0z_5Ztpsd9QI93wNeDXn3EWVnYw_adpCwdx0XsJxxBQOu11OeLvnKEXFVbBHtBfWSsxYf7Iba0-HHVumfSCPFvRlNlJdkKTb92VDm3HMaA9b-M-URV6HjAg=s1600', false, 8, 'Complexe Meublé PEPON')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T3nMIGeckJgX2IxMy0z_5Ztpsd9QI93wNeDXn3EWVnYw_adpCwdx0XsJxxBQOu11OeLvnKEXFVbBHtBfWSsxYf7Iba0-HHVumfSCPFvRlNlJdkKTb92VDm3HMaA9b-M-URV6HjAg=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T3nMIGeckJgX2IxMy0z_5Ztpsd9QI93wNeDXn3EWVnYw_adpCwdx0XsJxxBQOu11OeLvnKEXFVbBHtBfWSsxYf7Iba0-HHVumfSCPFvRlNlJdkKTb92VDm3HMaA9b-M-URV6HjAg=s1600-n-k-no', false, 9, 'Complexe Meublé PEPON')
  on conflict do nothing;

  -- [150] Douala_yassa_meublé (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'douala-yassa-meuble-yassa',
    'apartment',
    'published',
    'Douala_yassa_meublé',
    'Douala_yassa_meublé
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    3.97384,
    9.79669,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3uDfZrlybs0sbqdcXkSvTurxTiF0V1eGQxpKMZr5qbsR8-ew5gkQ5_jjY2oRfS104f4OoRH4Q06DoodrDF5_7iXhI83emGZHdQx3Csi_sEHiY8Yuvihjcbw8vf3t-XuOBffjml_-qCvu9hkcwFYWTHJbvcRYnjoQ3CQNt5AJ3GRyKS68SScyPb=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3uDfZrlybs0sbqdcXkSvTurxTiF0V1eGQxpKMZr5qbsR8-ew5gkQ5_jjY2oRfS104f4OoRH4Q06DoodrDF5_7iXhI83emGZHdQx3Csi_sEHiY8Yuvihjcbw8vf3t-XuOBffjml_-qCvu9hkcwFYWTHJbvcRYnjoQ3CQNt5AJ3GRyKS68SScyPb=s1600', true, 0, 'Douala_yassa_meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3uDfZrlybs0sbqdcXkSvTurxTiF0V1eGQxpKMZr5qbsR8-ew5gkQ5_jjY2oRfS104f4OoRH4Q06DoodrDF5_7iXhI83emGZHdQx3Csi_sEHiY8Yuvihjcbw8vf3t-XuOBffjml_-qCvu9hkcwFYWTHJbvcRYnjoQ3CQNt5AJ3GRyKS68SScyPb=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW3uDfZrlybs0sbqdcXkSvTurxTiF0V1eGQxpKMZr5qbsR8-ew5gkQ5_jjY2oRfS104f4OoRH4Q06DoodrDF5_7iXhI83emGZHdQx3Csi_sEHiY8Yuvihjcbw8vf3t-XuOBffjml_-qCvu9hkcwFYWTHJbvcRYnjoQ3CQNt5AJ3GRyKS68SScyPb=s1600-p-k-no', false, 1, 'Douala_yassa_meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhH2dbGjhVO8aLAPKe6RmKKDZUh8loZawgt3XINlN8ALLk-8OAehK0xP4_TD9SW_5YhCNk-3ZxmAXr9AYK8BE-JcFpQ4f_l20HjRVrCo5E3LC7pb_2CrYloFImGhtZqI0SyAD7vss2w4y9EDiKfNis_pCk4Thw8E4kmSQhmvunXm4lmhe3j0XHh6=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhH2dbGjhVO8aLAPKe6RmKKDZUh8loZawgt3XINlN8ALLk-8OAehK0xP4_TD9SW_5YhCNk-3ZxmAXr9AYK8BE-JcFpQ4f_l20HjRVrCo5E3LC7pb_2CrYloFImGhtZqI0SyAD7vss2w4y9EDiKfNis_pCk4Thw8E4kmSQhmvunXm4lmhe3j0XHh6=s1600', false, 2, 'Douala_yassa_meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhH2dbGjhVO8aLAPKe6RmKKDZUh8loZawgt3XINlN8ALLk-8OAehK0xP4_TD9SW_5YhCNk-3ZxmAXr9AYK8BE-JcFpQ4f_l20HjRVrCo5E3LC7pb_2CrYloFImGhtZqI0SyAD7vss2w4y9EDiKfNis_pCk4Thw8E4kmSQhmvunXm4lmhe3j0XHh6=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhH2dbGjhVO8aLAPKe6RmKKDZUh8loZawgt3XINlN8ALLk-8OAehK0xP4_TD9SW_5YhCNk-3ZxmAXr9AYK8BE-JcFpQ4f_l20HjRVrCo5E3LC7pb_2CrYloFImGhtZqI0SyAD7vss2w4y9EDiKfNis_pCk4Thw8E4kmSQhmvunXm4lmhe3j0XHh6=s1600-n-k-no', false, 3, 'Douala_yassa_meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhF6r1Diwpx70ytLvDs7zVFYrcWc2eo_PlR0TMft2HRxiRC5HggMSRE-U-SRQ0KUc30VCko5jixoWIJMzFF3HUo_UoMXlS2iFHfvXXA-JDvxVVltuLudNKioxK2i879lYPTyYnIGDJ70bXuWZY9n66wi21cMujdSXsk-esCrRb9AZjcScz3Hj5BN=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhF6r1Diwpx70ytLvDs7zVFYrcWc2eo_PlR0TMft2HRxiRC5HggMSRE-U-SRQ0KUc30VCko5jixoWIJMzFF3HUo_UoMXlS2iFHfvXXA-JDvxVVltuLudNKioxK2i879lYPTyYnIGDJ70bXuWZY9n66wi21cMujdSXsk-esCrRb9AZjcScz3Hj5BN=s1600', false, 4, 'Douala_yassa_meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhF6r1Diwpx70ytLvDs7zVFYrcWc2eo_PlR0TMft2HRxiRC5HggMSRE-U-SRQ0KUc30VCko5jixoWIJMzFF3HUo_UoMXlS2iFHfvXXA-JDvxVVltuLudNKioxK2i879lYPTyYnIGDJ70bXuWZY9n66wi21cMujdSXsk-esCrRb9AZjcScz3Hj5BN=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhF6r1Diwpx70ytLvDs7zVFYrcWc2eo_PlR0TMft2HRxiRC5HggMSRE-U-SRQ0KUc30VCko5jixoWIJMzFF3HUo_UoMXlS2iFHfvXXA-JDvxVVltuLudNKioxK2i879lYPTyYnIGDJ70bXuWZY9n66wi21cMujdSXsk-esCrRb9AZjcScz3Hj5BN=s1600-n-k-no', false, 5, 'Douala_yassa_meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEsIRCZhHJNB1DLC2P7y_iIGbeZDzLe3R4iBysmRNWWDK6nC8PIXUIxhKV8WwCtAGtx8JITv9VfABWRN4md1WHoG84y26mJlaKZLcSAnvd0J8XJ8cj10OXNVJn8SoqZjVPxgoSbaUwWBcwKqnUhgPmGGzxLX_FjmB_e4EvPmTgScc577T1A7_uG=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEsIRCZhHJNB1DLC2P7y_iIGbeZDzLe3R4iBysmRNWWDK6nC8PIXUIxhKV8WwCtAGtx8JITv9VfABWRN4md1WHoG84y26mJlaKZLcSAnvd0J8XJ8cj10OXNVJn8SoqZjVPxgoSbaUwWBcwKqnUhgPmGGzxLX_FjmB_e4EvPmTgScc577T1A7_uG=s1600', false, 6, 'Douala_yassa_meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEsIRCZhHJNB1DLC2P7y_iIGbeZDzLe3R4iBysmRNWWDK6nC8PIXUIxhKV8WwCtAGtx8JITv9VfABWRN4md1WHoG84y26mJlaKZLcSAnvd0J8XJ8cj10OXNVJn8SoqZjVPxgoSbaUwWBcwKqnUhgPmGGzxLX_FjmB_e4EvPmTgScc577T1A7_uG=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEsIRCZhHJNB1DLC2P7y_iIGbeZDzLe3R4iBysmRNWWDK6nC8PIXUIxhKV8WwCtAGtx8JITv9VfABWRN4md1WHoG84y26mJlaKZLcSAnvd0J8XJ8cj10OXNVJn8SoqZjVPxgoSbaUwWBcwKqnUhgPmGGzxLX_FjmB_e4EvPmTgScc577T1A7_uG=s1600-n-k-no', false, 7, 'Douala_yassa_meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHKrgAfMhUoT4xE7u3K4A_JHcyGt71tIkp2oywTrPQrstZhlBt9hJW4_OGxn6ieZYSJhJ4tBl1xn4wO4MzudRSXncMKupOAW2vRfi4gmB5pJscaeSdEVY2nJvL2h84Z1NH7eNZttn1hubh1sUjMPSVzTLikTf4UyMDnqgRDS6nyHmzF0iEFUGg=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHKrgAfMhUoT4xE7u3K4A_JHcyGt71tIkp2oywTrPQrstZhlBt9hJW4_OGxn6ieZYSJhJ4tBl1xn4wO4MzudRSXncMKupOAW2vRfi4gmB5pJscaeSdEVY2nJvL2h84Z1NH7eNZttn1hubh1sUjMPSVzTLikTf4UyMDnqgRDS6nyHmzF0iEFUGg=s1600', false, 8, 'Douala_yassa_meublé')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHKrgAfMhUoT4xE7u3K4A_JHcyGt71tIkp2oywTrPQrstZhlBt9hJW4_OGxn6ieZYSJhJ4tBl1xn4wO4MzudRSXncMKupOAW2vRfi4gmB5pJscaeSdEVY2nJvL2h84Z1NH7eNZttn1hubh1sUjMPSVzTLikTf4UyMDnqgRDS6nyHmzF0iEFUGg=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHKrgAfMhUoT4xE7u3K4A_JHcyGt71tIkp2oywTrPQrstZhlBt9hJW4_OGxn6ieZYSJhJ4tBl1xn4wO4MzudRSXncMKupOAW2vRfi4gmB5pJscaeSdEVY2nJvL2h84Z1NH7eNZttn1hubh1sUjMPSVzTLikTf4UyMDnqgRDS6nyHmzF0iEFUGg=s1600-n-k-no', false, 9, 'Douala_yassa_meublé')
  on conflict do nothing;

  -- [151] Bel Appartement meublé à Douala Cameroun (Yassa) (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'bel-appartement-meuble-a-douala-cameroun-yassa-yassa',
    'apartment',
    'published',
    'Bel Appartement meublé à Douala Cameroun (Yassa)',
    'Bel Appartement meublé à Douala Cameroun (Yassa)
Adresse : Douala.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.014286,
    9.7423134,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0FPr_7eYksqzBpVtN5MCoDvRbTiUWkE07y0yo1kN6KTVHqVL2kdlVi43AsuzuMzF4U7wKLY1qhF8xryQ1aanGaF24v8XdIIHPTR6Sl4gBpN21H6G_67NP0DhA88T-eI_0ze0O3vK8vNQPhvHnM4NXbruzo6yFmjbb5x7XRK2hu_G9T43sdTdt5=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0FPr_7eYksqzBpVtN5MCoDvRbTiUWkE07y0yo1kN6KTVHqVL2kdlVi43AsuzuMzF4U7wKLY1qhF8xryQ1aanGaF24v8XdIIHPTR6Sl4gBpN21H6G_67NP0DhA88T-eI_0ze0O3vK8vNQPhvHnM4NXbruzo6yFmjbb5x7XRK2hu_G9T43sdTdt5=s1600', true, 0, 'Bel Appartement meublé à Douala Cameroun (Yassa)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0FPr_7eYksqzBpVtN5MCoDvRbTiUWkE07y0yo1kN6KTVHqVL2kdlVi43AsuzuMzF4U7wKLY1qhF8xryQ1aanGaF24v8XdIIHPTR6Sl4gBpN21H6G_67NP0DhA88T-eI_0ze0O3vK8vNQPhvHnM4NXbruzo6yFmjbb5x7XRK2hu_G9T43sdTdt5=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0FPr_7eYksqzBpVtN5MCoDvRbTiUWkE07y0yo1kN6KTVHqVL2kdlVi43AsuzuMzF4U7wKLY1qhF8xryQ1aanGaF24v8XdIIHPTR6Sl4gBpN21H6G_67NP0DhA88T-eI_0ze0O3vK8vNQPhvHnM4NXbruzo6yFmjbb5x7XRK2hu_G9T43sdTdt5=s1600-p-k-no', false, 1, 'Bel Appartement meublé à Douala Cameroun (Yassa)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFrRDPMeTtJNBLXRJ2FPlxzqgnSUGCjgon0d2J95VDuYsl_AEuTFi_DNC5sCw1JReMWtwtBzVOSgVZy2jBAwb0G1dRjYreNnG95tXEkN_8Kpsq6ZbwTVC7RPtVKHLpMoUbSJdjIilwgveqQAj-K7aikDgVatTeTpRtZ_opGb7DZ3fe0g8mybss9=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFrRDPMeTtJNBLXRJ2FPlxzqgnSUGCjgon0d2J95VDuYsl_AEuTFi_DNC5sCw1JReMWtwtBzVOSgVZy2jBAwb0G1dRjYreNnG95tXEkN_8Kpsq6ZbwTVC7RPtVKHLpMoUbSJdjIilwgveqQAj-K7aikDgVatTeTpRtZ_opGb7DZ3fe0g8mybss9=s1600', false, 2, 'Bel Appartement meublé à Douala Cameroun (Yassa)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFrRDPMeTtJNBLXRJ2FPlxzqgnSUGCjgon0d2J95VDuYsl_AEuTFi_DNC5sCw1JReMWtwtBzVOSgVZy2jBAwb0G1dRjYreNnG95tXEkN_8Kpsq6ZbwTVC7RPtVKHLpMoUbSJdjIilwgveqQAj-K7aikDgVatTeTpRtZ_opGb7DZ3fe0g8mybss9=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFrRDPMeTtJNBLXRJ2FPlxzqgnSUGCjgon0d2J95VDuYsl_AEuTFi_DNC5sCw1JReMWtwtBzVOSgVZy2jBAwb0G1dRjYreNnG95tXEkN_8Kpsq6ZbwTVC7RPtVKHLpMoUbSJdjIilwgveqQAj-K7aikDgVatTeTpRtZ_opGb7DZ3fe0g8mybss9=s1600-n-k-no', false, 3, 'Bel Appartement meublé à Douala Cameroun (Yassa)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEAJ6wHbCQWoZQm3vC_jN67gz1DPq42-V2RM7TbcwMCBUqtYFtUxr1pa75uvDhGBeD-UNejr2Osi4oHGYaLIIJ8y38IQumpCupxY-R9D3w0pFZ9w_ZYIHDYnq6cnnEZRQajo4YOK8_WYzbdyJ1XkI96NYoSK4SEgf5sn443RrwTJkl-TOF8WW8a=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEAJ6wHbCQWoZQm3vC_jN67gz1DPq42-V2RM7TbcwMCBUqtYFtUxr1pa75uvDhGBeD-UNejr2Osi4oHGYaLIIJ8y38IQumpCupxY-R9D3w0pFZ9w_ZYIHDYnq6cnnEZRQajo4YOK8_WYzbdyJ1XkI96NYoSK4SEgf5sn443RrwTJkl-TOF8WW8a=s1600', false, 4, 'Bel Appartement meublé à Douala Cameroun (Yassa)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEAJ6wHbCQWoZQm3vC_jN67gz1DPq42-V2RM7TbcwMCBUqtYFtUxr1pa75uvDhGBeD-UNejr2Osi4oHGYaLIIJ8y38IQumpCupxY-R9D3w0pFZ9w_ZYIHDYnq6cnnEZRQajo4YOK8_WYzbdyJ1XkI96NYoSK4SEgf5sn443RrwTJkl-TOF8WW8a=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEAJ6wHbCQWoZQm3vC_jN67gz1DPq42-V2RM7TbcwMCBUqtYFtUxr1pa75uvDhGBeD-UNejr2Osi4oHGYaLIIJ8y38IQumpCupxY-R9D3w0pFZ9w_ZYIHDYnq6cnnEZRQajo4YOK8_WYzbdyJ1XkI96NYoSK4SEgf5sn443RrwTJkl-TOF8WW8a=s1600-n-k-no', false, 5, 'Bel Appartement meublé à Douala Cameroun (Yassa)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEcKmm4XUKqQLWUq6ZmkvXLB-R2lO4ByHxWNz7ZjwzWy2Vo9XriclT63PDLNlpDBEkunxvCUlunu-q47pdf3zdsq8KVwoFp9mnvwOrYGH2FmWn79Sn6LZfxisY6YhQx8v3rF7UYaK3UMeINxhGrktrB17rMiO2Y39CYQjlnE4gWrVTF7PZsbPja=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEcKmm4XUKqQLWUq6ZmkvXLB-R2lO4ByHxWNz7ZjwzWy2Vo9XriclT63PDLNlpDBEkunxvCUlunu-q47pdf3zdsq8KVwoFp9mnvwOrYGH2FmWn79Sn6LZfxisY6YhQx8v3rF7UYaK3UMeINxhGrktrB17rMiO2Y39CYQjlnE4gWrVTF7PZsbPja=s1600', false, 6, 'Bel Appartement meublé à Douala Cameroun (Yassa)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEcKmm4XUKqQLWUq6ZmkvXLB-R2lO4ByHxWNz7ZjwzWy2Vo9XriclT63PDLNlpDBEkunxvCUlunu-q47pdf3zdsq8KVwoFp9mnvwOrYGH2FmWn79Sn6LZfxisY6YhQx8v3rF7UYaK3UMeINxhGrktrB17rMiO2Y39CYQjlnE4gWrVTF7PZsbPja=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEcKmm4XUKqQLWUq6ZmkvXLB-R2lO4ByHxWNz7ZjwzWy2Vo9XriclT63PDLNlpDBEkunxvCUlunu-q47pdf3zdsq8KVwoFp9mnvwOrYGH2FmWn79Sn6LZfxisY6YhQx8v3rF7UYaK3UMeINxhGrktrB17rMiO2Y39CYQjlnE4gWrVTF7PZsbPja=s1600-n-k-no', false, 7, 'Bel Appartement meublé à Douala Cameroun (Yassa)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFFp20RaqhxZ74TKeQwcx5vv5G-p4C1ZcHL_eu9Xzoooki4ZlOgxlMU_7i7UKO2IvtUl6e8ohk83WwaqY5eJ5j-GSqEBy73zITQxMdsxu8sYP3UVFddvNjsPM-yV_lhrXy_vD0NSa87x9GiiTEY6chAmxrdeUQxJmkOyDhE7vAw4Z867JCqk4cR=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFFp20RaqhxZ74TKeQwcx5vv5G-p4C1ZcHL_eu9Xzoooki4ZlOgxlMU_7i7UKO2IvtUl6e8ohk83WwaqY5eJ5j-GSqEBy73zITQxMdsxu8sYP3UVFddvNjsPM-yV_lhrXy_vD0NSa87x9GiiTEY6chAmxrdeUQxJmkOyDhE7vAw4Z867JCqk4cR=s1600', false, 8, 'Bel Appartement meublé à Douala Cameroun (Yassa)')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFFp20RaqhxZ74TKeQwcx5vv5G-p4C1ZcHL_eu9Xzoooki4ZlOgxlMU_7i7UKO2IvtUl6e8ohk83WwaqY5eJ5j-GSqEBy73zITQxMdsxu8sYP3UVFddvNjsPM-yV_lhrXy_vD0NSa87x9GiiTEY6chAmxrdeUQxJmkOyDhE7vAw4Z867JCqk4cR=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhFFp20RaqhxZ74TKeQwcx5vv5G-p4C1ZcHL_eu9Xzoooki4ZlOgxlMU_7i7UKO2IvtUl6e8ohk83WwaqY5eJ5j-GSqEBy73zITQxMdsxu8sYP3UVFddvNjsPM-yV_lhrXy_vD0NSa87x9GiiTEY6chAmxrdeUQxJmkOyDhE7vAw4Z867JCqk4cR=s1600-n-k-no', false, 9, 'Bel Appartement meublé à Douala Cameroun (Yassa)')
  on conflict do nothing;

  -- [152] TWIN TOWERS Apartments (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'twin-towers-apartments-yassa',
    'apartment',
    'published',
    'TWIN TOWERS Apartments',
    'TWIN TOWERS Apartments
Catégorie : Appartement avec services.
Adresse : 237, Douala.
Contact / WhatsApp : +237687381252.
Note Google Maps : 4.6/5 (24 avis).

Avis clients récents :
- "Note sans commentaire écrit." (tiwazo jone, note 5/5)
- "Note sans commentaire écrit." (Aldo Nana, note 5/5)
- "Note sans commentaire écrit." (Mauricio Redobina, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '237, Douala',
    3.9909722,
    9.8110966,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdzq0Df__dwCxr3mRNfFzaHQS9CAftFL2LqrlcweLEmRR353KzxWLjosyyvO74GO2XFNWt9uwNzUn4dAO0a-ljZmD2rh2Xuy5SxP189G7Rma11p4pYkYOP3lquF4ONN4d5yOnD0=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdzq0Df__dwCxr3mRNfFzaHQS9CAftFL2LqrlcweLEmRR353KzxWLjosyyvO74GO2XFNWt9uwNzUn4dAO0a-ljZmD2rh2Xuy5SxP189G7Rma11p4pYkYOP3lquF4ONN4d5yOnD0=s1600', true, 0, 'TWIN TOWERS Apartments')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdzq0Df__dwCxr3mRNfFzaHQS9CAftFL2LqrlcweLEmRR353KzxWLjosyyvO74GO2XFNWt9uwNzUn4dAO0a-ljZmD2rh2Xuy5SxP189G7Rma11p4pYkYOP3lquF4ONN4d5yOnD0=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdzq0Df__dwCxr3mRNfFzaHQS9CAftFL2LqrlcweLEmRR353KzxWLjosyyvO74GO2XFNWt9uwNzUn4dAO0a-ljZmD2rh2Xuy5SxP189G7Rma11p4pYkYOP3lquF4ONN4d5yOnD0=s1600-p-k-no', false, 1, 'TWIN TOWERS Apartments')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RtwqexyiT6a0TXCeLqsK-em14HgFTNKLRevwaIREtg8WLw3x_PcFSPOEsfqZaMI8zsLTWWLEeySqPRHrNBWE3JrEC9zLx13LjlJNSeBjGPMamPIAZEL9wn8GQwupfrcjgu6TOT=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RtwqexyiT6a0TXCeLqsK-em14HgFTNKLRevwaIREtg8WLw3x_PcFSPOEsfqZaMI8zsLTWWLEeySqPRHrNBWE3JrEC9zLx13LjlJNSeBjGPMamPIAZEL9wn8GQwupfrcjgu6TOT=s1600', false, 2, 'TWIN TOWERS Apartments')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RtwqexyiT6a0TXCeLqsK-em14HgFTNKLRevwaIREtg8WLw3x_PcFSPOEsfqZaMI8zsLTWWLEeySqPRHrNBWE3JrEC9zLx13LjlJNSeBjGPMamPIAZEL9wn8GQwupfrcjgu6TOT=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RtwqexyiT6a0TXCeLqsK-em14HgFTNKLRevwaIREtg8WLw3x_PcFSPOEsfqZaMI8zsLTWWLEeySqPRHrNBWE3JrEC9zLx13LjlJNSeBjGPMamPIAZEL9wn8GQwupfrcjgu6TOT=s1600-n-k-no', false, 3, 'TWIN TOWERS Apartments')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TZPcgWo2VpDeEInyi3bHsnvVCPhX9Pn8faWhYz7R6EQ7D4_9o7PhQb2kEHSkYMXDt1lfDRaH_xlJACsuQMWCuOetS1T708hmA7EpR2dq1lP71G0lipx7HWm_P36DMYXkNvJA9lsw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TZPcgWo2VpDeEInyi3bHsnvVCPhX9Pn8faWhYz7R6EQ7D4_9o7PhQb2kEHSkYMXDt1lfDRaH_xlJACsuQMWCuOetS1T708hmA7EpR2dq1lP71G0lipx7HWm_P36DMYXkNvJA9lsw=s1600', false, 4, 'TWIN TOWERS Apartments')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TZPcgWo2VpDeEInyi3bHsnvVCPhX9Pn8faWhYz7R6EQ7D4_9o7PhQb2kEHSkYMXDt1lfDRaH_xlJACsuQMWCuOetS1T708hmA7EpR2dq1lP71G0lipx7HWm_P36DMYXkNvJA9lsw=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TZPcgWo2VpDeEInyi3bHsnvVCPhX9Pn8faWhYz7R6EQ7D4_9o7PhQb2kEHSkYMXDt1lfDRaH_xlJACsuQMWCuOetS1T708hmA7EpR2dq1lP71G0lipx7HWm_P36DMYXkNvJA9lsw=s1600-n-k-no', false, 5, 'TWIN TOWERS Apartments')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sf7lxXAtLQ8lYxs4i9Z1opgHftscB_DUKmw-CzFlEKF30vpHVwt4w3BWEg7zZZEhcZJnz9S4cqZDvKsYiZo-O0R9kbDPFmjos63VUR1kvQl0kOGxETv17aocKD3snPuhrunlKC=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sf7lxXAtLQ8lYxs4i9Z1opgHftscB_DUKmw-CzFlEKF30vpHVwt4w3BWEg7zZZEhcZJnz9S4cqZDvKsYiZo-O0R9kbDPFmjos63VUR1kvQl0kOGxETv17aocKD3snPuhrunlKC=s1600', false, 6, 'TWIN TOWERS Apartments')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sf7lxXAtLQ8lYxs4i9Z1opgHftscB_DUKmw-CzFlEKF30vpHVwt4w3BWEg7zZZEhcZJnz9S4cqZDvKsYiZo-O0R9kbDPFmjos63VUR1kvQl0kOGxETv17aocKD3snPuhrunlKC=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Sf7lxXAtLQ8lYxs4i9Z1opgHftscB_DUKmw-CzFlEKF30vpHVwt4w3BWEg7zZZEhcZJnz9S4cqZDvKsYiZo-O0R9kbDPFmjos63VUR1kvQl0kOGxETv17aocKD3snPuhrunlKC=s1600-n-k-no', false, 7, 'TWIN TOWERS Apartments')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RlDZ7qegrcjpq7AGvpm7LWLm-RInOrQZwX7NdUvmhMV7-4GEIVuDy9uwS9tZ63SR8xGbuqd7loRm1ryVr2LlnG14FpJttrxBgbleXdn749am2rJcIjhtcutbPnd0M2gA8qWdY=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RlDZ7qegrcjpq7AGvpm7LWLm-RInOrQZwX7NdUvmhMV7-4GEIVuDy9uwS9tZ63SR8xGbuqd7loRm1ryVr2LlnG14FpJttrxBgbleXdn749am2rJcIjhtcutbPnd0M2gA8qWdY=s1600', false, 8, 'TWIN TOWERS Apartments')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RlDZ7qegrcjpq7AGvpm7LWLm-RInOrQZwX7NdUvmhMV7-4GEIVuDy9uwS9tZ63SR8xGbuqd7loRm1ryVr2LlnG14FpJttrxBgbleXdn749am2rJcIjhtcutbPnd0M2gA8qWdY=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RlDZ7qegrcjpq7AGvpm7LWLm-RInOrQZwX7NdUvmhMV7-4GEIVuDy9uwS9tZ63SR8xGbuqd7loRm1ryVr2LlnG14FpJttrxBgbleXdn749am2rJcIjhtcutbPnd0M2gA8qWdY=s1600-n-k-no', false, 9, 'TWIN TOWERS Apartments')
  on conflict do nothing;

  -- [153] Studio meublé à Douala-Maetur Yassa - Two-Bedroom Apartment (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'studio-meuble-a-douala-maetur-yassa-two-bedroom-apartment-yassa',
    'studio',
    'published',
    'Studio meublé à Douala-Maetur Yassa - Two-Bedroom Apartment',
    'Studio meublé à Douala-Maetur Yassa - Two-Bedroom Apartment
Adresse : Douala.
Note Google Maps : 1/5 (0 avis).',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Douala',
    4.0485802,
    9.7329197,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0AV9vlk_NDvYldhKUw3_7d1jd3vYtgPA8xoaPD8QGKFUWNnSLwDvDixb_UBhX10-cCm9oMeDyGrlejPXroSpue7Vmz-15HVqnUmcObP4PZP-4iRE4RZcrA_jxZYwmkybGNeOAXkZShmf9ed2ghHU92nI1vz246amFcvbi5Fpwt70d6yid5fP8=s1600', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0AV9vlk_NDvYldhKUw3_7d1jd3vYtgPA8xoaPD8QGKFUWNnSLwDvDixb_UBhX10-cCm9oMeDyGrlejPXroSpue7Vmz-15HVqnUmcObP4PZP-4iRE4RZcrA_jxZYwmkybGNeOAXkZShmf9ed2ghHU92nI1vz246amFcvbi5Fpwt70d6yid5fP8=s1600', true, 0, 'Studio meublé à Douala-Maetur Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0AV9vlk_NDvYldhKUw3_7d1jd3vYtgPA8xoaPD8QGKFUWNnSLwDvDixb_UBhX10-cCm9oMeDyGrlejPXroSpue7Vmz-15HVqnUmcObP4PZP-4iRE4RZcrA_jxZYwmkybGNeOAXkZShmf9ed2ghHU92nI1vz246amFcvbi5Fpwt70d6yid5fP8=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-proxy/AIM7gW0AV9vlk_NDvYldhKUw3_7d1jd3vYtgPA8xoaPD8QGKFUWNnSLwDvDixb_UBhX10-cCm9oMeDyGrlejPXroSpue7Vmz-15HVqnUmcObP4PZP-4iRE4RZcrA_jxZYwmkybGNeOAXkZShmf9ed2ghHU92nI1vz246amFcvbi5Fpwt70d6yid5fP8=s1600-p-k-no', false, 1, 'Studio meublé à Douala-Maetur Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHMoMzmSyVOiN8W5dmHJS62o_-WssY8ZlqhvaPAsP2Na4s-8DSlqE3kWyDEpart08ej8of_Xucu41bxEvxNe-CCwyaqiDhjhiI0JmO3mohEwzSR3FlotKVSdlyngx26CEPGyyvBDUi4vD8vje_O1_hz9oAK7Zy6Qx5wNZ8BUj2sw89PAPifXig=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHMoMzmSyVOiN8W5dmHJS62o_-WssY8ZlqhvaPAsP2Na4s-8DSlqE3kWyDEpart08ej8of_Xucu41bxEvxNe-CCwyaqiDhjhiI0JmO3mohEwzSR3FlotKVSdlyngx26CEPGyyvBDUi4vD8vje_O1_hz9oAK7Zy6Qx5wNZ8BUj2sw89PAPifXig=s1600', false, 2, 'Studio meublé à Douala-Maetur Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHMoMzmSyVOiN8W5dmHJS62o_-WssY8ZlqhvaPAsP2Na4s-8DSlqE3kWyDEpart08ej8of_Xucu41bxEvxNe-CCwyaqiDhjhiI0JmO3mohEwzSR3FlotKVSdlyngx26CEPGyyvBDUi4vD8vje_O1_hz9oAK7Zy6Qx5wNZ8BUj2sw89PAPifXig=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHMoMzmSyVOiN8W5dmHJS62o_-WssY8ZlqhvaPAsP2Na4s-8DSlqE3kWyDEpart08ej8of_Xucu41bxEvxNe-CCwyaqiDhjhiI0JmO3mohEwzSR3FlotKVSdlyngx26CEPGyyvBDUi4vD8vje_O1_hz9oAK7Zy6Qx5wNZ8BUj2sw89PAPifXig=s1600-n-k-no', false, 3, 'Studio meublé à Douala-Maetur Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGXwCX9ptJ2vTqMkt8Rx_qKDjJ8pAlrLYtpXo-PNa1Bem0a05CQL9CNhyY-rE2zFhD3im6i-qKgmshBnMm1GQcBFUfNmvow1uKnmDIF14ALkDwFruNVOadIGXCuwKd1NWD0QKLFXyEYD34btz7QSwQl6iPNHU421l61E9j0VtvBgSA0xtrROhb_=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGXwCX9ptJ2vTqMkt8Rx_qKDjJ8pAlrLYtpXo-PNa1Bem0a05CQL9CNhyY-rE2zFhD3im6i-qKgmshBnMm1GQcBFUfNmvow1uKnmDIF14ALkDwFruNVOadIGXCuwKd1NWD0QKLFXyEYD34btz7QSwQl6iPNHU421l61E9j0VtvBgSA0xtrROhb_=s1600', false, 4, 'Studio meublé à Douala-Maetur Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGXwCX9ptJ2vTqMkt8Rx_qKDjJ8pAlrLYtpXo-PNa1Bem0a05CQL9CNhyY-rE2zFhD3im6i-qKgmshBnMm1GQcBFUfNmvow1uKnmDIF14ALkDwFruNVOadIGXCuwKd1NWD0QKLFXyEYD34btz7QSwQl6iPNHU421l61E9j0VtvBgSA0xtrROhb_=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhGXwCX9ptJ2vTqMkt8Rx_qKDjJ8pAlrLYtpXo-PNa1Bem0a05CQL9CNhyY-rE2zFhD3im6i-qKgmshBnMm1GQcBFUfNmvow1uKnmDIF14ALkDwFruNVOadIGXCuwKd1NWD0QKLFXyEYD34btz7QSwQl6iPNHU421l61E9j0VtvBgSA0xtrROhb_=s1600-n-k-no', false, 5, 'Studio meublé à Douala-Maetur Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEYueM6uR_noYaBYRavJi4tHe5zuPAgQHUgmsjusdjb2GVpvsY7HNiNP7z4hF5MgSEpvYXs9EYcAaxdpncQI7hlPwtAJgDjF5sGy6Q3b5gsqtE-t27Twr67G0gXg7abbiBDdtxHEJU3NkXgCXvHtzgutxgI-M1OPh9czLu47a07Y7L6cN2M6lw3zA=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEYueM6uR_noYaBYRavJi4tHe5zuPAgQHUgmsjusdjb2GVpvsY7HNiNP7z4hF5MgSEpvYXs9EYcAaxdpncQI7hlPwtAJgDjF5sGy6Q3b5gsqtE-t27Twr67G0gXg7abbiBDdtxHEJU3NkXgCXvHtzgutxgI-M1OPh9czLu47a07Y7L6cN2M6lw3zA=s1600', false, 6, 'Studio meublé à Douala-Maetur Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEYueM6uR_noYaBYRavJi4tHe5zuPAgQHUgmsjusdjb2GVpvsY7HNiNP7z4hF5MgSEpvYXs9EYcAaxdpncQI7hlPwtAJgDjF5sGy6Q3b5gsqtE-t27Twr67G0gXg7abbiBDdtxHEJU3NkXgCXvHtzgutxgI-M1OPh9czLu47a07Y7L6cN2M6lw3zA=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhEYueM6uR_noYaBYRavJi4tHe5zuPAgQHUgmsjusdjb2GVpvsY7HNiNP7z4hF5MgSEpvYXs9EYcAaxdpncQI7hlPwtAJgDjF5sGy6Q3b5gsqtE-t27Twr67G0gXg7abbiBDdtxHEJU3NkXgCXvHtzgutxgI-M1OPh9czLu47a07Y7L6cN2M6lw3zA=s1600-n-k-no', false, 7, 'Studio meublé à Douala-Maetur Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHr8S14L0Oewl1IA6k9DJsnLxY7UQnl0M8jwacEhYJSuf2VBg2E_1tCMOsV2YrGh8Pywou5R9jcFb3oNveeNPm5S3K-iZ3OWhf43a4EVm_6oCMccfwiAViMysQfOka5QsLweCMmtxjjKovqzLvQ16CQ6QJWAxVuUvKKgeUnuGJjLXYFTQ4P2-kGyQ=s1600', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHr8S14L0Oewl1IA6k9DJsnLxY7UQnl0M8jwacEhYJSuf2VBg2E_1tCMOsV2YrGh8Pywou5R9jcFb3oNveeNPm5S3K-iZ3OWhf43a4EVm_6oCMccfwiAViMysQfOka5QsLweCMmtxjjKovqzLvQ16CQ6QJWAxVuUvKKgeUnuGJjLXYFTQ4P2-kGyQ=s1600', false, 8, 'Studio meublé à Douala-Maetur Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHr8S14L0Oewl1IA6k9DJsnLxY7UQnl0M8jwacEhYJSuf2VBg2E_1tCMOsV2YrGh8Pywou5R9jcFb3oNveeNPm5S3K-iZ3OWhf43a4EVm_6oCMccfwiAViMysQfOka5QsLweCMmtxjjKovqzLvQ16CQ6QJWAxVuUvKKgeUnuGJjLXYFTQ4P2-kGyQ=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-proxy/ALd4DhHr8S14L0Oewl1IA6k9DJsnLxY7UQnl0M8jwacEhYJSuf2VBg2E_1tCMOsV2YrGh8Pywou5R9jcFb3oNveeNPm5S3K-iZ3OWhf43a4EVm_6oCMccfwiAViMysQfOka5QsLweCMmtxjjKovqzLvQ16CQ6QJWAxVuUvKKgeUnuGJjLXYFTQ4P2-kGyQ=s1600-n-k-no', false, 9, 'Studio meublé à Douala-Maetur Yassa - Two-Bedroom Apartment')
  on conflict do nothing;

  -- [154] Yassa (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'yassa-yassa',
    'apartment',
    'published',
    'Yassa',
    'Yassa',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Yassa',
    3.970778,
    9.813235,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeWVndIVUZuPxh8R2M492ZVJj855obEIMsij3dlWCx92NBVYAQMski7_g3lNkUJZ6bt5lwL_SFycpoM7C1s1HtAdpyX7jY4lWujSGuwMlw60utF805v2pZFGLlyeGJQQH27Difw=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeWVndIVUZuPxh8R2M492ZVJj855obEIMsij3dlWCx92NBVYAQMski7_g3lNkUJZ6bt5lwL_SFycpoM7C1s1HtAdpyX7jY4lWujSGuwMlw60utF805v2pZFGLlyeGJQQH27Difw=s1600', true, 0, 'Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLeWVndIVUZuPxh8R2M492ZVJj855obEIMsij3dlWCx92NBVYAQMski7_g3lNkUJZ6bt5lwL_SFycpoM7C1s1HtAdpyX7jY4lWujSGuwMlw60utF805v2pZFGLlyeGJQQH27Difw=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLeWVndIVUZuPxh8R2M492ZVJj855obEIMsij3dlWCx92NBVYAQMski7_g3lNkUJZ6bt5lwL_SFycpoM7C1s1HtAdpyX7jY4lWujSGuwMlw60utF805v2pZFGLlyeGJQQH27Difw=s1600-p-k-no', false, 1, 'Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QbAEKPXF7PbC_ejiZ1f1EBeY-y_AT4gfPNr_nFJO9oJRM41NyQLI43Ke-Nr-7qRqtxoKpCgSYReS5zWkBCa77_6R62rQ6lJmjfmif-7-kMzuVFjR6ufldkTsiOWaC_GYSYkfoE=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QbAEKPXF7PbC_ejiZ1f1EBeY-y_AT4gfPNr_nFJO9oJRM41NyQLI43Ke-Nr-7qRqtxoKpCgSYReS5zWkBCa77_6R62rQ6lJmjfmif-7-kMzuVFjR6ufldkTsiOWaC_GYSYkfoE=s1600', false, 2, 'Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QbAEKPXF7PbC_ejiZ1f1EBeY-y_AT4gfPNr_nFJO9oJRM41NyQLI43Ke-Nr-7qRqtxoKpCgSYReS5zWkBCa77_6R62rQ6lJmjfmif-7-kMzuVFjR6ufldkTsiOWaC_GYSYkfoE=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QbAEKPXF7PbC_ejiZ1f1EBeY-y_AT4gfPNr_nFJO9oJRM41NyQLI43Ke-Nr-7qRqtxoKpCgSYReS5zWkBCa77_6R62rQ6lJmjfmif-7-kMzuVFjR6ufldkTsiOWaC_GYSYkfoE=s1600-n-k-no', false, 3, 'Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QlvLBXpZPGGpsdiS5Rx73zoDtpY-FLw-hDxzI_1mHJo9Ncx4B22nmc-LJa-MbjOpsKKHCpyvK88N3XnK3jRn6E23qB9c14ipIuuegnv7wDmKPUcJwEkGOLltm_qq2TpG-jzIA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QlvLBXpZPGGpsdiS5Rx73zoDtpY-FLw-hDxzI_1mHJo9Ncx4B22nmc-LJa-MbjOpsKKHCpyvK88N3XnK3jRn6E23qB9c14ipIuuegnv7wDmKPUcJwEkGOLltm_qq2TpG-jzIA=s1600', false, 4, 'Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QlvLBXpZPGGpsdiS5Rx73zoDtpY-FLw-hDxzI_1mHJo9Ncx4B22nmc-LJa-MbjOpsKKHCpyvK88N3XnK3jRn6E23qB9c14ipIuuegnv7wDmKPUcJwEkGOLltm_qq2TpG-jzIA=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QlvLBXpZPGGpsdiS5Rx73zoDtpY-FLw-hDxzI_1mHJo9Ncx4B22nmc-LJa-MbjOpsKKHCpyvK88N3XnK3jRn6E23qB9c14ipIuuegnv7wDmKPUcJwEkGOLltm_qq2TpG-jzIA=s1600-n-k-no', false, 5, 'Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QWgUk1Q6nLSOr_sljDED8hSB55Nt4JIDhTj2CdSdaEUx6atmY73y9ATz5lUMYc1MSXRr9UbRvjk0haJde21dLQTfpTwdZePjweWpy4jslOzCIQsB6jXs9hsQNL8xKrfijhE99w=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QWgUk1Q6nLSOr_sljDED8hSB55Nt4JIDhTj2CdSdaEUx6atmY73y9ATz5lUMYc1MSXRr9UbRvjk0haJde21dLQTfpTwdZePjweWpy4jslOzCIQsB6jXs9hsQNL8xKrfijhE99w=s1600', false, 6, 'Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QWgUk1Q6nLSOr_sljDED8hSB55Nt4JIDhTj2CdSdaEUx6atmY73y9ATz5lUMYc1MSXRr9UbRvjk0haJde21dLQTfpTwdZePjweWpy4jslOzCIQsB6jXs9hsQNL8xKrfijhE99w=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QWgUk1Q6nLSOr_sljDED8hSB55Nt4JIDhTj2CdSdaEUx6atmY73y9ATz5lUMYc1MSXRr9UbRvjk0haJde21dLQTfpTwdZePjweWpy4jslOzCIQsB6jXs9hsQNL8xKrfijhE99w=s1600-n-k-no', false, 7, 'Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S0K9r1ed6AzUC4agibmdCsRrqaGHF9kkbEJj90yAmxPSc4zeUR1WnE---pEkxWlxjM48Ii5YaUA3J6Vevrcf2P3ICZxOtvc1g12ut8powmgy7kiACFVBY3wUKw1yVnP21dqjokBA=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S0K9r1ed6AzUC4agibmdCsRrqaGHF9kkbEJj90yAmxPSc4zeUR1WnE---pEkxWlxjM48Ii5YaUA3J6Vevrcf2P3ICZxOtvc1g12ut8powmgy7kiACFVBY3wUKw1yVnP21dqjokBA=s1600', false, 8, 'Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S0K9r1ed6AzUC4agibmdCsRrqaGHF9kkbEJj90yAmxPSc4zeUR1WnE---pEkxWlxjM48Ii5YaUA3J6Vevrcf2P3ICZxOtvc1g12ut8powmgy7kiACFVBY3wUKw1yVnP21dqjokBA=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9S0K9r1ed6AzUC4agibmdCsRrqaGHF9kkbEJj90yAmxPSc4zeUR1WnE---pEkxWlxjM48Ii5YaUA3J6Vevrcf2P3ICZxOtvc1g12ut8powmgy7kiACFVBY3wUKw1yVnP21dqjokBA=s1600-n-k-no', false, 9, 'Yassa')
  on conflict do nothing;

  -- [155] Station Tradex Yassa (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'station-tradex-yassa-yassa',
    'apartment',
    'published',
    'Station Tradex Yassa',
    'Station Tradex Yassa
Catégorie : Station-service.
Adresse : 2R24+58J, Douala.
Contact / WhatsApp : +237671071111.
Note Google Maps : 3.5/5 (1787 avis).

Avis clients récents :
- "Note sans commentaire écrit." (Fabrice Vénus Larousse, note 4/5)
- "Note sans commentaire écrit." (Bonjour L''AFRIQUE, note 3/5)
- "Note sans commentaire écrit." (Alim Garba, note 5/5)',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    '2R24+58J, Douala',
    4.0007466,
    9.8050189,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLezPFTFDP1Wf--e9PMhbF3vYvygYR5mvqTW_oiZQWaGid8owTFLtrAqcXvnchOy31A8wwtD7CkDcxd5Yp9UwNFNms18z2hyx2aa8NgYSdd6Im57NhMcceg9Q8NvN9R9ncz6iBs=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLezPFTFDP1Wf--e9PMhbF3vYvygYR5mvqTW_oiZQWaGid8owTFLtrAqcXvnchOy31A8wwtD7CkDcxd5Yp9UwNFNms18z2hyx2aa8NgYSdd6Im57NhMcceg9Q8NvN9R9ncz6iBs=s1600', true, 0, 'Station Tradex Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLezPFTFDP1Wf--e9PMhbF3vYvygYR5mvqTW_oiZQWaGid8owTFLtrAqcXvnchOy31A8wwtD7CkDcxd5Yp9UwNFNms18z2hyx2aa8NgYSdd6Im57NhMcceg9Q8NvN9R9ncz6iBs=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLezPFTFDP1Wf--e9PMhbF3vYvygYR5mvqTW_oiZQWaGid8owTFLtrAqcXvnchOy31A8wwtD7CkDcxd5Yp9UwNFNms18z2hyx2aa8NgYSdd6Im57NhMcceg9Q8NvN9R9ncz6iBs=s1600-p-k-no', false, 1, 'Station Tradex Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RPEaorPrZuQaHgfOuGvvRQNQDV8i8WwJM_vw_mKBvwX4QbX7OHthUU6p-UlUpiTrDXlL5uXlgZd04D2ZFxF_YzqI3Q14cD43Z0kql_3_oOSbKK9B5k5yflrkXNcgSdeiMYc2I=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RPEaorPrZuQaHgfOuGvvRQNQDV8i8WwJM_vw_mKBvwX4QbX7OHthUU6p-UlUpiTrDXlL5uXlgZd04D2ZFxF_YzqI3Q14cD43Z0kql_3_oOSbKK9B5k5yflrkXNcgSdeiMYc2I=s1600', false, 2, 'Station Tradex Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RPEaorPrZuQaHgfOuGvvRQNQDV8i8WwJM_vw_mKBvwX4QbX7OHthUU6p-UlUpiTrDXlL5uXlgZd04D2ZFxF_YzqI3Q14cD43Z0kql_3_oOSbKK9B5k5yflrkXNcgSdeiMYc2I=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RPEaorPrZuQaHgfOuGvvRQNQDV8i8WwJM_vw_mKBvwX4QbX7OHthUU6p-UlUpiTrDXlL5uXlgZd04D2ZFxF_YzqI3Q14cD43Z0kql_3_oOSbKK9B5k5yflrkXNcgSdeiMYc2I=s1600-n-k-no', false, 3, 'Station Tradex Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RedOH_KUj8Mt0l7RZA0MMJnUYnMRFG48uHl3W5NX_AZWYdqXOK0FXwonUBqvqCnInjGzQyVJTHTi8656C1NDpun_0dfOX09qJ3Tyl3B1tABq7evxq7DrpAehcEm0FVYfc6UTgH=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RedOH_KUj8Mt0l7RZA0MMJnUYnMRFG48uHl3W5NX_AZWYdqXOK0FXwonUBqvqCnInjGzQyVJTHTi8656C1NDpun_0dfOX09qJ3Tyl3B1tABq7evxq7DrpAehcEm0FVYfc6UTgH=s1600', false, 4, 'Station Tradex Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RedOH_KUj8Mt0l7RZA0MMJnUYnMRFG48uHl3W5NX_AZWYdqXOK0FXwonUBqvqCnInjGzQyVJTHTi8656C1NDpun_0dfOX09qJ3Tyl3B1tABq7evxq7DrpAehcEm0FVYfc6UTgH=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9RedOH_KUj8Mt0l7RZA0MMJnUYnMRFG48uHl3W5NX_AZWYdqXOK0FXwonUBqvqCnInjGzQyVJTHTi8656C1NDpun_0dfOX09qJ3Tyl3B1tABq7evxq7DrpAehcEm0FVYfc6UTgH=s1600-n-k-no', false, 5, 'Station Tradex Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T0NutbmOgkj2O4Lki5UZrza6F8W6_DC50aP0qR2lQyz346yClsmoVqjkKWwCV4GTaVY4Yst5-XmuhuWL_XZBU3eKLqyMtiv_yLvaxkud5ETdyZTSi3pD8RmC_wdy_2ZcKEemAvSw=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T0NutbmOgkj2O4Lki5UZrza6F8W6_DC50aP0qR2lQyz346yClsmoVqjkKWwCV4GTaVY4Yst5-XmuhuWL_XZBU3eKLqyMtiv_yLvaxkud5ETdyZTSi3pD8RmC_wdy_2ZcKEemAvSw=s1600', false, 6, 'Station Tradex Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T0NutbmOgkj2O4Lki5UZrza6F8W6_DC50aP0qR2lQyz346yClsmoVqjkKWwCV4GTaVY4Yst5-XmuhuWL_XZBU3eKLqyMtiv_yLvaxkud5ETdyZTSi3pD8RmC_wdy_2ZcKEemAvSw=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9T0NutbmOgkj2O4Lki5UZrza6F8W6_DC50aP0qR2lQyz346yClsmoVqjkKWwCV4GTaVY4Yst5-XmuhuWL_XZBU3eKLqyMtiv_yLvaxkud5ETdyZTSi3pD8RmC_wdy_2ZcKEemAvSw=s1600-n-k-no', false, 7, 'Station Tradex Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rh_eai--bJ7u7bN1noonvfO0AMsMouzS_R3ipzQ3GGSkoE2WKU4K9QhR4i3TS9m2N-jYOk1gg43K_Ytq2k6NJ9Q0CVP9ap8JZvEN3ZEIHHzOxDkTEGeo5mCbYvImNwvTQlkRfQ=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rh_eai--bJ7u7bN1noonvfO0AMsMouzS_R3ipzQ3GGSkoE2WKU4K9QhR4i3TS9m2N-jYOk1gg43K_Ytq2k6NJ9Q0CVP9ap8JZvEN3ZEIHHzOxDkTEGeo5mCbYvImNwvTQlkRfQ=s1600', false, 8, 'Station Tradex Yassa')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rh_eai--bJ7u7bN1noonvfO0AMsMouzS_R3ipzQ3GGSkoE2WKU4K9QhR4i3TS9m2N-jYOk1gg43K_Ytq2k6NJ9Q0CVP9ap8JZvEN3ZEIHHzOxDkTEGeo5mCbYvImNwvTQlkRfQ=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9Rh_eai--bJ7u7bN1noonvfO0AMsMouzS_R3ipzQ3GGSkoE2WKU4K9QhR4i3TS9m2N-jYOk1gg43K_Ytq2k6NJ9Q0CVP9ap8JZvEN3ZEIHHzOxDkTEGeo5mCbYvImNwvTQlkRfQ=s1600-n-k-no', false, 9, 'Station Tradex Yassa')
  on conflict do nothing;

  -- [156] Bellevue appartement meublé Douala, situé à Yassa près du stage de japoma. (Yassa)
  v_listing_id := gen_random_uuid();
  insert into public.listings (
    id, owner_id, slug, type, status, title, description,
    city_id, neighborhood_id, landmark, lat, lng,
    bedrooms, bathrooms, max_guests, surface_m2,
    price_night, price_month, deposit, utilities_included,
    rules, verified_badge, published_at, updated_content_at
  ) values (
    v_listing_id,
    demo_owner,
    'bellevue-appartement-meuble-douala-situe-a-yassa-pres-du-stage-de-japoma-ya',
    'apartment',
    'published',
    'Bellevue appartement meublé Douala, situé à Yassa près du stage de japoma.',
    'Bellevue appartement meublé Douala, situé à Yassa près du stage de japoma.
Catégorie : Complexe d''appartements meublés.
Contact / WhatsApp : +41772223630.',
    c_douala_id,
    coalesce((select id from public.neighborhoods where slug = 'yassa'), (select id from public.neighborhoods where slug = 'bonapriso')),
    'Yassa',
    null,
    null,
    2, 1, 4, 60,
    30000, 450000, 30000, true,
    '{"smoking": false, "pets": false, "visitors": true}'::jsonb,
    true,
    now(),
    now()
  ) on conflict (slug) do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdvGYIV6QJniHLlA0iY2zupUD5yoSePswhzT_M1CKU6TLyr0zzInfSoMZzr6NeZgKrpnyXJalndOcNDgSCN8qdE4f7u7AzDvDV2IgX-9s_MBdAmpQpzzFsI_7w2d-2vH9cSoe1dfs3HEu0o=s1600', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdvGYIV6QJniHLlA0iY2zupUD5yoSePswhzT_M1CKU6TLyr0zzInfSoMZzr6NeZgKrpnyXJalndOcNDgSCN8qdE4f7u7AzDvDV2IgX-9s_MBdAmpQpzzFsI_7w2d-2vH9cSoe1dfs3HEu0o=s1600', true, 0, 'Bellevue appartement meublé Douala, situé à Yassa près du stage de japoma.')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/grass-cs/AABkmLdvGYIV6QJniHLlA0iY2zupUD5yoSePswhzT_M1CKU6TLyr0zzInfSoMZzr6NeZgKrpnyXJalndOcNDgSCN8qdE4f7u7AzDvDV2IgX-9s_MBdAmpQpzzFsI_7w2d-2vH9cSoe1dfs3HEu0o=s1600-p-k-no', 'https://lh3.googleusercontent.com/grass-cs/AABkmLdvGYIV6QJniHLlA0iY2zupUD5yoSePswhzT_M1CKU6TLyr0zzInfSoMZzr6NeZgKrpnyXJalndOcNDgSCN8qdE4f7u7AzDvDV2IgX-9s_MBdAmpQpzzFsI_7w2d-2vH9cSoe1dfs3HEu0o=s1600-p-k-no', false, 1, 'Bellevue appartement meublé Douala, situé à Yassa près du stage de japoma.')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TZ0JMeHtQOuA7B3MFmmo0lpl2ztuLT8oU27zgn5FP0EKMiUMIJIWSy_7k_SF__SW5zYdLRK2efnPRAwx9Nr-vjLsdXSVCmvQeaRcgFfOn-1EwAAxV0ZuVSlAiOZ_fMQHrbCI6IdV_u7U10=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TZ0JMeHtQOuA7B3MFmmo0lpl2ztuLT8oU27zgn5FP0EKMiUMIJIWSy_7k_SF__SW5zYdLRK2efnPRAwx9Nr-vjLsdXSVCmvQeaRcgFfOn-1EwAAxV0ZuVSlAiOZ_fMQHrbCI6IdV_u7U10=s1600', false, 2, 'Bellevue appartement meublé Douala, situé à Yassa près du stage de japoma.')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TZ0JMeHtQOuA7B3MFmmo0lpl2ztuLT8oU27zgn5FP0EKMiUMIJIWSy_7k_SF__SW5zYdLRK2efnPRAwx9Nr-vjLsdXSVCmvQeaRcgFfOn-1EwAAxV0ZuVSlAiOZ_fMQHrbCI6IdV_u7U10=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9TZ0JMeHtQOuA7B3MFmmo0lpl2ztuLT8oU27zgn5FP0EKMiUMIJIWSy_7k_SF__SW5zYdLRK2efnPRAwx9Nr-vjLsdXSVCmvQeaRcgFfOn-1EwAAxV0ZuVSlAiOZ_fMQHrbCI6IdV_u7U10=s1600-n-k-no', false, 3, 'Bellevue appartement meublé Douala, situé à Yassa près du stage de japoma.')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QKUph8OfCy9u2i5rVMF26_Qeqyul1kyrbw8YghGLFzgU4tjYv8d0z1VKWwmXBVV2TUBPby-sttcimgVlEwDTBE5AYmpXKPIpkSgtnXDnQ1lFlaxIHueT4z-BtOZe_MDOeNme7JPa0y3M8=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QKUph8OfCy9u2i5rVMF26_Qeqyul1kyrbw8YghGLFzgU4tjYv8d0z1VKWwmXBVV2TUBPby-sttcimgVlEwDTBE5AYmpXKPIpkSgtnXDnQ1lFlaxIHueT4z-BtOZe_MDOeNme7JPa0y3M8=s1600', false, 4, 'Bellevue appartement meublé Douala, situé à Yassa près du stage de japoma.')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QKUph8OfCy9u2i5rVMF26_Qeqyul1kyrbw8YghGLFzgU4tjYv8d0z1VKWwmXBVV2TUBPby-sttcimgVlEwDTBE5AYmpXKPIpkSgtnXDnQ1lFlaxIHueT4z-BtOZe_MDOeNme7JPa0y3M8=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9QKUph8OfCy9u2i5rVMF26_Qeqyul1kyrbw8YghGLFzgU4tjYv8d0z1VKWwmXBVV2TUBPby-sttcimgVlEwDTBE5AYmpXKPIpkSgtnXDnQ1lFlaxIHueT4z-BtOZe_MDOeNme7JPa0y3M8=s1600-n-k-no', false, 5, 'Bellevue appartement meublé Douala, situé à Yassa près du stage de japoma.')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R1BeqxMj589cx8DuEp7XyUGtIXwR8Uj0W5_S9OjKd7cDIU25DZmn8FXDC11qJp2H43UVY0LuBnuItK0xWxvOnd0T0YwfWKJDi5z1tOEqfw0B3wYj_UqhHC_iiQr7EzFlc4aY-MlHPj_SbH=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R1BeqxMj589cx8DuEp7XyUGtIXwR8Uj0W5_S9OjKd7cDIU25DZmn8FXDC11qJp2H43UVY0LuBnuItK0xWxvOnd0T0YwfWKJDi5z1tOEqfw0B3wYj_UqhHC_iiQr7EzFlc4aY-MlHPj_SbH=s1600', false, 6, 'Bellevue appartement meublé Douala, situé à Yassa près du stage de japoma.')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R1BeqxMj589cx8DuEp7XyUGtIXwR8Uj0W5_S9OjKd7cDIU25DZmn8FXDC11qJp2H43UVY0LuBnuItK0xWxvOnd0T0YwfWKJDi5z1tOEqfw0B3wYj_UqhHC_iiQr7EzFlc4aY-MlHPj_SbH=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9R1BeqxMj589cx8DuEp7XyUGtIXwR8Uj0W5_S9OjKd7cDIU25DZmn8FXDC11qJp2H43UVY0LuBnuItK0xWxvOnd0T0YwfWKJDi5z1tOEqfw0B3wYj_UqhHC_iiQr7EzFlc4aY-MlHPj_SbH=s1600-n-k-no', false, 7, 'Bellevue appartement meublé Douala, situé à Yassa près du stage de japoma.')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SzXjNe0ir_9HL5Z-8Y8H7wgkt4W3ufR9p8gn1fik0A6oS1vLgYGpepuTB_GjqgjJUbJX7m0orQ_2BdFntX7oNCqYYwuTM8x451yLOoGLoe1WsiL0ZANh_D5lxIJElrrZFYv7HH4rpYE04g=s1600', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SzXjNe0ir_9HL5Z-8Y8H7wgkt4W3ufR9p8gn1fik0A6oS1vLgYGpepuTB_GjqgjJUbJX7m0orQ_2BdFntX7oNCqYYwuTM8x451yLOoGLoe1WsiL0ZANh_D5lxIJElrrZFYv7HH4rpYE04g=s1600', false, 8, 'Bellevue appartement meublé Douala, situé à Yassa près du stage de japoma.')
  on conflict do nothing;

  insert into public.listing_media (listing_id, path_full, path_thumb, is_cover, position, alt)
  values (v_listing_id, 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SzXjNe0ir_9HL5Z-8Y8H7wgkt4W3ufR9p8gn1fik0A6oS1vLgYGpepuTB_GjqgjJUbJX7m0orQ_2BdFntX7oNCqYYwuTM8x451yLOoGLoe1WsiL0ZANh_D5lxIJElrrZFYv7HH4rpYE04g=s1600-n-k-no', 'https://lh3.googleusercontent.com/gps-cs-s/ANWiy9SzXjNe0ir_9HL5Z-8Y8H7wgkt4W3ufR9p8gn1fik0A6oS1vLgYGpepuTB_GjqgjJUbJX7m0orQ_2BdFntX7oNCqYYwuTM8x451yLOoGLoe1WsiL0ZANh_D5lxIJElrrZFYv7HH4rpYE04g=s1600-n-k-no', false, 9, 'Bellevue appartement meublé Douala, situé à Yassa près du stage de japoma.')
  on conflict do nothing;

end $$;
