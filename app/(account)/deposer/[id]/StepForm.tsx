"use client";

import { useState, useTransition } from "react";
import { updateListing, submitListing, updateListingAmenities } from "@/lib/actions/listings";
import { Check, ChevronLeft, ChevronRight, Loader2 } from "lucide-react";
import type { Listing, Amenity, City, Neighborhood } from "@/lib/types";
import { cn } from "@/lib/format";

interface StepFormProps {
  listing: Listing;
  cities: City[];
  neighborhoods: Neighborhood[];
  amenities: Amenity[];
  selectedAmenityIds: number[];
}

const STEPS = [
  { id: 1, label: "Type" },
  { id: 2, label: "Localisation" },
  { id: 3, label: "Description" },
  { id: 4, label: "Équipements" },
  { id: 5, label: "Photos" },
  { id: 6, label: "Prix" },
  { id: 7, label: "Règles" },
  { id: 8, label: "Récapitulatif" },
];

const LISTING_TYPES = [
  { value: "studio", label: "Studio", emoji: "🏠" },
  { value: "apartment", label: "Appartement", emoji: "🏢" },
  { value: "room", label: "Chambre meublée", emoji: "🛏️" },
  { value: "duplex", label: "Duplex", emoji: "🏡" },
];

const CATEGORY_LABELS: Record<string, string> = {
  comfort: "Confort",
  kitchen: "Cuisine",
  power_water: "Énergie & Eau",
  security: "Sécurité",
  outdoor: "Extérieur",
};

