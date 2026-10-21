import { createClient } from "@/lib/supabase/server";
import { ListingCard } from "@/components/ListingCard";
import { EmptyState } from "@/components/EmptyState";
import { TYPE_SLUGS } from "@/lib/slug";
import { Heart } from "lucide-react";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Mes favoris — MeubléFacile",
  robots: { index: false, follow: false },
};

export default async function FavorisPage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();

  const { data: favorites } = await supabase
    .from("favorites")
    .select(`
      listing_id,
      listings!inner(
        id, slug, type, status, title, landmark, bedrooms, surface_m2,
        price_night, price_month, verified_badge, updated_content_at,
        neighborhoods(slug, name),
        cities(slug, name),
        listing_media(path_thumb, alt, is_cover, position)
      )
    `)
    .eq("user_id", user!.id)
    .eq("listings.status", "published")
    .order("created_at", { ascending: false });

  const listings = (favorites ?? [])
    .map((f) => f.listings)
    .filter(Boolean)
    .flat();

  return (
    <div>
      <h1 className="text-xl font-bold text-gray-900 mb-6">
        Mes favoris <span className="text-gray-400 font-normal">({listings.length})</span>
      </h1>

      {listings.length > 0 ? (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {listings.map((listing) => {
            if (!listing || typeof listing !== "object" || Array.isArray(listing)) return null;
            const l = listing as Record<string, unknown>;
            const neighborhood = Array.isArray(l.neighborhoods) ? l.neighborhoods[0] : l.neighborhoods;
            const city = Array.isArray(l.cities) ? l.cities[0] : l.cities;
            const typeSlug = TYPE_SLUGS[l.type as string] ?? l.type;
            const href = city && neighborhood
              ? `/${(city as { slug: string }).slug}/${(neighborhood as { slug: string }).slug}/${typeSlug}/${l.slug}`
              : "#";
            return (
              <ListingCard
                key={l.id as string}
                listing={(l as unknown) as Parameters<typeof ListingCard>[0]["listing"]}
                href={href}
                isFavorite={true}
              />
            );
          })}
        </div>
      ) : (
        <EmptyState
          icon={<Heart size={28} />}
          title="Aucun favori pour l'instant"
          description="Parcourez les annonces et cliquez sur ❤ pour sauvegarder vos logements préférés."
          action={{ label: "Parcourir les annonces", href: "/douala" }}
        />
      )}
    </div>
  );
}
