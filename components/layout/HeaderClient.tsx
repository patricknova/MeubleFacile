"use client";

import Link from "next/link";
import { useState } from "react";
import { User, LogOut, LayoutDashboard, PlusCircle } from "lucide-react";
import type { User as SupabaseUser } from "@supabase/supabase-js";

interface HeaderClientProps {
  user: SupabaseUser | null;
  profile: { first_name: string | null; role: string } | null;
}

export function HeaderClient({ user, profile }: HeaderClientProps) {
  const [menuOpen, setMenuOpen] = useState(false);

  return (
    <div className="flex items-center gap-2">
      {user ? (
        <>
          {/* Déposer une annonce */}
          <Link
            href="/deposer"
            className="hidden sm:flex items-center gap-1.5 rounded-[var(--radius-field)] bg-brand-700 px-4 py-2 text-sm font-semibold text-white hover:bg-brand-800 transition-colors"
          >
            <PlusCircle size={15} />
            Déposer une annonce
          </Link>

          {/* Menu utilisateur */}
          <div className="relative">
            <button
              onClick={() => setMenuOpen((o) => !o)}
              className="flex items-center gap-2 rounded-full border border-gray-200 px-3 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 transition-colors"
              aria-expanded={menuOpen}
              aria-haspopup="true"
            >
              <User size={16} className="text-gray-500" />
              <span className="hidden sm:block max-w-[100px] truncate">
                {profile?.first_name ?? "Mon compte"}
              </span>
            </button>

            {menuOpen && (
              <>
                <div
                  className="fixed inset-0 z-10"
                  onClick={() => setMenuOpen(false)}
                  aria-hidden="true"
                />
                <div className="absolute right-0 top-12 z-20 min-w-[180px] rounded-xl border border-gray-100 bg-white py-1 shadow-lg">
                  <Link
                    href="/mes-annonces"
                    onClick={() => setMenuOpen(false)}
                    className="flex items-center gap-2 px-4 py-2.5 text-sm text-gray-700 hover:bg-gray-50"
                  >
                    <LayoutDashboard size={15} />
                    Mes annonces
                  </Link>
                  <Link
                    href="/favoris"
                    onClick={() => setMenuOpen(false)}
                    className="flex items-center gap-2 px-4 py-2.5 text-sm text-gray-700 hover:bg-gray-50"
                  >
                    ❤ Mes favoris
                  </Link>
                  <Link
                    href="/profil"
                    onClick={() => setMenuOpen(false)}
                    className="flex items-center gap-2 px-4 py-2.5 text-sm text-gray-700 hover:bg-gray-50"
                  >
                    <User size={15} />
                    Mon profil
                  </Link>
                  {profile?.role === "admin" && (
                    <>
                      <div className="my-1 border-t border-gray-100" />
                      <Link
                        href="/admin/moderation"
                        onClick={() => setMenuOpen(false)}
                        className="flex items-center gap-2 px-4 py-2.5 text-sm text-brand-700 font-medium hover:bg-brand-50"
                      >
                        Admin — Modération
                      </Link>
                    </>
                  )}
                  <div className="my-1 border-t border-gray-100" />
                  <form action="/auth/deconnexion" method="post">
                    <button
                      type="submit"
                      className="flex w-full items-center gap-2 px-4 py-2.5 text-sm text-red-600 hover:bg-red-50"
                    >
                      <LogOut size={15} />
                      Déconnexion
                    </button>
                  </form>
                </div>
              </>
            )}
          </div>
        </>
      ) : (
        <>
          <Link
            href="/auth/connexion"
            className="rounded-[var(--radius-field)] border border-gray-200 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 transition-colors hidden sm:block"
          >
            Connexion
          </Link>
          <Link
            href="/deposer"
            className="flex items-center gap-1.5 rounded-[var(--radius-field)] bg-brand-700 px-4 py-2 text-sm font-semibold text-white hover:bg-brand-800 transition-colors"
          >
            <PlusCircle size={15} />
            <span className="hidden sm:block">Déposer une annonce</span>
            <span className="sm:hidden">Déposer</span>
          </Link>
        </>
      )}
    </div>
  );
}
