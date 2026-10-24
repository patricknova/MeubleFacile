import { TYPE_LABELS, TYPE_SLUGS } from "./slug";

const SITE = process.env.NEXT_PUBLIC_SITE_URL || "https://meuble-facile.vercel.app";

/**
 * Génère le title SEO d'une fiche annonce (~60 caractères)
 */
export function buildListingTitle(listing: {
  title: string;
  neighborhood_name: string;
  city_name: string;
  price_night?: number | null;
  price_month?: number | null;
}): string {
  const price = listing.price_night ?? listing.price_month;
  const priceStr = price
    ? ` – ${new Intl.NumberFormat("fr-CM").format(price)} FCFA`
    : "";
  return `${listing.title} à ${listing.neighborhood_name}, ${listing.city_name}${priceStr}`.slice(0, 70);
}

/**
 * Génère la description SEO d'une fiche annonce (~150 caractères)
 */
export function buildListingDescription(listing: {
  title: string;
  neighborhood_name: string;
  bedrooms?: number | null;
  surface_m2?: number | null;
  landmark?: string | null;
  updated_content_at?: string | null;
}): string {
  const parts = [];
  if (listing.bedrooms) parts.push(`${listing.bedrooms} chambre${listing.bedrooms > 1 ? "s" : ""}`);
  if (listing.surface_m2) parts.push(`${listing.surface_m2} m²`);
  if (listing.landmark) parts.push(`près de ${listing.landmark}`);

  const details = parts.join(", ");
  const base = `${listing.title} à ${listing.neighborhood_name}${details ? " — " + details : ""}.`;
  return (base + " Contactez le propriétaire sur WhatsApp.").slice(0, 155);
}

/**
 * Génère le title SEO d'une page quartier + type
 */
export function buildNeighborhoodTypeTitle(
  type: string,
  neighborhoodName: string,
  cityName: string,
  count: number,
  minPrice?: number | null
): string {
  const typeLabel = TYPE_LABELS[type] ?? type;
  const priceStr = minPrice
    ? ` – dès ${new Intl.NumberFormat("fr-CM").format(minPrice)} FCFA`
    : "";
  return `${typeLabel}s à ${neighborhoodName}, ${cityName}${priceStr}`.slice(0, 70);
}

/**
 * URL canonique d'une annonce
 */
export function buildListingUrl(listing: {
  city_slug: string;
  neighborhood_slug: string;
  type: string;
  slug: string;
}): string {
  const typeSlug = TYPE_SLUGS[listing.type] ?? listing.type;
  return `${SITE}/${listing.city_slug}/${listing.neighborhood_slug}/${typeSlug}/${listing.slug}`;
}

export { SITE };
