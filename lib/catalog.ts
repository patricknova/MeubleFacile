// ============================================================
// Catalogue Unifié — MeubléFacile Douala
// Regroupe les 156+ appartements et studios meublés réels
// ============================================================

import catalogRaw from "./catalog-data.json";

export interface CatalogListing {
  id: string;
  slug: string;
  title: string;
  type: "studio" | "apartment" | "duplex" | "room";
  status: string;
  neighborhood: {
    name: string;
    slug: string;
  };
  city: {
    name: string;
    slug: string;
  };
  landmark: string;
  price_night: number;
  price_month: number;
  bedrooms: number;
  bathrooms: number;
  surface_m2: number;
  verified_badge: boolean;
  phone: string;
  rating: number;
  reviewsCount: number;
  listing_media: {
    path_thumb: string;
    path_full: string;
    alt: string;
    is_cover: boolean;
    position: number;
  }[];
}

const ALL_LISTINGS: CatalogListing[] = catalogRaw as CatalogListing[];

/**
 * Retourne la totalité des annonces du catalogue (156+)
 */
export function getAllCatalogListings(): CatalogListing[] {
  return ALL_LISTINGS;
}

/**
 * Retourne une sélection pour l'accueil (studios & appartements variés de plusieurs quartiers)
 */
export function getFeaturedCatalogListings(limit = 12): CatalogListing[] {
  const priorityNeighborhoods = ["bonapriso", "yassa", "bonamoussadi", "akwa", "makepe", "kotto"];
  const featured: CatalogListing[] = [];
  const seenNeighborhoods = new Set<string>();

  // 1. Sélectionner un de chaque quartier prioritaire
  for (const n of priorityNeighborhoods) {
    const match = ALL_LISTINGS.find(
      (l) => l.neighborhood.slug === n && l.listing_media.length > 0 && !featured.some((f) => f.id === l.id)
    );
    if (match) {
      featured.push(match);
      seenNeighborhoods.add(n);
    }
  }

  // 2. Compléter jusqu'à la limite
  for (const item of ALL_LISTINGS) {
    if (featured.length >= limit) break;
    if (!featured.some((f) => f.id === item.id)) {
      featured.push(item);
    }
  }

  return featured;
}

/**
 * Retourne les logements meublés filtrés par quartier et/ou type
 */
export function getCatalogListingsByNeighborhood(
  neighborhoodSlug: string,
  type?: string
): CatalogListing[] {
  const normN = neighborhoodSlug.toLowerCase().trim();
  return ALL_LISTINGS.filter((l) => {
    const matchN = l.neighborhood.slug === normN;
    if (!matchN) return false;
    if (type) {
      return l.type === type;
    }
    return true;
  });
}

/**
 * Retourne les logements meublés filtrés par type (studio, apartment, etc.)
 */
export function getCatalogListingsByType(type: string): CatalogListing[] {
  return ALL_LISTINGS.filter((l) => l.type === type);
}

/**
 * Statistiques et liste des quartiers avec nombre d'annonces réelles
 */
export function getCatalogNeighborhoodStats() {
  const map = new Map<string, { name: string; slug: string; count: number; studios: number; apartments: number }>();

  for (const item of ALL_LISTINGS) {
    const slug = item.neighborhood.slug;
    const existing = map.get(slug) || {
      name: item.neighborhood.name,
      slug,
      count: 0,
      studios: 0,
      apartments: 0,
    };
    existing.count++;
    if (item.type === "studio") existing.studios++;
    if (item.type === "apartment" || item.type === "duplex") existing.apartments++;
    map.set(slug, existing);
  }

  return Array.from(map.values()).sort((a, b) => b.count - a.count);
}

/**
 * Trouve un logement par son slug
 */
export function getCatalogListingBySlug(slug: string): CatalogListing | undefined {
  return ALL_LISTINGS.find((l) => l.slug === slug);
}
