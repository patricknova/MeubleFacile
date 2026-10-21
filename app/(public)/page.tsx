import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { SearchBar } from "@/components/SearchBar";
import { ListingCard } from "@/components/ListingCard";
import { JsonLd } from "@/components/JsonLd";
import { TYPE_SLUGS } from "@/lib/slug";
import { normalizeListing, buildListingHref } from "@/lib/normalize";
import { CheckCircle2, MapPin, MessageCircle, ShieldCheck, ArrowRight } from "lucide-react";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "MeubléFacile — Logements meublés à Douala",
  description:
    "Trouvez votre studio ou appartement meublé à Douala. Annonces vérifiées, photos réelles, contactez le propriétaire directement sur WhatsApp.",
};

const SITE = process.env.NEXT_PUBLIC_SITE_URL || "https://meublefacile.vercel.app";

const POPULAR_NEIGHBORHOODS = [
  { name: "Bonamoussadi", slug: "bonamoussadi", desc: "Quartier résidentiel prisé, commerces et restaurants" },
  { name: "Akwa", slug: "akwa", desc: "Centre des affaires, bien desservi" },
  { name: "Bonapriso", slug: "bonapriso", desc: "Quartier calme et verdoyant" },
  { name: "Makepe", slug: "makepe", desc: "En plein développement, prix accessibles" },
  { name: "Deido", slug: "deido", desc: "Animé, proche du port et du marché" },
  { name: "Logbessou", slug: "logbessou", desc: "Résidentiel, idéal pour les familles" },
];

const HOW_IT_WORKS = [
  {
    icon: MapPin,
    title: "Cherchez",
    desc: "Filtrez par quartier, budget, équipements. Chaque annonce a des photos réelles.",
  },
  {
    icon: CheckCircle2,
    title: "Vérifiez",
    desc: "Les annonces sont vérifiées manuellement avant publication. Badge visible sur chaque fiche.",
  },
  {
    icon: MessageCircle,
    title: "Contactez",
    desc: "Un clic pour envoyer un message pré-rempli au propriétaire sur WhatsApp.",
  },
];

