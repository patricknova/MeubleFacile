import { createClient } from "@/lib/supabase/server";
import { TYPE_SLUGS } from "@/lib/slug";
import { getAllPosts } from "@/lib/blog";
import type { MetadataRoute } from "next";

const SITE = process.env.NEXT_PUBLIC_SITE_URL || "https://meublefacile.vercel.app";

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const supabase = await createClient();

  const [citiesRes, neighborhoodsRes, listingsRes] = await Promise.all([
    supabase.from("cities").select("slug, updated_at").eq("active", true),
    supabase
      .from("neighborhoods")
      .select("slug, city_id, cities(slug)")
      .order("name"),
    supabase
      .from("listings")
      .select("slug, type, updated_content_at, neighborhoods(slug), cities(slug)")
      .eq("status", "published")
      .order("updated_content_at", { ascending: false })
      .limit(500),
  ]);

  const blogPosts = getAllPosts();
  const blogPages: MetadataRoute.Sitemap = [
    { url: `${SITE}/blog`, lastModified: new Date(), changeFrequency: "daily", priority: 0.8 },
    ...blogPosts.map((p) => ({
      url: `${SITE}/blog/${p.slug}`,
      lastModified: new Date(p.updatedAt || p.publishedAt),
      changeFrequency: "weekly" as const,
      priority: 0.85,
    })),
  ];

  const staticPages: MetadataRoute.Sitemap = [
    { url: `${SITE}/`, lastModified: new Date(), changeFrequency: "daily", priority: 1 },
    { url: `${SITE}/a-propos`, lastModified: new Date(), changeFrequency: "monthly", priority: 0.3 },
    { url: `${SITE}/contact`, lastModified: new Date(), changeFrequency: "monthly", priority: 0.3 },
    { url: `${SITE}/conditions`, lastModified: new Date(), changeFrequency: "yearly", priority: 0.2 },
    { url: `${SITE}/confidentialite`, lastModified: new Date(), changeFrequency: "yearly", priority: 0.2 },
  ];

  const cityPages: MetadataRoute.Sitemap = (citiesRes.data ?? []).map((c) => ({
    url: `${SITE}/${c.slug}`,
    lastModified: new Date(),
    changeFrequency: "daily" as const,
    priority: 0.8,
  }));

  // Pages quartier + types
  const neighborhoodPages: MetadataRoute.Sitemap = [];
  for (const n of neighborhoodsRes.data ?? []) {
    const citySlug = Array.isArray(n.cities) ? n.cities[0]?.slug : (n.cities as { slug?: string } | null)?.slug;
    if (!citySlug) continue;

    neighborhoodPages.push({
      url: `${SITE}/${citySlug}/${n.slug}`,
      lastModified: new Date(),
      changeFrequency: "daily",
      priority: 0.7,
    });

    for (const typeSlug of Object.values(TYPE_SLUGS)) {
      neighborhoodPages.push({
        url: `${SITE}/${citySlug}/${n.slug}/${typeSlug}`,
        lastModified: new Date(),
        changeFrequency: "daily",
        priority: 0.6,
      });
    }
  }

  // Fiches annonces
  const listingPages: MetadataRoute.Sitemap = (listingsRes.data ?? []).map((l) => {
    const neighborhood = Array.isArray(l.neighborhoods) ? l.neighborhoods[0] : l.neighborhoods;
    const city = Array.isArray(l.cities) ? l.cities[0] : l.cities;
    const typeSlug = TYPE_SLUGS[l.type] ?? l.type;
    return {
      url: `${SITE}/${(city as { slug?: string })?.slug}/${(neighborhood as { slug?: string })?.slug}/${typeSlug}/${l.slug}`,
      lastModified: new Date(l.updated_content_at),
      changeFrequency: "weekly" as const,
      priority: 0.9,
    };
  });

  return [...staticPages, ...blogPages, ...cityPages, ...neighborhoodPages, ...listingPages];
}
