// backend/src/services/planner.service.js
import { query } from "../db/db.js";
import queries from "../db/queries.js";
import mlService from "./ml.service.js";
import { generateItinerary } from "../utils/itinerary.js";
import { validators } from "../utils/validator.js";
import config from "../config/env.js";

const UNSPLASH_BASE = "https://api.unsplash.com";

const TRIP_KEYWORDS = {
  trekking: "nepal mountain trek himalaya",
  cultural: "nepal temple heritage culture monastery",
  wildlife: "nepal wildlife safari jungle",
  adventure: "nepal adventure outdoor sport",
  pilgrimage: "nepal temple shrine spiritual",
};

const imageCache = new Map();

async function searchUnsplashPhotos(searchQuery, count = 5) {
  const cacheKey = `${searchQuery}::${count}`;
  if (imageCache.has(cacheKey)) return imageCache.get(cacheKey);

  const accessKey = config.server?.unsplash?.accessKey;
  if (!accessKey) {
    console.warn("UNSPLASH_ACCESS_KEY not set — using fallback images");
    return getFallbackImages(searchQuery, count);
  }

  try {
    const url = `${UNSPLASH_BASE}/search/photos?query=${encodeURIComponent(searchQuery)}&per_page=${count}&orientation=landscape&client_id=${accessKey}`;
    const res = await fetch(url);

    if (!res.ok) {
      console.warn(`Unsplash API error ${res.status}: ${res.statusText}`);
      return getFallbackImages(searchQuery, count);
    }

    const data = await res.json();

    if (!data.results || data.results.length === 0) {
      return getFallbackImages(searchQuery, count);
    }

    const urls = data.results.map((photo) => photo.urls.regular);
    imageCache.set(cacheKey, urls);
    return urls;
  } catch (err) {
    console.warn("Unsplash API fetch failed:", err.message);
    return getFallbackImages(searchQuery, count);
  }
}

function getFallbackImages(searchQuery, count) {
  const urls = Array.from({ length: count }, (_, i) => {
    const seed = encodeURIComponent(`${searchQuery}-${i}`);
    return `https://picsum.photos/seed/${seed}/800/600`;
  });
  imageCache.set(`${searchQuery}::${count}`, urls);
  return urls;
}

function buildSearchQuery(name, { tripType, region } = {}) {
  const parts = [name];
  if (tripType && TRIP_KEYWORDS[tripType]) {
    parts.push(TRIP_KEYWORDS[tripType]);
  }
  if (region) parts.push(region);
  parts.push("Nepal");
  return parts.join(" ");
}

async function getUnsplashImageUrl(
  name,
  { tripType, region, width = 800, height = 600, sig = 0 } = {},
) {
  const searchQuery = buildSearchQuery(name, { tripType, region });
  const photos = await searchUnsplashPhotos(searchQuery, 5);
  return photos[sig % photos.length] || getFallbackImages(name, 1)[0];
}

async function getImageCarousel(
  name,
  { tripType, region, count = 5, width = 800, height = 600 } = {},
) {
  const searchQuery = buildSearchQuery(name, { tripType, region });
  return searchUnsplashPhotos(searchQuery, count);
}

class PlannerService {
  async mapDestination(dest) {
    const tripType = dest.trip_type;
    const region = dest.region;
    const name = dest.name;
    return {
      id: dest.id,
      name,
      region,
      description: dest.description,
      difficulty: dest.difficulty,
      minDuration: dest.min_duration,
      maxDuration: dest.max_duration,
      bestSeasons: dest.best_seasons || [],
      elevation: dest.elevation,
      highlights: dest.highlights || [],
      tripType,
      imageUrl:
        dest.image_url ||
        (await getUnsplashImageUrl(name, { tripType, region })),
      images: await getImageCarousel(name, { tripType, region, count: 5 }),
    };
  }

