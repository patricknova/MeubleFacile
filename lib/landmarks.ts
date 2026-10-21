// Données réelles des points de repère et commodités de Douala par quartier
// Utilisé pour enrichir les fiches logements avec les lieux Google Maps à proximité

export interface NearbyLandmark {
  id: string;
  name: string;
  category: "supermarket" | "health" | "transport" | "food" | "bank" | "leisure";
  distanceText: string;
  walkTimeText: string;
  photoUrl?: string;
  googleMapsUrl: string;
}

export const CATEGORY_META = {
  supermarket: {
    label: "Supermarchés & Marchés",
    icon: "🛒",
    badgeColor: "bg-emerald-50 text-emerald-700 border-emerald-200",
  },
  health: {
    label: "Santé & Pharmacies",
    icon: "🏥",
    badgeColor: "bg-rose-50 text-rose-700 border-rose-200",
  },
  transport: {
    label: "Transports & Mobilité",
    icon: "✈️",
    badgeColor: "bg-blue-50 text-blue-700 border-blue-200",
  },
  food: {
    label: "Restaurants & Sorties",
    icon: "🍽️",
    badgeColor: "bg-amber-50 text-amber-700 border-amber-200",
  },
  bank: {
    label: "Banques & Distributeurs",
    icon: "🏦",
    badgeColor: "bg-purple-50 text-purple-700 border-purple-200",
  },
  leisure: {
    label: "Loisirs & Détente",
    icon: "🌴",
    badgeColor: "bg-teal-50 text-teal-700 border-teal-200",
  },
} as const;

