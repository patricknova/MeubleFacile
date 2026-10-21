import Image from "next/image";
import Link from "next/link";
import { Heart, MapPin, BedDouble } from "lucide-react";
import { formatXAF } from "@/lib/format";
import { VerifiedBadge } from "@/components/ui/Badge";
import { buildListingHref } from "@/lib/normalize";
import { TYPE_SLUGS } from "@/lib/slug";

// Types délibérément souples : Supabase retourne des objets partiels
interface ListingCardListing {
  id: string;
  slug: string;
  type: string;
  title: string;
  landmark?: string | null;
  bedrooms?: number | null;
  surface_m2?: number | null;
  price_night?: number | null;
  price_month?: number | null;
  verified_badge?: boolean;
  city?: { name: string; slug: string } | null;
  neighborhood?: { name: string; slug: string } | null;
  listing_media?: {
    path_thumb: string;
    alt?: string | null;
    is_cover?: boolean;
    position?: number | null;
  }[];
}

interface ListingCardProps {
  listing: ListingCardListing;
  href?: string;
  variant?: "vertical" | "horizontal";
  isFavorite?: boolean;
  onFavoriteToggle?: (id: string) => void;
}

function cn(...classes: (string | undefined | null | false)[]): string {
  return classes.filter(Boolean).join(" ");
}

