"use client";

import { useEffect } from "react";
import Link from "next/link";
import { AlertTriangle, RotateCcw, Home } from "lucide-react";

export default function GlobalError({
  error,
  reset,
}: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  useEffect(() => {
    console.error("[MeubléFacile Error Boundary]:", error);
  }, [error]);

  return (
    <div className="min-h-[70vh] flex items-center justify-center px-4 py-16">
      <div className="max-w-md w-full text-center bg-white rounded-2xl border border-gray-200 p-8 shadow-sm">
        <div className="mx-auto flex h-14 w-14 items-center justify-center rounded-full bg-amber-100 text-amber-600 mb-5">
          <AlertTriangle size={28} />
        </div>

        <h1 className="text-xl font-bold text-gray-900 mb-2">
          Une erreur temporaire est survenue
        </h1>
        <p className="text-sm text-gray-600 mb-6">
          Nous n&apos;avons pas pu charger cette page. Cela peut être dû à un rafraîchissement des services ou à une connexion instable.
        </p>

        {process.env.NODE_ENV === "development" && error.message && (
          <div className="mb-6 p-3 rounded-lg bg-red-50 text-left text-xs font-mono text-red-800 break-words">
            {error.message}
          </div>
        )}

        <div className="flex flex-col sm:flex-row gap-3 justify-center">
          <button
            onClick={() => reset()}
            className="inline-flex items-center justify-center gap-2 rounded-xl bg-brand-700 px-5 py-2.5 text-sm font-semibold text-white hover:bg-brand-800 transition-colors shadow-sm"
          >
            <RotateCcw size={16} />
            Réessayer
          </button>
          <Link
            href="/"
            className="inline-flex items-center justify-center gap-2 rounded-xl border border-gray-200 bg-white px-5 py-2.5 text-sm font-semibold text-gray-700 hover:bg-gray-50 transition-colors"
          >
            <Home size={16} />
            Retour à l&apos;accueil
          </Link>
        </div>
      </div>
    </div>
  );
}
