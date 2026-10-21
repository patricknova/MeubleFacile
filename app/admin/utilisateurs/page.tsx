import { createClient } from "@/lib/supabase/server";
import { formatDate } from "@/lib/format";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Utilisateurs — Admin MeubléFacile",
  robots: { index: false, follow: false },
};

export const revalidate = 0;

export default async function UtilisateursPage() {
  const supabase = await createClient();

  const { data: profiles } = await supabase
    .from("profiles")
    .select("id, first_name, last_name, role, is_verified, created_at")
    .order("created_at", { ascending: false })
    .limit(50);

  return (
    <div>
      <h2 className="text-lg font-bold text-gray-900 mb-6">Utilisateurs ({profiles?.length ?? 0})</h2>
      <div className="overflow-x-auto rounded-xl border border-gray-200 bg-white">
        <table className="min-w-full divide-y divide-gray-100 text-sm">
          <thead className="bg-gray-50">
            <tr>
              {["Nom", "Rôle", "Vérifié", "Inscription"].map((h) => (
                <th key={h} className="px-4 py-3 text-left text-xs font-semibold text-gray-500 uppercase tracking-wide">
                  {h}
                </th>
              ))}
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-100">
            {(profiles ?? []).map((p) => (
              <tr key={p.id} className="hover:bg-gray-50 transition-colors">
                <td className="px-4 py-3 font-medium text-gray-900">
                  {p.first_name ?? "—"} {p.last_name ?? ""}
                </td>
                <td className="px-4 py-3">
                  <span className={`rounded-full px-2.5 py-0.5 text-xs font-medium ${
                    p.role === "admin"
                      ? "bg-brand-100 text-brand-800"
                      : "bg-gray-100 text-gray-600"
                  }`}>
                    {p.role}
                  </span>
                </td>
                <td className="px-4 py-3">
                  {p.is_verified ? (
                    <span className="text-green-600">✔ Vérifié</span>
                  ) : (
                    <span className="text-gray-400">—</span>
                  )}
                </td>
                <td className="px-4 py-3 text-gray-500">{formatDate(p.created_at)}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
