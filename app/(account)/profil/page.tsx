import { createClient } from "@/lib/supabase/server";
import { updateProfile } from "@/lib/actions/auth";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Mon profil — MeubléFacile",
  robots: { index: false, follow: false },
};

interface Props {
  searchParams: Promise<{ success?: string; error?: string }>;
}

export default async function ProfilPage({ searchParams }: Props) {
  const { success, error } = await searchParams;
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();

  const { data: profile } = await supabase
    .from("profiles")
    .select("first_name, last_name, whatsapp_phone, role, is_verified, created_at")
    .eq("id", user!.id)
    .single();

  return (
    <div className="max-w-xl">
      <h1 className="text-xl font-bold text-gray-900 mb-6">Mon profil</h1>

      {success && (
        <div className="mb-4 rounded-lg border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-800">
          ✅ Profil mis à jour avec succès.
        </div>
      )}
      {error && (
        <div className="mb-4 rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          Une erreur est survenue. Veuillez réessayer.
        </div>
      )}

      <div className="rounded-2xl border border-gray-200 bg-white p-6 space-y-5">
        {/* Avatar + statut */}
        <div className="flex items-center gap-4">
          <div className="flex h-14 w-14 items-center justify-center rounded-full bg-brand-100 text-brand-700 text-xl font-bold">
            {profile?.first_name?.[0]?.toUpperCase() ?? user?.email?.[0]?.toUpperCase() ?? "?"}
          </div>
          <div>
            <p className="font-semibold text-gray-900">
              {profile?.first_name ? `${profile.first_name} ${profile.last_name ?? ""}` : user?.email}
            </p>
            <div className="flex items-center gap-2 mt-0.5">
              {profile?.is_verified ? (
                <span className="text-xs text-green-700 bg-green-50 border border-green-200 rounded-full px-2 py-0.5">
                  ✔ Identité vérifiée
                </span>
              ) : (
                <span className="text-xs text-amber-700 bg-amber-50 border border-amber-200 rounded-full px-2 py-0.5">
                  ⏳ Vérification en attente
                </span>
              )}
              {profile?.role === "admin" && (
                <span className="text-xs text-brand-700 bg-brand-50 border border-brand-200 rounded-full px-2 py-0.5">
                  Admin
                </span>
              )}
            </div>
          </div>
        </div>

        {/* Formulaire */}
        <form action={updateProfile} className="space-y-4 pt-2 border-t border-gray-100">
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label htmlFor="first_name" className="block text-sm font-medium text-gray-700 mb-1">
                Prénom
              </label>
              <input
                id="first_name"
                name="first_name"
                type="text"
                defaultValue={profile?.first_name ?? ""}
                className="w-full h-11 rounded-[var(--radius-field)] border border-gray-200 px-3 text-sm focus:border-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-200"
              />
            </div>
            <div>
              <label htmlFor="last_name" className="block text-sm font-medium text-gray-700 mb-1">
                Nom
              </label>
              <input
                id="last_name"
                name="last_name"
                type="text"
                defaultValue={profile?.last_name ?? ""}
                className="w-full h-11 rounded-[var(--radius-field)] border border-gray-200 px-3 text-sm focus:border-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-200"
              />
            </div>
          </div>

          <div>
            <label htmlFor="email" className="block text-sm font-medium text-gray-700 mb-1">
              Email
            </label>
            <input
              id="email"
              type="email"
              value={user?.email ?? ""}
              disabled
              className="w-full h-11 rounded-[var(--radius-field)] border border-gray-100 bg-gray-50 px-3 text-sm text-gray-400 cursor-not-allowed"
            />
          </div>

          <div>
            <label htmlFor="whatsapp_phone" className="block text-sm font-medium text-gray-700 mb-1">
              Numéro WhatsApp
            </label>
            <div className="flex">
              <span className="flex h-11 items-center rounded-l-[var(--radius-field)] border border-r-0 border-gray-200 bg-gray-50 px-3 text-sm text-gray-500">
                +237
              </span>
              <input
                id="whatsapp_phone"
                name="whatsapp_phone"
                type="tel"
                defaultValue={profile?.whatsapp_phone?.replace("+237", "") ?? ""}
                placeholder="6XXXXXXXX"
                className="flex-1 h-11 rounded-r-[var(--radius-field)] border border-gray-200 px-3 text-sm focus:border-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-200"
              />
            </div>
            <p className="mt-1 text-xs text-gray-400">
              Ce numéro sera affiché sur vos annonces pour le contact WhatsApp.
            </p>
          </div>

          <button
            type="submit"
            id="btn-save-profile"
            className="w-full h-11 rounded-[var(--radius-field)] bg-brand-700 font-semibold text-white hover:bg-brand-800 transition-colors"
          >
            Enregistrer les modifications
          </button>
        </form>
      </div>
    </div>
  );
}
