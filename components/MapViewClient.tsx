"use client";

import dynamic from "next/dynamic";

const MapViewDynamic = dynamic(
  () => import("@/components/MapView").then((m) => m.MapView),
  {
    ssr: false,
    loading: () => (
      <div className="h-64 w-full animate-pulse rounded-xl bg-gray-100" />
    ),
  }
);

interface MapViewClientProps {
  lat: number;
  lng: number;
  title: string;
  approximate?: boolean;
}

export function MapViewClient(props: MapViewClientProps) {
  return <MapViewDynamic {...props} />;
}
