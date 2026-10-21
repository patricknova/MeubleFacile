/**
 * Formate un montant en FCFA (XAF)
 * Exemple : 25000 → "25 000 FCFA"
 */
export function formatXAF(amount: number | null | undefined): string {
  if (amount == null) return "—";
  return (
    new Intl.NumberFormat("fr-CM", {
      style: "decimal",
      maximumFractionDigits: 0,
    }).format(amount) + "\u00a0FCFA" // espace insécable avant FCFA
  );
}

/**
 * Formate une date en français (JJ/MM/AAAA)
 */
export function formatDate(date: string | Date | null): string {
  if (!date) return "—";
  return new Intl.DateTimeFormat("fr-CM", {
    day: "2-digit",
    month: "2-digit",
    year: "numeric",
    timeZone: "Africa/Douala",
  }).format(new Date(date));
}

/**
 * Formate une date en relatif (ex: "il y a 3 jours")
 */
export function formatRelativeDate(date: string | Date): string {
  const now = new Date();
  const d = new Date(date);
  const diffMs = now.getTime() - d.getTime();
  const diffDays = Math.floor(diffMs / (1000 * 60 * 60 * 24));

  if (diffDays === 0) return "Aujourd'hui";
  if (diffDays === 1) return "Hier";
  if (diffDays < 7) return `Il y a ${diffDays} jours`;
  if (diffDays < 30) return `Il y a ${Math.floor(diffDays / 7)} semaines`;
  if (diffDays < 365) return `Il y a ${Math.floor(diffDays / 30)} mois`;
  return `Il y a ${Math.floor(diffDays / 365)} an(s)`;
}

/**
 * Génère l'URL WhatsApp avec message pré-rempli
 */
export function buildWhatsAppUrl(phone: string, message: string): string {
  const cleaned = phone.replace(/\s+/g, "").replace(/^\+/, "");
  return `https://wa.me/${cleaned}?text=${encodeURIComponent(message)}`;
}

/**
 * Génère un message WhatsApp pré-rempli pour une annonce
 */
export function buildListingWhatsAppMessage(
  listingTitle: string,
  listingUrl: string
): string {
  return `Bonjour, je suis intéressé(e) par votre annonce "${listingTitle}" sur MeubléFacile.\n${listingUrl}\nEst-il toujours disponible ?`;
}

/**
 * Combine des classes CSS conditionnellement (tiny version de clsx)
 */
export function cn(...classes: (string | undefined | null | false)[]): string {
  return classes.filter(Boolean).join(" ");
}
