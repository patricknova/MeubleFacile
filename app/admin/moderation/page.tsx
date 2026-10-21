import { createClient } from "@/lib/supabase/server";
import { approveListing, rejectListing } from "@/lib/actions/admin";
import { formatDate } from "@/lib/format";
import { TYPE_SLUGS, TYPE_LABELS } from "@/lib/slug";
import Link from "next/link";
import { CheckCircle2, XCircle, Eye } from "lucide-react";
import { EmptyState } from "@/components/EmptyState";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Modération — Admin MeubléFacile",
  robots: { index: false, follow: false },
};

export const revalidate = 0;

export default async function ModerationPage() {
  const supabase = await createClient();

  const { data: listings } = await supabase
    .from("listings")
    .select(`
      id, slug, type, title, landmark, bedrooms, surface_m2,
      price_night, price_month, created_at,
      profiles!listings_owner_id_fkey(first_name, whatsapp_phone, is_verified),
      neighborhoods(name, slug), cities(slug, name),
      listing_media(path_thumb, is_cover, position)
    `)
    .eq("status", "pending_review")
    .order("created_at", { ascending: true });

  return (
    <div>
      <div className="flex items-baseline justify-between mb-6">
        <h2 className="text-lg font-bold text-gray-900">Annonces en attente</h2>
        <span className="text-sm text-gray-400">{listings?.length ?? 0} annonce(s)</span>
      </div>

      {listings && listings.length > 0 ? (
        <div className="space-y-4">
          {listings.map((listing) => {
            const owner = Array.isArray(listing.profiles) ? listing.profiles[0] : listing.profiles;
            const neighborhood = Array.isArray(listing.neighborhoods) ? listing.neighborhoods[0] : listing.neighborhoods;
            const city = Array.isArray(listing.cities) ? listing.cities[0] : listing.cities;
            const cover = (listing.listing_media ?? [])
              .sort((a: { position?: number }, b: { position?: number }) => (a.position ?? 0) - (b.position ?? 0))
              .find((m: { is_cover: boolean }) => m.is_cover) ?? listing.listing_media?.[0];

            const typeSlug = TYPE_SLUGS[listing.type];
            const previewHref = city && neighborhood
              ? `/${city.slug}/${neighborhood.slug}/${typeSlug}/${listing.slug}`
              : null;

            return (
              <div key={listing.id} className="rounded-xl border border-gray-200 bg-white overflow-hidden">
                <div className="flex flex-col sm:flex-row">
                  {/* Photo */}
                  <div className="h-32 w-full sm:w-44 shrink-0 bg-gray-100">
                    {cover ? (
                      // eslint-disable-next-line @next/next/no-img-element
                      <img src={cover.path_thumb} alt={listing.title} className="h-full w-full object-cover" />
                    ) : (
                      <div className="flex h-full items-center justify-center text-gray-300 text-xs">Pas de photo</div>
                    )}
                  </div>

                  {/* Infos */}
                  <div className="flex-1 p-4">
                    <div className="flex items-start justify-between gap-2 mb-2">
                      <div>
                        <p className="text-xs text-gray-500 mb-0.5">{TYPE_LABELS[listing.type]} · {neighborhood?.name}</p>
                        <h3 className="font-semibold text-gray-900">{listing.title}</h3>
                      </div>
                      {previewHref && (
                        <Link
                          href={previewHref}
                          target="_blank"
                          className="shrink-0 flex items-center gap-1 text-xs text-brand-700 hover:underline"
                        >
                          <Eye size={13} /> Aperçu
                        </Link>
                      )}
                    </div>

                    <div className="flex flex-wrap gap-x-4 gap-y-1 text-xs text-gray-500 mb-3">
                      {listing.bedrooms && <span>{listing.bedrooms} ch.</span>}
                      {listing.surface_m2 && <span>{listing.surface_m2} m²</span>}
                      {listing.price_night && <span>{listing.price_night.toLocaleString("fr")} FCFA/nuit</span>}
                      {listing.price_month && <span>{listing.price_month.toLocaleString("fr")} FCFA/mois</span>}
                    </div>

                    {owner && (
                      <p className="text-xs text-gray-500 mb-2">
                        Propriétaire : <strong>{(owner as { first_name?: string }).first_name ?? "Inconnu"}</strong>
                        {(owner as { is_verified?: boolean }).is_verified && " ✔"}
                        {(owner as { whatsapp_phone?: string }).whatsapp_phone && (
                          <> — {(owner as { whatsapp_phone?: string }).whatsapp_phone}</>
                        )}
                      </p>
                    )}

                    <p className="text-xs text-gray-400">Soumis le {formatDate(listing.created_at)}</p>

                    {/* Actions */}
                    <div className="flex gap-2 mt-3">
                      <form action={approveListing.bind(null, listing.id)}>
                        <button
                          type="submit"
                          id={`btn-approve-${listing.id}`}
                          className="flex items-center gap-1.5 rounded-lg bg-green-700 px-4 py-2 text-xs font-semibold text-white hover:bg-green-800 transition-colors"
                        >
                          <CheckCircle2 size={13} /> Approuver
                        </button>
                      </form>
                      <form
                        action={async (fd: FormData) => {
                          "use server";
                          const reason = fd.get("reason") as string;
                          await rejectListing(listing.id, reason || "Non conforme");
                        }}
                        className="flex gap-2"
                      >
                        <input
                          name="reason"
                          type="text"
                          placeholder="Motif du refus..."
                          className="h-8 rounded-lg border border-gray-200 px-3 text-xs focus:border-brand-500 focus:outline-none w-48"
                        />
                        <button
                          type="submit"
                          id={`btn-reject-${listing.id}`}
                          className="flex items-center gap-1.5 rounded-lg bg-red-600 px-4 py-2 text-xs font-semibold text-white hover:bg-red-700 transition-colors"
                        >
                          <XCircle size={13} /> Refuser
                        </button>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            );
          })}
        </div>
      ) : (
        <EmptyState
          icon={<CheckCircle2 size={28} />}
          title="File de modération vide"
          description="Toutes les annonces ont été traitées. Bon travail ! 🎉"
        />
      )}
    </div>
  );
}
