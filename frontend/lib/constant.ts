import { Season, Difficulty, TripType, Nationality } from "./types";
// Season options
export const SEASONS: {
  value: Season;
  label: string;
  description: string;
  months: string;
}[] = [
  {
    value: "spring",
    label: "Spring",
    description: "Warm weather, blooming rhododendrons",
    months: "March - May",
  },
  {
    value: "summer",
    label: "Summer/Monsoon",
    description: "Rainy season, lush landscapes",
    months: "June - August",
  },
  {
    value: "autumn",
    label: "Autumn",
    description: "Clear skies, best mountain views",
    months: "September - November",
  },
  {
    value: "winter",
    label: "Winter",
    description: "Cold weather, fewer crowds",
    months: "December - February",
  },
];

// Difficulty levels
export const DIFFICULTIES: {
  value: Difficulty;
  label: string;
  description: string;
}[] = [
  {
    value: "easy",
    label: "Easy",
    description: "Suitable for beginners, gentle trails",
  },
  {
    value: "moderate",
    label: "Moderate",
    description: "Some hiking experience required",
  },
  {
    value: "challenging",
    label: "Challenging",
    description: "Good fitness and experience needed",
  },
  {
    value: "strenuous",
    label: "Strenuous",
    description: "Expert level, high altitude",
  },
];

// Trip types
export const TRIP_TYPES: {
  value: TripType;
  label: string;
  description: string;
  icon: string;
}[] = [
  {
    value: "trekking",
    label: "Trekking",
    description: "Mountain trails and high-altitude adventures",
    icon: "⛰️",
  },
  {
    value: "cultural",
    label: "Cultural",
    description: "Heritage sites and cultural immersion",
    icon: "🏛️",
  },
  {
    value: "wildlife",
    label: "Wildlife",
    description: "National parks and wildlife safari",
    icon: "🦏",
  },
  {
    value: "adventure",
    label: "Adventure",
    description: "Rafting, paragliding, and extreme sports",
    icon: "🪂",
  },
  {
    value: "pilgrimage",
    label: "Pilgrimage",
    description: "Religious sites and spiritual journeys",
    icon: "🕉️",
  },
];

// Budget ranges (in NPR)
export const BUDGET_RANGES = {
  min: 10000,
  max: 500000,
  step: 5000,
  default: 50000,
};

// Duration ranges (in days)
export const DURATION_RANGES = {
  min: 1,
  max: 30,
  step: 1,
  default: 7,
};

// Group size ranges
export const GROUP_SIZE_RANGES = {
  min: 1,
  max: 20,
  step: 1,
  default: 2,
};

// Popular destinations (for quick select)
export const POPULAR_DESTINATIONS = [
  "Everest Base Camp",
  "Annapurna Circuit",
  "Langtang Valley",
  "Manaslu Circuit",
  "Upper Mustang",
  "Gokyo Lakes",
  "Poon Hill",
  "Chitwan National Park",
  "Pokhara",
  "Kathmandu Valley",
];

// Accommodation types
export const ACCOMMODATION_TYPES = [
  { value: "basic", label: "Basic Tea Houses", priceMultiplier: 1 },
  { value: "standard", label: "Standard Lodges", priceMultiplier: 1.5 },
  { value: "luxury", label: "Luxury Hotels", priceMultiplier: 2.5 },
];

// Pace options
export const PACE_OPTIONS = [
  {
    value: "relaxed",
    label: "Relaxed",
    description: "Extra rest days, shorter hiking hours",
  },
  {
    value: "moderate",
    label: "Moderate",
    description: "Balanced pace with adequate rest",
  },
  {
    value: "fast",
    label: "Fast",
    description: "Minimal rest days, longer hiking hours",
  },
];

export const API_CONFIG = {
  baseUrl: process.env.NEXT_PUBLIC_API_URL || "http://localhost:5000",
  endpoints: {
    plan: "/api/planner/plan",
    destinations: "/api/planner/destinations",
    estimate: "/api/planner/estimate",
  },
  timeout: 30000,
};

export const NATIONALITIES: {
  value: Nationality;
  label: string;
  description: string;
  icon: string;
}[] = [
  {
    value: "nepali",
    label: "Nepali",
    description:
      "Nepali citizen — local pricing for permits, transport & accommodation",
    icon: "🇳🇵",
  },
  {
    value: "tourist",
    label: "Tourist",
    description:
      "Foreign national — international pricing for permits & services",
    icon: "🌍",
  },
];
export const ERROR_MESSAGES = {
  network:
    "Unable to connect to the server. Please check your internet connection.",
  validation: "Please fill all required fields correctly.",
  budget: "Budget must be at least NPR 10,000 for a trip.",
  duration: "Duration must be between 1 and 30 days.",
  generic: "Something went wrong. Please try again.",
  noResults:
    "No destinations found matching your criteria. Try adjusting your filters.",
};

// Success messages
export const SUCCESS_MESSAGES = {
  planGenerated: "Your trip plan has been generated successfully!",
  saved: "Your trip plan has been saved.",
};

// Info messages
export const INFO_MESSAGES = {
  processing: "Analyzing your preferences and finding the best destinations...",
  calculating: "Calculating costs and generating itinerary...",
};