export function StepForm({ listing, cities, neighborhoods, amenities, selectedAmenityIds: initialAmenityIds }: StepFormProps) {
  const [isPending, startTransition] = useTransition();
  const [step, setStep] = useState(1);
  const [selectedType, setSelectedType] = useState(listing.type ?? "studio");
  const [selectedCity, setSelectedCity] = useState(listing.city_id?.toString() ?? "");
  const [selectedNeighborhood, setSelectedNeighborhood] = useState(listing.neighborhood_id?.toString() ?? "");
  const [selectedAmenities, setSelectedAmenities] = useState<number[]>(initialAmenityIds);

  const filteredNeighborhoods = neighborhoods.filter(
    (n) => n.city_id === parseInt(selectedCity || "0")
  );

  function handleNext() {
    if (step < STEPS.length) setStep((s) => s + 1);
  }
  function handlePrev() {
    if (step > 1) setStep((s) => s - 1);
  }

  function toggleAmenity(id: number) {
    setSelectedAmenities((prev) =>
      prev.includes(id) ? prev.filter((a) => a !== id) : [...prev, id]
    );
  }

  async function handleSaveStep(formData: FormData) {
    startTransition(async () => {
      await updateListing(listing.id, formData);
      if (step === 4) {
        await updateListingAmenities(listing.id, selectedAmenities);
      }
      handleNext();
    });
  }

  async function handleSubmit() {
    startTransition(async () => {
      await submitListing(listing.id);
    });
  }

  const amenityByCategory = amenities.reduce<Record<string, Amenity[]>>((acc, a) => {
    if (!acc[a.category]) acc[a.category] = [];
    acc[a.category].push(a);
    return acc;
  }, {});

  return (
    <div className="max-w-2xl mx-auto">
      {/* Barre de progression */}
      <div className="mb-8">
        <div className="flex items-center justify-between mb-3">
          <p className="text-sm font-medium text-gray-700">Étape {step} / {STEPS.length}</p>
          <p className="text-sm text-gray-400">{STEPS[step - 1].label}</p>
        </div>
        <div className="h-2 rounded-full bg-gray-100 overflow-hidden">
          <div
            className="h-full rounded-full bg-brand-700 transition-all duration-300"
            style={{ width: `${(step / STEPS.length) * 100}%` }}
          />
        </div>
        {/* Points d'étapes sur desktop */}
        <div className="hidden sm:flex justify-between mt-2">
          {STEPS.map((s) => (
            <button
              key={s.id}
              onClick={() => s.id < step && setStep(s.id)}
              disabled={s.id >= step}
              className={cn(
                "flex flex-col items-center gap-1",
                s.id < step ? "cursor-pointer" : "cursor-default"
              )}
            >
              <div className={cn(
                "flex h-6 w-6 items-center justify-center rounded-full text-xs font-semibold",
                s.id < step ? "bg-brand-700 text-white" :
                s.id === step ? "bg-brand-700 text-white ring-4 ring-brand-100" :
                "bg-gray-200 text-gray-400"
              )}>
                {s.id < step ? <Check size={12} /> : s.id}
              </div>
              <span className={cn("text-[10px]", s.id <= step ? "text-brand-700 font-medium" : "text-gray-400")}>
                {s.label}
              </span>
            </button>
          ))}
        </div>
      </div>

      {/* ── Étape 1 : Type ── */}
      {step === 1 && (
        <form action={handleSaveStep} className="space-y-6">
          <input type="hidden" name="type" value={selectedType} />
          <h2 className="text-lg font-bold text-gray-900">Quel type de logement proposez-vous ?</h2>
          <div className="grid grid-cols-2 gap-3">
            {LISTING_TYPES.map((t) => (
              <button
                key={t.value}
                type="button"
                onClick={() => setSelectedType(t.value as Listing["type"])}
                className={cn(
                  "flex flex-col items-center gap-2 rounded-xl border-2 p-5 text-sm font-medium transition-all",
                  selectedType === t.value
                    ? "border-brand-700 bg-brand-50 text-brand-700"
                    : "border-gray-200 bg-white text-gray-700 hover:border-brand-200"
                )}
              >
                <span className="text-3xl">{t.emoji}</span>
                {t.label}
              </button>
            ))}
          </div>
          <div>
            <label htmlFor="title" className="block text-sm font-medium text-gray-700 mb-1">
              Titre de l&apos;annonce <span className="text-red-500">*</span>
            </label>
            <input
              id="title"
              name="title"
              type="text"
              defaultValue={listing.title}
              placeholder="Ex. Studio meublé climatisé avec WiFi, Bonamoussadi"
              required
              maxLength={140}
              className="w-full h-12 rounded-[var(--radius-field)] border border-gray-200 px-4 text-sm focus:border-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-200"
            />
            <p className="mt-1 text-xs text-gray-400">Soyez précis et honnête. Maximum 140 caractères.</p>
          </div>
          <StepButtons step={step} maxStep={STEPS.length} onPrev={handlePrev} isPending={isPending} />
        </form>
      )}

      {/* ── Étape 2 : Localisation ── */}
      {step === 2 && (
        <form action={handleSaveStep} className="space-y-5">
          <input type="hidden" name="city_id" value={selectedCity} />
          <input type="hidden" name="neighborhood_id" value={selectedNeighborhood} />
          <h2 className="text-lg font-bold text-gray-900">Où se trouve le logement ?</h2>
          <div>
            <label htmlFor="city" className="block text-sm font-medium text-gray-700 mb-1">Ville</label>
            <select
              id="city"
              value={selectedCity}
              onChange={(e) => { setSelectedCity(e.target.value); setSelectedNeighborhood(""); }}
              className="w-full h-12 rounded-[var(--radius-field)] border border-gray-200 bg-white px-4 text-sm focus:border-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-200"
            >
              <option value="">Choisir une ville</option>
              {cities.map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}
            </select>
          </div>
          <div>
            <label htmlFor="neighborhood" className="block text-sm font-medium text-gray-700 mb-1">Quartier</label>
            <select
              id="neighborhood"
              value={selectedNeighborhood}
              onChange={(e) => setSelectedNeighborhood(e.target.value)}
              disabled={!selectedCity}
              className="w-full h-12 rounded-[var(--radius-field)] border border-gray-200 bg-white px-4 text-sm focus:border-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-200 disabled:bg-gray-50 disabled:text-gray-400"
            >
              <option value="">Choisir un quartier</option>
              {filteredNeighborhoods.map((n) => <option key={n.id} value={n.id}>{n.name}</option>)}
            </select>
          </div>
          <div>
            <label htmlFor="landmark" className="block text-sm font-medium text-gray-700 mb-1">Repère (optionnel)</label>
            <input
              id="landmark"
              name="landmark"
              type="text"
              defaultValue={listing.landmark ?? ""}
              placeholder="Ex. Face Total Bonamoussadi, derrière l'école..."
              className="w-full h-12 rounded-[var(--radius-field)] border border-gray-200 px-4 text-sm focus:border-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-200"
            />
            <p className="mt-1 text-xs text-gray-400">Un repère connu aide les locataires à trouver le logement.</p>
          </div>
          <StepButtons step={step} maxStep={STEPS.length} onPrev={handlePrev} isPending={isPending} />
        </form>
      )}

      {/* ── Étape 3 : Description ── */}
      {step === 3 && (
        <form action={handleSaveStep} className="space-y-5">
          <h2 className="text-lg font-bold text-gray-900">Décrivez votre logement</h2>
          <div className="grid grid-cols-2 gap-4">
            {[
              { name: "bedrooms", label: "Chambres", defaultValue: listing.bedrooms, min: 0, max: 10 },
              { name: "bathrooms", label: "Salles de bain", defaultValue: listing.bathrooms, min: 0, max: 10 },
              { name: "surface_m2", label: "Surface (m²)", defaultValue: listing.surface_m2, min: 5, max: 1000, step: 0.5 },
              { name: "max_guests", label: "Personnes max.", defaultValue: listing.max_guests, min: 1, max: 20 },
            ].map((f) => (
              <div key={f.name}>
                <label htmlFor={f.name} className="block text-sm font-medium text-gray-700 mb-1">{f.label}</label>
                <input
                  id={f.name}
                  name={f.name}
                  type="number"
                  defaultValue={f.defaultValue ?? ""}
                  min={f.min}
                  max={f.max}
                  step={(f as { step?: number }).step ?? 1}
                  className="w-full h-12 rounded-[var(--radius-field)] border border-gray-200 px-4 text-sm focus:border-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-200"
                />
              </div>
            ))}
          </div>
          <div>
            <label htmlFor="description" className="block text-sm font-medium text-gray-700 mb-1">
              Description <span className="text-red-500">*</span>
            </label>
            <textarea
              id="description"
              name="description"
              defaultValue={listing.description ?? ""}
              rows={6}
              required
              minLength={100}
              placeholder="Décrivez votre logement : vue, environnement, points forts, ce qui est inclus..."
              className="w-full rounded-[var(--radius-field)] border border-gray-200 px-4 py-3 text-sm focus:border-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-200 resize-none"
            />
            <p className="mt-1 text-xs text-gray-400">Minimum 100 caractères. Décrivez honnêtement le logement.</p>
          </div>
          <StepButtons step={step} maxStep={STEPS.length} onPrev={handlePrev} isPending={isPending} />
        </form>
      )}

      {/* ── Étape 4 : Équipements ── */}
      {step === 4 && (
        <div className="space-y-6">
          <h2 className="text-lg font-bold text-gray-900">Quels équipements sont disponibles ?</h2>
          {Object.entries(amenityByCategory).map(([cat, items]) => (
            <div key={cat}>
              <h3 className="text-sm font-semibold text-gray-500 uppercase tracking-wide mb-3">
                {CATEGORY_LABELS[cat] ?? cat}
              </h3>
              <div className="flex flex-wrap gap-2">
                {items.map((amenity) => {
                  const isSelected = selectedAmenities.includes(amenity.id);
                  return (
                    <button
                      key={amenity.id}
                      type="button"
                      onClick={() => toggleAmenity(amenity.id)}
                      className={cn(
                        "rounded-full border px-4 py-2 text-sm font-medium transition-all",
                        isSelected
                          ? "border-brand-700 bg-brand-700 text-white"
                          : "border-gray-200 bg-white text-gray-700 hover:border-brand-300 hover:bg-brand-50"
                      )}
                    >
                      {isSelected && <span className="mr-1">✓</span>}
                      {amenity.label_fr}
                    </button>
                  );
                })}
              </div>
            </div>
          ))}
          <div className="flex justify-between pt-4 border-t border-gray-100">
            <button
              type="button"
              onClick={handlePrev}
              className="flex items-center gap-1.5 rounded-xl border border-gray-200 px-5 py-2.5 text-sm font-medium text-gray-700 hover:bg-gray-50 transition-colors"
            >
              <ChevronLeft size={16} /> Précédent
            </button>
            <button
              type="button"
              onClick={() => {
                startTransition(async () => {
                  await updateListingAmenities(listing.id, selectedAmenities);
                  handleNext();
                });
              }}
              disabled={isPending}
              className="flex items-center gap-1.5 rounded-xl bg-brand-700 px-5 py-2.5 text-sm font-semibold text-white hover:bg-brand-800 transition-colors disabled:opacity-50"
            >
              {isPending ? <Loader2 size={16} className="animate-spin" /> : null}
              Suivant <ChevronRight size={16} />
            </button>
          </div>
        </div>
      )}

      {/* ── Étape 5 : Photos ── */}
      {step === 5 && (
        <div className="space-y-6">
          <h2 className="text-lg font-bold text-gray-900">Photos du logement</h2>
          <div className="rounded-xl border-2 border-dashed border-gray-200 p-8 text-center">
            <p className="text-3xl mb-3">📸</p>
            <p className="font-medium text-gray-700 mb-1">Ajoutez au moins 5 photos</p>
            <p className="text-sm text-gray-400 mb-4">
              Photographiez chaque pièce en pleine lumière. Les photos sont compressées automatiquement.
            </p>
            <p className="text-xs text-amber-600 bg-amber-50 border border-amber-200 rounded-lg px-3 py-2 inline-block">
              📱 Pour les photos, utilisez l&apos;application mobile ou envoyez vos photos par WhatsApp à notre équipe qui les ajoutera pour vous.
            </p>
          </div>
          <div className="flex justify-between pt-4 border-t border-gray-100">
            <button
              type="button"
              onClick={handlePrev}
              className="flex items-center gap-1.5 rounded-xl border border-gray-200 px-5 py-2.5 text-sm font-medium text-gray-700 hover:bg-gray-50 transition-colors"
            >
              <ChevronLeft size={16} /> Précédent
            </button>
            <button
              type="button"
              onClick={handleNext}
              className="flex items-center gap-1.5 rounded-xl bg-brand-700 px-5 py-2.5 text-sm font-semibold text-white hover:bg-brand-800 transition-colors"
            >
              Suivant <ChevronRight size={16} />
            </button>
          </div>
        </div>
      )}

      {/* ── Étape 6 : Prix ── */}
      {step === 6 && (
        <form action={handleSaveStep} className="space-y-5">
          <h2 className="text-lg font-bold text-gray-900">Tarification</h2>
          <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
            <div>
              <label htmlFor="price_night" className="block text-sm font-medium text-gray-700 mb-1">Prix par nuit (FCFA)</label>
              <input
                id="price_night"
                name="price_night"
                type="number"
                defaultValue={listing.price_night ?? ""}
                min={0}
                step={500}
                placeholder="25 000"
                className="w-full h-12 rounded-[var(--radius-field)] border border-gray-200 px-4 text-sm focus:border-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-200"
              />
            </div>
            <div>
              <label htmlFor="price_month" className="block text-sm font-medium text-gray-700 mb-1">Prix par mois (FCFA)</label>
              <input
                id="price_month"
                name="price_month"
                type="number"
                defaultValue={listing.price_month ?? ""}
                min={0}
                step={5000}
                placeholder="250 000"
                className="w-full h-12 rounded-[var(--radius-field)] border border-gray-200 px-4 text-sm focus:border-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-200"
              />
            </div>
            <div>
              <label htmlFor="deposit" className="block text-sm font-medium text-gray-700 mb-1">Caution (FCFA)</label>
              <input
                id="deposit"
                name="deposit"
                type="number"
                defaultValue={listing.deposit ?? 0}
                min={0}
                step={5000}
                placeholder="0"
                className="w-full h-12 rounded-[var(--radius-field)] border border-gray-200 px-4 text-sm focus:border-brand-500 focus:outline-none focus:ring-2 focus:ring-brand-200"
              />
            </div>
          </div>
          <div className="flex items-center gap-3">
            <input
              id="utilities_included"
              name="utilities_included"
              type="checkbox"
              value="true"
              defaultChecked={listing.utilities_included}
              className="h-4 w-4 rounded border-gray-300 text-brand-700"
            />
            <label htmlFor="utilities_included" className="text-sm text-gray-700">
              Charges incluses (eau, électricité, WiFi)
            </label>
          </div>
          <StepButtons step={step} maxStep={STEPS.length} onPrev={handlePrev} isPending={isPending} />
        </form>
      )}

      {/* ── Étape 7 : Règles ── */}
      {step === 7 && (
        <div className="space-y-6">
          <h2 className="text-lg font-bold text-gray-900">Règles de la maison</h2>
          <div className="space-y-3">
            {[
              { key: "smoking", label: "Fumeurs autorisés" },
              { key: "pets", label: "Animaux autorisés" },
              { key: "visitors", label: "Visiteurs autorisés" },
            ].map(({ key, label }) => {
              const rules = listing.rules as Record<string, boolean>;
              return (
                <div key={key} className="flex items-center justify-between rounded-xl border border-gray-200 bg-white px-4 py-3">
                  <span className="text-sm text-gray-700">{label}</span>
                  <div className="flex gap-2">
                    {[true, false].map((val) => (
                      <button
                        key={String(val)}
                        type="button"
                        className={cn(
                          "rounded-lg px-3 py-1.5 text-xs font-medium transition-all",
                          rules?.[key] === val
                            ? "bg-brand-700 text-white"
                            : "border border-gray-200 text-gray-500 hover:bg-gray-50"
                        )}
                      >
                        {val ? "Oui" : "Non"}
                      </button>
                    ))}
                  </div>
                </div>
              );
            })}
          </div>
          <div className="flex justify-between pt-4 border-t border-gray-100">
            <button
              type="button"
              onClick={handlePrev}
              className="flex items-center gap-1.5 rounded-xl border border-gray-200 px-5 py-2.5 text-sm font-medium text-gray-700 hover:bg-gray-50 transition-colors"
            >
              <ChevronLeft size={16} /> Précédent
            </button>
            <button
              type="button"
              onClick={handleNext}
              className="flex items-center gap-1.5 rounded-xl bg-brand-700 px-5 py-2.5 text-sm font-semibold text-white hover:bg-brand-800 transition-colors"
            >
              Suivant <ChevronRight size={16} />
            </button>
          </div>
        </div>
      )}

      {/* ── Étape 8 : Récapitulatif ── */}
      {step === 8 && (
        <div className="space-y-6">
          <h2 className="text-lg font-bold text-gray-900">Récapitulatif de votre annonce</h2>
          <div className="rounded-2xl border border-gray-200 bg-white divide-y divide-gray-100">
            {[
              { label: "Titre", value: listing.title || "Non renseigné" },
              { label: "Type", value: LISTING_TYPES.find(t => t.value === listing.type)?.label },
              { label: "Localisation", value: listing.landmark ?? "Quartier sélectionné" },
              { label: "Chambres", value: listing.bedrooms ?? "—" },
              { label: "Surface", value: listing.surface_m2 ? `${listing.surface_m2} m²` : "—" },
              { label: "Prix/nuit", value: listing.price_night ? `${listing.price_night.toLocaleString("fr")} FCFA` : "—" },
              { label: "Prix/mois", value: listing.price_month ? `${listing.price_month.toLocaleString("fr")} FCFA` : "—" },
              { label: "Équipements", value: `${selectedAmenities.length} sélectionné${selectedAmenities.length > 1 ? "s" : ""}` },
            ].map(({ label, value }) => (
              <div key={label} className="flex justify-between px-5 py-3 text-sm">
                <span className="text-gray-500">{label}</span>
                <span className="font-medium text-gray-900 text-right max-w-[60%]">{String(value ?? "—")}</span>
              </div>
            ))}
          </div>

          <div className="rounded-xl border border-amber-200 bg-amber-50 px-4 py-3 text-sm text-amber-800">
            ⚠️ Votre annonce sera vérifiée par notre équipe avant publication (délai &lt; 24 h).
          </div>

          <div className="flex justify-between pt-2">
            <button
              type="button"
              onClick={handlePrev}
              className="flex items-center gap-1.5 rounded-xl border border-gray-200 px-5 py-2.5 text-sm font-medium text-gray-700 hover:bg-gray-50 transition-colors"
            >
              <ChevronLeft size={16} /> Modifier
            </button>
            <button
              type="button"
              onClick={handleSubmit}
              disabled={isPending}
              id="btn-submit-listing"
              className="flex items-center gap-2 rounded-xl bg-brand-700 px-6 py-2.5 text-sm font-bold text-white hover:bg-brand-800 transition-colors disabled:opacity-50"
            >
              {isPending ? <Loader2 size={16} className="animate-spin" /> : <Check size={16} />}
              Envoyer à la modération
            </button>
          </div>
        </div>
      )}
    </div>
  );
}

function StepButtons({ step, maxStep, onPrev, isPending }: {
  step: number; maxStep: number; onPrev: () => void; isPending: boolean;
}) {
  return (
    <div className="flex justify-between pt-4 border-t border-gray-100">
      <button
        type="button"
        onClick={onPrev}
        disabled={step === 1}
        className="flex items-center gap-1.5 rounded-xl border border-gray-200 px-5 py-2.5 text-sm font-medium text-gray-700 hover:bg-gray-50 transition-colors disabled:opacity-40 disabled:cursor-not-allowed"
      >
        <ChevronLeft size={16} /> Précédent
      </button>
      <button
        type="submit"
        disabled={isPending}
        className="flex items-center gap-1.5 rounded-xl bg-brand-700 px-5 py-2.5 text-sm font-semibold text-white hover:bg-brand-800 transition-colors disabled:opacity-50"
      >
        {isPending ? <Loader2 size={16} className="animate-spin" /> : null}
        {step === maxStep ? "Soumettre" : "Suivant"} <ChevronRight size={16} />
      </button>
    </div>
  );
}
