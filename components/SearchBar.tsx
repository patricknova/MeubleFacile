"use client";

import { useRouter } from "next/navigation";
import { Search } from "lucide-react";
import { useState } from "react";

interface NeighborhoodOption {
  id: number;
  slug: string;
  name: string;
  city?: { slug: string } | null;
}

interface SearchBarProps {
  neighborhoods?: NeighborhoodOption[];
  defaultNeighborhood?: string;
  defaultBudget?: string;
  defaultType?: string;
  compact?: boolean;
}

const TYPES = [
  { value: "", label: "Tous les types" },
  { value: "studio-meuble", label: "Studio meublé" },
  { value: "appartement-meuble", label: "Appartement meublé" },
  { value: "chambre-meublee", label: "Chambre meublée" },
  { value: "duplex-meuble", label: "Duplex meublé" },
];

export function SearchBar({
  neighborhoods = [],
  defaultNeighborhood = "",
  defaultBudget = "",
  defaultType = "",
  compact = false,
}: SearchBarProps) {
  const router = useRouter();
  const [neighborhood, setNeighborhood] = useState(defaultNeighborhood);
  const [budget, setBudget] = useState(defaultBudget);
  const [type, setType] = useState(defaultType);

  function handleSearch(e: React.FormEvent) {
    e.preventDefault();
    // Trouver le quartier sélectionné pour construire l'URL SEO-friendly
    const selected = neighborhoods.find((n) => n.slug === neighborhood);
    if (selected?.city) {
      const citySlug = (selected.city as { slug: string }).slug;
      const params = new URLSearchParams();
      if (budget) params.set("budget_max", budget);
      const query = params.toString();
      const base = `/${citySlug}/${neighborhood}${type ? `/${type}` : ""}`;
      router.push(query ? `${base}?${query}` : base);
    } else {
      // Recherche générique
      const params = new URLSearchParams();
      if (neighborhood) params.set("q", neighborhood);
      if (budget) params.set("budget_max", budget);
      if (type) params.set("type", type);
      router.push(`/douala?${params.toString()}`);
    }
  }

  if (compact) {
    return (
      <form
        onSubmit={handleSearch}
        className="flex items-center gap-2 rounded-full border border-gray-200 bg-white px-4 py-2 shadow-sm hover:shadow-md transition-shadow"
      >
        <Search size={16} className="text-gray-400 shrink-0" />
        <input
          type="text"
          placeholder="Quartier, budget…"
          value={neighborhood}
          onChange={(e) => setNeighborhood(e.target.value)}
          className="flex-1 bg-transparent text-sm outline-none placeholder:text-gray-400"
          aria-label="Rechercher un logement"
        />
        <button
          type="submit"
          className="shrink-0 rounded-full bg-brand-700 px-3 py-1 text-xs font-semibold text-white hover:bg-brand-800 transition-colors"
        >
          Chercher
        </button>
      </form>
    );
  }

  return (
    <form
      onSubmit={handleSearch}
      id="search-form"
      className="mx-auto w-full max-w-4xl rounded-2xl bg-white p-3 shadow-xl"
    >
      <div className="grid gap-2 md:grid-cols-[2fr_1fr_1fr_auto]">
        {/* Quartier */}
        <div className="relative">
          <label htmlFor="search-neighborhood" className="sr-only">Quartier</label>
          {neighborhoods.length > 0 ? (
            <select
              id="search-neighborhood"
              value={neighborhood}
              onChange={(e) => setNeighborhood(e.target.value)}
              className="h-12 w-full rounded-xl border border-gray-200 bg-white px-4 text-sm text-gray-700 focus:border-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-200 appearance-none"
            >
              <option value="">Tous les quartiers</option>
              {neighborhoods.map((n) => (
                <option key={n.id} value={n.slug}>{n.name}</option>
              ))}
            </select>
          ) : (
            <input
              id="search-neighborhood"
              type="text"
              placeholder="📍 Quartier (ex. Bonamoussadi)"
              value={neighborhood}
              onChange={(e) => setNeighborhood(e.target.value)}
              className="h-12 w-full rounded-xl border border-gray-200 px-4 text-sm focus:border-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-200"
            />
          )}
        </div>

        {/* Budget */}
        <div>
          <label htmlFor="search-budget" className="sr-only">Budget maximum</label>
          <input
            id="search-budget"
            type="number"
            placeholder="💰 Budget max (FCFA)"
            value={budget}
            onChange={(e) => setBudget(e.target.value)}
            min={0}
            step={5000}
            className="h-12 w-full rounded-xl border border-gray-200 px-4 text-sm focus:border-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-200"
          />
        </div>

        {/* Type */}
        <div>
          <label htmlFor="search-type" className="sr-only">Type de logement</label>
          <select
            id="search-type"
            value={type}
            onChange={(e) => setType(e.target.value)}
            className="h-12 w-full rounded-xl border border-gray-200 bg-white px-4 text-sm text-gray-700 focus:border-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-200 appearance-none"
          >
            {TYPES.map((t) => (
              <option key={t.value} value={t.value}>{t.label}</option>
            ))}
          </select>
        </div>

        {/* Bouton */}
        <button
          type="submit"
          className="h-12 rounded-xl bg-brand-700 px-6 font-semibold text-white hover:bg-brand-800 active:bg-brand-900 transition-colors flex items-center gap-2"
        >
          <Search size={16} aria-hidden="true" />
          <span>Rechercher</span>
        </button>
      </div>
    </form>
  );
}
