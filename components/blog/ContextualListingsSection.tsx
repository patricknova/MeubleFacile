import Link from "next/link";
import Image from "next/image";
import { Zap, Wifi, ShieldCheck, Droplets, MapPin, CheckCircle2, MessageCircle, ArrowRight } from "lucide-react";
import { formatXAF, buildWhatsAppUrl } from "@/lib/format";
import type { BlogPost } from "@/lib/blog";

// Données de secours réalistes basées sur les seed & annonces réelles
const FALLBACK_LISTINGS = [
  {
    id: "1",
    slug: "studio-meuble-vip-bonapriso-douala",
    title: "Studio Meublé VIP avec Balcon — Bonapriso",
    neighborhood: "Bonapriso",
    city: "Douala",
    type: "studio",
    price_night: 35000,
    price_month: 550000,
    surface_m2: 45,
    coverPhoto: "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=800&auto=format&fit=crop&q=80",
    phone: "+237699000001",
    amenities: [
      { label: "Groupe automatique", icon: "zap" },
      { label: "Réserve d'eau + Pompe", icon: "droplet" },
      { label: "Wi-Fi Fibre", icon: "wifi" },
      { label: "Gardien 24/7", icon: "shield" }
    ],
    featuresText: "Inverseur automatique < 15s · Citerne 2 000 L · Climatisation continue"
  },
  {
    id: "2",
    slug: "appartement-standing-liberte-akwa-douala",
    title: "Appartement Standing 3 Pièces — Boulevard de la Liberté, Akwa",
    neighborhood: "Akwa",
    city: "Douala",
    type: "apartment",
    price_night: 65000,
    price_month: 1100000,
    surface_m2: 95,
    coverPhoto: "https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800&auto=format&fit=crop&q=80",
    phone: "+237699000001",
    amenities: [
      { label: "Fibre Camtel 50 Mbps", icon: "wifi" },
      { label: "Groupe secouru", icon: "zap" },
      { label: "Parking sécurisé", icon: "shield" },
      { label: "Espace bureau", icon: "check" }
    ],
    featuresText: "Idéal consultants & visios · Ligne dédiée télétravail · Vue dégagée"
  },
  {
    id: "3",
    slug: "duplex-prestige-denver-douala",
    title: "Duplex de Prestige avec Piscine — Denver, Douala",
    neighborhood: "Denver",
    city: "Douala",
    type: "duplex",
    price_night: 120000,
    price_month: 2200000,
    surface_m2: 240,
    coverPhoto: "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=800&auto=format&fit=crop&q=80",
    phone: "+237699000001",
    amenities: [
      { label: "Enceinte sécurisée 24/7", icon: "shield" },
      { label: "Vidéosurveillance CCTV", icon: "shield" },
      { label: "Solaire + Groupe 30 kVA", icon: "zap" },
      { label: "Forage privé", icon: "droplet" }
    ],
    featuresText: "Sécurité maximale pour familles & délégations · Barbelés concertinas · Coffre-fort"
  },
  {
    id: "4",
    slug: "appartement-familial-bonamoussadi-douala",
    title: "Appartement Familial Grand Confort — Bonamoussadi",
    neighborhood: "Bonamoussadi",
    city: "Douala",
    type: "apartment",
    price_night: 45000,
    price_month: 750000,
    surface_m2: 85,
    coverPhoto: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800&auto=format&fit=crop&q=80",
    phone: "+237699000001",
    amenities: [
      { label: "Groupe électrogène", icon: "zap" },
      { label: "Citerne d'eau 1 500 L", icon: "droplet" },
      { label: "Wi-Fi illimité", icon: "wifi" },
      { label: "Gardien de nuit", icon: "shield" }
    ],
    featuresText: "Quartier dynamique et commerçant · Climatisation tous salons & chambres"
  }
];

interface Props {
  post: BlogPost;
  citySlug?: string;
}

