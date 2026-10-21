"use client";

import { useEffect, useRef } from "react";
import { MapPin } from "lucide-react";

interface MapViewProps {
  lat: number;
  lng: number;
  title: string;
  approximate?: boolean;
}

export function MapView({ lat, lng, title, approximate = true }: MapViewProps) {
  const mapRef = useRef<HTMLDivElement>(null);
  const mapInstanceRef = useRef<unknown>(null);

  useEffect(() => {
    let isCancelled = false;

    if (!mapRef.current) return;

    // Si une instance existe déjà, la détruire proprement avant réinitialisation
    if (mapInstanceRef.current) {
      try {
        (mapInstanceRef.current as { remove: () => void }).remove();
      } catch {
        // ignorer
      }
      mapInstanceRef.current = null;
    }

    // Réinitialiser l'ID Leaflet interne sur l'élément DOM pour éviter l'erreur "already initialized"
    const container = mapRef.current as HTMLDivElement & { _leaflet_id?: number | null };
    if (container && container._leaflet_id) {
      container._leaflet_id = null;
    }

    // Chargement dynamique de Leaflet pour éviter les erreurs SSR
    import("leaflet").then((L) => {
      if (isCancelled || !mapRef.current) return;

      const targetEl = mapRef.current as HTMLDivElement & { _leaflet_id?: number | null };
      if (targetEl._leaflet_id) {
        targetEl._leaflet_id = null;
      }

      // Fix des icônes Leaflet avec webpack
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      delete (L.Icon.Default.prototype as any)._getIconUrl;
      L.Icon.Default.mergeOptions({
        iconRetinaUrl: "https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon-2x.png",
        iconUrl: "https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png",
        shadowUrl: "https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png",
      });

      const map = L.map(targetEl, {
        center: [lat, lng],
        zoom: 15,
        zoomControl: true,
        scrollWheelZoom: false,
      });

      if (isCancelled) {
        map.remove();
        return;
      }

      L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
        attribution: '© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
      }).addTo(map);

      if (approximate) {
        // Cercle pour position approximative (±200 m)
        L.circle([lat, lng], {
          radius: 200,
          color: "#0f766e",
          fillColor: "#0f766e",
          fillOpacity: 0.15,
          weight: 2,
        }).addTo(map);
      } else {
        L.marker([lat, lng]).addTo(map).bindPopup(title);
      }

      mapInstanceRef.current = map;
    });

    return () => {
      isCancelled = true;
      if (mapInstanceRef.current) {
        try {
          (mapInstanceRef.current as { remove: () => void }).remove();
        } catch {
          // ignorer
        }
        mapInstanceRef.current = null;
      }
      if (mapRef.current) {
        const targetEl = mapRef.current as HTMLDivElement & { _leaflet_id?: number | null };
        if (targetEl._leaflet_id) {
          targetEl._leaflet_id = null;
        }
      }
    };
  }, [lat, lng, title, approximate]);

  return (
    <div className="relative overflow-hidden rounded-xl border border-gray-200">
      {/* Import CSS Leaflet */}
      <link
        rel="stylesheet"
        href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
      />
      <div ref={mapRef} className="h-64 w-full" aria-label={`Carte montrant la position de ${title}`} />
      {approximate && (
        <div className="absolute bottom-3 left-3 flex items-center gap-1.5 rounded-full bg-white/90 px-3 py-1.5 text-xs text-gray-600 shadow">
          <MapPin size={12} className="text-brand-600" />
          Position approximative (±200 m)
        </div>
      )}
    </div>
  );
}
