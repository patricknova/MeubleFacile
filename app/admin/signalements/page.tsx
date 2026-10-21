import { createClient } from "@/lib/supabase/server";
import { handleReport } from "@/lib/actions/admin";
import { formatDate } from "@/lib/format";
import { CheckCircle2, Trash2 } from "lucide-react";
import { EmptyState } from "@/components/EmptyState";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Signalements — Admin MeubléFacile",
  robots: { index: false, follow: false },
};

export const revalidate = 0;

export default async function SignalementsPage() {
  const supabase = await createClient();

  const { data: reports } = await supabase
    .from("reports")
    .select(`
      id, reason, details, status, created_at,
      listings(id, slug, title)
    `)
    .eq("status", "open")
    .order("created_at", { ascending: true });

  return (
    <div>
      <div className="flex items-baseline justify-between mb-6">
        <h2 className="text-lg font-bold text-gray-900">Signalements ouverts</h2>
        <span className="text-sm text-gray-400">{reports?.length ?? 0} signalement(s)</span>
      </div>

      {reports && reports.length > 0 ? (
        <div className="space-y-3">
          {reports.map((report) => {
            const listing = Array.isArray(report.listings) ? report.listings[0] : report.listings;
            return (
              <div key={report.id} className="rounded-xl border border-gray-200 bg-white p-4">
                <div className="flex items-start justify-between gap-3">
                  <div className="flex-1">
                    <p className="text-sm font-semibold text-gray-900">{report.reason}</p>
                    {report.details && (
                      <p className="text-xs text-gray-500 mt-1">{report.details}</p>
                    )}
                    {listing && (
                      <p className="text-xs text-gray-400 mt-1">
                        Annonce : <strong>{(listing as { title?: string }).title ?? "—"}</strong>
                      </p>
                    )}
                    <p className="text-xs text-gray-400 mt-1">Signalé le {formatDate(report.created_at)}</p>
                  </div>
                  <div className="flex gap-2 shrink-0">
                    <form action={handleReport.bind(null, report.id, "handled")}>
                      <button
                        type="submit"
                        className="flex items-center gap-1 rounded-lg bg-green-700 px-3 py-1.5 text-xs font-semibold text-white hover:bg-green-800 transition-colors"
                      >
                        <CheckCircle2 size={12} /> Traité
                      </button>
                    </form>
                    <form action={handleReport.bind(null, report.id, "dismissed")}>
                      <button
                        type="submit"
                        className="flex items-center gap-1 rounded-lg border border-gray-200 px-3 py-1.5 text-xs font-medium text-gray-600 hover:bg-gray-50 transition-colors"
                      >
                        <Trash2 size={12} /> Ignorer
                      </button>
                    </form>
                  </div>
                </div>
              </div>
            );
          })}
        </div>
      ) : (
        <EmptyState
          icon={<CheckCircle2 size={28} />}
          title="Aucun signalement ouvert"
          description="Tout est en ordre. Aucun signalement à traiter."
        />
      )}
    </div>
  );
}