  async generatePlan(planRequest) {
    const {
      budget,
      duration,
      season,
      difficulty,
      tripType,
      groupSize,
      startData,
      nationality,
      preferences = {},
    } = planRequest;

    const destination = await this.getSuitableDestinations({
      season,
      difficulty,
      tripType,
      duration,
    });

    if (destination.length === 0) {
      throw new Error(
        "No destinations found matching your criteria. Please try different filters",
      );
    }

    const recommendation = await mlService.getRecommendation(
      {
        budget,
        duration,
        season,
        difficulty,
        tripType,
        groupSize,
      },
      destination,
    );

    const selectedDestination = destination.find(
      (d) => d.id === recommendation.destinationId,
    );

    if (!selectedDestination) {
      throw new Error("Failed to recommend a destination. Please try again");
    }

    const durationValidation = validators.validateDurationDestination(
      duration,
      selectedDestination.min_duration,
      selectedDestination.max_duration,
    );

    const warnings = [];
    if (durationValidation.warning) {
      warnings.push(durationValidation.warning);
    }

    const seasonValidation = validators.validateSeasonDestination(
      season,
      selectedDestination.best_seasons,
    );

    if (seasonValidation.warning) {
      warnings.push(seasonValidation.warning);
    }

    const costBreakdown = await this.calculateCosts({
      destinationId: selectedDestination.id,
      duration,
      season,
      groupSize,
      nationality: nationality || "nepali",

      accommodation: preferences.accommodation || "standard",
    });

    const budgetValidation = validators.validateBudgetDuration(
      budget,
      duration,
    );

    if (!budgetValidation.vaild) {
      warnings.push(budgetValidation.message);
    }

    if (costBreakdown.total > budget) {
      warnings.push(
        `Estimated cost(NPR ${costBreakdown.total.toLocaleString()} exceeds your budget by NPR ${(costBreakdown.total - budget).toLocaleString()})`,
      );
    }

    const itinerary = await this.generateItinerary({
      destinationId: selectedDestination.id,
      duration,
      pace: preferences.pace || "moderate",
    });

    const enrichedDays = await Promise.all(
      itinerary.days.map(async (day) => ({
        ...day,
        imageUrl: await getUnsplashImageUrl(day.location || day.title, {
          tripType: selectedDestination.trip_type,
          region: selectedDestination.region,
          width: 640,
          height: 400,
        }),
        images: await getImageCarousel(day.location || day.title, {
          tripType: selectedDestination.trip_type,
          region: selectedDestination.region,
          count: 3,
          width: 640,
          height: 400,
        }),
      })),
    );

    const itineraryWithImages = {
      ...itinerary,
      days: enrichedDays,
    };

    const recommendations = this.generateRecommendations({
      destination: selectedDestination,
      season,
      duration,
      groupSize,
      budget,
      costBreakdown,
    });

    const response = {
      destination: await this.mapDestination(selectedDestination),
      costBreakdown,
      itinerary: itineraryWithImages,
      recommendations,
      warnings: warnings.length > 0 ? warnings : undefined,
      matchScore: recommendation.matchScore,
    };

    this.recordPlanGeneration({
      destinationId: selectedDestination.id,
      season,
      difficulty,
      budget,
      duration,
      groupSize,
      nationality: nationality || "nepali",

      totalCost: costBreakdown.total,
      matchScore: recommendation.matchScore,
    }).catch((err) => console.error("analytics recording failed", err));
    return response;
  }

  async getSuitableDestinations(filters) {
    const { season, difficulty, tripType, duration } = filters;
    const result = await query(queries.destinations.getFiltered, [
      difficulty || null,
      tripType || null,
      season || null,
      duration || null,
    ]);
    return result.rows;
  }

  async getDestinations(filters = {}) {
    const { season, difficulty, tripType } = filters;
    if (season || difficulty || tripType) {
      const rows = await this.getSuitableDestinations(filters);
      return Promise.all(rows.map((d) => this.mapDestination(d)));
    }
    const result = await query(queries.destinations.getAll);
    return Promise.all(result.rows.map((d) => this.mapDestination(d)));
  }

  async getDestinationById(id) {
    const result = await query(queries.destinations.getById, [id]);
    if (result.rows.length === 0) {
      throw new Error("Destination not found");
    }
    return result.rows[0];
  }

  async searchDestinations(searchQuery) {
    const result = await query(queries.destinations.search, [
      `%${searchQuery}%`,
    ]);
    return result.rows;
  }

  async calculateCosts(params) {
    const {
      destinationId,
      duration,
      season,
      groupSize,
      accommodation,
      nationality,
    } = params;

    const groupSizeCategory = this.getGroupSizeCategory(groupSize);
    const nat = nationality || "nepali";

    let costResult = await query(queries.costs.getByDestination, [
      destinationId,
      season,
      groupSizeCategory,
      accommodation,
      nat,
    ]);

    if (costResult.rows.length === 0) {
      costResult = await query(queries.costs.getDefaultCost, [
        destinationId,
        season,
        nat,
      ]);
    }

    if (costResult.rows.length === 0) {
      return this.estimateCosts(duration, groupSize, accommodation, nat);
    }

    const costs = costResult.rows[0];

    const transportation = costs.transportation_cost;
    const accommodations = costs.accommodation_cost_per_day * duration;
    const food = costs.food_cost_per_day * duration;
    const permits = costs.permit_cost;
    const guide = costs.guide_cost_per_day * duration;
    const equipment = costs.equipment_cost;
    const miscellaneous = costs.miscellaneous_cost * duration;

    const total =
      transportation +
      accommodations +
      food +
      permits +
      guide +
      equipment +
      miscellaneous;

    return {
      transportation,
      accommodation: accommodations,
      food,
      permits,
      guide,
      equipment,
      miscellaneous,
      total: Math.round(total),
    };
  }

