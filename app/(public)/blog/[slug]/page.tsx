import { notFound } from "next/navigation";
import Link from "next/link";
import Image from "next/image";
import type { Metadata } from "next";
import {
  Clock,
  Calendar,
  Share2,
  CheckCircle2,
  AlertTriangle,
  ArrowLeft,
  Zap,
  Wifi,
  ShieldCheck,
  MapPin,
  MessageCircle,
} from "lucide-react";
import { getPostBySlug, getAllPosts, getRelatedPosts } from "@/lib/blog";
import { ContextualListingsSection } from "@/components/blog/ContextualListingsSection";
import { JsonLd } from "@/components/JsonLd";

interface Props {
  params: Promise<{ slug: string }>;
}

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL || "https://meublefacile.cm";

export async function generateStaticParams() {
  const posts = getAllPosts();
  return posts.map((p) => ({ slug: p.slug }));
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params;
  const post = getPostBySlug(slug);

  if (!post) {
    return { title: "Article non trouvé | MeubléFacile" };
  }

  const url = `${SITE_URL}/blog/${post.slug}`;

  return {
    title: post.metaTitle,
    description: post.metaDescription,
    keywords: post.tags,
    alternates: { canonical: url },
    openGraph: {
      title: post.metaTitle,
      description: post.metaDescription,
      url,
      type: "article",
      publishedTime: post.publishedAt,
      authors: [post.author.name],
      images: [{ url: post.coverImage, width: 1200, height: 630, alt: post.title }],
    },
    twitter: {
      card: "summary_large_image",
      title: post.metaTitle,
      description: post.metaDescription,
      images: [post.coverImage],
    },
  };
}

