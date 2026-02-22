import { PlannerRequest, PlannerResponse, Destination } from "./types";
import { API_CONFIG, ERROR_MESSAGES } from "./constant";

async function fetchWithTimeout(
  url: string,
  options: RequestInit = {},
  timeout: number = API_CONFIG.timeout,
): Promise<Response> {
  const controller = new AbortController();
  const id = setTimeout(() => controller.abort(), timeout);

  try {
    const response = await fetch(url, {
      ...options,
      signal: controller.signal,
    });
    clearTimeout(id);
    return response;
  } catch (error) {
    clearTimeout(id);
    throw error;
  }
}

// API Error class
export class ApiError extends Error {
  constructor(
    message: string,
    public statusCode?: number,
    public data?: unknown,
  ) {
    super(message);
    this.name = "ApiError";
  }
}

// Handle API response
async function handleResponse<T>(response: Response): Promise<T> {
  if (!response.ok) {
    const errorData = await response.json().catch(() => ({}));
    throw new ApiError(
      errorData.message || ERROR_MESSAGES.generic,
      response.status,
      errorData,
    );
  }

  return response.json();
}

// API Client
export const api = {
  // Generate trip plan
  async generatePlan(data: PlannerRequest): Promise<PlannerResponse> {
    try {
      const response = await fetchWithTimeout(
        `${API_CONFIG.baseUrl}${API_CONFIG.endpoints.plan}`,
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(data),
        },
      );

      const result = await handleResponse<{
        success: boolean;
        data: PlannerResponse;
      }>(response);
      return result.data;
    } catch (error) {
      if (error instanceof ApiError) {
        throw error;
      }
      if (error instanceof Error && error.name === "AbortError") {
        throw new ApiError("Request timeout. Please try again.");
      }
      throw new ApiError(ERROR_MESSAGES.network);
    }
  },

  // Get all destinations
  async getDestinations(filters?: {
    season?: string;
    difficulty?: string;
    tripType?: string;
  }): Promise<Destination[]> {
    try {
      const params = new URLSearchParams();
      if (filters?.season) params.append("season", filters.season);
      if (filters?.difficulty) params.append("difficulty", filters.difficulty);
      if (filters?.tripType) params.append("tripType", filters.tripType);

      const queryString = params.toString();
      const url = `${API_CONFIG.baseUrl}${API_CONFIG.endpoints.destinations}${
        queryString ? `?${queryString}` : ""
      }`;

      const response = await fetchWithTimeout(url);
      const result = await handleResponse<{
        success: boolean;
        data: Destination[];
      }>(response);
      return result.data;
    } catch (error) {
      if (error instanceof ApiError) {
        throw error;
      }
      throw new ApiError(ERROR_MESSAGES.network);
    }
  },

  // Get cost estimate (lightweight endpoint)
  async getCostEstimate(data: {
    budget: number;
    duration: number;
    groupSize: number;
  }): Promise<{
    estimatedCost: number;
    feasible: boolean;
    budgetUtilization: number;
  }> {
    try {
      const response = await fetchWithTimeout(
        `${API_CONFIG.baseUrl}${API_CONFIG.endpoints.estimate}`,
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(data),
        },
      );

      const result = await handleResponse<{
        success: boolean;
        data: {
          estimatedCost: number;
          feasible: boolean;
          budgetUtilization: number;
        };
      }>(response);
      return result.data;
    } catch (error) {
      if (error instanceof ApiError) {
        throw error;
      }
      throw new ApiError(ERROR_MESSAGES.network);
    }
  },
};

export const mockApi = {
  async generatePlan(data: PlannerRequest): Promise<PlannerResponse> {
    await new Promise((resolve) => setTimeout(resolve, 2000));

    return {
      destination: {
        id: "1",
        name: "Everest Base Camp Trek",
        region: "Khumbu",
        description:
          "Journey to the base of the world's highest mountain through stunning Himalayan landscapes.",
        difficulty: "challenging",
        minDuration: 12,
        maxDuration: 16,
        bestSeasons: ["spring", "autumn"],
        elevation: 5364,
        highlights: [
          "Sagarmatha National Park",
          "Sherpa culture and monasteries",
          "Panoramic mountain views",
          "Kala Patthar viewpoint",
        ],
        tripType: "trekking",
      },
      costBreakdown: {
        transportation: 15000,
        accommodation: 25000,
        food: 18000,
        permits: 8000,
        guide: 12000,
        equipment: 8000,
        miscellaneous: 4000,
        total: 90000,
      },
      itinerary: {
        days: [
          {
            day: 1,
            title: "Arrival in Kathmandu",
            location: "Kathmandu",
            activities: ["Airport pickup", "Hotel check-in", "Trip briefing"],
            accommodation: "Hotel in Thamel",
            meals: "Dinner",
          },
          {
            day: 2,
            title: "Fly to Lukla, Trek to Phakding",
            location: "Phakding",
            activities: [
              "Scenic flight to Lukla",
              "Begin trekking",
              "Walk along Dudh Koshi River",
            ],
            accommodation: "Tea house",
            meals: "Breakfast, Lunch, Dinner",
            distance: "8 km",
            duration: "3-4 hours",
            elevation: "2,610m",
          },
          {
            day: 3,
            title: "Trek to Namche Bazaar",
            location: "Namche Bazaar",
            activities: [
              "Cross suspension bridges",
              "Enter Sagarmatha National Park",
              "Steep climb to Namche",
            ],
            accommodation: "Tea house",
            meals: "Breakfast, Lunch, Dinner",
            distance: "11 km",
            duration: "5-6 hours",
            elevation: "3,440m",
          },
        ],
        totalDistance: "130 km",
        maxElevation: "5,364m",
      },
      recommendations: [
        "Book domestic flights in advance during peak season",
        "Carry sufficient cash as ATMs are limited in mountain regions",
        "Acclimatize properly to avoid altitude sickness",
        "Pack warm clothing even in summer months",
      ],
      warnings: [
        "High altitude - proper acclimatization required",
        "Weather can be unpredictable in mountain regions",
      ],
      matchScore: 92,
    };
  },

  async getDestinations(): Promise<Destination[]> {
    await new Promise((resolve) => setTimeout(resolve, 1000));

    return [
      {
        id: "1",
        name: "Everest Base Camp",
        region: "Khumbu",
        description: "Trek to the base of the world's highest mountain",
        difficulty: "challenging",
        minDuration: 12,
        maxDuration: 16,
        bestSeasons: ["spring", "autumn"],
        elevation: 5364,
        highlights: ["Sagarmatha NP", "Sherpa culture"],
        tripType: "trekking",
      },
      {
        id: "2",
        name: "Annapurna Circuit",
        region: "Annapurna",
        description: "Classic trek around the Annapurna massif",
        difficulty: "moderate",
        minDuration: 15,
        maxDuration: 20,
        bestSeasons: ["spring", "autumn"],
        elevation: 5416,
        highlights: ["Thorong La Pass", "Diverse landscapes"],
        tripType: "trekking",
      },
    ];
  },

  async getCostEstimate(data: {
    budget: number;
    duration: number;
    groupSize: number;
  }): Promise<{
    estimatedCost: number;
    feasible: boolean;
    budgetUtilization: number;
  }> {
    await new Promise((resolve) => setTimeout(resolve, 500));

    const estimatedCost = data.duration * 6000;
    return {
      estimatedCost,
      feasible: data.budget >= estimatedCost,
      budgetUtilization: Math.round((estimatedCost / data.budget) * 100),
    };
  },
};

export const apiClient =
  process.env.NEXT_PUBLIC_USE_MOCK_API === "true" ? mockApi : api;
