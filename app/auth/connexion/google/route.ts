import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";

export async function POST(request: Request) {
  const formData = await request.formData();
  const redirectTo = (formData.get("redirectTo") as string) || "/mes-annonces";
  const supabase = await createClient();

  const origin = new URL(request.url).origin;
  const { data, error } = await supabase.auth.signInWithOAuth({
    provider: "google",
    options: {
      redirectTo: `${origin}/auth/callback?next=${encodeURIComponent(redirectTo)}`,
    },
  });

  if (error || !data.url) {
    redirect(`/auth/connexion?message=${encodeURIComponent("Erreur avec Google. Réessayez.")}`);
  }

  redirect(data.url);
}
