import { notFound } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { Breadcrumbs } from "@/components/Breadcrumbs";
import { ListingCard } from "@/components/ListingCard";
import { Pagination } from "@/components/Pagination";
import { JsonLd } from "@/components/JsonLd";
import { EmptyState } from "@/components/EmptyState";
import { TYPE_SLUGS, TYPE_LABELS } from "@/lib/slug";
import { getCatalogListingsByNeighborhood, getCatalogNeighborhoodStats } from "@/lib/catalog";
import Link from "next/link";
import { Home } from "lucide-react";
import type { Metadata } from "next";

interface Props {
  params: Promise<{ city: string; neighborhood: string }>;
  searchParams: Promise<{ page?: string; budget_max?: string }>;
}

const PER_PAGE = 12;
const SITE = process.env.NEXT_PUBLIC_SITE_URL || "https://meuble-facile.vercel.app";

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { city, neighborhood } = await params;
  const supabase = await createClient();

  let n: any = null;
  const { data: dbN } = await supabase
    .from("neighborhoods")
    .select("name, intro, cities(name, slug)")
    .eq("slug", neighborhood)
    .single();

  if (dbN) {
    n = dbN;
  } else {
    const catN = getCatalogNeighborhoodStats().find((s) => s.slug === neighborhood.toLowerCase());
    if (catN) {
      n = {
        name: catN.name,
        intro: `Trouvez votre appartement ou studio meublé à ${catN.name}, Douala. Annonces vérifiées avec photos et contact WhatsApp.`,
        cities: { name: "Douala", slug: "douala" },
      };
    }
  }

  if (!n) return { title: "Quartier introuvable", robots: { index: false, follow: false } };
  const cityName = Array.isArray(n.cities) ? n.cities[0]?.name : (n.cities as { name?: string } | null)?.name ?? "Douala";
  const url = `${SITE}/${city}/${neighborhood}`;

  return {
    title: `Logements meublés à ${n.name}, ${cityName} — MeubléFacile`,
    description: n.intro
      ? n.intro.slice(0, 155)
      : `Trouvez un logement meublé à ${n.name}. Annonces vérifiées, contact WhatsApp direct.`,
    alternates: { canonical: url },
  };
}

export const revalidate = 3600;

