import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-sans",
  display: "swap",
  weight: ["400", "500", "600", "700"],
});

export const metadata: Metadata = {
  title: {
    default: "MeubléFacile — Logements meublés à Douala",
    template: "%s | MeubléFacile",
  },
  description:
    "Trouvez votre studio ou appartement meublé à Douala. Annonces vérifiées, photos réelles, contactez le propriétaire directement sur WhatsApp.",
  metadataBase: new URL(
    process.env.NEXT_PUBLIC_SITE_URL || "https://meublefacile.vercel.app"
  ),
  openGraph: {
    siteName: "MeubléFacile",
    locale: "fr_CM",
    type: "website",
  },
  twitter: {
    card: "summary_large_image",
  },
  robots: {
    index: true,
    follow: true,
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="fr" className={inter.variable}>
      <body className="min-h-screen bg-gray-50 text-gray-900 antialiased">
        {children}
      </body>
    </html>
  );
}
