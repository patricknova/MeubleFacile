import { notFound, redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { StepForm } from "./StepForm";
import type { Metadata } from "next";
import type { City, Neighborhood } from "@/lib/types";

export const metadata: Metadata = {
  title: "Déposer une annonce — MeubléFacile",
  robots: { index: false, follow: false },
};

interface Props {
  params: Promise<{ id: string }>;
}

export default async function DeposerIdPage({ params }: Props) {
  const { id } = await params;
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/auth/connexion?redirectTo=/deposer");

  // Charger l'annonce avec ses relations
  const { data: listing } = await supabase
    .from("listings")
    .select(`
      id, slug, type, status, title, description, landmark,
      bedrooms, bathrooms, max_guests, surface_m2,
      price_night, price_month, deposit, utilities_included, rules,
      city_id, neighborhood_id
    `)
    .eq("id", id)
    .eq("owner_id", user.id)
    .in("status", ["draft", "rejected"])
    .single();

  if (!listing) notFound();

  // Villes, quartiers, équipements
  const [citiesRes, neighborhoodsRes, amenitiesRes, selectedAmenitiesRes] = await Promise.all([
    supabase.from("cities").select("id, slug, name").eq("active", true).order("name"),
    supabase.from("neighborhoods").select("id, slug, name, city_id").order("name"),
    supabase.from("amenities").select("id, code, category, label_fr, label_en, sort_order").order("sort_order"),
    supabase.from("listing_amenities").select("amenity_id").eq("listing_id", id),
  ]);

  const selectedAmenityIds = (selectedAmenitiesRes.data ?? []).map((a) => a.amenity_id);

  return (
    <div className="max-w-2xl mx-auto">
      <div className="mb-6">
        <h1 className="text-xl font-bold text-gray-900">
          {listing.status === "rejected" ? "Corriger et resoumettre" : "Déposer une annonce"}
        </h1>
        {listing.status === "rejected" && (
          <p className="mt-1 text-sm text-amber-700 bg-amber-50 border border-amber-200 rounded-lg px-3 py-2">
            Votre annonce a été refusée. Corrigez les points indiqués puis resoumettez.
          </p>
        )}
      </div>

      <StepForm
        listing={listing as Parameters<typeof StepForm>[0]["listing"]}
        cities={(citiesRes.data ?? []) as unknown as City[]}
        neighborhoods={(neighborhoodsRes.data ?? []) as unknown as Neighborhood[]}
        amenities={amenitiesRes.data ?? []}
        selectedAmenityIds={selectedAmenityIds}
      />
    </div>
  );
}
