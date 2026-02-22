//user input types
export type TripType =
  | "trekking"
  | "cultural"
  | "wildlife"
  | "adventure"
  | "pilgrimage";
export type Difficulty = "easy" | "moderate" | "challenging" | "strenuous";
export type Season = "spring" | "summer" | "autumn" | "winter";
export type Nationality = "nepali" | "tourist";

export interface PlannerFormData {
  budget: number;
  duration: number;
  season: Season;
  difficulty: Difficulty;
  tripType: TripType;
  groupSize: number;
  startDate?: string;
  nationality: Nationality;
}

//destination information
export interface Destination {
  id: string;
  name: string;
  region: string;
  description: string;
  difficulty: Difficulty;
  minDuration: number;
  maxDuration: number;
  bestSeasons: Season[];
  elevation: number;
  highlights: string[];
  imageUrl?: string;
  images?: string[];
  tripType: TripType;
}

//Cost breakdown
export interface CostBreakdown {
  transportation: number;
  accommodation: number;
  food: number;
  permits: number;
  guide: number;
  equipment: number;
  miscellaneous: number;
  total: number;
}

// Itinerary day
export interface ItineraryDay {
  day: number;
  title: string;
  location: string;
  activities: string[];
  accommodation: string;
  meals: string;
  distance?: string;
  elevation?: string;
  duration?: string;
  highlights?: string[];
  imageUrl?: string;
  images?: string[];
}

// Complete itinerary
export interface Itinerary {
  days: ItineraryDay[];
  totalDistance?: string;
  maxElevation?: string;
}

// API Response from ML model
export interface PlannerResponse {
  destination: Destination;
  costBreakdown: CostBreakdown;
  itinerary: Itinerary;
  recommendations: string[];
  warnings?: string[];
  matchScore: number;
}

// API Request
export interface PlannerRequest extends PlannerFormData {
  preferences?: {
    accommodation?: "basic" | "standard" | "luxury";
    place?: "relaxed" | "moderate" | "fast";
    guide?: boolean;
  };
}

// Filter options
export interface FilterOptions {
  seasons: Season[];
  difficulties: Difficulty[];
  tripTypes: TripType[];
  budgetRange: {
    min: number;
    max: number;
  };
  durationRange: {
    min: number;
    max: number;
  };
}
