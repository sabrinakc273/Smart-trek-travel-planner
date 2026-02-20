import axios from "axios";
import config from "../config/env.js";

class MLService {
  constructor() {
    this.client = axios.create({
      baseURL: config.ml.serviceUrl,
      timeout: config.ml.timeout,
      headers: {
        "Content-Type": "application/json",
      },
    });
  }

  async getRecommendation(features, destinations) {
    try {
      const response = await this.client.post("/recommend", {
        features: {
          budget: features.budget,
          duration: features.duration,
          season: this.encodeSeason(features.season),
          difficulty: this.encodeDifficulty(features.difficulty),
          tripType: this.encodeTripType(features.tripType),
          groupSize: features.groupSize,
        },

        destinations: destinations.map((d) => ({
          id: d.id,
          name: d.name,
          difficulty: this.encodeDifficulty(d.difficulty),
          minDuration: d.min_duration,
          maxDuration: d.max_duration,
          elevation: d.elevation,
          tripType: this.encodeTripType(d.trip_type),
          bestSeasons: d.best_seasons.map((s) => this.encodeSeason(s)),
        })),
      });

      return {
        destinationId: response.data.destination_id,
        matchScore: Math.round(response.data.match_score * 100),
      };
    } catch (error) {
      console.warn(
        "ML service unavailable, using fallback algorithm",
        error.message,
      );

      return this.fallbackRecommendation(features, destinations);
    }
  }

  async optimizeItinerary(params) {
    try {
      const response = await this.client.post("/optimize-itinerary", {
        destination: params.destination,
        duration: params.duration,
        pace: params.pace,
        preferences: params.preferences,
      });

      return response.data;
    } catch (error) {
      console.warn("ML optimization unavailable, using rule-based algorithm");
      return null;
    }
  }

  async predictCost(params) {
    try {
      const response = await this.client.post("/predict-cost", {
        destination: params.destination,
        duration: params.duration,
        season: this.encodeSeason(params.season),
        groupSize: params.groupSize,
        accommodation: params.accommodation,
      });

      return response.data.predicted_cost;
    } catch (error) {
      console.warn("ML cost prediction unavailable");
      return null;
    }
  }

  fallbackRecommendation(features, destinations) {
    let bestMatch = null;
    let highestScore = 0;

    destinations.forEach((destination) => {
      let score = 0;

      if (destination.difficulty === features.difficulty) {
        score += 30;
      } else {
        const difficultyOrder = [
          "easy",
          "moderate",
          "challenging",
          "strenuous",
        ];
        const diff = Math.abs(
          difficultyOrder.indexOf(destination.difficulty) -
            difficultyOrder.indexOf(features.difficulty),
        );
        score += Math.max(0, 30 - diff * 10);
      }

      if (destination.trip_type === features.tripType) {
        score += 25;
      }

      if (
        features.duration >= destination.min_duration &&
        features.duration <= destination.max_duration
      ) {
        score += 20;
      } else {
        const durationDiff = Math.min(
          Math.abs(features.duration - destination.min_duration),
          Math.abs(features.duration - destination.max_duration),
        );
        score += Math.max(0, 20 - durationDiff * 2);
      }

      if (
        destination.best_seasons &&
        destination.best_seasons.includes(features.season)
      ) {
        score += 15;
      } else {
        score += 5;
      }

      const estimatedCost = features.duration * 7000;
      if (
        features.budget >= estimatedCost * 0.8 &&
        features.budget <= estimatedCost * 1.5
      ) {
        score += 10;
      } else if (features.budget >= estimatedCost * 0.5) {
        score += 5;
      }

      if (score > highestScore) {
        highestScore = score;
        bestMatch = destination;
      }
    });

    return {
      destinationId: bestMatch?.id,
      matchScore: Math.min(Math.round((highestScore / 100) * 100), 98),
      confidence: highestScore / 100,
    };
  }

  encodeSeason(season) {
    const mapping = {
      spring: 0,
      summer: 1,
      autumn: 2,
      winter: 3,
    };
    return mapping[season] ?? 0;
  }

  encodeDifficulty(difficulty) {
    const mapping = {
      easy: 0,
      moderate: 1,
      challenging: 2,
      strenuous: 3,
    };
    return mapping[difficulty] ?? 1;
  }

  encodeTripType(tripType) {
    const mapping = {
      trekking: 0,
      cultural: 1,
      wildlife: 2,
      adventure: 3,
      pilgrimage: 4,
    };
    return mapping[tripType] ?? 0;
  }

  async healthCheck() {
    try {
      const response = await this.client.get("/health", { timeout: 5000 });
      return response.status === 200;
    } catch (error) {
      return false;
    }
  }
}

export default new MLService();
