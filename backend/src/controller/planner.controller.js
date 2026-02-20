import plannerService from "../services/planner.service.js";

class PlannerController {
  async generatePlan(req, res, next) {
    try {
      const planRequest = req.body;
      const result = await plannerService.generatePlan(planRequest);

      res.status(200).json({
        success: true,
        message: "Trip plan generated successfully",
        data: result,
      });
    } catch (error) {
      next(error);
    }
  }

  async getDestinations(req, res, next) {
    try {
      const filters = {
        season: req.query.season,
        difficulty: req.query.difficulty,
        tripType: req.query.tripType,
      };

      const destinations = await plannerService.getDestinations(filters);

      res.status(200).json({
        success: true,
        message: "Destinations retrieved successfully",
        data: destinations,
        count: destinations.length,
      });
    } catch (error) {
      next(error);
    }
  }

  async getDestinationById(req, res, next) {
    try {
      const { id } = req.params;
      const destination = await plannerService.getDestinationById(id);

      res.status(200).json({
        success: true,
        message: "Destination retrieved successfully",
        data: destination,
      });
    } catch (error) {
      next(error);
    }
  }

  async searchDestinations(req, res, next) {
    try {
      const { q } = req.query;

      if (!q || q.trim().length < 2) {
        return res.status(400).json({
          success: false,
          message: "Search query must be at least 2 characters",
        });
      }

      const destinations = await plannerService.searchDestinations(q.trim());

      res.status(200).json({
        success: true,
        message: "Search completed successfully",
        data: destinations,
        count: destinations.length,
      });
    } catch (error) {
      next(error);
    }
  }

  async getCostEstimate(req, res, next) {
    try {
      const { budget, duration, groupSize } = req.body;
      const estimate = await plannerService.getCostEstimate({
        budget,
        duration,
        groupSize,
      });

      res.status(200).json({
        success: true,
        message: "Cost estimate calculated successfully",
        data: estimate,
      });
    } catch (error) {
      next(error);
    }
  }

  async healthCheck(req, res) {
    res.status(200).json({
      success: true,
      message: "API is running",
      timestamp: new Date().toISOString(),
      service: "Trek Planner Backend",
      version: "1.0.0",
    });
  }
}

export default new PlannerController();