  async getCostEstimate(params) {
    const { budget, duration, groupSize } = params;

    const avgCostPerDay = 7000;
    const estimatedCost = duration * avgCostPerDay;

    const groupDiscount = groupSize > 5 ? 0.9 : groupSize > 10 ? 0.85 : 1;
    const finalEstimate = Math.round(estimatedCost * groupDiscount);

    return {
      estimatedCost: finalEstimate,
      feasible: budget >= finalEstimate,
      budgetUtilization: Math.round((finalEstimate / budget) * 100),
    };
  }

  async generateItinerary(params) {
    const { destinationId, duration, pace } = params;

    const destination = await this.getDestinationById(destinationId);

    const templateResult = await query(queries.itineraries.getByDestination, [
      destinationId,
    ]);
    const templateDays = templateResult.rows;

    return generateItinerary(destination, templateDays, duration, pace);
  }

  generateRecommendations(params) {
    const { destination, season, duration, groupSize, budget, costBreakdown } =
      params;
    const recommendations = [];

    if (!destination.best_seasons.includes(season)) {
      recommendations.push(
        `Consider traveling during ${destination.best_seasons.join(" or ")} for the best experience`,
      );
    }

    if (duration < destination.min_duration) {
      recommendations.push(
        `Extend your trip to ${destination.min_duration} days for a more complete experience`,
      );
    }

    const budgetBuffer = budget - costBreakdown.total;
    if (budgetBuffer > costBreakdown.total * 0.3) {
      recommendations.push(
        "You have extra budget. Consider upgrading accommodation or adding side trips",
      );
    } else if (budgetBuffer < costBreakdown.total * 0.1) {
      recommendations.push(
        "Carry extra cash for emergencies and unexpected expenses",
      );
    }

    if (groupSize === 1) {
      recommendations.push(
        "Solo trekking is adventurous! Consider hiring a guide for safety and local insights",
      );
    } else if (groupSize > 10) {
      recommendations.push(
        "Large groups should book accommodations in advance, especially during peak season",
      );
    }

    recommendations.push(
      "Purchase comprehensive travel insurance before your trip",
    );

    if (destination.elevation > 3000) {
      recommendations.push(
        "Allow proper acclimatization days to prevent altitude sickness",
      );
    }

    recommendations.push(
      "Book permits and arrange logistics at least 2 weeks in advance",
    );

    return recommendations;
  }

  estimateCosts(duration, groupSize, accommodation, nationality) {
    const isNepali = nationality === "nepali";

    const baseCostPerDay = isNepali
      ? { basic: 1000, standard: 1800, luxury: 4000 }
      : { basic: 5000, standard: 7000, luxury: 12000 };

    const dailyCost = baseCostPerDay[accommodation] || baseCostPerDay.standard;
    const groupDiscount = groupSize > 5 ? 0.9 : 1;

    const accommodations = Math.round(
      dailyCost * 0.35 * duration * groupDiscount,
    );
    const food = Math.round(dailyCost * 0.25 * duration);
    const transportation = Math.round(
      (isNepali ? 3000 : 15000) * groupDiscount,
    );
    const permits = isNepali ? 200 : 8000;
    const guide = Math.round((isNepali ? 0 : 3000) * duration);
    const equipment = isNepali ? 1000 : 8000;
    const miscellaneous = Math.round(dailyCost * 0.1 * duration);
    const total =
      transportation +
      accommodations +
      food +
      permits +
      guide +
      equipment +
      miscellaneous;
    return {
      transportation,
      accommodation: accommodations,
      food,
      permits,
      guide,
      equipment,
      miscellaneous,
      total: Math.round(total),
    };
  }

  getGroupSizeCategory(groupSize) {
    if (groupSize === 1) return "solo";
    if (groupSize <= 5) return "small";
    if (groupSize <= 10) return "medium";
    return "large";
  }

  async recordPlanGeneration(data) {
    try {
      await query(queries.analytics.recordPlanGeneration, [
        data.destinationId,
        data.season,
        data.difficulty,
        data.budget,
        data.duration,
        data.groupSize,
        data.nationality || "nepali",
        data.totalCost,
        data.matchScore,
      ]);
    } catch (error) {
      console.error("Failed to record analytics:", error);
    }
  }
}

export default new PlannerService();
