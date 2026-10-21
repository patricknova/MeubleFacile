import { notFound } from "next/navigation";
import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { Breadcrumbs } from "@/components/Breadcrumbs";
import { ListingCard } from "@/components/ListingCard";
import { JsonLd } from "@/components/JsonLd";
import { TYPE_SLUGS, TYPE_LABELS } from "@/lib/slug";
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

  if (!data) return { title: "Ville introuvable", robots: { index: false, follow: false } };
  return {
    title: `Logements meublés à ${data.name} — MeubléFacile`,
    description: `Trouvez un studio ou appartement meublé à ${data.name}. Annonces vérifiées avec photos, contactez le propriétaire sur WhatsApp.`,
    alternates: { canonical: `/${city}` },
  };
}

export const revalidate = 3600;

export default async function CityPage({ params }: Props) {
  const { city } = await params;
  const supabase = await createClient();

  const { data: cityData } = await supabase
    .from("cities")
    .select("id, name, slug")
    .eq("slug", city)
    .eq("active", true)
    .single();

  if (!cityData) notFound();

  // Quartiers avec nombre d'annonces
  const { data: neighborhoods } = await supabase
    .from("neighborhoods")
    .select("id, slug, name, intro, lat, lng")
    .eq("city_id", cityData.id)
    .order("name");

  // Annonces récentes de la ville
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
    .eq("city_id", cityData.id)
    .order("published_at", { ascending: false })
    .limit(9);

  const SITE = process.env.NEXT_PUBLIC_SITE_URL || "https://meublefacile.vercel.app";

  const jsonLd = {
    "@context": "https://schema.org",
    "@type": "ItemList",
    name: `Logements meublés à ${cityData.name}`,
    url: `${SITE}/${city}`,
    numberOfItems: listings?.length ?? 0,
    itemListElement: (listings ?? []).slice(0, 10).map((l, i) => {
      const neighborhood = Array.isArray(l.neighborhoods) ? l.neighborhoods[0] : l.neighborhoods;
      const citySlug = Array.isArray(l.cities) ? l.cities[0]?.slug : (l.cities as { slug?: string } | null)?.slug;
      const typeSlug = TYPE_SLUGS[l.type] ?? l.type;
      return {
        "@type": "ListItem",
        position: i + 1,
        url: `${SITE}/${citySlug}/${neighborhood?.slug}/${typeSlug}/${l.slug}`,
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
        {neighborhoods && neighborhoods.length > 0 && (
          <section aria-labelledby="neighborhoods-title" className="mb-12">
            <h2 id="neighborhoods-title" className="text-lg font-bold text-gray-900 mb-4">
              Quartiers de {cityData.name}
            </h2>
            <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 md:grid-cols-4">
              {neighborhoods.map((n) => (
                <Link
                  key={n.id}
                  href={`/${city}/${n.slug}`}
                  className="group flex items-start gap-3 rounded-xl border border-gray-200 bg-white p-4 hover:border-brand-300 hover:bg-brand-50 transition-all hover:shadow-sm"
                >
                  <div className="shrink-0 mt-0.5 flex h-8 w-8 items-center justify-center rounded-full bg-brand-100 group-hover:bg-brand-200 transition-colors">
                    <MapPin size={15} className="text-brand-700" />
                  </div>
                  <div>
                    <p className="text-sm font-semibold text-gray-900">{n.name}</p>
                    {n.intro && (
                      <p className="text-xs text-gray-400 mt-0.5 line-clamp-2">{n.intro}</p>
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
                {label}s
              </Link>
            ))}
          </div>
        </section>

        {/* Annonces récentes */}
        {listings && listings.length > 0 && (
          <section aria-labelledby="recent-title">
            <div className="flex items-baseline justify-between mb-4">
              <h2 id="recent-title" className="text-lg font-bold text-gray-900">
                Annonces récentes à {cityData.name}
              </h2>
            </div>
            <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
              {listings.map((listing) => {
                const neighborhood = Array.isArray(listing.neighborhoods) ? listing.neighborhoods[0] : listing.neighborhoods;
                const listingCity = Array.isArray(listing.cities) ? listing.cities[0] : listing.cities;
                const typeSlug = TYPE_SLUGS[listing.type] ?? listing.type;
                const href = listingCity && neighborhood
                  ? `/${listingCity.slug}/${neighborhood.slug}/${typeSlug}/${listing.slug}`
                  : "#";
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

        {(!listings || listings.length === 0) && (
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
