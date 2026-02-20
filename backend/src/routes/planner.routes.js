import express from "express";
import plannerController from "../controller/planner.controller.js";
import { validate, schemas } from "../utils/validator.js";
const router = express.Router();

router.post(
  "/plan",
  validate(schemas.planRequest, "body"),
  plannerController.generatePlan,
);

router.get(
  "/destinations",
  validate(schemas.destinationFilter, "query"),
  plannerController.getDestinations,
);

router.get(
  "/destinations/search",
  validate(schemas.searchQuery, "query"),
  plannerController.searchDestinations,
);

router.get(
  "/destinations/:id",
  validate(schemas.idParam, "params"),
  plannerController.getDestinationById,
);

router.post(
  "/estimate",
  validate(schemas.estimateRequest, "body"),
  plannerController.getCostEstimate,
);

export default router;
