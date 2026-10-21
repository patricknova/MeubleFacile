import Link from "next/link";
import { JsonLd } from "@/components/JsonLd";
import { cn } from "@/lib/format";

interface BreadcrumbItem {
  label: string;
  href?: string;
}

interface BreadcrumbsProps {
  items: BreadcrumbItem[];
  className?: string;
}

const SITE = process.env.NEXT_PUBLIC_SITE_URL || "https://meublefacile.vercel.app";

export function Breadcrumbs({ items, className }: BreadcrumbsProps) {
  const all = [{ label: "Accueil", href: "/" }, ...items];

  const jsonLd = {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    itemListElement: all.map((item, i) => ({
      "@type": "ListItem",
      position: i + 1,
      name: item.label,
      item: item.href ? `${SITE}${item.href}` : undefined,
    })),
  };

  return (
    <>
      <JsonLd data={jsonLd} />
      <nav aria-label="Fil d'Ariane" className={cn("text-sm text-gray-500", className)}>
        <ol className="flex flex-wrap items-center gap-1">
          {all.map((item, i) => (
            <li key={i} className="flex items-center gap-1">
              {i > 0 && <span aria-hidden="true" className="text-gray-300">›</span>}
              {item.href && i < all.length - 1 ? (
                <Link
                  href={item.href}
                  className="hover:text-brand-700 transition-colors hover:underline"
                >
                  {item.label}
                </Link>
              ) : (
                <span className="text-gray-900 font-medium" aria-current={i === all.length - 1 ? "page" : undefined}>
                  {item.label}
                </span>
              )}
            </li>
          ))}
        </ol>
      </nav>
    </>
  );
}