export const NEIGHBORHOOD_LANDMARKS: Record<string, NearbyLandmark[]> = {
  bonapriso: [
    {
      id: "spar-bonapriso",
      name: "Supermarché SPAR Bonapriso",
      category: "supermarket",
      distanceText: "250 m",
      walkTimeText: "3 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1578916171728-46686eac8d58?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Supermarch%C3%A9+SPAR+Bonapriso+Douala",
    },
    {
      id: "clinique-mermoz",
      name: "Clinique Mermoz",
      category: "health",
      distanceText: "400 m",
      walkTimeText: "5 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Clinique+Mermoz+Bonapriso+Douala",
    },
    {
      id: "le-biniou",
      name: "Restaurant Le Biniou",
      category: "food",
      distanceText: "550 m",
      walkTimeText: "7 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Restaurant+Le+Biniou+Bonapriso+Douala",
    },
    {
      id: "aeroport-douala",
      name: "Aéroport International de Douala",
      category: "transport",
      distanceText: "3,5 km",
      walkTimeText: "8 min en taxi",
      photoUrl: "https://images.unsplash.com/photo-1436491865332-7a61a109cc05?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=A%C3%A9roport+International+de+Douala",
    },
    {
      id: "bicec-bonapriso",
      name: "Agence BICEC / Distributeur GAB",
      category: "bank",
      distanceText: "300 m",
      walkTimeText: "4 min à pied",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Banque+BICEC+Bonapriso+Douala",
    },
  ],
  akwa: [
    {
      id: "akwa-palace",
      name: "Hôtel Akwa Palace & Boulevard de la Liberté",
      category: "leisure",
      distanceText: "150 m",
      walkTimeText: "2 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1566073771259-6a8506099945?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Akwa+Palace+Douala",
    },
    {
      id: "marche-sandaga",
      name: "Marché Sandaga",
      category: "supermarket",
      distanceText: "800 m",
      walkTimeText: "10 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1488459716781-31db52582fe9?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=March%C3%A9+Sandaga+Douala",
    },
    {
      id: "soppo-priso",
      name: "Clinique Soppo Priso",
      category: "health",
      distanceText: "450 m",
      walkTimeText: "5 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Clinique+Soppo+Priso+Akwa+Douala",
    },
    {
      id: "banques-akwa",
      name: "Pôle Bancaire Akwa (Afriland, Société Générale, UBA)",
      category: "bank",
      distanceText: "250 m",
      walkTimeText: "3 min à pied",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Banques+Boulevard+de+la+Libert%C3%A9+Akwa+Douala",
    },
  ],
  bonamoussadi: [
    {
      id: "carrefour-market-bonamoussadi",
      name: "Carrefour Market Bonamoussadi",
      category: "supermarket",
      distanceText: "300 m",
      walkTimeText: "4 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1578916171728-46686eac8d58?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Carrefour+Market+Bonamoussadi+Douala",
    },
    {
      id: "rond-point-maetur",
      name: "Rond-Point Maetur",
      category: "transport",
      distanceText: "450 m",
      walkTimeText: "6 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Rond-Point+Maetur+Bonamoussadi+Douala",
    },
    {
      id: "clinique-esperance",
      name: "Clinique de l'Espérance",
      category: "health",
      distanceText: "600 m",
      walkTimeText: "7 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Clinique+de+l%27Esp%C3%A9rance+Bonamoussadi+Douala",
    },
    {
      id: "santa-lucia-bonamoussadi",
      name: "Supermarché Santa Lucia",
      category: "supermarket",
      distanceText: "750 m",
      walkTimeText: "9 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1583258292688-d0213dc5a3a8?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Santa+Lucia+Bonamoussadi+Douala",
    },
  ],
  makepe: [
    {
      id: "rhone-poulenc",
      name: "Carrefour Rhône-Poulenc",
      category: "transport",
      distanceText: "350 m",
      walkTimeText: "4 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Carrefour+Rh%C3%B4ne-Poulenc+Makepe+Douala",
    },
    {
      id: "hopital-general",
      name: "Hôpital Général de Douala",
      category: "health",
      distanceText: "1,2 km",
      walkTimeText: "4 min en taxi",
      photoUrl: "https://images.unsplash.com/photo-1586773860418-d37222d8fce3?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=H%C3%B4pital+G%C3%A9n%C3%A9ral+de+Douala",
    },
    {
      id: "saker-makepe",
      name: "Boulangerie Pâtisserie Saker Makepe",
      category: "food",
      distanceText: "400 m",
      walkTimeText: "5 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1509440159596-0249088772ff?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Boulangerie+Saker+Makepe+Douala",
    },
  ],
  bonanjo: [
    {
      id: "place-gouvernement",
      name: "Place du Gouvernement & Quartier Administratif",
      category: "leisure",
      distanceText: "200 m",
      walkTimeText: "3 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1541872703-74c5e44368f9?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Place+du+Gouvernement+Bonanjo+Douala",
    },
    {
      id: "port-douala",
      name: "Port Autonome de Douala",
      category: "transport",
      distanceText: "850 m",
      walkTimeText: "10 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1578575437130-527eed3abbec?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Port+Autonome+de+Douala",
    },
    {
      id: "musee-maritime",
      name: "Musée Maritime de Douala",
      category: "leisure",
      distanceText: "400 m",
      walkTimeText: "5 min à pied",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Mus%C3%A9e+Maritime+de+Douala",
    },
  ],
  kotto: [
    {
      id: "denver-residentiel",
      name: "Denver Résidentiel & Boutiques",
      category: "leisure",
      distanceText: "250 m",
      walkTimeText: "3 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Denver+Kotto+Douala",
    },
    {
      id: "marche-kotto",
      name: "Marché de Kotto",
      category: "supermarket",
      distanceText: "600 m",
      walkTimeText: "7 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1488459716781-31db52582fe9?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=March%C3%A9+Kotto+Douala",
    },
  ],
  bali: [
    {
      id: "rue-de-la-joie",
      name: "Rue de la Joie & Restaurants locaux",
      category: "food",
      distanceText: "300 m",
      walkTimeText: "4 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Rue+de+la+Joie+Bali+Douala",
    },
    {
      id: "polyclinique-ste-anne",
      name: "Polyclinique Sainte-Anne",
      category: "health",
      distanceText: "500 m",
      walkTimeText: "6 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Polyclinique+Sainte-Anne+Bali+Douala",
    },
  ],
  deido: [
    {
      id: "rond-point-deido",
      name: "Rond-point Deido & Carrefour 4 Étages",
      category: "transport",
      distanceText: "300 m",
      walkTimeText: "4 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=Rond-point+Deido+Douala",
    },
    {
      id: "hopital-deido",
      name: "Hôpital de District de Deido",
      category: "health",
      distanceText: "600 m",
      walkTimeText: "7 min à pied",
      photoUrl: "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?w=300&auto=format&fit=crop&q=80",
      googleMapsUrl: "https://www.google.com/maps/search/?api=1&query=H%C3%B4pital+de+District+de+Deido+Douala",
    },
  ],
};

export function getNearbyLandmarks(
  neighborhoodSlug: string,
  customLandmark?: string | null
): NearbyLandmark[] {
  const normSlug = (neighborhoodSlug || "").toLowerCase().trim();
  const baseLandmarks = NEIGHBORHOOD_LANDMARKS[normSlug] ?? [
    {
      id: "generic-market",
      name: "Commerces de proximité & Marché",
      category: "supermarket",
      distanceText: "300 m",
      walkTimeText: "4 min à pied",
      googleMapsUrl: `https://www.google.com/maps/search/?api=1&query=Supermarch%C3%A9+${encodeURIComponent(neighborhoodSlug)}+Douala`,
    },
    {
      id: "generic-health",
      name: "Pharmacie & Centre de santé",
      category: "health",
      distanceText: "500 m",
      walkTimeText: "6 min à pied",
      googleMapsUrl: `https://www.google.com/maps/search/?api=1&query=Pharmacie+${encodeURIComponent(neighborhoodSlug)}+Douala`,
    },
  ];

  if (customLandmark && customLandmark.trim().length > 0) {
    const customItem: NearbyLandmark = {
      id: "custom-landmark",
      name: customLandmark,
      category: "transport",
      distanceText: "À proximité immédiate",
      walkTimeText: "1-2 min à pied",
      googleMapsUrl: `https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(customLandmark + " " + neighborhoodSlug + " Douala")}`,
    };
    return [customItem, ...baseLandmarks];
  }

  return baseLandmarks;
}