export default async function HomePage() {
  let neighborhoods: Array<{
    id: number;
    slug: string;
    name: string;
    city_id: number;
    cities: { slug: string } | null;
  }> = [];

  let recentListings: any[] = [];

  try {
    const supabase = await createClient();

    // Récupérer les quartiers pour la barre de recherche
    const { data: nData, error: nError } = await supabase
      .from("neighborhoods")
      .select("id, slug, name, city_id, cities(slug)")
      .eq("cities.active", true)
      .order("name");

    if (!nError && nData) {
      neighborhoods = nData as unknown as typeof neighborhoods;
    }

    // Annonces récentes publiées (pour la section "Dernières annonces")
    const { data: lData, error: lError } = await supabase
      .from("listings")
      .select(`
        id, slug, type, title, landmark, bedrooms, surface_m2,
        price_night, price_month, deposit, verified_badge,
        updated_content_at,
        neighborhoods(slug, name),
        cities(slug, name),
        listing_media(path_thumb, alt, is_cover, position)
      `)
      .eq("status", "published")
      .order("published_at", { ascending: false })
      .limit(6);

    if (!lError && lData) {
      recentListings = lData;
    }
  } catch (error: any) {
    if (error?.digest === "DYNAMIC_SERVER_USAGE") {
      throw error;
    }
    console.warn("[HomePage] Erreur lors de la récupération des données :", error);
  }

  const jsonLd = {
    "@context": "https://schema.org",
    "@type": "WebSite",
    name: "MeubléFacile",
    url: SITE,
    description: "Plateforme de location de logements meublés à Douala, Cameroun",
    potentialAction: {
      "@type": "SearchAction",
      target: `${SITE}/douala?q={search_term_string}`,
      "query-input": "required name=search_term_string",
    },
  };

  const orgJsonLd = {
    "@context": "https://schema.org",
    "@type": "Organization",
    name: "MeubléFacile",
    url: SITE,
    logo: `${SITE}/logo.png`,
    contactPoint: {
      "@type": "ContactPoint",
      contactType: "customer support",
      availableLanguage: ["French"],
    },
  };

  return (
    <>
      <JsonLd data={jsonLd} />
      <JsonLd data={orgJsonLd} />

      {/* ── Hero ── */}
      <section className="relative overflow-hidden bg-gradient-to-br from-brand-800 via-brand-700 to-brand-600 pb-20 pt-16">
        {/* Motif décoratif */}
        <div className="absolute inset-0 opacity-10">
          <div className="absolute -right-20 -top-20 h-80 w-80 rounded-full bg-white" />
          <div className="absolute -left-10 bottom-0 h-60 w-60 rounded-full bg-white" />
        </div>

        <div className="relative mx-auto max-w-5xl px-4 text-center sm:px-6">
          <div className="mb-4 inline-flex items-center gap-2 rounded-full bg-white/15 px-4 py-1.5 text-sm font-medium text-white">
            <span className="h-2 w-2 rounded-full bg-green-400 animate-pulse" />
            Annonces vérifiées à Douala
          </div>
          <h1 className="text-3xl font-bold leading-tight tracking-tight text-white sm:text-4xl md:text-5xl">
            Trouvez votre logement meublé<br className="hidden sm:block" />
            <span className="text-accent-400"> à Douala</span>
          </h1>
          <p className="mt-4 text-base text-brand-100 sm:text-lg max-w-xl mx-auto">
            Studios, appartements et chambres meublés — annonces avec photos réelles, vérifiées avant publication.
          </p>

          {/* Barre de recherche */}
          <div className="mt-8">
            <SearchBar
              neighborhoods={(neighborhoods ?? []).map((n) => ({
                id: n.id,
                slug: n.slug,
                name: n.name,
                city: Array.isArray(n.cities) ? (n.cities[0] ?? null) : (n.cities as { slug: string } | null),
              }))}
            />
          </div>

          {/* Puces rapides */}
          <div className="mt-5 flex flex-wrap justify-center gap-2">
            {["Studio meublé", "Appartement 2 ch.", "Clim + Wifi", "Groupe électrogène"].map((tag) => (
              <span key={tag} className="rounded-full bg-white/15 px-3 py-1 text-xs font-medium text-white">
                {tag}
              </span>
            ))}
          </div>
        </div>
      </section>

      {/* ── Statistiques ── */}
      <section className="bg-white border-b border-gray-100">
        <div className="mx-auto max-w-4xl px-4 py-6 sm:px-6">
          <dl className="grid grid-cols-3 gap-4 text-center">
            {[
              { value: "100+", label: "Annonces vérifiées" },
              { value: "10+", label: "Quartiers couverts" },
              { value: "0 FCFA", label: "Frais pour les locataires" },
            ].map(({ value, label }) => (
              <div key={label}>
                <dt className="text-2xl font-bold text-brand-700">{value}</dt>
                <dd className="text-xs text-gray-500 mt-0.5">{label}</dd>
              </div>
            ))}
          </dl>
        </div>
      </section>

      <div className="mx-auto max-w-7xl px-4 sm:px-6">

        {/* ── Quartiers populaires ── */}
        <section className="py-12" aria-labelledby="neighborhoods-heading">
          <div className="flex items-baseline justify-between mb-6">
            <h2 id="neighborhoods-heading" className="text-xl font-bold text-gray-900">
              Quartiers populaires à Douala
            </h2>
            <Link href="/douala" className="text-sm text-brand-700 font-medium hover:underline flex items-center gap-1">
              Voir tout <ArrowRight size={14} />
            </Link>
          </div>
          <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-6">
            {POPULAR_NEIGHBORHOODS.map((n) => (
              <Link
                key={n.slug}
                href={`/douala/${n.slug}`}
                className="group rounded-xl border border-gray-200 bg-white p-4 text-center hover:border-brand-300 hover:bg-brand-50 transition-all hover:shadow-sm"
              >
                <div className="mb-2 flex h-10 w-10 mx-auto items-center justify-center rounded-full bg-brand-100 group-hover:bg-brand-200 transition-colors">
                  <MapPin size={18} className="text-brand-700" />
                </div>
                <p className="text-sm font-semibold text-gray-900">{n.name}</p>
                <p className="text-xs text-gray-400 mt-0.5 line-clamp-2">{n.desc}</p>
              </Link>
            ))}
          </div>
        </section>

        {/* ── Dernières annonces ── */}
        {recentListings && recentListings.length > 0 && (
          <section className="py-4 pb-12" aria-labelledby="recent-heading">
            <div className="flex items-baseline justify-between mb-6">
              <h2 id="recent-heading" className="text-xl font-bold text-gray-900">
                Dernières annonces publiées
              </h2>
              <Link href="/douala" className="text-sm text-brand-700 font-medium hover:underline flex items-center gap-1">
                Toutes les annonces <ArrowRight size={14} />
              </Link>
            </div>
            <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
              {recentListings.map((listing) => (
                <ListingCard
                  key={listing.id}
                  listing={normalizeListing(listing as Record<string, unknown>)}
                  href={buildListingHref(listing as Record<string, unknown>, TYPE_SLUGS)}
                />
              ))}
            </div>
          </section>
        )}

        {/* ── Comment ça marche ── */}
        <section className="py-12 border-t border-gray-100" aria-labelledby="how-heading">
          <h2 id="how-heading" className="text-xl font-bold text-gray-900 text-center mb-10">
            Comment ça marche ?
          </h2>
          <div className="grid gap-8 sm:grid-cols-3">
            {HOW_IT_WORKS.map(({ icon: Icon, title, desc }, i) => (
              <div key={title} className="flex flex-col items-center text-center">
                <div className="mb-4 flex h-14 w-14 items-center justify-center rounded-full bg-brand-100 text-brand-700">
                  <Icon size={26} />
                </div>
                <span className="mb-1 text-xs font-semibold uppercase tracking-widest text-brand-600">
                  Étape {i + 1}
                </span>
                <h3 className="text-base font-bold text-gray-900 mb-1">{title}</h3>
                <p className="text-sm text-gray-500">{desc}</p>
              </div>
            ))}
          </div>
        </section>

        {/* ── CTA Propriétaires ── */}
        <section className="my-12 overflow-hidden rounded-2xl bg-gradient-to-r from-brand-700 to-brand-600 px-6 py-10 text-center text-white">
          <h2 className="text-xl font-bold sm:text-2xl">
            Vous êtes propriétaire ou gestionnaire ?
          </h2>
          <p className="mt-2 text-brand-100 text-sm sm:text-base max-w-lg mx-auto">
            Publiez votre annonce gratuitement et touchez des locataires qualifiés directement sur WhatsApp.
          </p>
          <div className="mt-6 flex flex-col sm:flex-row gap-3 justify-center">
            <Link
              href="/deposer"
              className="inline-flex items-center justify-center rounded-xl bg-white px-6 py-3 text-sm font-bold text-brand-700 hover:bg-brand-50 transition-colors"
            >
              Déposer mon annonce gratuitement
            </Link>
            <Link
              href="/a-propos"
              className="inline-flex items-center justify-center rounded-xl border border-white/30 px-6 py-3 text-sm font-medium text-white hover:bg-white/10 transition-colors"
            >
              En savoir plus
            </Link>
          </div>
          <p className="mt-4 text-xs text-brand-200 flex items-center justify-center gap-1">
            <ShieldCheck size={13} />
            Annonces vérifiées par notre équipe avant publication
          </p>
        </section>
      </div>
    </>
  );
}
