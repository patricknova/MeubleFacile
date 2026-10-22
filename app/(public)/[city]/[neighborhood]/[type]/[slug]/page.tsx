import { notFound } from "next/navigation";
import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { Breadcrumbs } from "@/components/Breadcrumbs";
import { Gallery } from "@/components/Gallery";
import { AmenityList } from "@/components/AmenityList";
import { JsonLd } from "@/components/JsonLd";
import { VerifiedBadge } from "@/components/ui/Badge";
import { ListingCard } from "@/components/ListingCard";
import { MapViewClient } from "@/components/MapViewClient";
import { NearbyLandmarksSection } from "@/components/NearbyLandmarksSection";
import { getNearbyLandmarks } from "@/lib/landmarks";
import { getCatalogListingBySlug, getCatalogListingsByNeighborhood } from "@/lib/catalog";
import { TYPE_SLUGS, TYPE_LABELS } from "@/lib/slug";
import { formatXAF, formatDate, buildWhatsAppUrl, buildListingWhatsAppMessage } from "@/lib/format";
import { buildListingTitle, buildListingDescription } from "@/lib/seo";
import {
  BedDouble, Bath, Maximize2, MapPin, CheckCircle2, Calendar,
  MessageCircleWarning, Flag
} from "lucide-react";
import type { Metadata } from "next";
import type { Amenity } from "@/lib/types";

interface Props {
  params: Promise<{ city: string; neighborhood: string; type: string; slug: string }>;
}

const SITE = process.env.NEXT_PUBLIC_SITE_URL || "https://meublefacile.vercel.app";

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { city, neighborhood, type, slug } = await params;
  const supabase = await createClient();

  const { data: dbL } = await supabase
    .from("listings")
    .select(`id, title, description, type, status, price_night, price_month,
      bedrooms, surface_m2, landmark, updated_content_at, verified_badge,
      neighborhoods(slug, name), cities(slug, name),
      listing_media(path_full, alt, is_cover, position)`)
    .eq("slug", slug)
    .in("status", ["published", "rented"])
    .single();

  let l: Record<string, any> | null = dbL;
  if (!l) {
    const catL = getCatalogListingBySlug(slug);
    if (catL) {
      l = {
        id: catL.id,
        title: catL.title,
        description: `Superbe ${catL.type === "studio" ? "studio" : "appartement"} meublé situé à ${catL.neighborhood.name}, Douala. Tout équipé, sécurisé, photos réelles.`,
        type: catL.type,
        status: "published",
        price_night: catL.price_night,
        price_month: catL.price_month,
        bedrooms: catL.bedrooms,
        surface_m2: catL.surface_m2,
        landmark: catL.landmark,
        updated_content_at: new Date().toISOString(),
        verified_badge: catL.verified_badge,
        neighborhoods: { slug: catL.neighborhood.slug, name: catL.neighborhood.name },
        cities: { slug: "douala", name: "Douala" },
        listing_media: catL.listing_media,
      };
    }
  }

  if (!l) return { title: "Annonce introuvable", robots: { index: false, follow: false } };

  const nData = Array.isArray(l.neighborhoods) ? l.neighborhoods[0] : l.neighborhoods;
  const cityData = Array.isArray(l.cities) ? l.cities[0] : l.cities;
  const cover = (l.listing_media ?? []).find((m: { is_cover: boolean }) => m.is_cover) ?? l.listing_media?.[0];
  const url = `${SITE}/${city}/${neighborhood}/${type}/${slug}`;

  const title = buildListingTitle({
    title: l.title,
    neighborhood_name: nData?.name ?? "",
    city_name: cityData?.name ?? "",
    price_night: l.price_night,
    price_month: l.price_month,
  });
  const description = buildListingDescription({
    title: l.title,
    neighborhood_name: nData?.name ?? "",
    bedrooms: l.bedrooms,
    surface_m2: l.surface_m2,
    landmark: l.landmark,
    updated_content_at: l.updated_content_at,
  });

  return {
    title,
    description,
    alternates: { canonical: url },
    robots: l.status === "published"
      ? { index: true, follow: true }
      : { index: true, follow: true }, // rented : conservée
    openGraph: {
      type: "website",
      url,
      title,
      description,
      images: cover ? [{ url: cover.path_full, width: 1280, height: 960, alt: cover.alt ?? l.title }] : [],
      locale: "fr_CM",
    },
    twitter: {
      card: "summary_large_image",
      title,
      description,
      images: cover ? [cover.path_full] : [],
    },
  };
}