export function ListingCard({
  listing,
  href: propHref,
  variant = "vertical",
  isFavorite = false,
  onFavoriteToggle,
}: ListingCardProps) {
  // Détermination robuste de l'URL cible (ne retombe jamais sur "#" si slug dispo)
  const href =
    !propHref || propHref === "#"
      ? buildListingHref(listing as unknown as Record<string, unknown>, TYPE_SLUGS)
      : propHref;

  const coverPhoto =
    listing.listing_media?.find((m) => m.is_cover) ?? listing.listing_media?.[0];

  const price = listing.price_night ?? listing.price_month;
  const priceLabel = listing.price_night ? "/nuit" : "/mois";

  if (variant === "horizontal") {
    return (
      <article className="group relative flex flex-col overflow-hidden rounded-[var(--radius-card)] border border-gray-200 bg-white shadow-sm hover:shadow-md transition-shadow md:flex-row cursor-pointer">
        {/* Photo */}
        <div className="relative aspect-[4/3] md:aspect-auto md:w-64 md:shrink-0 overflow-hidden bg-gray-100">
          {coverPhoto ? (
            <Image
              src={coverPhoto.path_thumb}
              alt={coverPhoto.alt ?? listing.title}
              fill
              sizes="(min-width: 768px) 256px, 100vw"
              className="object-cover group-hover:scale-105 transition-transform duration-300"
            />
          ) : (
            <div className="absolute inset-0 bg-gray-100 flex items-center justify-center">
              <span className="text-gray-400 text-sm">Aucune photo</span>
            </div>
          )}
          {listing.verified_badge && (
            <div className="absolute top-2 left-2 z-20">
              <VerifiedBadge />
            </div>
          )}
          {onFavoriteToggle && (
            <button
              type="button"
              onClick={(e) => {
                e.preventDefault();
                e.stopPropagation();
                onFavoriteToggle(listing.id);
              }}
              aria-label={isFavorite ? "Retirer des favoris" : "Ajouter aux favoris"}
              className="absolute top-2 right-2 z-20 flex h-9 w-9 items-center justify-center rounded-full bg-white/90 shadow transition-colors hover:bg-white"
            >
              <Heart
                className={isFavorite ? "fill-red-500 stroke-red-500" : "stroke-gray-500"}
                size={18}
              />
            </button>
          )}
        </div>

        {/* Infos */}
        <div className="flex flex-1 flex-col gap-1.5 p-4">
          <div className="flex items-center gap-1 text-xs text-gray-500">
            <MapPin size={12} />
            <span>{listing.neighborhood?.name ?? "—"}</span>
          </div>
          <h2 className="font-semibold text-gray-900 line-clamp-2 leading-snug">
            <Link
              href={href}
              className="hover:text-brand-700 transition-colors after:absolute after:inset-0 after:z-10 focus:outline-none"
            >
              {listing.title}
            </Link>
          </h2>
          <div className="flex items-center gap-2 text-sm text-gray-500">
            {listing.bedrooms && (
              <span className="flex items-center gap-1">
                <BedDouble size={13} />
                {listing.bedrooms} ch.
              </span>
            )}
            {listing.surface_m2 && <span>{listing.surface_m2} m²</span>}
          </div>
          {listing.landmark && (
            <p className="text-xs text-gray-400 line-clamp-1">{listing.landmark}</p>
          )}
        </div>

        {/* Prix + CTA */}
        <div className="flex items-center justify-between gap-2 border-t p-4 md:w-44 md:flex-col md:items-end md:border-l md:border-t-0 md:justify-center">
          {price ? (
            <div className="text-right">
              <span className="block text-xs text-gray-400">à partir de</span>
              <strong className="text-lg font-bold text-gray-900">{formatXAF(price)}</strong>
              <span className="text-xs text-gray-500">{priceLabel}</span>
            </div>
          ) : (
            <span className="text-sm text-gray-400">Prix sur demande</span>
          )}
          <Link
            href={href}
            className="relative z-20 mt-1 inline-flex items-center justify-center rounded-lg bg-brand-700 px-4 py-2 text-sm font-semibold text-white hover:bg-brand-800 transition-colors"
          >
            Voir
          </Link>
        </div>
      </article>
    );
  }

  // Vertical (default)
  return (
    <article className="group relative overflow-hidden rounded-[var(--radius-card)] border border-gray-200 bg-white shadow-sm hover:shadow-md transition-shadow cursor-pointer">
      {/* Photo */}
      <div className="relative aspect-[4/3] overflow-hidden bg-gray-100">
        {coverPhoto ? (
          <Image
            src={coverPhoto.path_thumb}
            alt={coverPhoto.alt ?? listing.title}
            fill
            sizes="(min-width: 768px) 320px, 100vw"
            className="object-cover group-hover:scale-105 transition-transform duration-300"
          />
        ) : (
          <div className="absolute inset-0 bg-gray-100 flex items-center justify-center">
            <span className="text-gray-400 text-sm">Aucune photo</span>
          </div>
        )}
        <div className="absolute top-2 left-2 flex flex-col gap-1 z-20">
          {listing.verified_badge && <VerifiedBadge />}
        </div>
        {onFavoriteToggle && (
          <button
            type="button"
            onClick={(e) => {
              e.preventDefault();
              e.stopPropagation();
              onFavoriteToggle(listing.id);
            }}
            aria-label={isFavorite ? "Retirer des favoris" : "Ajouter aux favoris"}
            className="absolute top-2 right-2 z-20 flex h-9 w-9 items-center justify-center rounded-full bg-white/90 shadow transition-colors hover:bg-white"
          >
            <Heart
              className={cn(
                "transition-colors",
                isFavorite ? "fill-red-500 stroke-red-500" : "stroke-gray-500"
              )}
              size={18}
            />
          </button>
        )}
      </div>

      {/* Contenu */}
      <div className="p-3">
        <div className="flex items-center gap-1 text-xs text-gray-500 mb-1">
          <MapPin size={11} />
          <span>{listing.neighborhood?.name ?? "—"}</span>
          {listing.bedrooms && (
            <>
              <span>·</span>
              <BedDouble size={11} />
              <span>{listing.bedrooms} ch.</span>
            </>
          )}
        </div>
        <h2 className="font-semibold text-gray-900 line-clamp-2 text-sm leading-snug mb-2">
          <Link
            href={href}
            className="hover:text-brand-700 transition-colors after:absolute after:inset-0 after:z-10 focus:outline-none"
          >
            {listing.title}
          </Link>
        </h2>
        {price ? (
          <p className="text-sm">
            <strong className="text-gray-900">{formatXAF(price)}</strong>
            <span className="text-gray-400">{priceLabel}</span>
          </p>
        ) : (
          <p className="text-sm text-gray-400">Prix sur demande</p>
        )}
      </div>
    </article>
  );
}
