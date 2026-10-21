"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";

async function requireAdmin() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/auth/connexion");

  const { data: profile } = await supabase
    .from("profiles")
    .select("role")
    .eq("id", user.id)
    .single();

  if (profile?.role !== "admin") redirect("/");
  return { supabase, user };
}

export async function approveListing(listingId: string) {
  const { supabase, user } = await requireAdmin();
  await supabase
    .from("listings")
    .update({ status: "published", published_at: new Date().toISOString() })
    .eq("id", listingId);

  await supabase.from("moderation_log").insert({
    listing_id: listingId,
    admin_id: user.id,
    decision: "approved",
  });

  revalidatePath("/admin/moderation");
}

export async function rejectListing(listingId: string, reason: string) {
  const { supabase, user } = await requireAdmin();
  await supabase
    .from("listings")
    .update({ status: "rejected", rejection_reason: reason })
    .eq("id", listingId);

  await supabase.from("moderation_log").insert({
    listing_id: listingId,
    admin_id: user.id,
    decision: "rejected",
    reason,
  });

  revalidatePath("/admin/moderation");
}

export async function handleReport(reportId: string, action: "handled" | "dismissed") {
  const { supabase } = await requireAdmin();
  await supabase.from("reports").update({ status: action }).eq("id", reportId);
  revalidatePath("/admin/signalements");
}
