import { TYPE_SLUGS as DEFAULT_TYPE_SLUGS } from "./slug";

/**
 * Normalise un objet listing retourné par Supabase pour l'utilisation dans ListingCard.
 * Supporte aussi bien les jointures Supabase (tableaux/objets) que les objets déjà normalisés.
 */
export function normalizeListing(listing: Record<string, unknown>) {
  const rawCity = listing.cities ?? listing.city;
  const city = Array.isArray(rawCity)
    ? (rawCity[0] as { slug: string; name: string } | undefined) ?? null
    : (rawCity as { slug: string; name: string } | null);

  const rawNeighborhood = listing.neighborhoods ?? listing.neighborhood;
  const neighborhood = Array.isArray(rawNeighborhood)
    ? (rawNeighborhood[0] as { slug: string; name: string } | undefined) ?? null
    : (rawNeighborhood as { slug: string; name: string } | null);

  const listing_media = ((listing.listing_media as { path_thumb: string; alt?: string | null; is_cover?: boolean; position?: number | null }[] | null) ?? [])
    .sort((a, b) => (a.position ?? 0) - (b.position ?? 0));

  return {
    id: listing.id as string,
    slug: listing.slug as string,
    type: listing.type as string,
    title: listing.title as string,
    landmark: listing.landmark as string | null | undefined,
    bedrooms: listing.bedrooms as number | null | undefined,
    surface_m2: listing.surface_m2 as number | null | undefined,
    price_night: listing.price_night as number | null | undefined,
    price_month: listing.price_month as number | null | undefined,
    verified_badge: listing.verified_badge as boolean | undefined,
    city: city ?? undefined,
    neighborhood: neighborhood ?? undefined,
    listing_media,
  };
}

/**
 * Construit l'URL publique d'une annonce à partir des objets partiels Supabase ou normalisés.
 * Ne retourne jamais "#" dès lors que le slug de l'annonce est présent.
 */
export function buildListingHref(
  listing: Record<string, unknown>,
  TYPE_SLUGS: Record<string, string> = DEFAULT_TYPE_SLUGS
): string {
  const rawCity = listing.cities ?? listing.city;
  const cityObj = Array.isArray(rawCity)
    ? (rawCity[0] as { slug?: string } | undefined)
    : (rawCity as { slug?: string } | null);

  const rawNeighborhood = listing.neighborhoods ?? listing.neighborhood;
  const neighborhoodObj = Array.isArray(rawNeighborhood)
    ? (rawNeighborhood[0] as { slug?: string } | undefined)
    : (rawNeighborhood as { slug?: string } | null);

  const citySlug = cityObj?.slug ?? (typeof rawCity === "string" ? rawCity : "douala");
  const neighborhoodSlug = neighborhoodObj?.slug ?? (typeof rawNeighborhood === "string" ? rawNeighborhood : "tous");
  const typeStr = (listing.type as string) || "studio";
  const typeSlug = TYPE_SLUGS[typeStr] ?? typeStr;
  const listingSlug = (listing.slug as string) || "";

  if (!listingSlug) return "#";

  return `/${citySlug}/${neighborhoodSlug}/${typeSlug}/${listingSlug}`;
}
