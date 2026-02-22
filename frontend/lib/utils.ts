// frontend/lib/utils.ts
import { clsx, type ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

export function formatCurrency(amount: number) {
  return `NPR ${amount.toLocaleString("en-IN")}`;
}

export function getDifficultyBadge(difficulty: string) {
  switch (difficulty) {
    case "easy":
      return {
        bg: "bg-green-100/10",
        text: "text-green-400",
        border: "border-green-400/40",
      };
    case "moderate":
      return {
        bg: "bg-yellow-100/10",
        text: "text-yellow-400",
        border: "border-yellow-400/40",
      };
    case "challenging":
      return {
        bg: "bg-orange-100/10",
        text: "text-orange-400",
        border: "border-orange-400/40",
      };
    case "strenuous":
    case "hard":
      return {
        bg: "bg-red-100/10",
        text: "text-red-400",
        border: "border-red-400/40",
      };
    default:
      return {
        bg: "bg-gray-100/10",
        text: "text-gray-400",
        border: "border-gray-400/40",
      };
  }
}

export function calculatePercentage(part: number, total: number): number {
  if (!total || total === 0) return 0;
  return Math.round((part / total) * 100);
}
