import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { HeaderClient } from "./HeaderClient";

export async function Header() {
  let user = null;
  let profile = null;

  try {
    const supabase = await createClient();
    const { data } = await supabase.auth.getUser();
    user = data?.user ?? null;

    if (user) {
      const { data: profileData } = await supabase
        .from("profiles")
        .select("first_name, role")
        .eq("id", user.id)
        .single();
      profile = profileData;
    }
  } catch (error: unknown) {
    if (typeof error === "object" && error !== null && "digest" in error && (error as { digest: string }).digest === "DYNAMIC_SERVER_USAGE") {
      throw error;
    }
    console.warn("[Header] Impossible de récupérer la session utilisateur :", error);
  }

  return (
    <header className="sticky top-0 z-40 border-b border-gray-200 bg-white/95 backdrop-blur-sm">
      <div className="mx-auto flex h-16 max-w-7xl items-center justify-between gap-4 px-4 sm:px-6">
        {/* Logo */}
        <Link
          href="/"
          className="flex items-center gap-2 font-bold text-brand-700 text-lg shrink-0"
          aria-label="MeubléFacile — accueil"
        >
          <span className="flex h-8 w-8 items-center justify-center rounded-lg bg-brand-700 text-white text-sm font-black">
            MF
          </span>
          <span className="hidden sm:block">MeubléFacile</span>
        </Link>

        {/* Navigation centrale (desktop) */}
        <nav className="hidden md:flex items-center gap-6 text-sm text-gray-600">
          <Link href="/douala" className="hover:text-brand-700 transition-colors font-medium">
            Douala
          </Link>
          <Link href="/douala/bonamoussadi/studio-meuble" className="hover:text-brand-700 transition-colors">
            Studios
          </Link>
          <Link href="/douala/bonamoussadi/appartement-meuble" className="hover:text-brand-700 transition-colors">
            Appartements
          </Link>
          <Link
            href="/blog"
            className="hover:text-brand-700 transition-colors font-semibold text-gray-800 flex items-center gap-1.5"
          >
            <span className="w-2 h-2 rounded-full bg-emerald-500 animate-pulse" />
            Blog & Guides
          </Link>
        </nav>

        {/* Actions droite */}
        <HeaderClient user={user} profile={profile} />
      </div>
    </header>
  );
}
