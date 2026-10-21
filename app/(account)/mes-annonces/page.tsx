import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/format";
import { LISTING_STATUS_LABELS, LISTING_STATUS_COLORS } from "@/lib/types";
import { TYPE_SLUGS, TYPE_LABELS } from "@/lib/slug";
import { createDraftListing, toggleListingPause, deleteDraftListing, submitListing } from "@/lib/actions/listings";
import Link from "next/link";
import { PlusCircle, Eye, Pencil, PauseCircle, PlayCircle, Trash2, Send } from "lucide-react";
import { EmptyState } from "@/components/EmptyState";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Mes annonces — MeubléFacile",
  robots: { index: false, follow: false },
};

interface Props {
  searchParams: Promise<{ submitted?: string; error?: string }>;
}

export default async function MesAnnoncesPage({ searchParams }: Props) {
  const { submitted, error } = await searchParams;
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();

  const { data: listings } = await supabase
    .from("listings")
    .select(`
      id, slug, type, status, title, price_night, price_month,
      updated_content_at, published_at, rejection_reason,
      neighborhoods(name, slug), cities(slug, name),
      listing_media(path_thumb, is_cover, position)
    `)
    .eq("owner_id", user!.id)
    .order("updated_content_at", { ascending: false });

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-xl font-bold text-gray-900">Mes annonces</h1>
        <form action={createDraftListing}>
          <button
            type="submit"
            id="btn-new-listing"
            className="flex items-center gap-2 rounded-xl bg-brand-700 px-4 py-2.5 text-sm font-semibold text-white hover:bg-brand-800 transition-colors"
          >
            <PlusCircle size={16} />
            Nouvelle annonce
          </button>
        </form>
      </div>

      {submitted && (
        <div className="mb-4 rounded-lg border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-800">
          ✅ Annonce envoyée à la modération. Elle sera publiée sous 24 h.
        </div>
      )}
      {error && (
        <div className="mb-4 rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
          Une erreur est survenue. Veuillez réessayer.
        </div>
      )}

      {listings && listings.length > 0 ? (
        <div className="space-y-3">
          {listings.map((listing) => {
            const neighborhood = Array.isArray(listing.neighborhoods)
              ? listing.neighborhoods[0]
              : listing.neighborhoods;
            const city = Array.isArray(listing.cities) ? listing.cities[0] : listing.cities;
            const cover = (listing.listing_media ?? [])
              .sort((a: { position?: number }, b: { position?: number }) => (a.position ?? 0) - (b.position ?? 0))
              .find((m: { is_cover: boolean }) => m.is_cover) ?? listing.listing_media?.[0];

            const typeSlug = TYPE_SLUGS[listing.type];
            const publicHref = city && neighborhood && listing.status !== "draft"
              ? `/${city.slug}/${neighborhood.slug}/${typeSlug}/${listing.slug}`
              : null;

            return (
              <div
                key={listing.id}
                className="flex flex-col gap-3 rounded-xl border border-gray-200 bg-white p-4 sm:flex-row sm:items-center"
              >
                {/* Miniature */}
                <div className="h-20 w-28 shrink-0 overflow-hidden rounded-lg bg-gray-100">
                  {cover ? (
                    // eslint-disable-next-line @next/next/no-img-element
                    <img
                      src={cover.path_thumb}
                      alt={listing.title || "Annonce"}
                      className="h-full w-full object-cover"
                    />
                  ) : (
                    <div className="flex h-full items-center justify-center text-gray-300 text-xs">
                      Pas de photo
                    </div>
                  )}
                </div>

                {/* Infos */}
                <div className="flex-1 min-w-0">
                  <div className="flex flex-wrap items-center gap-2 mb-1">
                    <span
                      className={`inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-medium ${
                        LISTING_STATUS_COLORS[listing.status as keyof typeof LISTING_STATUS_COLORS]
                      }`}
                    >
                      {LISTING_STATUS_LABELS[listing.status as keyof typeof LISTING_STATUS_LABELS]}
                    </span>
                    <span className="text-xs text-gray-400">{TYPE_LABELS[listing.type]}</span>
                  </div>
                  <p className="font-semibold text-gray-900 truncate">
                    {listing.title || <span className="text-gray-400 italic">Sans titre</span>}
                  </p>
                  {neighborhood && (
                    <p className="text-xs text-gray-500">{neighborhood.name}</p>
                  )}
                  {listing.rejection_reason && (
                    <p className="mt-1 text-xs text-red-600 bg-red-50 rounded px-2 py-1">
                      Refus : {listing.rejection_reason}
                    </p>
                  )}
                  <p className="text-xs text-gray-400 mt-1">
                    Modifié le {formatDate(listing.updated_content_at)}
                  </p>
                </div>

                {/* Actions */}
                <div className="flex flex-wrap gap-2 shrink-0">
                  {publicHref && (
                    <Link
                      href={publicHref}
                      className="flex items-center gap-1.5 rounded-lg border border-gray-200 px-3 py-2 text-xs font-medium text-gray-700 hover:bg-gray-50 transition-colors"
                      title="Voir l'annonce"
                    >
                      <Eye size={13} /> Voir
                    </Link>
                  )}
                  <Link
                    href={`/deposer/${listing.id}`}
                    className="flex items-center gap-1.5 rounded-lg border border-gray-200 px-3 py-2 text-xs font-medium text-gray-700 hover:bg-gray-50 transition-colors"
                    title="Modifier"
                  >
                    <Pencil size={13} /> Modifier
                  </Link>

                  {listing.status === "draft" && (
                    <>
                      <form action={submitListing.bind(null, listing.id)}>
                        <button
                          type="submit"
                          className="flex items-center gap-1.5 rounded-lg bg-brand-700 px-3 py-2 text-xs font-semibold text-white hover:bg-brand-800 transition-colors"
                          title="Envoyer à la modération"
                        >
                          <Send size={13} /> Publier
                        </button>
                      </form>
                      <form action={deleteDraftListing.bind(null, listing.id)}>
                        <button
                          type="submit"
                          className="flex items-center gap-1.5 rounded-lg border border-red-200 px-3 py-2 text-xs font-medium text-red-600 hover:bg-red-50 transition-colors"
                          title="Supprimer le brouillon"
                          onClick={(e) => {
                            if (!confirm("Supprimer ce brouillon ?")) e.preventDefault();
                          }}
                        >
                          <Trash2 size={13} />
                        </button>
                      </form>
                    </>
                  )}

                  {(listing.status === "published" || listing.status === "paused") && (
                    <form action={toggleListingPause.bind(null, listing.id, listing.status as "published" | "paused")}>
                      <button
                        type="submit"
                        className="flex items-center gap-1.5 rounded-lg border border-gray-200 px-3 py-2 text-xs font-medium text-gray-700 hover:bg-gray-50 transition-colors"
                        title={listing.status === "published" ? "Mettre en pause" : "Reprendre"}
                      >
                        {listing.status === "published" ? <PauseCircle size={13} /> : <PlayCircle size={13} />}
                        {listing.status === "published" ? "Pause" : "Reprendre"}
                      </button>
                    </form>
                  )}
                </div>
              </div>
            );
          })}
        </div>
      ) : (
        <EmptyState
          icon={<PlusCircle size={28} />}
          title="Vous n'avez pas encore d'annonce"
          description="Déposez votre première annonce gratuitement. Elle sera publiée après vérification."
          action={{ label: "Déposer une annonce", href: "/deposer" }}
        />
      )}
    </div>
  );
}
