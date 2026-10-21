// Types TypeScript pour la base de données Supabase MVP

export type ListingStatus =
  | "draft"
  | "pending_review"
  | "published"
  | "paused"
  | "rented"
  | "rejected";

export type ListingType = "studio" | "apartment" | "room" | "duplex";

export interface Profile {
  id: string;
  first_name: string | null;
  last_name: string | null;
  whatsapp_phone: string | null;
  role: "user" | "admin";
  is_verified: boolean;
  created_at: string;
}

export interface City {
  id: number;
  slug: string;
  name: string;
  active: boolean;
}

export interface Neighborhood {
  id: number;
  city_id: number;
  slug: string;
  name: string;
  intro: string | null;
  lat: number | null;
  lng: number | null;
  city?: City;
}

export interface Amenity {
  id: number;
  code: string;
  category: "comfort" | "kitchen" | "power_water" | "security" | "outdoor";
  label_fr: string;
  label_en: string | null;
  sort_order: number;
}

export interface ListingMedia {
  id: string;
  listing_id: string;
  path_full: string;
  path_thumb: string;
  alt: string | null;
  width: number | null;
  height: number | null;
  position: number;
  is_cover: boolean;
}

export interface ListingAmenity {
  listing_id: string;
  amenity_id: number;
  quantity: number;
  amenity?: Amenity;
}

export interface Listing {
  id: string;
  owner_id: string;
  slug: string;
  type: ListingType;
  status: ListingStatus;
  title: string;
  description: string | null;
  city_id: number | null;
  neighborhood_id: number | null;
  landmark: string | null;
  lat: number | null;
  lng: number | null;
  bedrooms: number | null;
  bathrooms: number | null;
  max_guests: number | null;
  surface_m2: number | null;
  price_night: number | null;
  price_month: number | null;
  deposit: number;
  utilities_included: boolean;
  rules: Record<string, unknown>;
  verified_badge: boolean;
  rejection_reason: string | null;
  published_at: string | null;
  last_confirmed_at: string | null;
  updated_content_at: string;
  rented_at: string | null;
  created_at: string;
  // Jointures optionnelles
  city?: City;
  neighborhood?: Neighborhood;
  listing_media?: ListingMedia[];
  listing_amenities?: ListingAmenity[];
  owner?: Profile;
}

export interface Report {
  id: string;
  listing_id: string;
  reporter_id: string | null;
  reason: string;
  details: string | null;
  status: "open" | "handled" | "dismissed";
  created_at: string;
}

export interface ModerationLog {
  id: number;
  listing_id: string;
  admin_id: string | null;
  decision: "approved" | "rejected" | "changes";
  reason: string | null;
  created_at: string;
}

// ── Catégories d'équipements ──
export const AMENITY_CATEGORIES = {
  comfort: "Confort",
  kitchen: "Cuisine",
  power_water: "Énergie & Eau",
  security: "Sécurité",
  outdoor: "Extérieur",
} as const;

// ── Labels des statuts d'annonce ──
export const LISTING_STATUS_LABELS: Record<ListingStatus, string> = {
  draft: "Brouillon",
  pending_review: "En attente de validation",
  published: "Publiée",
  paused: "En pause",
  rented: "Louée",
  rejected: "Refusée",
};

export const LISTING_STATUS_COLORS: Record<ListingStatus, string> = {
  draft: "bg-gray-100 text-gray-700",
  pending_review: "bg-amber-100 text-amber-800",
  published: "bg-green-100 text-green-800",
  paused: "bg-blue-100 text-blue-700",
  rented: "bg-purple-100 text-purple-800",
  rejected: "bg-red-100 text-red-700",
};
