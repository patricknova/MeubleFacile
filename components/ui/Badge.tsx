import { cn } from "@/lib/format";

type BadgeVariant = "verified" | "new" | "instant" | "promoted" | "status";

interface BadgeProps {
  variant?: BadgeVariant;
  children: React.ReactNode;
  className?: string;
}

const variantClasses: Record<BadgeVariant, string> = {
  verified:
    "bg-brand-100 text-brand-800 border border-brand-200",
  new:
    "bg-accent-500 text-white",
  instant:
    "bg-green-100 text-green-800 border border-green-200",
  promoted:
    "bg-amber-100 text-amber-800 border border-amber-200",
  status:
    "bg-gray-100 text-gray-700",
};

export function Badge({ variant = "status", children, className }: BadgeProps) {
  return (
    <span
      className={cn(
        "inline-flex items-center gap-1 rounded-full px-2.5 py-0.5 text-xs font-medium",
        variantClasses[variant],
        className
      )}
    >
      {children}
    </span>
  );
}

export function VerifiedBadge() {
  return (
    <Badge variant="verified">
      <span aria-hidden="true">✔</span> Vérifié
    </Badge>
  );
}
