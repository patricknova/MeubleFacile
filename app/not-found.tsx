import Link from "next/link";
import { Search, Home } from "lucide-react";

export default function NotFound() {
  return (
    <div className="min-h-[70vh] flex items-center justify-center px-4 py-16">
      <div className="max-w-md w-full text-center bg-white rounded-2xl border border-gray-200 p-8 shadow-sm">
        <div className="mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-brand-50 text-brand-700 mb-5">
          <Search size={32} />
        </div>

        <h1 className="text-2xl font-bold text-gray-900 mb-2">
          Page introuvable
        </h1>
        <p className="text-sm text-gray-600 mb-6">
          Le logement, le quartier ou la page que vous recherchez n'existe pas ou a été déplacé.
        </p>

        <div className="flex flex-col sm:flex-row gap-3 justify-center">
          <Link
            href="/douala"
            className="inline-flex items-center justify-center gap-2 rounded-xl bg-brand-700 px-5 py-2.5 text-sm font-semibold text-white hover:bg-brand-800 transition-colors shadow-sm"
          >
            Explorer Douala
          </Link>
          <Link
            href="/"
            className="inline-flex items-center justify-center gap-2 rounded-xl border border-gray-200 bg-white px-5 py-2.5 text-sm font-semibold text-gray-700 hover:bg-gray-50 transition-colors"
          >
            <Home size={16} />
            Accueil
          </Link>
        </div>
      </div>
    </div>
  );
}
