import Image from "next/image";
import { ExternalLink, Navigation, MapPin } from "lucide-react";
import { NearbyLandmark, CATEGORY_META } from "@/lib/landmarks";

interface NearbyLandmarksSectionProps {
  neighborhoodName: string;
  landmarks: NearbyLandmark[];
}

export function NearbyLandmarksSection({
  neighborhoodName,
  landmarks,
}: NearbyLandmarksSectionProps) {
  if (!landmarks || landmarks.length === 0) return null;

  return (
    <section className="rounded-2xl border border-gray-100 bg-gradient-to-b from-white to-gray-50/50 p-6 shadow-xs">
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2 mb-5">
        <div>
          <div className="flex items-center gap-2 mb-1">
            <span className="flex h-6 w-6 items-center justify-center rounded-full bg-brand-50 text-brand-700 text-xs font-bold">
              <MapPin size={13} />
            </span>
            <span className="text-xs font-semibold uppercase tracking-wider text-brand-700">
              Google Maps & Quartier
            </span>
          </div>
          <h2 className="text-xl font-bold text-gray-900">
            Lieux d&apos;intérêt & commodités à proximité
          </h2>
          <p className="text-xs text-gray-500 mt-0.5">
            Repères réels situés autour de ce logement à {neighborhoodName}
          </p>
        </div>
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3.5">
        {landmarks.map((lm) => {
          const meta = CATEGORY_META[lm.category] ?? CATEGORY_META.supermarket;

          return (
            <div
              key={lm.id}
              className="group relative flex flex-col justify-between overflow-hidden rounded-xl border border-gray-200/80 bg-white p-3.5 shadow-xs hover:border-brand-500 hover:shadow-md transition-all duration-200"
            >
              <div className="flex items-start gap-3">
                {/* Photo ou icône */}
                {lm.photoUrl ? (
                  <div className="relative h-14 w-14 shrink-0 overflow-hidden rounded-lg bg-gray-100">
                    <Image
                      src={lm.photoUrl}
                      alt={lm.name}
                      fill
                      sizes="56px"
                      className="object-cover group-hover:scale-105 transition-transform duration-300"
                    />
                  </div>
                ) : (
                  <div className="flex h-12 w-12 shrink-0 items-center justify-center rounded-xl bg-gray-50 text-xl border border-gray-100">
                    {meta.icon}
                  </div>
                )}

                <div className="flex-1 min-w-0">
                  <span
                    className={`inline-block text-[10px] font-semibold px-2 py-0.5 rounded-full border mb-1 ${meta.badgeColor}`}
                  >
                    {meta.label}
                  </span>
                  <h3 className="text-xs font-semibold text-gray-900 truncate group-hover:text-brand-700 transition-colors">
                    {lm.name}
                  </h3>
                  <div className="mt-1 flex items-center gap-1.5 text-[11px] text-gray-500">
                    <Navigation size={11} className="text-brand-600 shrink-0" />
                    <span className="font-medium text-gray-700">{lm.distanceText}</span>
                    <span>·</span>
                    <span>{lm.walkTimeText}</span>
                  </div>
                </div>
              </div>

              {/* Bouton Google Maps */}
              <div className="mt-3 pt-2.5 border-t border-gray-100 flex items-center justify-end">
                <a
                  href={lm.googleMapsUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center gap-1 text-[11px] font-medium text-brand-700 hover:text-brand-800 hover:underline"
                >
                  <span>Voir sur Google Maps</span>
                  <ExternalLink size={11} />
                </a>
              </div>
            </div>
          );
        })}
      </div>

      <div className="mt-4 flex items-center gap-2 rounded-xl bg-blue-50/70 border border-blue-100 px-3.5 py-2 text-[11px] text-blue-900">
        <span>ℹ️</span>
        <span>
          Les distances et temps de trajet sont calculés à pied ou en taxi selon les axes principaux de {neighborhoodName}.
        </span>
      </div>
    </section>
  );
}
