"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { Search, Heart, PlusCircle, User } from "lucide-react";
import { cn } from "@/lib/format";

const NAV_ITEMS = [
  { href: "/douala", label: "Explorer", icon: Search },
  { href: "/favoris", label: "Favoris", icon: Heart },
  { href: "/deposer", label: "Déposer", icon: PlusCircle, highlight: true },
  { href: "/profil", label: "Profil", icon: User },
];

export function MobileNav() {
  const pathname = usePathname();

  return (
    <nav className="fixed bottom-0 inset-x-0 z-40 border-t border-gray-200 bg-white pb-safe md:hidden">
      <ul className="flex items-center justify-around">
        {NAV_ITEMS.map(({ href, label, icon: Icon, highlight }) => {
          const active = pathname.startsWith(href) && href !== "/douala"
            ? true
            : pathname === "/" && href === "/douala"
            ? false
            : pathname.startsWith(href);

          return (
            <li key={href} className="flex-1">
              <Link
                href={href}
                className={cn(
                  "flex flex-col items-center gap-1 py-2.5 text-[10px] font-medium transition-colors",
                  highlight
                    ? "text-brand-700"
                    : active
                    ? "text-brand-700"
                    : "text-gray-500"
                )}
              >
                <Icon
                  size={22}
                  className={cn(
                    highlight && "text-brand-700",
                    active && !highlight && "text-brand-700"
                  )}
                />
                {label}
              </Link>
            </li>
          );
        })}
      </ul>
    </nav>
  );
}
