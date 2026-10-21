import { cn } from "@/lib/format";
import type { Amenity } from "@/lib/types";
import {
  Wind, Wifi, Zap, Droplets, ShieldCheck, Car, Tv, Refrigerator,
  ChefHat, BedDouble, Star, Trees, Dumbbell, Building2
} from "lucide-react";

const AMENITY_ICONS: Record<string, React.ElementType> = {
  ac: Wind,
  wifi: Wifi,
  generator: Zap,
  water_tank: Droplets,
  guard: ShieldCheck,
  parking: Car,
  tv: Tv,
  fridge: Refrigerator,
  kitchen: ChefHat,
  bed: BedDouble,
  garden: Trees,
  gym: Dumbbell,
  elevator: Building2,
};

const CATEGORY_LABELS: Record<string, string> = {
  comfort: "Confort",
  kitchen: "Cuisine",
  power_water: "Énergie & Eau",
  security: "Sécurité",
  outdoor: "Extérieur",
};

interface AmenityListProps {
  amenities: { amenity?: Amenity | null; quantity?: number }[];
  showCategories?: boolean;
  className?: string;
}

function AmenityIcon({ code, className }: { code: string; className?: string }) {
  const Icon = AMENITY_ICONS[code] ?? Star;
  return <Icon size={16} className={cn("shrink-0", className)} aria-hidden="true" />;
}

export function AmenityList({ amenities, showCategories = false, className }: AmenityListProps) {
  if (!amenities.length) return null;

  if (!showCategories) {
    return (
      <ul className={cn("flex flex-wrap gap-2", className)}>
        {amenities.map(({ amenity, quantity }) =>
          amenity ? (
            <li
              key={amenity.id}
              className="flex items-center gap-1.5 rounded-full border border-gray-200 bg-gray-50 px-3 py-1 text-xs text-gray-700"
            >
              <AmenityIcon code={amenity.code} className="text-brand-600" />
              {amenity.label_fr}
              {quantity && quantity > 1 && <span className="text-gray-400">×{quantity}</span>}
            </li>
          ) : null
        )}
      </ul>
    );
  }

  // Grouper par catégorie
  const byCategory: Record<string, typeof amenities> = {};
  for (const item of amenities) {
    if (!item.amenity) continue;
    const cat = item.amenity.category;
    if (!byCategory[cat]) byCategory[cat] = [];
    byCategory[cat].push(item);
  }

  return (
    <div className={cn("space-y-4", className)}>
      {Object.entries(byCategory).map(([cat, items]) => (
        <div key={cat}>
          <h4 className="mb-2 text-xs font-semibold uppercase tracking-wide text-gray-500">
            {CATEGORY_LABELS[cat] ?? cat}
          </h4>
          <ul className="grid grid-cols-2 gap-x-4 gap-y-2 sm:grid-cols-3">
            {items.map(({ amenity, quantity }) =>
              amenity ? (
                <li key={amenity.id} className="flex items-center gap-2 text-sm text-gray-700">
                  <AmenityIcon code={amenity.code} className="text-brand-600" />
                  <span>
                    {amenity.label_fr}
                    {quantity && quantity > 1 && (
                      <span className="ml-1 text-gray-400 text-xs">×{quantity}</span>
                    )}
                  </span>
                </li>
              ) : null
            )}
          </ul>
        </div>
      ))}
    </div>
  );
}
