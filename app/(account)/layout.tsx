import { redirect } from "next/navigation";
import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { Header } from "@/components/layout/Header";
import { Footer } from "@/components/layout/Footer";
import { MobileNav } from "@/components/layout/MobileNav";
import { LayoutDashboard, Heart, User, PlusCircle } from "lucide-react";

const NAV = [
  { href: "/mes-annonces", label: "Mes annonces", icon: LayoutDashboard },
  { href: "/favoris", label: "Mes favoris", icon: Heart },
  { href: "/profil", label: "Mon profil", icon: User },
];

export default async function AccountLayout({ children }: { children: React.ReactNode }) {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();

  if (!user) redirect("/auth/connexion");

  return (
    <div className="flex min-h-screen flex-col">
      <Header />
      <div className="mx-auto w-full max-w-7xl flex-1 px-4 py-6 sm:px-6 pb-24 md:pb-6">
        <div className="flex flex-col gap-6 md:flex-row">
          {/* Sidebar navigation */}
          <aside className="hidden md:block md:w-56 shrink-0">
            <nav className="sticky top-24 space-y-1" aria-label="Navigation du compte">
              {NAV.map(({ href, label, icon: Icon }) => (
                <Link
                  key={href}
                  href={href}
                  className="flex items-center gap-2.5 rounded-xl px-3 py-2.5 text-sm font-medium text-gray-600 hover:bg-brand-50 hover:text-brand-700 transition-colors"
                >
                  <Icon size={16} />
                  {label}
                </Link>
              ))}
              <div className="pt-3 border-t border-gray-100">
                <Link
                  href="/deposer"
                  className="flex items-center gap-2.5 rounded-xl bg-brand-700 px-3 py-2.5 text-sm font-semibold text-white hover:bg-brand-800 transition-colors"
                >
                  <PlusCircle size={16} />
                  Nouvelle annonce
                </Link>
              </div>
            </nav>
          </aside>

          {/* Contenu principal */}
          <main className="flex-1 min-w-0">{children}</main>
        </div>
      </div>
      <Footer />
      <MobileNav />
    </div>
  );
}
