import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Politique de confidentialité — MeubléFacile",
};

export default function ConfidentialitePage() {
  return (
    <div className="mx-auto max-w-3xl px-4 py-12 sm:px-6">
      <h1 className="text-3xl font-bold text-gray-900 mb-2">Politique de confidentialité</h1>
      <p className="text-gray-400 text-sm mb-8">Dernière mise à jour : octobre 2026</p>

      <div className="space-y-8 text-gray-600 leading-relaxed text-sm">
        <section>
          <h2 className="text-lg font-bold text-gray-900 mb-3">1. Données collectées</h2>
          <ul className="list-disc list-inside space-y-1">
            <li>Adresse email (lors de la création de compte)</li>
            <li>Nom, prénom et numéro WhatsApp (renseignés volontairement dans le profil)</li>
            <li>Contenus des annonces publiées (photos, descriptions, tarifs)</li>
            <li>Données de navigation (logs techniques, adresse IP)</li>
          </ul>
        </section>

        <section>
          <h2 className="text-lg font-bold text-gray-900 mb-3">2. Utilisation des données</h2>
          <p>Les données sont utilisées pour :</p>
          <ul className="list-disc list-inside space-y-1 mt-2">
            <li>Fournir et améliorer le service MeubléFacile</li>
            <li>Permettre le contact entre propriétaires et locataires</li>
            <li>Modérer les annonces et prévenir les fraudes</li>
            <li>Envoyer des notifications relatives au compte (lien de connexion)</li>
          </ul>
        </section>

        <section>
          <h2 className="text-lg font-bold text-gray-900 mb-3">3. Partage des données</h2>
          <p>Votre numéro WhatsApp est affiché aux visiteurs uniquement sur vos annonces publiées. Nous ne vendons jamais vos données à des tiers.</p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-gray-900 mb-3">4. Hébergement</h2>
          <p>Les données sont hébergées par Supabase (base de données) et Vercel (hébergement web), tous deux opérant avec des niveaux élevés de sécurité.</p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-gray-900 mb-3">5. Vos droits</h2>
          <p>Vous pouvez à tout moment demander la suppression de votre compte et de vos données en nous contactant à <a href="mailto:contact@meublefacile.cm" className="text-brand-700 hover:underline">contact@meublefacile.cm</a>.</p>
        </section>

        <section>
          <h2 className="text-lg font-bold text-gray-900 mb-3">6. Cookies</h2>
          <p>MeubléFacile utilise uniquement des cookies de session nécessaires à l&apos;authentification. Aucun cookie de tracking publicitaire n&apos;est utilisé.</p>
        </section>
      </div>
    </div>
  );
}
