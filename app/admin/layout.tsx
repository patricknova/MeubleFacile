import { redirect } from "next/navigation";
import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { Header } from "@/components/layout/Header";
import { LayoutDashboard, Flag, Users, CheckSquare } from "lucide-react";

const NAV = [
  { href: "/admin/moderation", label: "Modération", icon: CheckSquare },
  { href: "/admin/signalements", label: "Signalements", icon: Flag },
  { href: "/admin/utilisateurs", label: "Utilisateurs", icon: Users },
];

export default async function AdminLayout({ children }: { children: React.ReactNode }) {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) redirect("/auth/connexion");

  const { data: profile } = await supabase
    .from("profiles")
    .select("role")
    .eq("id", user.id)
    .single();

  if (profile?.role !== "admin") redirect("/");

  // Compteurs de badges
  const [{ count: pendingCount }, { count: reportCount }] = await Promise.all([
    supabase.from("listings").select("id", { count: "exact", head: true }).eq("status", "pending_review"),
    supabase.from("reports").select("id", { count: "exact", head: true }).eq("status", "open"),
  ]);

  return (
    <div className="flex min-h-screen flex-col bg-gray-50">
      <Header />
      <div className="mx-auto w-full max-w-7xl flex-1 px-4 py-6 sm:px-6">
        <div className="mb-6 flex items-center justify-between">
          <h1 className="flex items-center gap-2 text-lg font-bold text-gray-900">
            <LayoutDashboard size={20} className="text-brand-700" />
            Administration
          </h1>
        </div>
        <div className="flex flex-col gap-6 md:flex-row">
          {/* Sidebar */}
          <aside className="hidden md:block md:w-56 shrink-0">
            <nav className="sticky top-24 space-y-1">
              {NAV.map(({ href, label, icon: Icon }) => (
                <Link
                  key={href}
                  href={href}
                  className="flex items-center justify-between rounded-xl px-3 py-2.5 text-sm font-medium text-gray-600 hover:bg-brand-50 hover:text-brand-700 transition-colors"
                >
                  <span className="flex items-center gap-2">
                    <Icon size={16} />
                    {label}
                  </span>
                  {href === "/admin/moderation" && (pendingCount ?? 0) > 0 && (
                    <span className="rounded-full bg-brand-700 px-1.5 py-0.5 text-[10px] font-bold text-white">
                      {pendingCount}
                    </span>
                  )}
                  {href === "/admin/signalements" && (reportCount ?? 0) > 0 && (
                    <span className="rounded-full bg-red-600 px-1.5 py-0.5 text-[10px] font-bold text-white">
                      {reportCount}
                    </span>
                  )}
                </Link>
              ))}
            </nav>
          </aside>
          <main className="flex-1 min-w-0">{children}</main>
        </div>
      </div>
    </div>
  );
}
