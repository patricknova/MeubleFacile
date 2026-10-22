// ============================================================
// Module Blog & Guides Éditoriaux — MeubléFacile
// Stratégie de positionnement : Sécurité, Connexion, Autonomie (S.C.A)
// ============================================================

export type BlogCategory = "autonomie" | "connexion" | "securite" | "quartiers";

export interface BlogPost {
  slug: string;
  title: string;
  metaTitle: string;
  metaDescription: string;
  excerpt: string;
  category: BlogCategory;
  categoryLabel: string;
  publishedAt: string;
  updatedAt?: string;
  readTime: string;
  author: {
    name: string;
    role: string;
    avatar: string;
  };
  coverImage: string;
  targetNeighborhood: string; // ex: 'bonapriso', 'akwa', 'yassa', 'bonamoussadi'
  targetAmenities: string[];  // ex: ['generator', 'water_tank', 'wifi', 'guard']
  featuredListingsSlugs: string[]; // Logements cités directement dans l'article
  tags: string[];
  contentHtml?: string;
  sections: {
    title: string;
    content: string;
    highlightBox?: {
      type: "tip" | "warning" | "checklist";
      title: string;
      items: string[];
    };
  }[];
}

export const BLOG_POSTS: BlogPost[] = [
  {
    slug: "delestage-douala-reconnaitre-meuble-autonome-groupe-reserve-eau",
    title: "Délestage à Douala : Comment reconnaître un VRAI meublé autonome (Groupe automatique & Réserve d'eau)",
    metaTitle: "Délestage Douala : Comment choisir un meublé autonome avec groupe & eau | MeubléFacile",
    metaDescription: "Guide d'audit anti-coupure à Douala : inverseur automatique, puissance en kVA, réserve d'eau avec surpresseur. Les questions à poser avant de réserver.",
    excerpt: "À Douala, un bel appartement ne vaut rien si vous passez la nuit sans climatisation sous 35°C ou sans eau pour vous doucher. Voici notre protocole d'audit pour repérer une véritable autonomie 24/7.",
    category: "autonomie",
    categoryLabel: "Autonomie Énergie & Eau",
    publishedAt: "2026-10-20",
    readTime: "6 min",
    author: {
      name: "Marc Ebanda",
      role: "Responsable Conformité & Qualité Logements Douala",
      avatar: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200&auto=format&fit=crop&q=80"
    },
    coverImage: "https://images.unsplash.com/photo-1513694203232-719a280e022f?w=1200&auto=format&fit=crop&q=80",
    targetNeighborhood: "bonapriso",
    targetAmenities: ["generator", "water_tank", "water_pump", "permanent_power"],
    featuredListingsSlugs: [
      "studio-meuble-vip-bonapriso-douala",
      "appartement-standing-liberte-akwa-douala",
      "appartement-familial-bonamoussadi-douala"
    ],
    tags: ["Délestage Douala", "Groupe Électrogène", "Réserve d'Eau", "Bonapriso", "Eneo", "Camwater"],
    sections: [
      {
        title: "1. Le piège du « Groupe électrogène disponible » à Douala",
        content: `C'est la désillusion la plus fréquente des vacanciers de la diaspora et des consultants internationaux : l'annonce promet un « groupe électrogène », mais une fois sur place lors d'une coupure nocturne, le gardien vous explique que le groupe est manuel, qu'il n'y a plus de gasoil, ou pire, qu'il ne supporte pas la climatisation.\n\nSur <a href="/douala" class="text-brand-700 font-semibold underline hover:text-brand-800">MeubléFacile</a>, nous n'acceptons dans notre sélection certifiée que les logements équipés d'un **inverseur automatique (ATS)** capable de basculer en moins de 30 secondes sans intervention humaine.`
      },
      {
        title: "2. Les 3 vérifications d'or pour la climatisation et l'énergie",
        content: `Pour qu'un meublé maintienne la climatisation continue dans les chambres pendant les coupures Eneo, il doit respecter des critères stricts :\n\n- **Puissance minimale du groupe** : Au moins 15 kVA pour une résidence collective, ou un groupe dédié de 5 kVA pour un studio individuel.\n- **Politique de carburant claire** : Le contrat doit stipuler si le carburant est inclus dans la nuitée (cas de tous les meublés vérifiés sur notre plateforme).\n- **Onduleur ou relais solaire** : Pour éviter que votre ordinateur portable ou vos équipements électroniques ne subissent de microrupteurs de tension.`,
        highlightBox: {
          type: "checklist",
          title: "Checklist à demander au bailleur avant d'envoyer un acompte :",
          items: [
            "Le basculement sur le groupe se fait-il automatiquement jour et nuit ?",
            "Les climatiseurs des chambres fonctionnent-ils tous sur le groupe de secours ?",
            "Le carburant du groupe est-il 100% inclus dans le tarif annoncé ?"
          ]
        }
      },
      {
        title: "3. La question de l'eau : Forage + Château d'eau + Surpresseur",
        content: `À Douala, l'eau courante de Camwater subit des baisses de pression chroniques. Un logement meublé de standing doit obligatoirement posséder une **réserve d'eau tampon (cuve de 1 000 à 3 000 litres)** couplée à un **surpresseur électrique branché sur le groupe de secours**.\n\nSans surpresseur, vous n'aurez qu'un mince filet d'eau au deuxième étage, incapable d'activer le chauffe-eau de votre douche.`
      }
    ]
  },
  {
    slug: "teletravail-douala-meubles-fibre-optique-starlink-visio-sans-coupure",
    title: "Télétravailler depuis Douala : Les meublés avec Fibre Optique réelle & Starlink pour visioconférences sans interruption",
    metaTitle: "Télétravail Douala : Meublés avec Fibre Optique & Starlink Vérifié | MeubléFacile",
    metaDescription: "Besoin d'un studio ou appartement meublé à Douala pour vos visioconférences Zoom et Teams ? Découvrez les critères de débit réel et les quartiers connectés.",
    excerpt: "Pour les consultants, freelances et cadres de la diaspora en séjour de travail, une simple clé 4G partagée ne suffit pas. Voici comment garantir une connexion stable à plus de 30 Mbps.",
    category: "connexion",
    categoryLabel: "Connexion & Télétravail",
    publishedAt: "2026-10-21",
    readTime: "5 min",
    author: {
      name: "Christelle Ngo",
      role: "Spécialiste Expérience Voyageurs & Nomades Digitaux",
      avatar: "https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=200&auto=format&fit=crop&q=80"
    },
    coverImage: "https://images.unsplash.com/photo-1522071820081-009f0129c71c?w=1200&auto=format&fit=crop&q=80",
    targetNeighborhood: "akwa",
    targetAmenities: ["wifi", "desk", "generator", "ac"],
    featuredListingsSlugs: [
      "appartement-standing-liberte-akwa-douala",
      "studio-affaires-bonanjo-douala",
      "studio-meuble-vip-bonapriso-douala"
    ],
    tags: ["Fibre Optique Douala", "Starlink Cameroun", "Télétravail", "Akwa", "Bonanjo", "Nomades Digitaux"],
    sections: [
      {
        title: "1. Pourquoi la simple mention « Wi-Fi inclus » est souvent trompeuse",
        content: `Nombreux sont les voyageurs arrivant dans un meublé à Douala découvrant un petit boîtier 4G d'opérateur mobile avec un forfait épuisé après deux réunions Teams.\n\nPour travailler sérieusement, vous avez besoin soit d'un **raccordement FTTH (Fibre optique jusqu'au domicile)** avec Camtel Blue ou Orange Fibre, soit d'une installation **Starlink** avec une vue dégagée vers le ciel.`
      },
      {
        title: "2. Les meilleurs quartiers de Douala pour une connexion haut débit",
        content: `Les infrastructures réseau sont particulièrement denses dans le triangle des affaires :\n\n- **Akwa & Bonanjo** : Cœur des sièges bancaires et des multinationales, où le réseau fibre est le plus stable. Découvrez nos <a href="/douala/bonanjo/studio-meuble" class="text-brand-700 underline font-semibold">studios meublés à Bonanjo</a> équipés d'espaces bureau dédiés.\n- **Bonapriso** : Idéal pour allier restaurants gastronomiques et séances de travail au calme.\n- **Denver & Makepe** : Quartiers modernes en plein essor accueillant de plus en plus de résidences connectées par satellite Starlink.`
      },
      {
        title: "3. La double sécurité réseau préconisée par MeubléFacile",
        content: `Nos logements partenaires de la catégorie « Affaires & Télétravail » disposent d'un routeur centralisé avec **back-up automatique 4G** : si la fibre subit une maintenance de voirie, le routeur bascule automatiquement sur un réseau mobile haut débit, sans que votre appel client ne coupe.`,
        highlightBox: {
          type: "tip",
          title: "Conseil de pro pour votre test de vitesse à l'arrivée :",
          items: [
            "Demandez au gestionnaire un test Speedtest récent avant d'embarquer.",
            "Vérifiez que le routeur Wi-Fi est lui-même branché sur le circuit secouru par onduleur.",
            "Optez pour un meublé avec une prise électrique murale à moins de 1,5m du bureau de travail."
          ]
        }
      }
    ]
  },
  {
    slug: "securite-meuble-douala-5-criteres-gardiennage-discretion-yassa-bonapriso",
    title: "Sécurité des Meublés à Douala : Les 5 critères indispensables (Gardien 24/7, Clôture électrifiée & Discrétion)",
    metaTitle: "Sécurité Meublé Douala : 5 critères de gardiennage et sécurité | MeubléFacile",
    metaDescription: "Comment s'assurer de la sécurité de sa famille et de ses effets personnels dans un appartement meublé à Douala ? Clôture, caméras, gardiennage jour et nuit.",
    excerpt: "Voyager avec des enfants ou transporter du matériel informatique précieux exige un niveau de sûreté absolu. Voici les standards de sécurité physique que chaque bailleur sérieux doit offrir.",
    category: "securite",
    categoryLabel: "Sécurité & Discrétion",
    publishedAt: "2026-10-21",
    readTime: "7 min",
    author: {
      name: "Alexandre Kamga",
      role: "Fondateur MeubléFacile & Expert Immobilier",
      avatar: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&auto=format&fit=crop&q=80"
    },
    coverImage: "https://images.unsplash.com/photo-1541971875076-8f970d573be6?w=1200&auto=format&fit=crop&q=80",
    targetNeighborhood: "yassa",
    targetAmenities: ["guard", "gated", "cctv", "safe"],
    featuredListingsSlugs: [
      "duplex-prestige-denver-douala",
      "studio-meuble-vip-bonapriso-douala",
      "appartement-familial-bonamoussadi-douala"
    ],
    tags: ["Sécurité Meublé Douala", "Gardiennage 24/7", "Yassa", "Denver", "Bonapriso", "Voyage Famille"],
    sections: [
      {
        title: "1. Gardiennage physique de jour comme de nuit : Le premier rempart",
        content: `À Douala, un digicode ne remplace jamais la présence d'un **gardien assermenté 24h/24**. Le gardien filtre les visiteurs inattendus, assure la fermeture des portails motorisés et veille sur vos véhicules en stationnement intérieur.\n\nDans des zones en pleine expansion comme <a href="/douala/bonapriso/appartement-meuble" class="text-brand-700 underline font-semibold">Yassa ou Bonapriso</a>, une résidence fermée avec guérite de sécurité apporte une quiétude incomparable pour les familles et la diaspora en vacances.`
      },
      {
        title: "2. Clôtures hautes, concertinas (barbelés rasoir) et vidéosurveillance CCTV",
        content: `Une enceinte sécurisée doit dissuader toute intrusion extérieure :\n\n- **Hauteur des murs** : Minimum 2,50 mètres avec filins électrifiés ou concertinas en crête.\n- **Caméras CCTV sur les parties communes** : Uniquement aux entrées et au parking pour préserver 100% de votre intimité à l'intérieur des appartements.\n- **Éclairage nocturne solaire** : Même en cas de coupure de courant du quartier, la cour intérieure et les accès restent parfaitement illuminés.`
      },
      {
        title: "3. Discrétion et serrures multipoints pour vos effets de valeur",
        content: `Lorsque vous quittez votre logement pour une virée shopping à Akwa ou un dîner à Bonapriso, vos passeports, devises et bijoux doivent rester en sécurité. Nous recommandons systématiquement les logements dotés de **coffres-forts à combinaison digitale scellés** et de portes d'entrée métalliques multipoints.`,
        highlightBox: {
          type: "warning",
          title: "Les signaux d'alerte qui doivent vous faire fuir :",
          items: [
            "Une cour ouverte directement sur la rue sans portail solide.",
            "Un gardien qui n'est présent qu'à temps partiel en journée.",
            "Des fenêtres du rez-de-chaussée sans grilles de défense métalliques."
          ]
        }
      }
    ]
  },
  {
    slug: "guide-yassa-japoma-douala-meubles-stade-axe-lourd-calme",
    title: "Guide Quartier Yassa & Japoma : Meublés modernes, calme et accès direct au Stade et à l'Aéroport",
    metaTitle: "Meublé Douala Yassa & Japoma : Guide des appartements modernes | MeubléFacile",
    metaDescription: "Pourquoi choisir un appartement meublé à Yassa ou Japoma ? Proximité aéroport, calme, résidences récentes et accès rapide sans embouteillages.",
    excerpt: "Situé à l'entrée Est de Douala, le secteur Yassa - Japoma s'impose comme le nouveau pôle des résidences spacieuses de haut standing. Découvrez pourquoi ce secteur séduit de plus en plus de visiteurs.",
    category: "quartiers",
    categoryLabel: "Guide Quartier",
    publishedAt: "2026-10-22",
    readTime: "5 min",
    author: {
      name: "Marc Ebanda",
      role: "Responsable Conformité & Qualité Logements Douala",
      avatar: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200&auto=format&fit=crop&q=80"
    },
    coverImage: "https://images.unsplash.com/photo-1580587771525-78b9dba3b914?w=1200&auto=format&fit=crop&q=80",
    targetNeighborhood: "yassa",
    targetAmenities: ["generator", "water_tank", "guard", "wifi"],
    featuredListingsSlugs: [
      "duplex-prestige-denver-douala",
      "appartement-familial-bonamoussadi-douala",
      "studio-meuble-vip-bonapriso-douala"
    ],
    tags: ["Yassa Douala", "Japoma", "Aéroport Douala", "Résidence Meublée", "Axe lourd Yaoundé"],
    sections: [
      {
        title: "1. L'atout fraîcheur et espace à l'écart du tumulte du centre-ville",
        content: `Contrairement à Akwa ou Deido où l'activité commerciale est permanente, Yassa offre de vastes résidences construites récemment, avec jardins paysagers, parkings privatifs pour plusieurs véhicules et terrasses sans vis-à-vis.\n\nC'est la localisation idéale si vous assistez à un match au Stade Omnisports de Japoma ou si vous souhaitez rejoindre l'Aéroport International de Douala en moins de 15 minutes sans subir les bouchons de Ndokoti.`
      },
      {
        title: "2. Les standards de construction des résidences de Yassa",
        content: `La grande majorité des meublés de Yassa ont été érigés après 2020. Ils intègrent dès leur conception des **forages d'eau privés** et des locaux techniques insonorisés pour les groupes électrogènes de forte puissance, garantissant zéro nuisance sonore pendant votre sommeil.`
      }
    ]
  }
];

export function getAllPosts(): BlogPost[] {
  return BLOG_POSTS;
}

export function getPostBySlug(slug: string): BlogPost | undefined {
  return BLOG_POSTS.find((p) => p.slug === slug);
}

export function getPostsByCategory(category: BlogCategory): BlogPost[] {
  return BLOG_POSTS.filter((p) => p.category === category);
}

export function getRelatedPosts(currentSlug: string): BlogPost[] {
  return BLOG_POSTS.filter((p) => p.slug !== currentSlug).slice(0, 3);
}
