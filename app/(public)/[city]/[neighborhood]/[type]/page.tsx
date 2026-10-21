import { notFound } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { Breadcrumbs } from "@/components/Breadcrumbs";
import { ListingCard } from "@/components/ListingCard";
import { Pagination } from "@/components/Pagination";
import { JsonLd } from "@/components/JsonLd";
import { EmptyState } from "@/components/EmptyState";
import { TYPE_SLUGS, TYPE_LABELS, SLUG_TO_TYPE } from "@/lib/slug";
import { Home } from "lucide-react";
import type { Metadata } from "next";

interface Props {
  params: Promise<{ city: string; neighborhood: string; type: string }>;
  searchParams: Promise<{ page?: string }>;
}

const PER_PAGE = 12;
const SITE = process.env.NEXT_PUBLIC_SITE_URL || "https://meublefacile.vercel.app";

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { city, neighborhood, type } = await params;
  const listingType = SLUG_TO_TYPE[type];
  if (!listingType) return { title: "Type introuvable", robots: { index: false, follow: false } };

  const supabase = await createClient();
  const { data: n } = await supabase
    .from("neighborhoods")
    .select("name, cities(name)")
    .eq("slug", neighborhood)
    .single();

  if (!n) return { title: "Quartier introuvable", robots: { index: false, follow: false } };
  const cityName = Array.isArray(n.cities) ? n.cities[0]?.name : (n.cities as { name?: string } | null)?.name;
  const typeLabel = TYPE_LABELS[listingType] ?? listingType;
  const url = `${SITE}/${city}/${neighborhood}/${type}`;

  // Prix minimum pour le title
  const { data: priceData } = await supabase
    .from("listings")
    .select("price_night")
    .eq("status", "published")
    .eq("type", listingType)
    .order("price_night", { ascending: true })
    .limit(1)
    .single();

  const priceStr = priceData?.price_night
    ? ` – dès ${new Intl.NumberFormat("fr-CM").format(priceData.price_night)} FCFA`
    : "";

  return {
    title: `${typeLabel}s à ${n.name}, ${cityName}${priceStr} — MeubléFacile`,
    description: `${(await supabase.from("listings").select("id", { count: "exact", head: true }).eq("status", "published").eq("type", listingType)).count ?? 0} ${typeLabel.toLowerCase()}s à ${n.name}. Annonces vérifiées avec photos, contactez le propriétaire sur WhatsApp.`,
    alternates: { canonical: url },
  };
}

export const revalidate = 3600;

export default async function TypePage({ params, searchParams }: Props) {
  const { city, neighborhood, type } = await params;
  const { page: pageParam } = await searchParams;
  const page = Math.max(1, parseInt(pageParam ?? "1", 10));
  const listingType = SLUG_TO_TYPE[type];

  if (!listingType) notFound();

  const supabase = await createClient();

  const { data: nData } = await supabase
    .from("neighborhoods")
    .select("id, name, slug, intro, cities(id, name, slug)")
    .eq("slug", neighborhood)
    .single();

  if (!nData) notFound();
  const cityData = Array.isArray(nData.cities) ? nData.cities[0] : nData.cities;
  if (!cityData || (cityData as { slug?: string }).slug !== city) notFound();

  // Count
  const { count } = await supabase
    .from("listings")
    .select("id", { count: "exact", head: true })
    .eq("status", "published")
    .eq("neighborhood_id", nData.id)
    .eq("type", listingType);

  const totalPages = Math.ceil((count ?? 0) / PER_PAGE);
  const indexable = (count ?? 0) >= 3;

  // Annonces
  const { data: listings } = await supabase
    .from("listings")
    .select(`
      id, slug, type, title, landmark, bedrooms, surface_m2,
      price_night, price_month, verified_badge, updated_content_at,
      neighborhoods(slug, name),
      cities(slug, name),
      listing_media(path_thumb, alt, is_cover, position)
    `)
    .eq("status", "published")
    .eq("neighborhood_id", nData.id)
    .eq("type", listingType)
    .order("verified_badge", { ascending: false })
    .order("updated_content_at", { ascending: false })
    .range((page - 1) * PER_PAGE, page * PER_PAGE - 1);

  const typeLabel = TYPE_LABELS[listingType];
  const cityName = (cityData as { name: string }).name;

  function buildHref(p: number) {
    return p === 1 ? `/${city}/${neighborhood}/${type}` : `/${city}/${neighborhood}/${type}?page=${p}`;
  }

  const jsonLd = {
    "@context": "https://schema.org",
    "@type": "ItemList",
    name: `${typeLabel}s à ${nData.name}, ${cityName}`,
    url: `${SITE}/${city}/${neighborhood}/${type}`,
    numberOfItems: count ?? 0,
  };

  return (
    <>
      {!indexable && <meta name="robots" content="noindex, follow" />}
      <JsonLd data={jsonLd} />

      <div className="mx-auto max-w-7xl px-4 py-6 sm:px-6">
        <Breadcrumbs
          items={[
            { label: cityName, href: `/${city}` },
            { label: nData.name, href: `/${city}/${neighborhood}` },
            { label: `${typeLabel}s` },
          ]}
        />

        <div className="mt-6 mb-6">
          <h1 className="text-2xl font-bold text-gray-900 sm:text-3xl">
            {typeLabel}s à {nData.name}, {cityName}
          </h1>
          {nData.intro && (
            <p className="mt-2 text-gray-600">{nData.intro}</p>
          )}
          {count !== null && (
            <p className="mt-1 text-sm text-gray-400">
              {count} annonce{count > 1 ? "s" : ""} disponible{count > 1 ? "s" : ""}
            </p>
          )}
        </div>

        {listings && listings.length > 0 ? (
          <>
            <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
              {listings.map((listing) => {
                const lNeighborhood = Array.isArray(listing.neighborhoods) ? listing.neighborhoods[0] : listing.neighborhoods;
                const lCity = Array.isArray(listing.cities) ? listing.cities[0] : listing.cities;
                const typeSlug = TYPE_SLUGS[listing.type] ?? listing.type;
                const href = lCity && lNeighborhood
                  ? `/${lCity.slug}/${lNeighborhood.slug}/${typeSlug}/${listing.slug}`
                  : "#";
                return (
                  <ListingCard
                    key={listing.id}
                    listing={{
                      ...listing,
                      city: lCity ?? undefined,
                      neighborhood: lNeighborhood ?? undefined,
                      listing_media: (listing.listing_media ?? []).sort((a, b) => (a.position ?? 0) - (b.position ?? 0)),
                    }}
                    href={href}
                  />
                );
              })}
            </div>
            <Pagination currentPage={page} totalPages={totalPages} buildHref={buildHref} />
          </>
        ) : (
          <EmptyState
            icon={<Home size={28} />}
            title={`Aucun ${typeLabel.toLowerCase()} dans ce quartier`}
            description="Aucune annonce pour ce type de logement dans ce quartier pour l'instant."
            action={{ label: "Voir tous les logements", href: `/${city}/${neighborhood}` }}
          />
        )}
      </div>
    </>
  );
}