export function ContextualListingsSection({ post, citySlug = "douala" }: Props) {
  // Sélection des logements en rapport avec l'article
  const matchedListings = FALLBACK_LISTINGS.filter((item) => {
    if (post.featuredListingsSlugs.includes(item.slug)) return true;
    if (item.neighborhood.toLowerCase() === post.targetNeighborhood.toLowerCase()) return true;
    return false;
  });

  const displayListings = (matchedListings.length > 0 ? matchedListings : FALLBACK_LISTINGS).slice(0, 3);

  // Thème de badge selon la catégorie
  const themeConfig = {
    autonomie: {
      icon: Zap,
      badge: "Standard Autonomie 24/7",
      color: "text-amber-700 bg-amber-50 border-amber-200",
      accent: "bg-amber-600"
    },
    connexion: {
      icon: Wifi,
      badge: "Standard Connexion Fibre & Visio",
      color: "text-blue-700 bg-blue-50 border-blue-200",
      accent: "bg-blue-600"
    },
    securite: {
      icon: ShieldCheck,
      badge: "Standard Sécurité & Gardiennage 24/7",
      color: "text-emerald-700 bg-emerald-50 border-emerald-200",
      accent: "bg-emerald-600"
    },
    quartiers: {
      icon: MapPin,
      badge: "Sélection Quartier & Commodités",
      color: "text-indigo-700 bg-indigo-50 border-indigo-200",
      accent: "bg-indigo-600"
    }
  }[post.category];

  const ThemeIcon = themeConfig.icon;

  return (
    <section className="my-12 rounded-3xl border border-gray-200 bg-gradient-to-b from-gray-50/70 to-white p-6 sm:p-8 shadow-sm">
      {/* En-tête de section */}
      <div className="flex flex-col md:flex-row md:items-end justify-between gap-4 border-b border-gray-200/80 pb-6">
        <div>
          <div className="inline-flex items-center gap-2 rounded-full border px-3 py-1 text-xs font-semibold uppercase tracking-wider mb-2.5 shadow-2xs backdrop-blur-sm">
            <span className={`inline-flex items-center gap-1.5 font-bold ${themeConfig.color}`}>
              <ThemeIcon size={14} />
              {themeConfig.badge}
            </span>
          </div>
          <h3 className="text-xl sm:text-2xl font-bold text-gray-900 tracking-tight">
            Logements cités & audités dans cet article
          </h3>
          <p className="text-sm text-gray-600 mt-1 max-w-2xl">
            Ces logements meublés à Douala respectent strictement les critères techniques présentés (puissance de secours, débit vérifié et protocole de sécurité).
          </p>
        </div>

        <Link
          href={`/${citySlug}/${post.targetNeighborhood}/appartement-meuble`}
          className="inline-flex items-center gap-1.5 text-sm font-semibold text-brand-700 hover:text-brand-800 transition-colors shrink-0"
        >
          Tous les meublés à {post.targetNeighborhood.charAt(0).toUpperCase() + post.targetNeighborhood.slice(1)}
          <ArrowRight size={15} />
        </Link>
      </div>

      {/* Grille des logements recommandés */}
      <div className="mt-6 grid grid-cols-1 md:grid-cols-3 gap-6">
        {displayListings.map((listing) => {
          const detailUrl = `/${citySlug}/${listing.neighborhood.toLowerCase()}/${listing.type}-meuble/${listing.slug}`;
          const whatsappMsg = `Bonjour, j'ai lu votre article "${post.title}" sur MeubléFacile. Je souhaite vérifier la disponibilité de "${listing.title}".`;
          const whatsappUrl = buildWhatsAppUrl(listing.phone, whatsappMsg);

          return (
            <div
              key={listing.id}
              className="group flex flex-col justify-between overflow-hidden rounded-2xl border border-gray-200 bg-white shadow-xs hover:shadow-md transition-all duration-300 hover:-translate-y-1"
            >
              <div>
                {/* Photo avec badge */}
                <div className="relative aspect-[16/10] overflow-hidden bg-gray-100">
                  <Image
                    src={listing.coverPhoto}
                    alt={listing.title}
                    fill
                    sizes="(min-width: 768px) 33vw, 100vw"
                    className="object-cover group-hover:scale-105 transition-transform duration-500"
                  />
                  <div className="absolute top-2.5 left-2.5 z-10">
                    <span className="inline-flex items-center gap-1 rounded-full bg-emerald-600/90 px-2.5 py-1 text-xs font-semibold text-white shadow-xs backdrop-blur-xs">
                      <CheckCircle2 size={12} />
                      Vérifié S.C.A
                    </span>
                  </div>
                  <div className="absolute bottom-2.5 left-2.5 z-10">
                    <span className="inline-flex items-center gap-1 rounded-md bg-black/70 px-2 py-0.5 text-xs font-medium text-white backdrop-blur-xs">
                      <MapPin size={11} />
                      {listing.neighborhood}, Douala
                    </span>
                  </div>
                </div>

                {/* Contenu textuel */}
                <div className="p-4">
                  <h4 className="font-bold text-gray-900 line-clamp-2 text-base leading-snug group-hover:text-brand-700 transition-colors">
                    <Link href={detailUrl}>{listing.title}</Link>
                  </h4>

                  <p className="mt-1.5 text-xs font-medium text-emerald-700 bg-emerald-50 rounded-md p-1.5 border border-emerald-100">
                    ⚡ {listing.featuresText}
                  </p>

                  {/* Chips équipements */}
                  <div className="mt-3 flex flex-wrap gap-1.5">
                    {listing.amenities.map((a, i) => (
                      <span
                        key={i}
                        className="inline-flex items-center gap-1 rounded-md bg-gray-100 px-2 py-0.5 text-[11px] font-medium text-gray-700"
                      >
                        {a.icon === "zap" && <Zap size={11} className="text-amber-600" />}
                        {a.icon === "droplet" && <Droplets size={11} className="text-blue-600" />}
                        {a.icon === "wifi" && <Wifi size={11} className="text-indigo-600" />}
                        {a.icon === "shield" && <ShieldCheck size={11} className="text-emerald-600" />}
                        {a.label}
                      </span>
                    ))}
                  </div>
                </div>
              </div>

              {/* Prix et CTA */}
              <div className="border-t border-gray-100 p-4 pt-3 bg-gray-50/50">
                <div className="flex items-baseline justify-between mb-3">
                  <div>
                    <span className="text-[11px] text-gray-400 block">Tarif direct</span>
                    <strong className="text-base font-bold text-gray-900">{formatXAF(listing.price_night)}</strong>
                    <span className="text-xs text-gray-500"> /nuit</span>
                  </div>
                  {listing.price_month && (
                    <span className="text-[11px] text-gray-500 font-medium">
                      {formatXAF(listing.price_month)} /mois
                    </span>
                  )}
                </div>

                <div className="grid grid-cols-2 gap-2">
                  <Link
                    href={detailUrl}
                    className="inline-flex items-center justify-center rounded-xl bg-gray-900 px-3 py-2 text-xs font-semibold text-white hover:bg-black transition-colors"
                  >
                    Voir la fiche
                  </Link>

                  <a
                    href={whatsappUrl}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="inline-flex items-center justify-center gap-1.5 rounded-xl bg-emerald-600 px-3 py-2 text-xs font-semibold text-white hover:bg-emerald-700 transition-colors shadow-xs"
                  >
                    <MessageCircle size={13} />
                    WhatsApp
                  </a>
                </div>
              </div>
            </div>
          );
        })}
      </div>

      {/* Bannière de réassurance en bas de section */}
      <div className="mt-6 flex flex-col sm:flex-row items-center justify-between gap-3 rounded-2xl bg-brand-50 border border-brand-200/70 p-4 text-xs text-brand-900">
        <div className="flex items-center gap-2">
          <CheckCircle2 className="text-brand-700 shrink-0" size={18} />
          <span>
            <strong>Garantie Sérénité MeubléFacile :</strong> En cas de panne avérée de groupe ou d&apos;eau non résolue sous 2h, nous prenons en charge votre relogement immédiat.
          </span>
        </div>
        <Link
          href={`/${citySlug}`}
          className="font-bold underline text-brand-700 hover:text-brand-800 shrink-0"
        >
          Consulter tout le catalogue Douala
        </Link>
      </div>
    </section>
  );
}