export default async function BlogPostPage({ params }: Props) {
  const { slug } = await params;
  const post = getPostBySlug(slug);

  if (!post) {
    notFound();
  }

  const relatedPosts = getRelatedPosts(post.slug);
  const articleUrl = `${SITE_URL}/blog/${post.slug}`;
  const whatsappShareUrl = `https://wa.me/?text=${encodeURIComponent(
    `Découvrez cet article utile sur les meublés à Douala : "${post.title}"\n${articleUrl}`
  )}`;

  // Schéma structuré JSON-LD BlogPosting
  const blogPostingSchema = {
    "@context": "https://schema.org",
    "@type": "BlogPosting",
    headline: post.title,
    description: post.metaDescription,
    image: post.coverImage,
    datePublished: post.publishedAt,
    dateModified: post.updatedAt || post.publishedAt,
    author: {
      "@type": "Person",
      name: post.author.name,
      jobTitle: post.author.role,
    },
    publisher: {
      "@type": "Organization",
      name: "MeubléFacile",
      url: SITE_URL,
      logo: {
        "@type": "ImageObject",
        url: `${SITE_URL}/favicon.ico`,
      },
    },
    mainEntityOfPage: {
      "@type": "WebPage",
      "@id": articleUrl,
    },
  };

  const breadcrumbsSchema = {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    itemListElement: [
      { "@type": "ListItem", position: 1, name: "Accueil", item: SITE_URL },
      { "@type": "ListItem", position: 2, name: "Blog & Guides", item: `${SITE_URL}/blog` },
      { "@type": "ListItem", position: 3, name: post.title, item: articleUrl },
    ],
  };

  return (
    <>
      <JsonLd data={blogPostingSchema} />
      <JsonLd data={breadcrumbsSchema} />

      <div className="min-h-screen bg-gray-50/40 pb-20">
        {/* Fil d'Ariane & Bouton retour */}
        <div className="border-b border-gray-200 bg-white">
          <div className="mx-auto flex max-w-4xl items-center justify-between px-4 py-3 sm:px-6 text-xs text-gray-500">
            <Link
              href="/blog"
              className="inline-flex items-center gap-1.5 font-semibold text-brand-700 hover:text-brand-800 transition-colors"
            >
              <ArrowLeft size={14} />
              Retour au blog
            </Link>

            <div className="hidden sm:flex items-center gap-2 text-gray-400">
              <Link href="/" className="hover:text-gray-600">Accueil</Link>
              <span>/</span>
              <Link href="/blog" className="hover:text-gray-600">Blog</Link>
              <span>/</span>
              <span className="text-gray-800 truncate max-w-[200px]">{post.categoryLabel}</span>
            </div>
          </div>
        </div>

        {/* En-tête Article */}
        <header className="border-b border-gray-200 bg-white py-10 sm:py-14">
          <div className="mx-auto max-w-4xl px-4 sm:px-6">
            <div className="flex flex-wrap items-center gap-2 mb-4">
              <span className="inline-flex items-center gap-1 rounded-full bg-brand-50 border border-brand-200/80 px-3 py-1 text-xs font-bold text-brand-800">
                {post.category === "autonomie" && <Zap size={13} className="text-amber-600" />}
                {post.category === "connexion" && <Wifi size={13} className="text-blue-600" />}
                {post.category === "securite" && <ShieldCheck size={13} className="text-emerald-600" />}
                {post.category === "quartiers" && <MapPin size={13} className="text-indigo-600" />}
                {post.categoryLabel}
              </span>
              <span className="inline-flex items-center gap-1 rounded-full bg-gray-100 px-3 py-1 text-xs font-medium text-gray-600">
                <MapPin size={12} />
                Quartier {post.targetNeighborhood.charAt(0).toUpperCase() + post.targetNeighborhood.slice(1)}, Douala
              </span>
            </div>

            <h1 className="text-2xl sm:text-4xl lg:text-5xl font-black text-gray-900 tracking-tight leading-tight">
              {post.title}
            </h1>

            <p className="mt-4 text-base sm:text-xl text-gray-600 leading-relaxed font-normal">
              {post.excerpt}
            </p>

            {/* Auteur, Date & Partage */}
            <div className="mt-8 flex flex-wrap items-center justify-between gap-4 border-t border-gray-100 pt-6">
              <div className="flex items-center gap-3">
                <Image
                  src={post.author.avatar}
                  alt={post.author.name}
                  width={44}
                  height={44}
                  className="rounded-full object-cover ring-2 ring-brand-100"
                />
                <div>
                  <p className="text-sm font-bold text-gray-900">{post.author.name}</p>
                  <p className="text-xs text-gray-500">{post.author.role}</p>
                </div>
              </div>

              <div className="flex items-center gap-4 text-xs text-gray-500">
                <span className="flex items-center gap-1">
                  <Calendar size={13} />
                  {post.publishedAt}
                </span>
                <span className="flex items-center gap-1">
                  <Clock size={13} />
                  {post.readTime}
                </span>

                <a
                  href={whatsappShareUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center gap-1.5 rounded-full bg-emerald-50 border border-emerald-200 px-3 py-1.5 font-bold text-emerald-700 hover:bg-emerald-100 transition-colors shadow-2xs"
                >
                  <MessageCircle size={13} />
                  Partager sur WhatsApp
                </a>
              </div>
            </div>
          </div>
        </header>

        {/* Contenu Principal */}
        <main className="mx-auto max-w-4xl px-4 sm:px-6 py-10">
          {/* Image principale */}
          <div className="relative aspect-[21/10] overflow-hidden rounded-3xl border border-gray-200 bg-gray-100 shadow-sm mb-12">
            <Image
              src={post.coverImage}
              alt={post.title}
              fill
              sizes="(min-width: 1024px) 896px, 100vw"
              priority
              className="object-cover"
            />
          </div>

          {/* Encart Manifeste S.C.A */}
          <div className="mb-10 rounded-2xl bg-gradient-to-r from-brand-900 to-gray-900 p-6 text-white shadow-md">
            <p className="text-xs font-bold uppercase tracking-wider text-amber-400 mb-1">
              La Règle d'or MeubléFacile à Douala
            </p>
            <p className="text-sm sm:text-base font-medium leading-snug">
              Ne réservez jamais un appartement sur la seule promesse de belles photos. Exigez la confirmation formelle de l'inverseur automatique, de la réserve d'eau avec surpresseur et du débit réel.
            </p>
          </div>

          {/* Sections textuelles de l'article avec balisage sémantique */}
          <div className="prose prose-lg max-w-none text-gray-800 space-y-10 leading-relaxed">
            {post.sections.map((section, idx) => (
              <section key={idx} className="space-y-4">
                <h2 className="text-xl sm:text-2xl font-black text-gray-900 tracking-tight border-l-4 border-brand-700 pl-4">
                  {section.title}
                </h2>

                <div
                  className="text-base sm:text-lg text-gray-700 leading-relaxed space-y-4 font-normal"
                  dangerouslySetInnerHTML={{
                    __html: section.content
                      .replace(/\n\n/g, "<p class='mt-3'>")
                      .replace(/\*\*(.*?)\*\*/g, "<strong class='font-bold text-gray-900'>$1</strong>"),
                  }}
                />

                {/* Boîte de mise en valeur (Checklist / Astuce / Attention) */}
                {section.highlightBox && (
                  <div
                    className={`mt-6 rounded-2xl p-5 border ${
                      section.highlightBox.type === "checklist"
                        ? "bg-emerald-50/70 border-emerald-200"
                        : section.highlightBox.type === "warning"
                        ? "bg-amber-50/80 border-amber-200"
                        : "bg-blue-50/70 border-blue-200"
                    }`}
                  >
                    <div className="flex items-center gap-2 mb-3">
                      {section.highlightBox.type === "checklist" && (
                        <CheckCircle2 size={18} className="text-emerald-700" />
                      )}
                      {section.highlightBox.type === "warning" && (
                        <AlertTriangle size={18} className="text-amber-700" />
                      )}
                      {section.highlightBox.type === "tip" && (
                        <Zap size={18} className="text-blue-700" />
                      )}
                      <h3
                        className={`text-sm sm:text-base font-bold ${
                          section.highlightBox.type === "checklist"
                            ? "text-emerald-900"
                            : section.highlightBox.type === "warning"
                            ? "text-amber-900"
                            : "text-blue-900"
                        }`}
                      >
                        {section.highlightBox.title}
                      </h3>
                    </div>

                    <ul className="space-y-2">
                      {section.highlightBox.items.map((item, itemIdx) => (
                        <li key={itemIdx} className="flex items-start gap-2.5 text-xs sm:text-sm text-gray-800">
                          <span className="font-bold text-brand-700 shrink-0">✓</span>
                          <span>{item}</span>
                        </li>
                      ))}
                    </ul>
                  </div>
                )}
              </section>
            ))}
          </div>

          {/* ============================================================ */}
          {/* SECTION CONTEXTUELLE : Logements cités & recommandés selon le topic */}
          {/* ============================================================ */}
          <ContextualListingsSection post={post} citySlug="douala" />

          {/* Tags de l'article */}
          <div className="my-8 flex flex-wrap items-center gap-2 border-t border-b border-gray-200 py-4">
            <span className="text-xs font-bold text-gray-500 uppercase tracking-wider mr-2">Mots-clés :</span>
            {post.tags.map((tag, i) => (
              <span
                key={i}
                className="rounded-lg bg-gray-100 px-2.5 py-1 text-xs font-semibold text-gray-700 hover:bg-brand-50 hover:text-brand-800 transition-colors"
              >
                #{tag}
              </span>
            ))}
          </div>

          {/* Articles connexes */}
          {relatedPosts.length > 0 && (
            <div className="mt-14">
              <h3 className="text-xl font-bold text-gray-900 mb-6">À lire également sur MeubléFacile</h3>
              <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
                {relatedPosts.map((r) => (
                  <Link
                    key={r.slug}
                    href={`/blog/${r.slug}`}
                    className="group flex flex-col justify-between rounded-2xl border border-gray-200 bg-white p-4 shadow-2xs hover:shadow-md transition-shadow"
                  >
                    <div>
                      <div className="relative aspect-[16/10] overflow-hidden rounded-xl bg-gray-100 mb-3">
                        <Image
                          src={r.coverImage}
                          alt={r.title}
                          fill
                          sizes="(min-width: 640px) 33vw, 100vw"
                          className="object-cover group-hover:scale-105 transition-transform duration-300"
                        />
                      </div>
                      <span className="text-[10px] font-bold uppercase tracking-wider text-brand-700">
                        {r.categoryLabel}
                      </span>
                      <h4 className="font-bold text-gray-900 text-sm leading-snug mt-1 group-hover:text-brand-700 transition-colors line-clamp-2">
                        {r.title}
                      </h4>
                    </div>
                    <span className="text-xs font-semibold text-brand-700 mt-3 inline-flex items-center gap-1">
                      Lire la suite →
                    </span>
                  </Link>
                ))}
              </div>
            </div>
          )}
        </main>
      </div>
    </>
  );
}
