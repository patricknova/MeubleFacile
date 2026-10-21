import type { Metadata } from "next";
import Link from "next/link";

export const metadata: Metadata = {
  title: "Contact — MeubléFacile",
  description: "Contactez l'équipe MeubléFacile pour toute question ou signalement.",
};

export default function ContactPage() {
  return (
    <div className="mx-auto max-w-2xl px-4 py-12 sm:px-6">
      <h1 className="text-3xl font-bold text-gray-900 mb-4">Contactez-nous</h1>
      <p className="text-gray-500 mb-8">
        Pour toute question, signalement ou partenariat, utilisez l&apos;un des canaux ci-dessous.
      </p>

      <div className="grid gap-4 sm:grid-cols-2">
        <a
          href="mailto:contact@meublefacile.cm"
          className="flex items-center gap-4 rounded-xl border border-gray-200 bg-white p-5 hover:border-brand-300 hover:bg-brand-50 transition-all"
        >
          <span className="text-2xl">✉️</span>
          <div>
            <p className="font-semibold text-gray-900">Email</p>
            <p className="text-sm text-gray-500">contact@meublefacile.cm</p>
          </div>
        </a>
        <a
          href="https://wa.me/237690000000?text=Bonjour MeubléFacile,"
          target="_blank"
          rel="noopener noreferrer"
          className="flex items-center gap-4 rounded-xl border border-gray-200 bg-white p-5 hover:border-[#25D366] hover:bg-green-50 transition-all"
        >
          <span className="text-2xl">💬</span>
          <div>
            <p className="font-semibold text-gray-900">WhatsApp</p>
            <p className="text-sm text-gray-500">+237 6 90 00 00 00</p>
          </div>
        </a>
      </div>

      <div className="mt-8 rounded-xl border border-amber-200 bg-amber-50 p-5">
        <p className="font-semibold text-amber-800 mb-1">⚠️ Signaler une arnaque</p>
        <p className="text-sm text-amber-700">
          Si vous pensez être victime d&apos;une arnaque liée à une annonce MeubléFacile, ne versez aucun argent et contactez-nous immédiatement.
          Utilisez aussi le bouton &quot;Signaler&quot; sur la fiche annonce concernée.
        </p>
      </div>

      <div className="mt-8 text-sm text-gray-400">
        <Link href="/a-propos" className="hover:text-brand-700">À propos</Link>
        {" · "}
        <Link href="/conditions" className="hover:text-brand-700">CGU</Link>
        {" · "}
        <Link href="/confidentialite" className="hover:text-brand-700">Confidentialité</Link>
      </div>
    </div>
  );
}
