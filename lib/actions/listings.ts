"use server";

import { redirect } from "next/navigation";
import { revalidatePath } from "next/cache";
import { createClient } from "@/lib/supabase/server";
import { generateListingSlug } from "@/lib/slug";
import type { ListingStatus } from "@/lib/types";

/** Crée un brouillon vide et redirige vers le formulaire */
export async function createDraftListing() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/auth/connexion");

  const { data, error } = await supabase
    .from("listings")
    .insert({
      owner_id: user.id,
      slug: generateListingSlug("brouillon"),
      type: "studio",
      status: "draft",
      title: "",
    })
    .select("id")
    .single();

  if (error || !data) redirect("/mes-annonces?error=1");
  redirect(`/deposer/${data.id}`);
}

/** Met à jour les données d'une annonce (multi-étapes) */
export async function updateListing(listingId: string, formData: FormData) {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/auth/connexion");

  // Vérifier que l'annonce appartient à l'utilisateur
  const { data: existing } = await supabase
    .from("listings")
    .select("owner_id, status")
    .eq("id", listingId)
    .single();

  if (!existing || existing.owner_id !== user.id) redirect("/mes-annonces");

  const title = formData.get("title") as string | null;
  const description = formData.get("description") as string | null;
  const type = formData.get("type") as string | null;
  const cityId = formData.get("city_id") ? parseInt(formData.get("city_id") as string) : null;
  const neighborhoodId = formData.get("neighborhood_id") ? parseInt(formData.get("neighborhood_id") as string) : null;
  const landmark = formData.get("landmark") as string | null;
  const bedrooms = formData.get("bedrooms") ? parseInt(formData.get("bedrooms") as string) : null;
  const bathrooms = formData.get("bathrooms") ? parseInt(formData.get("bathrooms") as string) : null;
  const surfaceM2 = formData.get("surface_m2") ? parseFloat(formData.get("surface_m2") as string) : null;
  const maxGuests = formData.get("max_guests") ? parseInt(formData.get("max_guests") as string) : null;
  const priceNight = formData.get("price_night") ? parseInt(formData.get("price_night") as string) : null;
  const priceMonth = formData.get("price_month") ? parseInt(formData.get("price_month") as string) : null;
  const deposit = formData.get("deposit") ? parseInt(formData.get("deposit") as string) : 0;
  const utilitiesIncluded = formData.get("utilities_included") === "true";

  const updates: Record<string, unknown> = {};
  if (title !== null) {
    updates.title = title;
    // Regénérer le slug si le titre change significativement
    if (title.trim().length > 3) {
      updates.slug = generateListingSlug(title);
    }
  }
  if (description !== null) updates.description = description;
  if (type !== null) updates.type = type;
  if (cityId !== null) updates.city_id = cityId;
  if (neighborhoodId !== null) updates.neighborhood_id = neighborhoodId;
  if (landmark !== null) updates.landmark = landmark;
  if (bedrooms !== null) updates.bedrooms = bedrooms;
  if (bathrooms !== null) updates.bathrooms = bathrooms;
  if (surfaceM2 !== null) updates.surface_m2 = surfaceM2;
  if (maxGuests !== null) updates.max_guests = maxGuests;
  if (priceNight !== null) updates.price_night = priceNight;
  if (priceMonth !== null) updates.price_month = priceMonth;
  if (deposit !== null) updates.deposit = deposit;
  updates.utilities_included = utilitiesIncluded;

  await supabase.from("listings").update(updates).eq("id", listingId);
  revalidatePath(`/deposer/${listingId}`);
}

/** Soumet une annonce à la modération */
export async function submitListing(listingId: string) {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/auth/connexion");

  const { data: listing } = await supabase
    .from("listings")
    .select("owner_id, status, title, neighborhood_id")
    .eq("id", listingId)
    .single();

  if (!listing || listing.owner_id !== user.id) redirect("/mes-annonces");
  if (!["draft", "rejected"].includes(listing.status)) redirect("/mes-annonces");

  await supabase
    .from("listings")
    .update({ status: "pending_review" })
    .eq("id", listingId);

  revalidatePath("/mes-annonces");
  redirect("/mes-annonces?submitted=1");
}

/** Met une annonce en pause ou la reprend */
export async function toggleListingPause(listingId: string, currentStatus: ListingStatus) {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/auth/connexion");

  const newStatus = currentStatus === "published" ? "paused" : "published";
  await supabase
    .from("listings")
    .update({ status: newStatus })
    .eq("id", listingId)
    .eq("owner_id", user.id);

  revalidatePath("/mes-annonces");
}

/** Supprime un brouillon */
export async function deleteDraftListing(listingId: string) {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/auth/connexion");

  await supabase
    .from("listings")
    .delete()
    .eq("id", listingId)
    .eq("owner_id", user.id)
    .eq("status", "draft");

  revalidatePath("/mes-annonces");
}

/** Met à jour les équipements d'une annonce */
export async function updateListingAmenities(listingId: string, amenityIds: number[]) {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) return;

  // Vérifier propriété
  const { data } = await supabase
    .from("listings")
    .select("owner_id")
    .eq("id", listingId)
    .single();

  if (!data || data.owner_id !== user.id) return;

  // Supprimer les anciens, insérer les nouveaux
  await supabase.from("listing_amenities").delete().eq("listing_id", listingId);
  if (amenityIds.length > 0) {
    await supabase.from("listing_amenities").insert(
      amenityIds.map((id) => ({ listing_id: listingId, amenity_id: id, quantity: 1 }))
    );
  }
  revalidatePath(`/deposer/${listingId}`);
}
