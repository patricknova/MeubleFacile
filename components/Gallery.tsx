"use client";

import { useState } from "react";
import Image from "next/image";
import { X, ChevronLeft, ChevronRight, Expand } from "lucide-react";

// Only the fields Gallery actually reads — avoids requiring `listing_id`
interface GalleryMedia {
  id: string;
  path_full: string;
  path_thumb: string;
  alt?: string | null;
  is_cover?: boolean;
  position?: number | null;
  width?: number | null;
  height?: number | null;
}

interface GalleryProps {
  media: GalleryMedia[];
  title: string;
}

export function Gallery({ media, title }: GalleryProps) {
  const [lightboxIndex, setLightboxIndex] = useState<number | null>(null);

  if (!media.length) return null;

  const cover = media.find((m) => m.is_cover) ?? media[0];
  const others = media.filter((m) => m.id !== cover.id).slice(0, 4);

  function openLightbox(index: number) {
    setLightboxIndex(index);
  }
  function closeLightbox() {
    setLightboxIndex(null);
  }
  function prev() {
    if (lightboxIndex === null) return;
    setLightboxIndex((lightboxIndex - 1 + media.length) % media.length);
  }
  function next() {
    if (lightboxIndex === null) return;
    setLightboxIndex((lightboxIndex + 1) % media.length);
  }

  return (
    <>
      {/* Grille mosaïque desktop / carrousel mobile */}
      <div className="relative">
        {/* Mobile : carrousel simple */}
        <div className="relative aspect-[4/3] overflow-hidden rounded-xl md:hidden">
          <Image
            src={cover.path_full}
            alt={cover.alt ?? title}
            fill
            sizes="100vw"
            className="object-cover"
            priority
          />
          <button
            onClick={() => openLightbox(0)}
            className="absolute bottom-3 right-3 flex items-center gap-1.5 rounded-full bg-white/90 px-3 py-1.5 text-xs font-semibold text-gray-700 shadow"
          >
            <Expand size={13} />
            {media.length} photos
          </button>
        </div>

        {/* Desktop : mosaïque 1 grande + 4 petites */}
        <div className="hidden md:grid md:grid-cols-4 md:grid-rows-2 md:gap-2 md:h-[420px] rounded-xl overflow-hidden">
          {/* Grande photo principale */}
          <button
            onClick={() => openLightbox(0)}
            className="col-span-2 row-span-2 relative overflow-hidden group"
            aria-label={`Voir la photo 1 de ${media.length}`}
          >
            <Image
              src={cover.path_full}
              alt={cover.alt ?? title}
              fill
              sizes="50vw"
              className="object-cover group-hover:scale-105 transition-transform duration-300"
              priority
            />
          </button>

          {/* Petites photos */}
          {others.map((m, i) => (
            <button
              key={m.id}
              onClick={() => openLightbox(i + 1)}
              className="relative overflow-hidden group"
              aria-label={`Voir la photo ${i + 2} de ${media.length}`}
            >
              <Image
                src={m.path_thumb}
                alt={m.alt ?? `${title} — photo ${i + 2}`}
                fill
                sizes="25vw"
                className="object-cover group-hover:scale-105 transition-transform duration-300"
              />
              {/* Overlay "voir toutes" sur la dernière vignette */}
              {i === 3 && media.length > 5 && (
                <div className="absolute inset-0 bg-black/50 flex items-center justify-center">
                  <span className="text-white font-semibold text-sm">+{media.length - 5} photos</span>
                </div>
              )}
            </button>
          ))}

          {/* Bouton voir toutes */}
          <button
            onClick={() => openLightbox(0)}
            className="absolute bottom-3 right-3 flex items-center gap-1.5 rounded-full bg-white/90 px-3 py-1.5 text-xs font-semibold text-gray-700 shadow hover:bg-white transition-colors"
          >
            <Expand size={13} />
            Voir les {media.length} photos
          </button>
        </div>
      </div>

      {/* Lightbox */}
      {lightboxIndex !== null && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center bg-black/95"
          role="dialog"
          aria-label="Galerie de photos"
          aria-modal="true"
        >
          {/* Fermer */}
          <button
            onClick={closeLightbox}
            className="absolute top-4 right-4 flex h-10 w-10 items-center justify-center rounded-full bg-white/10 text-white hover:bg-white/20 transition-colors"
            aria-label="Fermer la galerie"
          >
            <X size={20} />
          </button>

          {/* Compteur */}
          <div className="absolute top-4 left-1/2 -translate-x-1/2 rounded-full bg-white/10 px-4 py-1.5 text-sm text-white">
            {lightboxIndex + 1} / {media.length}
          </div>

          {/* Précédent */}
          <button
            onClick={prev}
            className="absolute left-3 flex h-12 w-12 items-center justify-center rounded-full bg-white/10 text-white hover:bg-white/20 transition-colors"
            aria-label="Photo précédente"
          >
            <ChevronLeft size={24} />
          </button>

          {/* Image courante */}
          <div className="relative h-[80vh] w-full max-w-4xl px-16">
            <Image
              src={media[lightboxIndex].path_full}
              alt={media[lightboxIndex].alt ?? `${title} — photo ${lightboxIndex + 1}`}
              fill
              sizes="100vw"
              className="object-contain"
            />
          </div>

          {/* Suivant */}
          <button
            onClick={next}
            className="absolute right-3 flex h-12 w-12 items-center justify-center rounded-full bg-white/10 text-white hover:bg-white/20 transition-colors"
            aria-label="Photo suivante"
          >
            <ChevronRight size={24} />
          </button>
        </div>
      )}
    </>
  );
}
