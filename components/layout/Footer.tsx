import Link from "next/link";

const NEIGHBORHOODS = [
  "Akwa", "Bonanjo", "Bonapriso", "Bonamoussadi",
  "Makepe", "Deido", "Logbessou", "Bepanda",
];

const TYPES = [
  { label: "Studios meublés", href: "/douala/bonamoussadi/studio-meuble" },
  { label: "Appartements meublés", href: "/douala/bonamoussadi/appartement-meuble" },
  { label: "Chambres meublées", href: "/douala/bonamoussadi/chambre-meublee" },
  { label: "Duplex meublés", href: "/douala/bonamoussadi/duplex-meuble" },
];

const LEGAL = [
  { label: "À propos", href: "/a-propos" },
  { label: "Conditions d'utilisation", href: "/conditions" },
  { label: "Politique de confidentialité", href: "/confidentialite" },
  { label: "Contact", href: "/contact" },
];

export function Footer() {
  const year = new Date().getFullYear();

  return (
    <footer className="border-t border-gray-200 bg-white mt-16">
      <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6">
        <div className="grid grid-cols-2 gap-8 md:grid-cols-4">
          {/* Logo + description */}
          <div className="col-span-2 md:col-span-1">
            <Link href="/" className="flex items-center gap-2 font-bold text-brand-700 text-lg">
              <span className="flex h-8 w-8 items-center justify-center rounded-lg bg-brand-700 text-white text-sm font-black">
                MF
              </span>
              MeubléFacile
            </Link>
            <p className="mt-3 text-sm text-gray-500 leading-relaxed">
              La plateforme de location de logements meublés à Douala. Annonces vérifiées, contactez le propriétaire sur WhatsApp.
            </p>
            <p className="mt-3 text-xs text-gray-400">
              ⚠️ Ne payez jamais d&apos;avance sans avoir visité le logement.
            </p>
          </div>

          {/* Quartiers */}
          <div>
            <h3 className="text-sm font-semibold text-gray-900 mb-3">Quartiers à Douala</h3>
            <ul className="space-y-2">
              {NEIGHBORHOODS.map((n) => (
                <li key={n}>
                  <Link
                    href={`/douala/${n.toLowerCase()}`}
                    className="text-sm text-gray-500 hover:text-brand-700 transition-colors"
                  >
                    {n}
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          {/* Types */}
          <div>
            <h3 className="text-sm font-semibold text-gray-900 mb-3">Types de logements</h3>
            <ul className="space-y-2">
              {TYPES.map((t) => (
                <li key={t.href}>
                  <Link
                    href={t.href}
                    className="text-sm text-gray-500 hover:text-brand-700 transition-colors"
                  >
                    {t.label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          {/* Légal */}
          <div>
            <h3 className="text-sm font-semibold text-gray-900 mb-3">Informations</h3>
            <ul className="space-y-2">
              {LEGAL.map((l) => (
                <li key={l.href}>
                  <Link
                    href={l.href}
                    className="text-sm text-gray-500 hover:text-brand-700 transition-colors"
                  >
                    {l.label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>
        </div>

        <div className="mt-10 border-t border-gray-100 pt-6 flex flex-col sm:flex-row items-center justify-between gap-3">
          <p className="text-xs text-gray-400">
            © {year} MeubléFacile. Tous droits réservés.
          </p>
          <p className="text-xs text-gray-400">
            Fait à Douala, Cameroun 🇨🇲
          </p>
        </div>
      </div>
    </footer>
  );
}
