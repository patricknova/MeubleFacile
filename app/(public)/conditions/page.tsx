import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Conditions d'utilisation — MeubléFacile",
};

export default function ConditionsPage() {
  return (
    <div className="mx-auto max-w-3xl px-4 py-12 sm:px-6">
      <h1 className="text-3xl font-bold text-gray-900 mb-2">Conditions d&apos;utilisation</h1>
      <p className="text-gray-400 text-sm mb-8">Dernière mise à jour : octobre 2026</p>

      <div className="space-y-8 text-gray-600 leading-relaxed text-sm">
        <section>
          <h2 className="text-lg font-bold text-gray-900 mb-3">1. Objet</h2>
          <p>MeubléFacile est une plateforme de mise en relation entre propriétaires de logements meublés et locataires potentiels à Douala, Cameroun. MeubléFacile n&apos;est pas partie aux transactions entre propriétaires et locataires.</p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-gray-900 mb-3">2. Utilisation du service</h2>
          <ul className="list-disc list-inside space-y-1">
            <li>Vous devez avoir au moins 18 ans pour utiliser ce service.</li>
            <li>Les informations fournies doivent être exactes et à jour.</li>
            <li>Il est interdit de publier des annonces frauduleuses ou trompeuses.</li>
            <li>Les photos publiées doivent correspondre au logement réel.</li>
          </ul>
        </section>

        <section>
          <h2 className="text-lg font-bold text-gray-900 mb-3">3. Gratuité pour les locataires</h2>
          <p>L&apos;accès aux annonces et le contact avec les propriétaires sont entièrement gratuits pour les locataires. MeubléFacile ne perçoit aucune commission sur les locations.</p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-gray-900 mb-3">4. Avertissement anti-arnaque</h2>
          <p className="font-medium text-amber-700 bg-amber-50 border border-amber-200 rounded-lg px-4 py-3">
            ⚠️ Ne payez jamais d&apos;avance sans avoir visité physiquement le logement. MeubléFacile ne demande jamais de paiement avant visite.
          </p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-gray-900 mb-3">5. Modération</h2>
          <p>MeubléFacile se réserve le droit de supprimer ou refuser toute annonce ne respectant pas les présentes conditions, sans préavis.</p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-gray-900 mb-3">6. Responsabilité</h2>
          <p>MeubléFacile agit en tant qu&apos;intermédiaire technique uniquement. Nous ne pouvons être tenus responsables des transactions entre propriétaires et locataires, ni de l&apos;exactitude des informations fournies par les utilisateurs.</p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-gray-900 mb-3">7. Contact</h2>
          <p>Pour toute question : <a href="mailto:contact@meublefacile.cm" className="text-brand-700 hover:underline">contact@meublefacile.cm</a></p>
        </section>
      </div>
    </div>
  );
}
