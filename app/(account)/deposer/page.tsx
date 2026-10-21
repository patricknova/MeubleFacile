import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { createDraftListing } from "@/lib/actions/listings";

// Page intermédiaire : crée un brouillon et redirige vers /deposer/[id]
export default async function DeposerPage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/auth/connexion?redirectTo=/deposer");

  return (
    <div className="flex flex-col items-center justify-center min-h-[60vh]">
      <h1 className="text-xl font-bold text-gray-900 mb-4">Déposer une annonce</h1>
      <p className="text-gray-500 text-sm mb-6">Créez votre annonce en quelques étapes simples.</p>
      <form action={createDraftListing}>
        <button
          type="submit"
          id="btn-start-listing"
          className="flex items-center gap-2 rounded-xl bg-brand-700 px-6 py-3 font-semibold text-white hover:bg-brand-800 transition-colors"
        >
          Commencer mon annonce →
        </button>
      </form>
    </div>
  );
}