export default async function NeighborhoodPage({ params, searchParams }: Props) {
  const { city, neighborhood } = await params;
  const { page: pageParam, budget_max } = await searchParams;
  const page = Math.max(1, parseInt(pageParam ?? "1", 10));
  const supabase = await createClient();

  // Quartier
  let nData: any = null;
  const { data: dbNData } = await supabase
    .from("neighborhoods")
    .select("id, name, slug, intro, lat, lng, cities(id, name, slug)")
    .eq("slug", neighborhood)
    .single();

  if (dbNData) {
    nData = dbNData;
  } else {
    const catN = getCatalogNeighborhoodStats().find((s) => s.slug === neighborhood.toLowerCase());
    if (catN) {
      nData = {
        id: 9000,
        name: catN.name,
        slug: catN.slug,
        intro: `Trouvez votre appartement ou studio meublé à ${catN.name}, Douala. Annonces réelles avec photos, climatisation et contact direct sur WhatsApp.`,
        lat: 4.02,
        lng: 9.71,
        cities: { id: 1, name: "Douala", slug: "douala" },
      };
    }
  }

  if (!nData) notFound();

  const cityData = Array.isArray(nData.cities) ? nData.cities[0] : nData.cities;
  if (!cityData || (cityData as { slug?: string }).slug !== city) notFound();

  // Annonces depuis Supabase
  let query = supabase
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
    .order("verified_badge", { ascending: false })
    .order("updated_content_at", { ascending: false });

  if (budget_max) query = query.lte("price_night", parseInt(budget_max));
  const { data: dbListings } = await query;

  // Catalogue local de secours / complément pour le quartier
  const catListings = getCatalogListingsByNeighborhood(neighborhood);
  const combinedListings = [
    ...(dbListings ?? []),
    ...catListings.filter((c) => !(dbListings ?? []).some((l) => l.slug === c.slug)),
  ];

  const totalCount = combinedListings.length;
  const totalPages = Math.ceil(totalCount / PER_PAGE);
  const listings = combinedListings.slice((page - 1) * PER_PAGE, page * PER_PAGE);

  const indexable = totalCount >= 3 && !budget_max && page <= 1;

  function buildHref(p: number) {
    const u = `/${city}/${neighborhood}`;
    return p === 1 ? u : `${u}?page=${p}`;
  }

  const jsonLd = {
    "@context": "https://schema.org",
    "@type": "ItemList",
    name: `Logements meublés à ${nData.name}`,
    url: `${SITE}/${city}/${neighborhood}`,
    numberOfItems: totalCount,
    itemListElement: (listings ?? []).slice(0, 10).map((l, i) => {
      const itemRecord = l as Record<string, unknown>;
      const lNeighborhood = (itemRecord.neighborhood as { slug?: string } | undefined) ?? (Array.isArray(itemRecord.neighborhoods) ? itemRecord.neighborhoods[0] : itemRecord.neighborhoods);
      const lCity = (itemRecord.city as { slug?: string } | undefined) ?? (Array.isArray(itemRecord.cities) ? itemRecord.cities[0] : itemRecord.cities);
      return {
        "@type": "ListItem",
        position: (page - 1) * PER_PAGE + i + 1,
        url: `${SITE}/${lCity?.slug ?? city}/${lNeighborhood?.slug ?? neighborhood}/${TYPE_SLUGS[l.type] ?? l.type}/${l.slug}`,
        name: l.title,
      };
    }),
  };

  return (
    <>
      {!indexable && (
        <meta name="robots" content="noindex, follow" />
      )}
      <JsonLd data={jsonLd} />

      <div className="mx-auto max-w-7xl px-4 py-6 sm:px-6">
        <Breadcrumbs
          items={[
            { label: (cityData as { name: string }).name, href: `/${city}` },
            { label: nData.name },
          ]}
        />

        <div className="mt-6 mb-6">
          <h1 className="text-2xl font-bold text-gray-900 sm:text-3xl">
            Logements meublés à {nData.name}
          </h1>
          {nData.intro && (
            <p className="mt-2 text-gray-600 leading-relaxed">{nData.intro}</p>
          )}
          {totalCount > 0 && (
            <p className="mt-1 text-sm text-gray-400">{totalCount} annonce{totalCount > 1 ? "s" : ""} disponible{totalCount > 1 ? "s" : ""}</p>
          )}
        </div>

        {/* Filtres rapides par type */}
        <div className="mb-6 flex flex-wrap gap-2">
          <Link
            href={`/${city}/${neighborhood}`}
            className="rounded-full border border-brand-700 bg-brand-700 px-4 py-1.5 text-xs font-semibold text-white"
          >
            Tous
          </Link>
          {Object.entries(TYPE_SLUGS).map(([type, typeSlug]) => (
            <Link
              key={type}
              href={`/${city}/${neighborhood}/${typeSlug}`}
              className="rounded-full border border-gray-200 bg-white px-4 py-1.5 text-xs font-medium text-gray-700 hover:border-brand-300 hover:bg-brand-50 transition-all"
            >
              {TYPE_LABELS[type]}s
            </Link>
          ))}
        </div>

        {/* Grille */}
        {listings && listings.length > 0 ? (
          <>
            <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
              {listings.map((listing) => {
                const itemRecord = listing as Record<string, unknown>;
                const lNeighborhood = (itemRecord.neighborhood as { name?: string; slug?: string } | undefined) ?? (Array.isArray(itemRecord.neighborhoods) ? itemRecord.neighborhoods[0] : itemRecord.neighborhoods);
                const lCity = (itemRecord.city as { name?: string; slug?: string } | undefined) ?? (Array.isArray(itemRecord.cities) ? itemRecord.cities[0] : itemRecord.cities);
                const typeSlug = TYPE_SLUGS[listing.type] ?? listing.type;
                const href = `/${lCity?.slug ?? city}/${lNeighborhood?.slug ?? neighborhood}/${typeSlug}/${listing.slug}`;
                return (
                  <ListingCard
                    key={listing.id}
                    listing={{
                      ...listing,
                      city: lCity ?? { name: "Douala", slug: "douala" },
                      neighborhood: lNeighborhood ?? { name: nData.name, slug: nData.slug },
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
            title="Aucune annonce dans ce quartier"
            description="Soyez le premier à publier un logement meublé à cet endroit."
            action={{ label: "Déposer une annonce", href: "/deposer" }}
          />
        )}
      </div>
    </>
  );
}
