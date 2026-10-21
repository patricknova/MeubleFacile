/**
 * Génère un slug URL-friendly à partir d'une chaîne de texte
 * Supprime les accents, convertit en minuscules, remplace espaces par tirets
 */
export function slugify(text: string): string {
  return text
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "") // Supprime les accents
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9\s-]/g, "") // Garde seulement lettres, chiffres, espaces, tirets
    .replace(/[\s_]+/g, "-") // Remplace espaces et underscores par tirets
    .replace(/-+/g, "-") // Supprime tirets multiples
    .replace(/^-+|-+$/g, ""); // Supprime tirets en début/fin
}

/**
 * Génère un slug unique pour une annonce avec un suffixe aléatoire court
 */
export function generateListingSlug(title: string): string {
  const base = slugify(title).slice(0, 60);
  const suffix = Math.random().toString(36).slice(2, 6); // 4 caractères aléatoires
  return `${base}-${suffix}`;
}

/**
 * Mapping type d'annonce → slug URL
 */
export const TYPE_SLUGS: Record<string, string> = {
  studio: "studio-meuble",
  apartment: "appartement-meuble",
  room: "chambre-meublee",
  duplex: "duplex-meuble",
};

/**
 * Inverse du mapping slug → type
 */
export const SLUG_TO_TYPE: Record<string, string> = Object.fromEntries(
  Object.entries(TYPE_SLUGS).map(([k, v]) => [v, k])
);

/**
 * Labels d'affichage des types en français
 */
export const TYPE_LABELS: Record<string, string> = {
  studio: "Studio meublé",
  apartment: "Appartement meublé",
  room: "Chambre meublée",
  duplex: "Duplex meublé",
};
