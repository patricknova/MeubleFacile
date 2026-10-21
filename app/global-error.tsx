"use client";

import { useEffect } from "react";

export default function GlobalError({
  error,
  reset,
}: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  useEffect(() => {
    console.error("[MeubléFacile Global Error]:", error);
  }, [error]);

  return (
    <html lang="fr">
      <body className="min-h-screen bg-gray-50 flex items-center justify-center p-4 font-sans text-gray-900 antialiased">
        <div className="max-w-md w-full text-center bg-white rounded-2xl border border-gray-200 p-8 shadow-sm">
          <div className="mx-auto flex h-14 w-14 items-center justify-center rounded-full bg-amber-100 text-amber-600 mb-5 text-2xl font-bold">
            ⚠️
          </div>

          <h1 className="text-xl font-bold text-gray-900 mb-2">
            Une erreur inattendue est survenue
          </h1>
          <p className="text-sm text-gray-600 mb-6">
            Le service rencontre une perturbation temporaire. Veuillez recharger la page.
          </p>

          <button
            onClick={() => reset()}
            className="inline-flex items-center justify-center gap-2 rounded-xl bg-teal-700 px-5 py-2.5 text-sm font-semibold text-white hover:bg-teal-800 transition-colors shadow-sm"
          >
            Recharger la page
          </button>
        </div>
      </body>
    </html>
  );
}
