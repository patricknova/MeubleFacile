import type { Metadata } from "next";
import Link from "next/link";
import Image from "next/image";
import { Zap, Wifi, ShieldCheck, MapPin, Clock, ArrowRight, Sparkles, BookOpen } from "lucide-react";
import { getAllPosts } from "@/lib/blog";

export const metadata: Metadata = {
  title: "Le Blog MeubléFacile — Sécurité, Connexion & Autonomie des Meublés à Douala",
  description:
    "Conseils d'experts, audits anti-délestage, tests de débit fibre et guides de sécurité pour réussir votre location d'appartement meublé à Douala (Bonapriso, Akwa, Yassa, Denver).",
  openGraph: {
    title: "Le Blog MeubléFacile — Guide Sécurité, Connexion & Autonomie à Douala",
    description: "Le prisme sans concession pour louer un appartement ou studio meublé à Douala sans mauvaise surprise.",
    type: "website",
  },
};

export default function BlogIndexPage() {
  const posts = getAllPosts();

  const categories = [
    { key: "all", label: "Tous les guides", icon: BookOpen },
    { key: "autonomie", label: "Autonomie (Énergie & Eau)", icon: Zap, color: "text-amber-600 bg-amber-50" },
    { key: "connexion", label: "Connexion (Fibre & Visio)", icon: Wifi, color: "text-blue-600 bg-blue-50" },
    { key: "securite", label: "Sécurité & Discrétion", icon: ShieldCheck, color: "text-emerald-600 bg-emerald-50" },
    { key: "quartiers", label: "Guides Quartiers Douala", icon: MapPin, color: "text-indigo-600 bg-indigo-50" },
  ];

  return (
    <div className="min-h-screen bg-gray-50/50 pb-20">
      {/* Hero Header */}
      <section className="border-b border-gray-200 bg-white py-12 sm:py-16">
        <div className="mx-auto max-w-7xl px-4 sm:px-6">
          <div className="max-w-3xl">
            <div className="inline-flex items-center gap-2 rounded-full border border-brand-200 bg-brand-50/80 px-3.5 py-1 text-xs font-semibold text-brand-800 mb-4 shadow-2xs">
              <Sparkles size={13} className="text-brand-600 animate-pulse" />
              Le Prisme S.C.A : Sécurité · Connexion · Autonomie
            </div>
            <h1 className="text-3xl sm:text-5xl font-black text-gray-900 tracking-tight leading-tight">
              Louez à Douala sans coupure, sans lag et en toute sécurité.
            </h1>
            <p className="mt-4 text-base sm:text-lg text-gray-600 leading-relaxed">
              À Douala, l’électricité, l’eau et l’Internet ne sont jamais des évidences. Nos articles et enquêtes de terrain vous dévoilent comment identifier les appartements et studios meublés 100% autonomes et fiables.
            </p>
          </div>

          {/* Bandeau des 3 piliers */}
          <div className="mt-10 grid grid-cols-1 md:grid-cols-3 gap-4 border-t border-gray-100 pt-8">
            <div className="flex items-start gap-3.5 rounded-2xl bg-amber-50/50 p-4 border border-amber-100">
              <div className="rounded-xl bg-amber-500 p-2 text-white shrink-0 shadow-xs">
                <Zap size={20} />
              </div>
              <div>
                <h2 className="text-sm font-bold text-gray-900">Autonomie 24/7</h2>
                <p className="text-xs text-gray-600 mt-0.5">
                  Groupes électrogènes automatiques, réserves d’eau et surpresseurs pour contrer les pannes Eneo et Camwater.
                </p>
              </div>
            </div>

            <div className="flex items-start gap-3.5 rounded-2xl bg-blue-50/50 p-4 border border-blue-100">
              <div className="rounded-xl bg-blue-500 p-2 text-white shrink-0 shadow-xs">
                <Wifi size={20} />
              </div>
              <div>
                <h2 className="text-sm font-bold text-gray-900">Connexion Fibre & Visio</h2>
                <p className="text-xs text-gray-600 mt-0.5">
                  Réseau stable FTTH et Starlink testés pour télétravailler sans interruption pendant votre séjour.
                </p>
              </div>
            </div>

            <div className="flex items-start gap-3.5 rounded-2xl bg-emerald-50/50 p-4 border border-emerald-100">
              <div className="rounded-xl bg-emerald-500 p-2 text-white shrink-0 shadow-xs">
                <ShieldCheck size={20} />
              </div>
              <div>
                <h2 className="text-sm font-bold text-gray-900">Sécurité & Discrétion</h2>
                <p className="text-xs text-gray-600 mt-0.5">
                  Gardiennage assermenté 24h/24, résidences clôturées et coffres-forts pour votre sérénité totale.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Navigation Filtres */}
      <section className="sticky top-16 z-20 border-b border-gray-200 bg-white/90 backdrop-blur-md">
        <div className="mx-auto flex max-w-7xl items-center gap-2 overflow-x-auto px-4 py-3 sm:px-6 scrollbar-none">
          {categories.map((c) => {
            const Icon = c.icon;
            return (
              <span
                key={c.key}
                className="inline-flex items-center gap-1.5 whitespace-nowrap rounded-full border border-gray-200 bg-gray-50 px-3.5 py-1.5 text-xs font-semibold text-gray-700 hover:border-brand-500 hover:bg-brand-50 hover:text-brand-800 transition-colors cursor-pointer"
              >
                <Icon size={13} className={c.color ? c.color.split(" ")[0] : "text-gray-500"} />
                {c.label}
              </span>
            );
          })}
        </div>
      </section>

      {/* Liste des articles */}
      <main className="mx-auto max-w-7xl px-4 sm:px-6 py-12">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {posts.map((post, index) => {
            const isFirst = index === 0;

            const categoryStyle = {
              autonomie: "text-amber-700 bg-amber-50 border-amber-200",
              connexion: "text-blue-700 bg-blue-50 border-blue-200",
              securite: "text-emerald-700 bg-emerald-50 border-emerald-200",
              quartiers: "text-indigo-700 bg-indigo-50 border-indigo-200",
            }[post.category];

            return (
              <article
                key={post.slug}
                className={`group flex flex-col justify-between overflow-hidden rounded-3xl border border-gray-200 bg-white shadow-xs hover:shadow-xl transition-all duration-300 ${
                  isFirst ? "md:col-span-2 lg:col-span-2" : ""
                }`}
              >
                <div>
                  {/* Image de couverture */}
                  <div
                    className={`relative overflow-hidden bg-gray-100 ${
                      isFirst ? "aspect-[21/9] sm:aspect-[2/1]" : "aspect-[16/10]"
                    }`}
                  >
                    <Image
                      src={post.coverImage}
                      alt={post.title}
                      fill
                      sizes={isFirst ? "(min-width: 1024px) 66vw, 100vw" : "(min-width: 1024px) 33vw, 100vw"}
                      className="object-cover group-hover:scale-105 transition-transform duration-500"
                    />
                    <div className="absolute top-4 left-4 z-10">
                      <span
                        className={`inline-flex items-center gap-1.5 rounded-full border px-3 py-1 text-xs font-bold shadow-xs backdrop-blur-md ${categoryStyle}`}
                      >
                        {post.category === "autonomie" && <Zap size={12} />}
                        {post.category === "connexion" && <Wifi size={12} />}
                        {post.category === "securite" && <ShieldCheck size={12} />}
                        {post.category === "quartiers" && <MapPin size={12} />}
                        {post.categoryLabel}
                      </span>
                    </div>
                  </div>

                  {/* Contenu */}
                  <div className="p-6 sm:p-8">
                    <div className="flex items-center gap-3 text-xs text-gray-500 mb-3">
                      <span className="flex items-center gap-1">
                        <Clock size={13} />
                        {post.readTime} de lecture
                      </span>
                      <span>·</span>
                      <span className="capitalize">{post.targetNeighborhood}, Douala</span>
                    </div>

                    <h2
                      className={`font-black text-gray-900 tracking-tight leading-snug group-hover:text-brand-700 transition-colors ${
                        isFirst ? "text-xl sm:text-2xl" : "text-lg sm:text-xl"
                      }`}
                    >
                      <Link href={`/blog/${post.slug}`}>{post.title}</Link>
                    </h2>

                    <p className="mt-3 text-sm text-gray-600 line-clamp-3 leading-relaxed">
                      {post.excerpt}
                    </p>

                    {/* Tags */}
                    <div className="mt-4 flex flex-wrap gap-1.5">
                      {post.tags.slice(0, 3).map((tag, i) => (
                        <span
                          key={i}
                          className="rounded-md bg-gray-100 px-2 py-0.5 text-[11px] font-medium text-gray-600"
                        >
                          #{tag}
                        </span>
                      ))}
                    </div>
                  </div>
                </div>

                {/* Footer auteur & lien */}
                <div className="flex items-center justify-between border-t border-gray-100 px-6 sm:px-8 py-4 bg-gray-50/50">
                  <div className="flex items-center gap-2.5">
                    <Image
                      src={post.author.avatar}
                      alt={post.author.name}
                      width={32}
                      height={32}
                      className="rounded-full object-cover"
                    />
                    <div>
                      <p className="text-xs font-bold text-gray-900">{post.author.name}</p>
                      <p className="text-[10px] text-gray-500 line-clamp-1">{post.author.role}</p>
                    </div>
                  </div>

                  <Link
                    href={`/blog/${post.slug}`}
                    className="inline-flex items-center gap-1 text-xs font-bold text-brand-700 hover:text-brand-800 transition-colors group-hover:translate-x-1"
                  >
                    Lire l’article
                    <ArrowRight size={13} />
                  </Link>
                </div>
              </article>
            );
          })}
        </div>
      </main>
    </div>
  );
}
