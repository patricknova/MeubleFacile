import Link from "next/link";

interface Props {
  searchParams: Promise<{ email?: string }>;
}

export default async function ConfirmerPage({ searchParams }: Props) {
  const { email } = await searchParams;

  return (
    <div className="flex min-h-[calc(100vh-4rem)] flex-col items-center justify-center px-4 py-12">
      <div className="w-full max-w-sm text-center">
        <div className="mb-6 flex h-16 w-16 mx-auto items-center justify-center rounded-full bg-brand-100">
          <span className="text-3xl">📧</span>
        </div>
        <h1 className="text-2xl font-bold text-gray-900">Vérifiez votre boîte mail</h1>
        <p className="mt-3 text-gray-600">
          Un lien de connexion a été envoyé à{" "}
          <strong>{email ?? "votre adresse email"}</strong>.
        </p>
        <p className="mt-2 text-sm text-gray-400">
          Cliquez sur le lien dans l&apos;email pour vous connecter. Le lien est valable 10 minutes.
        </p>
        <Link
          href="/auth/connexion"
          className="mt-6 inline-flex items-center text-sm text-brand-700 font-medium hover:underline"
        >
          ← Utiliser une autre adresse
        </Link>
      </div>
    </div>
  );
}
