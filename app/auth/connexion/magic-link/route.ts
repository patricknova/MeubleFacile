import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";

export async function POST(request: Request) {
  const formData = await request.formData();
  const email = formData.get("email") as string;
  const redirectTo = (formData.get("redirectTo") as string) || "/mes-annonces";
  const supabase = await createClient();

  const origin = new URL(request.url).origin;
  const { error } = await supabase.auth.signInWithOtp({
    email,
    options: {
      emailRedirectTo: `${origin}/auth/callback?next=${encodeURIComponent(redirectTo)}`,
    },
  });

  if (error) {
    redirect(`/auth/connexion?message=${encodeURIComponent("Une erreur est survenue. Vérifiez votre adresse email.")}`);
  }

  redirect(`/auth/connexion/confirmer?email=${encodeURIComponent(email)}`);
}
