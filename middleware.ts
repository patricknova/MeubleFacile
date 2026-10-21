import { createServerClient } from "@supabase/ssr";
import { NextResponse, type NextRequest } from "next/server";

export async function middleware(request: NextRequest) {
  let supabaseResponse = NextResponse.next({ request });

  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const supabaseKey =
    process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY ||
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

  // Si les variables Supabase sont absentes (ex. déploiement Vercel avant configuration des variables d'environnement),
  // on laisse passer les routes publiques pour éviter le crash 500 MIDDLEWARE_INVOCATION_FAILED.
  if (!supabaseUrl || !supabaseKey) {
    console.warn(
      "[Middleware] Attention: Variables d'environnement NEXT_PUBLIC_SUPABASE_URL ou clé Supabase manquantes."
    );
    return supabaseResponse;
  }

  let user = null;

  try {
    const supabase = createServerClient(supabaseUrl, supabaseKey, {
      cookies: {
        getAll() {
          return request.cookies.getAll();
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value }) =>
            request.cookies.set(name, value)
          );
          supabaseResponse = NextResponse.next({ request });
          cookiesToSet.forEach(({ name, value, options }) =>
            supabaseResponse.cookies.set(name, value, options)
          );
        },
      },
    });

    // Rafraîchit la session (important pour SSR)
    const { data } = await supabase.auth.getUser();
    user = data.user;
  } catch (error) {
    console.error("[Middleware] Erreur lors de la vérification de la session :", error);
  }

  // Routes protégées : redirige vers /auth/connexion si non connecté
  const protectedPaths = ["/deposer", "/mes-annonces", "/profil", "/favoris"];
  const isProtected = protectedPaths.some((path) =>
    request.nextUrl.pathname.startsWith(path)
  );

  if (isProtected && !user) {
    const loginUrl = new URL("/auth/connexion", request.url);
    loginUrl.searchParams.set("redirectTo", request.nextUrl.pathname);
    return NextResponse.redirect(loginUrl);
  }

  // Route admin : redirige si non admin (la vérification du rôle est faite côté serveur)
  if (request.nextUrl.pathname.startsWith("/admin") && !user) {
    return NextResponse.redirect(new URL("/auth/connexion", request.url));
  }

  return supabaseResponse;
}

export const config = {
  matcher: [
    "/((?!_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)",
  ],
};
