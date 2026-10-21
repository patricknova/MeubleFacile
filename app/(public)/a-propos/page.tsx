import type { Metadata } from "next";
import Link from "next/link";

export const metadata: Metadata = {
  title: "À propos de MeubléFacile — Logements meublés à Douala",
  description: "Découvrez MeubléFacile, la plateforme de location de logements meublés à Douala. Annonces vérifiées, contact direct propriétaire sur WhatsApp.",
};

export default function AProposPage() {
  return (
    <div className="mx-auto max-w-3xl px-4 py-12 sm:px-6">
      <h1 className="text-3xl font-bold text-gray-900 mb-6">À propos de MeubléFacile</h1>

      <div className="prose prose-gray max-w-none space-y-6 text-gray-600 leading-relaxed">
        <p className="text-lg text-gray-700">
          <strong>MeubléFacile</strong> est une plateforme de location de logements meublés à Douala, au Cameroun. Notre mission : mettre en relation propriétaires et locataires de manière simple, transparente et sécurisée.
        </p>

        <h2 className="text-xl font-bold text-gray-900 !mt-10">Notre mission</h2>
        <p>
          Trouver un logement meublé à Douala peut être compliqué : annonces non vérifiées, photos inexistantes, intermédiaires inutiles. MeubléFacile résout ces problèmes en proposant des annonces avec photos réelles, vérifiées manuellement avant publication, et un contact direct avec le propriétaire via WhatsApp — sans frais pour le locataire.
        </p>

        <h2 className="text-xl font-bold text-gray-900 !mt-10">Comment ça marche</h2>
        <ol className="list-decimal list-inside space-y-2">
          <li><strong>Les propriétaires</strong> déposent leurs annonces gratuitement avec photos et détails.</li>
          <li><strong>Notre équipe</strong> vérifie chaque annonce avant publication (délai &lt; 24 h).</li>
          <li><strong>Les locataires</strong> cherchent, filtrent et contactent le propriétaire directement sur WhatsApp.</li>
        </ol>

        <h2 className="text-xl font-bold text-gray-900 !mt-10">Nos engagements</h2>
        <ul className="list-disc list-inside space-y-2">
          <li>🆓 Gratuit pour les locataires, toujours.</li>
          <li>✅ Annonces vérifiées manuellement.</li>
          <li>📸 Photos réelles obligatoires.</li>
          <li>⚠️ Alerte anti-arnaque sur chaque annonce.</li>
        </ul>

        <h2 className="text-xl font-bold text-gray-900 !mt-10">Zones couvertes</h2>
        <p>
          Nous couvrons actuellement les quartiers de Douala : Akwa, Bonanjo, Bonapriso, Bonamoussadi, Makepe, Deido, Logbessou, Bepanda. D&apos;autres quartiers et villes seront ajoutés progressivement.
        </p>

        <div className="mt-10 rounded-2xl bg-brand-50 border border-brand-100 p-6">
          <h3 className="font-bold text-brand-800 mb-2">Vous êtes propriétaire ?</h3>
          <p className="text-sm text-brand-700 mb-4">
            Déposez votre annonce gratuitement et touchez des locataires qualifiés directement sur WhatsApp.
          </p>
          <Link
            href="/deposer"
            className="inline-flex items-center rounded-xl bg-brand-700 px-5 py-2.5 text-sm font-semibold text-white hover:bg-brand-800 transition-colors"
          >
            Déposer mon annonce →
          </Link>
        </div>

        <p className="text-sm text-gray-400 !mt-10">
          Des questions ? <Link href="/contact" className="text-brand-700 hover:underline">Contactez-nous</Link>
        </p>
      </div>
    </div>
  );
}
