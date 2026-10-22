import { notFound } from "next/navigation";
import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { Breadcrumbs } from "@/components/Breadcrumbs";
import { ListingCard } from "@/components/ListingCard";
import { JsonLd } from "@/components/JsonLd";
import { TYPE_SLUGS, TYPE_LABELS } from "@/lib/slug";
import { getCatalogNeighborhoodStats, getAllCatalogListings } from "@/lib/catalog";
import { MapPin, ArrowRight } from "lucide-react";
import type { Metadata } from "next";

interface Props {
  params: Promise<{ city: string }>;
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { city } = await params;
  const supabase = await createClient();
  const { data } = await supabase
    .from("cities")
    .select("name, slug")
    .eq("slug", city)
    .single();

  const cityName = data?.name ?? (city.toLowerCase() === "douala" ? "Douala" : city);
  return {
    title: `Logements meublés à ${cityName} — MeubléFacile`,
    description: `Trouvez un studio ou appartement meublé à ${cityName}. Plus de 150 annonces vérifiées par quartier (Bonapriso, Yassa, Bonamoussadi...) avec photos HD et WhatsApp direct.`,
    alternates: { canonical: `/${city}` },
  };
}

export const revalidate = 3600;

export default async function CityPage({ params }: Props) {
  const { city } = await params;
  const supabase = await createClient();

  const { data: dbCity } = await supabase
    .from("cities")
    .select("id, name, slug")
    .eq("slug", city)
    .eq("active", true)
    .single();

  const cityData = dbCity ?? (city.toLowerCase() === "douala" ? { id: 1, name: "Douala", slug: "douala" } : null);
  if (!cityData) notFound();

  // Quartiers Supabase
  const { data: dbNeighborhoods } = await supabase
    .from("neighborhoods")
    .select("id, slug, name, intro, lat, lng")
    .eq("city_id", cityData.id)
    .order("name");

  // Fusionner avec les statistiques du catalogue (pour inclure Yassa, Makepe, etc.)
  const catStats = getCatalogNeighborhoodStats();
  const allNeighborhoodsMap = new Map<string, { id: number | string; slug: string; name: string; intro?: string; count?: number; studios?: number; apartments?: number }>();

  // D'abord les quartiers de la base
  for (const n of dbNeighborhoods ?? []) {
    const stat = catStats.find((s) => s.slug === n.slug);
    allNeighborhoodsMap.set(n.slug, {
      id: n.id,
      slug: n.slug,
      name: n.name,
      intro: n.intro ?? undefined,
      count: stat?.count ?? 0,
      studios: stat?.studios ?? 0,
      apartments: stat?.apartments ?? 0,
    });
  }

  // Ajouter les quartiers du catalogue non présents en DB (comme Yassa)
  for (const stat of catStats) {
    if (!allNeighborhoodsMap.has(stat.slug)) {
      allNeighborhoodsMap.set(stat.slug, {
        id: `cat-${stat.slug}`,
        slug: stat.slug,
        name: stat.name,
        intro: `Découvrez les meilleurs appartements et studios meublés à ${stat.name}.`,
        count: stat.count,
        studios: stat.studios,
        apartments: stat.apartments,
      });
    }
  }

  const sortedNeighborhoods = Array.from(allNeighborhoodsMap.values()).sort((a, b) => {
    // Trier par nombre d'annonces décroissant
    return (b.count ?? 0) - (a.count ?? 0);
  });

  // Annonces récentes de la ville
  const { data: dbListings } = await supabase
    .from("listings")
    .select(`
      id, slug, type, title, landmark, bedrooms, surface_m2,
      price_night, price_month, verified_badge, updated_content_at,
      neighborhoods(slug, name),
      cities(slug, name),
      listing_media(path_thumb, alt, is_cover, position)
    `)
    .eq("status", "published")
    .eq("city_id", cityData.id)
    .order("published_at", { ascending: false })
    .limit(9);

  // Compléter avec les annonces du catalogue local
  const catListings = getAllCatalogListings().slice(0, 12);
  const combinedListings = [
    ...(dbListings ?? []),
    ...catListings.filter((c) => !(dbListings ?? []).some((l) => l.slug === c.slug)),
  ].slice(0, 12);

  const SITE = process.env.NEXT_PUBLIC_SITE_URL || "https://meublefacile.vercel.app";

  const jsonLd = {
    "@context": "https://schema.org",
    "@type": "ItemList",
    name: `Logements meublés à ${cityData.name}`,
    url: `${SITE}/${city}`,
    numberOfItems: combinedListings.length,
    itemListElement: combinedListings.slice(0, 10).map((l, i) => {
      const item = l as Record<string, unknown>;
      const neighborhood = (item.neighborhood as { slug?: string } | undefined) ?? (Array.isArray(item.neighborhoods) ? item.neighborhoods[0] : item.neighborhoods as { slug?: string } | undefined);
      const citySlug = (item.city as { slug?: string } | undefined)?.slug ?? (Array.isArray(item.cities) ? item.cities[0]?.slug : (item.cities as { slug?: string } | null)?.slug) ?? city;
      const typeSlug = TYPE_SLUGS[l.type] ?? l.type;
      return {
        "@type": "ListItem",
        position: i + 1,
        url: `${SITE}/${citySlug}/${neighborhood?.slug ?? "douala"}/${typeSlug}/${l.slug}`,
        name: l.title,
      };
    }),
  };

  return (
    <>
      <JsonLd data={jsonLd} />
      <div className="mx-auto max-w-7xl px-4 py-6 sm:px-6">
        <Breadcrumbs items={[{ label: cityData.name }]} />

        <div className="mt-6 mb-8">
          <h1 className="text-2xl font-bold text-gray-900 sm:text-3xl">
            Logements meublés à {cityData.name}
          </h1>
          <p className="mt-2 text-gray-500">
            Studios, appartements et chambres meublés — annonces vérifiées avec photos et contact WhatsApp direct.
          </p>
        </div>

        {/* Quartiers */}
        {sortedNeighborhoods && sortedNeighborhoods.length > 0 && (
          <section aria-labelledby="neighborhoods-title" className="mb-12">
            <h2 id="neighborhoods-title" className="text-lg font-bold text-gray-900 mb-4">
              Quartiers de {cityData.name} ({sortedNeighborhoods.length} quartiers)
            </h2>
            <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 md:grid-cols-4">
              {sortedNeighborhoods.map((n) => (
                <Link
                  key={n.slug}
                  href={`/${city}/${n.slug}`}
                  className="group flex items-start gap-3 rounded-xl border border-gray-200 bg-white p-4 hover:border-brand-300 hover:bg-brand-50 transition-all hover:shadow-sm"
                >
                  <div className="shrink-0 mt-0.5 flex h-8 w-8 items-center justify-center rounded-full bg-brand-100 group-hover:bg-brand-200 transition-colors">
                    <MapPin size={15} className="text-brand-700" />
                  </div>
                  <div>
                    <p className="text-sm font-semibold text-gray-900 group-hover:text-brand-800 transition-colors">{n.name}</p>
                    {n.count && n.count > 0 ? (
                      <p className="text-xs font-medium text-brand-600 mt-0.5">
                        {n.count} logement{n.count > 1 ? "s" : ""}
                        {n.apartments ? ` · ${n.apartments} appt${n.apartments > 1 ? "s" : ""}` : ""}
                        {n.studios ? ` · ${n.studios} studio${n.studios > 1 ? "s" : ""}` : ""}
                      </p>
                    ) : (
                      <p className="text-xs text-gray-400 mt-0.5 line-clamp-1">Voir les disponibilités</p>
                    )}
                  </div>
                </Link>
              ))}
            </div>
          </section>
        )}

        {/* Types de logements */}
        <section aria-labelledby="types-title" className="mb-12">
          <h2 id="types-title" className="text-lg font-bold text-gray-900 mb-4">
            Rechercher par type de logement
          </h2>
          <div className="flex flex-wrap gap-3">
            {Object.entries(TYPE_LABELS).map(([type, label]) => (
              <Link
                key={type}
                href={`/${city}/bonamoussadi/${TYPE_SLUGS[type]}`}
                className="rounded-full border border-gray-200 bg-white px-4 py-2 text-sm font-medium text-gray-700 hover:border-brand-300 hover:bg-brand-50 hover:text-brand-700 transition-all"
              >
                {label}s à Douala
              </Link>
            ))}
          </div>
        </section>

        {/* Annonces récentes */}
        {combinedListings && combinedListings.length > 0 && (
          <section aria-labelledby="recent-title">
            <div className="flex items-baseline justify-between mb-4">
              <h2 id="recent-title" className="text-lg font-bold text-gray-900">
                Logements meublés disponibles à {cityData.name}
              </h2>
              <span className="text-sm text-gray-500 font-medium">
                {combinedListings.length} annonces sélectionnées
              </span>
            </div>
            <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
              {combinedListings.map((listing) => {
                const item = listing as Record<string, unknown>;
                const neighborhood = (item.neighborhood as { slug?: string; name?: string } | undefined) ?? (Array.isArray(item.neighborhoods) ? item.neighborhoods[0] : item.neighborhoods as { slug?: string; name?: string } | undefined);
                const listingCity = (item.city as { slug?: string; name?: string } | undefined) ?? (Array.isArray(item.cities) ? item.cities[0] : item.cities as { slug?: string; name?: string } | undefined);
                const typeSlug = TYPE_SLUGS[listing.type] ?? listing.type;
                const href = listingCity && neighborhood
                  ? `/${listingCity.slug}/${neighborhood.slug}/${typeSlug}/${listing.slug}`
                  : `/${city}/${neighborhood?.slug ?? "douala"}/${typeSlug}/${listing.slug}`;
                return (
                  <ListingCard
                    key={listing.id}
                    listing={{
                      ...listing,
                      city: listingCity ?? undefined,
                      neighborhood: neighborhood ?? undefined,
                      listing_media: (listing.listing_media ?? []).sort((a, b) => (a.position ?? 0) - (b.position ?? 0)),
                    }}
                    href={href}
                  />
                );
              })}
            </div>
          </section>
        )}

        {(!combinedListings || combinedListings.length === 0) && (
          <div className="rounded-xl border border-dashed border-gray-200 py-16 text-center">
            <p className="text-gray-500">Aucune annonce publiée à {cityData.name} pour l&apos;instant.</p>
            <Link href="/deposer" className="mt-4 inline-flex items-center gap-1.5 text-sm text-brand-700 font-medium hover:underline">
              Déposer la première annonce <ArrowRight size={14} />
            </Link>
          </div>
        )}
      </div>
    </>
  );
}
