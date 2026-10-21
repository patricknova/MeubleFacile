"use server";

import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";

export async function updateProfile(formData: FormData) {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/auth/connexion");

  const firstName = formData.get("first_name") as string;
  const lastName = formData.get("last_name") as string;
  const whatsappPhone = formData.get("whatsapp_phone") as string;

  const { error } = await supabase
    .from("profiles")
    .update({
      first_name: firstName.trim() || null,
      last_name: lastName.trim() || null,
      whatsapp_phone: whatsappPhone.trim() || null,
    })
    .eq("id", user.id);

  if (error) {
    redirect("/profil?error=1");
  }
  redirect("/profil?success=1");
}