export const revalidate = 3600;

export default async function ListingPage({ params }: Props) {
  const { city, neighborhood, type, slug } = await params;
  const supabase = await createClient();

  const { data: dbListing } = await supabase
    .from("listings")
    .select(`
      id, slug, type, status, title, description, landmark,
      bedrooms, bathrooms, max_guests, surface_m2,
      price_night, price_month, deposit, utilities_included, rules,
      verified_badge, published_at, updated_content_at, rented_at,
      lat, lng, neighborhood_id, owner_id,
      neighborhoods(id, slug, name, city_id, cities(slug, name)),
      listing_media(id, path_full, path_thumb, alt, is_cover, position, width, height),
      listing_amenities(amenity_id, quantity, amenities(id, code, category, label_fr, label_en, sort_order))
    `)
    .eq("slug", slug)
    .in("status", ["published", "rented"])
    .single();

  let listing: any = null;
  let ownerProfile: { first_name?: string; is_verified?: boolean; whatsapp_phone?: string } | null = null;
  let waUrl: string | null = null;
  let similar: any[] = [];

  const listingUrl = `${SITE}/${city}/${neighborhood}/${type}/${slug}`;

  if (dbListing) {
    listing = dbListing;
    // Lire le numéro WhatsApp du propriétaire côté serveur (service_role ou RLS admin)
    const adminSupabase = await createClient();
    const { data: profile } = await adminSupabase
      .from("profiles")
      .select("first_name, whatsapp_phone, is_verified")
      .eq("id", listing.owner_id)
      .single();
    ownerProfile = profile;

    const waMessage = buildListingWhatsAppMessage(listing.title, listingUrl);
    waUrl = ownerProfile?.whatsapp_phone
      ? buildWhatsAppUrl(ownerProfile.whatsapp_phone, waMessage)
      : null;

    // Annonces similaires
    const { data: simData } = await supabase
      .from("listings")
      .select(`
        id, slug, type, title, landmark, bedrooms, surface_m2,
        price_night, price_month, verified_badge,
        neighborhoods(slug, name), cities(slug, name),
        listing_media(path_thumb, alt, is_cover, position)
      `)
      .eq("status", "published")
      .eq("neighborhood_id", listing.neighborhood_id)
      .eq("type", listing.type)
      .neq("id", listing.id)
      .limit(3);

    similar = simData && simData.length > 0
      ? simData
      : getCatalogListingsByNeighborhood(neighborhood, listing.type).filter((c) => c.slug !== slug).slice(0, 3);
  } else {
    const catListing = getCatalogListingBySlug(slug);
    if (!catListing) notFound();

    listing = {
      id: catListing.id,
      slug: catListing.slug,
      type: catListing.type,
      status: "published",
      title: catListing.title,
      description: `Superbe ${catListing.type === "studio" ? "studio" : "appartement"} meublé situé à ${catListing.neighborhood.name}, Douala. Entièrement équipé avec climatisation, Wi-Fi haut débit, réserve d'eau et gardiennage 24h/7j. Proche de tous commerces et commodités.`,
      landmark: catListing.landmark,
      bedrooms: catListing.bedrooms,
      bathrooms: catListing.bathrooms,
      max_guests: Math.max(2, catListing.bedrooms * 2),
      surface_m2: catListing.surface_m2,
      price_night: catListing.price_night,
      price_month: catListing.price_month,
      deposit: 0,
      utilities_included: true,
      rules: { smoking: false, pets: false, visitors: true },
      verified_badge: catListing.verified_badge,
      published_at: new Date().toISOString(),
      updated_content_at: new Date().toISOString(),
      rented_at: null,
      lat: null,
      lng: null,
      neighborhood_id: 9000,
      owner_id: "catalog-owner",
      neighborhoods: {
        id: 9000,
        slug: catListing.neighborhood.slug,
        name: catListing.neighborhood.name,
        city_id: 1,
        cities: { slug: "douala", name: "Douala" },
      },
      listing_media: catListing.listing_media.map((m, idx) => ({
        id: idx + 1,
        path_full: m.path_full,
        path_thumb: m.path_thumb,
        alt: m.alt,
        is_cover: m.is_cover,
        position: m.position,
        width: 1200,
        height: 800,
      })),
      listing_amenities: [
        { amenity_id: 1, quantity: 1, amenities: [{ id: 1, code: "wifi", category: "confort", label_fr: "Wi-Fi Haut Débit", label_en: "High-speed Wi-Fi", sort_order: 1 }] },
        { amenity_id: 2, quantity: 1, amenities: [{ id: 2, code: "climatisation", category: "confort", label_fr: "Climatisation", label_en: "Air conditioning", sort_order: 2 }] },
        { amenity_id: 3, quantity: 1, amenities: [{ id: 3, code: "eau_chaude", category: "sanitaire", label_fr: "Eau chaude", label_en: "Hot water", sort_order: 3 }] },
        { amenity_id: 4, quantity: 1, amenities: [{ id: 4, code: "cuisine_equipee", category: "cuisine", label_fr: "Cuisine équipée", label_en: "Equipped kitchen", sort_order: 4 }] },
        { amenity_id: 5, quantity: 1, amenities: [{ id: 5, code: "gardiennage", category: "securite", label_fr: "Gardien 24h/7j", label_en: "24/7 Security", sort_order: 5 }] },
        { amenity_id: 6, quantity: 1, amenities: [{ id: 6, code: "groupe_electrogene", category: "energie", label_fr: "Groupe électrogène", label_en: "Backup Generator", sort_order: 6 }] },
      ],
    };

    ownerProfile = {
      first_name: "Gestionnaire Partenaire",
      is_verified: true,
    };

    const waMessage = buildListingWhatsAppMessage(listing.title, listingUrl);
    const cleanPhone = (catListing.phone || "237699000000").replace(/[^0-9]/g, "");
    const finalPhone = cleanPhone.startsWith("237") ? cleanPhone : `237${cleanPhone}`;
    waUrl = buildWhatsAppUrl(finalPhone, waMessage);

    similar = getCatalogListingsByNeighborhood(neighborhood, listing.type)
      .filter((c) => c.slug !== slug)
      .slice(0, 3);
  }

  const nData = Array.isArray(listing.neighborhoods) ? listing.neighborhoods[0] : listing.neighborhoods;
  const cityData = Array.isArray((nData as { cities?: unknown })?.cities)
    ? ((nData as { cities?: unknown[] }).cities ?? [])[0]
    : (nData as { cities?: unknown } | null)?.cities;

  const media = (listing.listing_media ?? []).sort((a: { position?: number }, b: { position?: number }) => (a.position ?? 0) - (b.position ?? 0));
  // Supabase returns joined amenities as arrays; normalize to { amenity, quantity }
  type RawAmenityRow = { amenity_id: unknown; quantity: number; amenities: Amenity[] };
  const amenities = ((listing.listing_amenities ?? []) as unknown as RawAmenityRow[])
    .sort((a, b) => (a.amenities?.[0]?.sort_order ?? 0) - (b.amenities?.[0]?.sort_order ?? 0))
    .map((row) => ({ amenity: row.amenities?.[0] ?? null, quantity: row.quantity }));

  const typeLabel = TYPE_LABELS[listing.type] ?? listing.type;
  const cityName = (cityData as { name?: string } | null)?.name ?? "Douala";
  const landmarks = getNearbyLandmarks(nData?.slug ?? neighborhood, listing.landmark);

  const jsonLd = {
    "@context": "https://schema.org",
    "@type": "Apartment",
    name: listing.title,
    description: listing.description ?? undefined,
    url: listingUrl,
    image: media.map((m: { path_full: string }) => m.path_full),
    numberOfRooms: listing.bedrooms ?? undefined,
    floorSize: listing.surface_m2
      ? { "@type": "QuantitativeValue", value: listing.surface_m2, unitCode: "MTK" }
      : undefined,
    address: {
      "@type": "PostalAddress",
      addressLocality: nData?.name ?? "",
      addressRegion: cityName,
      addressCountry: "CM",
    },
    geo: listing.lat && listing.lng
      ? { "@type": "GeoCoordinates", latitude: listing.lat, longitude: listing.lng }
      : undefined,
    offers: {
      "@type": "Offer",
      price: listing.price_night ?? listing.price_month,
      priceCurrency: "XAF",
      availability: listing.status === "published"
        ? "https://schema.org/InStock"
        : "https://schema.org/SoldOut",
      url: listingUrl,
    },
  };

  const rules = listing.rules as Record<string, boolean | string>;

  return (
    <>
      <JsonLd data={jsonLd} />

      <div className="mx-auto max-w-7xl px-4 py-4 sm:px-6">
        <Breadcrumbs
          items={[
            { label: cityName, href: `/${city}` },
            { label: nData?.name ?? "", href: `/${city}/${neighborhood}` },
            { label: `${typeLabel}s`, href: `/${city}/${neighborhood}/${type}` },
            { label: listing.title },
          ]}
        />
      </div>

      {/* Galerie pleine largeur */}
      <div className="mx-auto max-w-7xl px-4 sm:px-6">
        <Gallery media={media} title={listing.title} />
      </div>

      <div className="mx-auto max-w-7xl px-4 py-6 sm:px-6">
        {/* Layout principal : 2 colonnes desktop */}
        <div className="lg:grid lg:grid-cols-[1fr_360px] lg:gap-10">

          {/* ── Colonne gauche ── */}
          <div className="space-y-8">

            {/* Titre + badges */}
            <div>
              {listing.status === "rented" && (
                <div className="mb-3 flex items-center gap-2 rounded-lg bg-amber-50 border border-amber-200 px-4 py-2.5 text-sm text-amber-800">
                  <MessageCircleWarning size={16} />
                  Ce logement n&apos;est plus disponible. Consultez les logements similaires ci-dessous.
                </div>
              )}
              <div className="flex flex-wrap items-center gap-2 mb-2">
                <span className="text-sm font-medium text-brand-700">{typeLabel}</span>
                {listing.verified_badge && <VerifiedBadge />}
                {ownerProfile?.is_verified && (
                  <span className="flex items-center gap-1 text-xs text-green-700 bg-green-50 border border-green-200 rounded-full px-2.5 py-0.5">
                    <CheckCircle2 size={12} />
                    Propriétaire vérifié
                  </span>
                )}
              </div>
              <h1 className="text-2xl font-bold text-gray-900 sm:text-3xl">{listing.title}</h1>
              <div className="mt-2 flex items-center gap-1 text-sm text-gray-500">
                <MapPin size={14} />
                <span>{nData?.name}, {cityName}</span>
                {listing.landmark && <span>· {listing.landmark}</span>}
              </div>
            </div>

            {/* Caractéristiques */}
            <div className="flex flex-wrap gap-6 text-sm text-gray-700 border-t border-b border-gray-100 py-5">
              {listing.bedrooms && (
                <div className="flex items-center gap-2">
                  <BedDouble size={18} className="text-brand-600" />
                  <span><strong>{listing.bedrooms}</strong> chambre{listing.bedrooms > 1 ? "s" : ""}</span>
                </div>
              )}
              {listing.bathrooms && (
                <div className="flex items-center gap-2">
                  <Bath size={18} className="text-brand-600" />
                  <span><strong>{listing.bathrooms}</strong> salle{listing.bathrooms > 1 ? "s" : ""} de bain</span>
                </div>
              )}
              {listing.surface_m2 && (
                <div className="flex items-center gap-2">
                  <Maximize2 size={18} className="text-brand-600" />
                  <span><strong>{listing.surface_m2}</strong> m²</span>
                </div>
              )}
              {listing.max_guests && (
                <div className="flex items-center gap-2">
                  👥 <span>Jusqu&apos;à <strong>{listing.max_guests}</strong> personnes</span>
                </div>
              )}
            </div>

            {/* Description */}
            {listing.description && (
              <div>
                <h2 className="text-lg font-semibold text-gray-900 mb-3">Description</h2>
                <p className="text-gray-600 leading-relaxed whitespace-pre-line">{listing.description}</p>
              </div>
            )}

            {/* Équipements */}
            {amenities.length > 0 && (
              <div>
                <h2 className="text-lg font-semibold text-gray-900 mb-4">Équipements</h2>
                <AmenityList amenities={amenities} showCategories />
              </div>
            )}

            {/* Prix détaillés */}
            <div>
              <h2 className="text-lg font-semibold text-gray-900 mb-3">Tarifs</h2>
              <div className="rounded-xl border border-gray-200 divide-y divide-gray-100">
                {listing.price_night && (
                  <div className="flex justify-between px-4 py-3 text-sm">
                    <span className="text-gray-600">Par nuit</span>
                    <strong className="text-gray-900">{formatXAF(listing.price_night)}</strong>
                  </div>
                )}
                {listing.price_month && (
                  <div className="flex justify-between px-4 py-3 text-sm">
                    <span className="text-gray-600">Par mois</span>
                    <strong className="text-gray-900">{formatXAF(listing.price_month)}</strong>
                  </div>
                )}
                {listing.deposit > 0 && (
                  <div className="flex justify-between px-4 py-3 text-sm">
                    <span className="text-gray-600">Caution</span>
                    <span className="text-gray-700">{formatXAF(listing.deposit)}</span>
                  </div>
                )}
                <div className="flex justify-between px-4 py-3 text-sm">
                  <span className="text-gray-600">Charges</span>
                  <span className="text-gray-700">{listing.utilities_included ? "Incluses" : "Non incluses"}</span>
                </div>
              </div>
            </div>

            {/* Règles */}
            {Object.keys(rules).length > 0 && (
              <div>
                <h2 className="text-lg font-semibold text-gray-900 mb-3">Règles de la maison</h2>
                <ul className="space-y-2 text-sm text-gray-600">
                  {rules.smoking !== undefined && (
                    <li>{rules.smoking ? "✅" : "🚫"} Fumeurs {rules.smoking ? "autorisés" : "non autorisés"}</li>
                  )}
                  {rules.pets !== undefined && (
                    <li>{rules.pets ? "✅" : "🚫"} Animaux {rules.pets ? "autorisés" : "non autorisés"}</li>
                  )}
                  {rules.visitors !== undefined && (
                    <li>{rules.visitors ? "✅" : "🚫"} Visiteurs {rules.visitors ? "autorisés" : "non autorisés"}</li>
                  )}
                </ul>
              </div>
            )}

            {/* Lieux et points de repère Google Maps à proximité */}
            <NearbyLandmarksSection
              neighborhoodName={nData?.name ?? cityName}
              landmarks={landmarks}
            />

            {/* Carte */}
            {listing.lat && listing.lng && (
              <div>
                <h2 className="text-lg font-semibold text-gray-900 mb-3">Localisation</h2>
                <MapViewClient lat={listing.lat} lng={listing.lng} title={listing.title} approximate />
              </div>
            )}

            {/* Infos publication */}
            <p className="text-xs text-gray-400 flex items-center gap-1">
              <Calendar size={12} />
              Mis à jour le {formatDate(listing.updated_content_at)}
            </p>

            {/* Signaler */}
            <Link
              href={`/signaler/${listing.id}`}
              className="inline-flex items-center gap-1.5 text-xs text-gray-400 hover:text-red-500 transition-colors"
            >
              <Flag size={12} />
              Signaler cette annonce
            </Link>
          </div>

          {/* ── Colonne droite : encart de contact (desktop) ── */}
          <div className="hidden lg:block">
            <div className="sticky top-24 rounded-2xl border border-gray-200 bg-white p-6 shadow-lg">
              {listing.price_night && (
                <div className="mb-1">
                  <strong className="text-2xl text-gray-900">{formatXAF(listing.price_night)}</strong>
                  <span className="text-gray-500 text-sm"> /nuit</span>
                </div>
              )}
              {listing.price_month && (
                <div className="mb-1">
                  <strong className="text-xl text-gray-900">{formatXAF(listing.price_month)}</strong>
                  <span className="text-gray-500 text-sm"> /mois</span>
                </div>
              )}
              {listing.deposit > 0 && (
                <p className="text-xs text-gray-500 mb-4">Caution : {formatXAF(listing.deposit)}</p>
              )}

              {waUrl && listing.status === "published" ? (
                <a
                  href={waUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  id="cta-whatsapp-desktop"
                  className="flex w-full items-center justify-center gap-2 rounded-xl bg-[#25D366] py-3.5 font-bold text-white hover:bg-[#20bd5a] transition-colors"
                >
                  <svg viewBox="0 0 24 24" className="h-5 w-5 fill-current" aria-hidden="true">
                    <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413Z" />
                  </svg>
                  Contacter sur WhatsApp
                </a>
              ) : listing.status === "rented" ? (
                <div className="rounded-xl bg-gray-100 py-3.5 text-center text-sm text-gray-500 font-medium">
                  Ce logement est loué
                </div>
              ) : (
                <Link
                  href="/auth/connexion"
                  className="flex w-full items-center justify-center gap-2 rounded-xl bg-brand-700 py-3.5 font-bold text-white hover:bg-brand-800 transition-colors"
                >
                  Connexion pour contacter
                </Link>
              )}

              <p className="mt-3 text-center text-xs text-gray-400">
                ⚠️ Ne payez jamais d&apos;avance sans avoir visité.
              </p>

              {ownerProfile && (
                <div className="mt-5 flex items-center gap-3 border-t border-gray-100 pt-4">
                  <div className="flex h-10 w-10 items-center justify-center rounded-full bg-brand-100 text-brand-700 font-bold text-sm">
                    {ownerProfile.first_name?.[0]?.toUpperCase() ?? "P"}
                  </div>
                  <div>
                    <p className="text-sm font-medium text-gray-900">
                      {ownerProfile.first_name ?? "Propriétaire"}
                    </p>
                    {ownerProfile.is_verified && (
                      <p className="text-xs text-green-600 flex items-center gap-1">
                        <CheckCircle2 size={11} /> Vérifié
                      </p>
                    )}
                  </div>
                </div>
              )}
            </div>
          </div>
        </div>

        {/* Logements similaires */}
        {similar && similar.length > 0 && (
          <section className="mt-14" aria-labelledby="similar-heading">
            <h2 id="similar-heading" className="text-lg font-bold text-gray-900 mb-4">
              Autres {typeLabel.toLowerCase()}s à {nData?.name}
            </h2>
            <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
              {similar.map((s) => {
                const sItem = s as Record<string, unknown>;
                const sNeighborhood = (sItem.neighborhood as { slug?: string; name?: string } | undefined) ?? (Array.isArray(sItem.neighborhoods) ? sItem.neighborhoods[0] : sItem.neighborhoods as { slug?: string; name?: string } | undefined);
                const sCity = (sItem.city as { slug?: string; name?: string } | undefined) ?? (Array.isArray(sItem.cities) ? sItem.cities[0] : sItem.cities as { slug?: string; name?: string } | undefined);
                const sTypeSlug = TYPE_SLUGS[s.type] ?? s.type;
                const href = sCity && sNeighborhood
                  ? `/${sCity.slug}/${sNeighborhood.slug}/${sTypeSlug}/${s.slug}`
                  : `/${city}/${neighborhood}/${sTypeSlug}/${s.slug}`;
                return (
                  <ListingCard
                    key={s.id}
                    listing={{
                      ...s,
                      city: sCity ?? undefined,
                      neighborhood: sNeighborhood ?? undefined,
                      listing_media: (s.listing_media ?? []).sort((a: { position?: number }, b: { position?: number }) => (a.position ?? 0) - (b.position ?? 0)),
                    }}
                    href={href}
                  />
                );
              })}
            </div>
          </section>
        )}
      </div>

      {/* ── Barre fixe mobile ── */}
      {listing.status === "published" && (
        <div className="fixed inset-x-0 bottom-0 z-40 border-t bg-white px-4 py-3 md:hidden" style={{ paddingBottom: "calc(0.75rem + env(safe-area-inset-bottom))" }}>
          <div className="flex items-center justify-between gap-3 max-w-sm mx-auto">
            <div>
              {listing.price_night && (
                <p className="text-base font-bold text-gray-900">
                  {formatXAF(listing.price_night)} <span className="text-xs font-normal text-gray-400">/nuit</span>
                </p>
              )}
              {!listing.price_night && listing.price_month && (
                <p className="text-base font-bold text-gray-900">
                  {formatXAF(listing.price_month)} <span className="text-xs font-normal text-gray-400">/mois</span>
                </p>
              )}
            </div>
            {waUrl ? (
              <a
                href={waUrl}
                target="_blank"
                rel="noopener noreferrer"
                id="cta-whatsapp-mobile"
                className="flex items-center gap-2 rounded-xl bg-[#25D366] px-5 py-3 font-bold text-white hover:bg-[#20bd5a] transition-colors"
              >
                <svg viewBox="0 0 24 24" className="h-5 w-5 fill-current" aria-hidden="true">
                  <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413Z" />
                </svg>
                WhatsApp
              </a>
            ) : (
              <Link
                href="/auth/connexion"
                className="rounded-xl bg-brand-700 px-5 py-3 font-bold text-white hover:bg-brand-800 transition-colors"
              >
                Connexion
              </Link>
            )}
          </div>
        </div>
      )}
    </>
  );
}
