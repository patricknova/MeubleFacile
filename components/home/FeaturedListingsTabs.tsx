"use client";

import { useState } from "react";
import Link from "next/link";
import { ArrowRight, BedDouble, Building2, MapPin, Sparkles } from "lucide-react";
import { ListingCard } from "@/components/ListingCard";
import { normalizeListing, buildListingHref } from "@/lib/normalize";
import { TYPE_SLUGS } from "@/lib/slug";
import type { CatalogListing } from "@/lib/catalog";

interface Props {
  initialListings: CatalogListing[];
}

export function FeaturedListingsTabs({ initialListings }: Props) {
  const [activeFilter, setActiveFilter] = useState<string>("all");

  const filterTabs = [
    { id: "all", label: "🌟 Tous à la une" },
    { id: "studio", label: "🛋️ Studios meublés" },
    { id: "apartment", label: "🏢 Appartements meublés" },
    { id: "bonapriso", label: "📍 Bonapriso" },
    { id: "yassa", label: "📍 Yassa" },
    { id: "bonamoussadi", label: "📍 Bonamoussadi" },
    { id: "akwa", label: "📍 Akwa" },
  ];

  const filteredListings = initialListings.filter((l) => {
    if (activeFilter === "all") return true;
    if (activeFilter === "studio") return l.type === "studio";
    if (activeFilter === "apartment") return l.type === "apartment" || l.type === "duplex";
    return l.neighborhood.slug === activeFilter;
  });

  const displayListings = filteredListings.slice(0, 9);

  return (
    <section className="py-8 pb-16" aria-labelledby="featured-heading">
      {/* En-tête de section */}
      <div className="flex flex-col md:flex-row md:items-end justify-between gap-4 mb-6">
        <div>
          <div className="inline-flex items-center gap-1.5 rounded-full bg-brand-50 border border-brand-200/80 px-3 py-1 text-xs font-semibold text-brand-800 mb-2">
            <Sparkles size={13} className="text-brand-600" />
            156+ Logements meublés réels vérifiés à Douala
          </div>
          <h2 id="featured-heading" className="text-2xl sm:text-3xl font-black text-gray-900 tracking-tight">
            Studios & Appartements Meublés disponibles
          </h2>
          <p className="text-sm text-gray-500 mt-1">
            Sélection de logements prêts à vivre avec photos réelles, climatisation et contact direct sur WhatsApp.
          </p>
        </div>

        <Link
          href="/douala"
          className="inline-flex items-center gap-1.5 text-sm font-bold text-brand-700 hover:text-brand-800 transition-colors shrink-0 group"
        >
          Voir tout le catalogue ({initialListings.length} annonces)
          <ArrowRight size={15} className="group-hover:translate-x-1 transition-transform" />
        </Link>
      </div>

      {/* Barre d'onglets de filtrage */}
      <div className="flex items-center gap-2 overflow-x-auto pb-2 scrollbar-none mb-6">
        {filterTabs.map((tab) => {
          const isActive = activeFilter === tab.id;
          return (
            <button
              key={tab.id}
              onClick={() => setActiveFilter(tab.id)}
              className={`inline-flex items-center gap-1.5 rounded-full px-4 py-2 text-xs font-bold transition-all whitespace-nowrap shadow-2xs ${
                isActive
                  ? "bg-brand-700 text-white shadow-brand-700/20 shadow-md"
                  : "bg-white text-gray-700 border border-gray-200 hover:bg-gray-50 hover:border-gray-300"
              }`}
            >
              {tab.label}
            </button>
          );
        })}
      </div>

      {/* Grille des logements */}
      <div className="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
        {displayListings.map((listing) => (
          <ListingCard
            key={listing.id}
            listing={normalizeListing(listing as unknown as Record<string, unknown>)}
            href={buildListingHref(listing as unknown as Record<string, unknown>, TYPE_SLUGS)}
          />
        ))}
      </div>

      {/* Raccourcis par quartier et type */}
      <div className="mt-10 rounded-2xl border border-gray-200 bg-white p-6 shadow-xs">
        <h3 className="text-sm font-bold text-gray-900 mb-3 flex items-center gap-2">
          <Building2 size={16} className="text-brand-700" />
          Recherches rapides par quartier :
        </h3>
        <div className="flex flex-wrap gap-2 text-xs">
          <Link
            href="/douala/bonapriso/studio-meuble"
            className="rounded-lg bg-gray-100 hover:bg-brand-50 hover:text-brand-700 px-3 py-1.5 font-medium text-gray-700 transition-colors"
          >
            Studios Bonapriso
          </Link>
          <Link
            href="/douala/bonapriso/appartement-meuble"
            className="rounded-lg bg-gray-100 hover:bg-brand-50 hover:text-brand-700 px-3 py-1.5 font-medium text-gray-700 transition-colors"
          >
            Appartements Bonapriso
          </Link>
          <Link
            href="/douala/yassa/appartement-meuble"
            className="rounded-lg bg-gray-100 hover:bg-brand-50 hover:text-brand-700 px-3 py-1.5 font-medium text-gray-700 transition-colors"
          >
            Appartements Yassa (Japoma)
          </Link>
          <Link
            href="/douala/bonamoussadi/studio-meuble"
            className="rounded-lg bg-gray-100 hover:bg-brand-50 hover:text-brand-700 px-3 py-1.5 font-medium text-gray-700 transition-colors"
          >
            Studios Bonamoussadi
          </Link>
          <Link
            href="/douala/bonamoussadi/appartement-meuble"
            className="rounded-lg bg-gray-100 hover:bg-brand-50 hover:text-brand-700 px-3 py-1.5 font-medium text-gray-700 transition-colors"
          >
            Appartements Bonamoussadi
          </Link>
          <Link
            href="/douala/akwa/appartement-meuble"
            className="rounded-lg bg-gray-100 hover:bg-brand-50 hover:text-brand-700 px-3 py-1.5 font-medium text-gray-700 transition-colors"
          >
            Appartements Akwa (Affaires)
          </Link>
        </div>
      </div>
    </section>
  );
}
