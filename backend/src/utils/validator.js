import Joi from "joi";

const schemas = {
  planRequest: Joi.object({
    budget: Joi.number().min(10000).max(10000000).required().messages({
      "number.base": "Budget must be a number",
      "number.min": "Budget must be at least NPR 10,000",
      "number.max": "Budget cannot exceed NPR 10,000,000",
      "any.required": "Budget is required",
    }),

    duration: Joi.number().integer().min(1).max(30).required().messages({
      "number.base": "Duration must be number",
      "number.integer": "Duration must be an integer",
      "number.min": "Duration must be at least 1 day",
      "number.max": "Duration cannot exceed 30 days",
      "any.required": "Duration is required",
    }),

    season: Joi.string()
      .valid("spring", "summer", "autumn", "winter")
      .required()
      .messages({
        "string.base": "Season must be a string",
        "any.only": "Season must be one of: spring, summer, autumn, winter",
        "any.required": "Season is required",
      }),

    difficulty: Joi.string()
      .valid("easy", "moderate", "challenging", "strenuous")
      .required()
      .messages({
        "string.base": "Difficulty must be a string",
        "any.only":
          "Difficulty must be one of: easy, moderate, challenging, strenuous",
        "any.required": "Difficulty is required",
      }),

    tripType: Joi.string()
      .valid("trekking", "cultural", "wildlife", "adventure", "pilgrimage")
      .required()
      .messages({
        "string.base": "Trip type must be a string",
        "any.only":
          "Trip type must be one of: trekking, cultural, wildlife, adventure, pilgrimage",
        "any.required": "Trip type is required",
      }),

    groupSize: Joi.number().integer().min(1).max(50).required().messages({
      "number.base": "Group size must be a number",
      "number.integer": "Group size must be an integer",
      "number.min": "Group size must be at least 1",
      "number.max": "Group size cannot exceed 50",
      "any.required": "Group size is required",
    }),

    nationality: Joi.string().valid("nepali", "tourist").required().messages({
      "string.base": "Nationality must be a string",
      "any.only": "Nationality must be one of: nepali, tourist",
      "any.required": "Please select whether you are Nepali or a Tourist",
    }),

    startDate: Joi.date().iso().min("now").optional().messages({
      "date.base": "Start date must be a valid date",
      "date.format": "Start date must be in ISO format",
      "date.min": "Start date cannot be in the past",
    }),

    preferences: Joi.object({
      accommodation: Joi.string()
        .valid("basic", "standard", "luxury")
        .optional(),
      pace: Joi.string().valid("relaxed", "moderate", "fast").optional(),
      guide: Joi.boolean().optional(),
    }).optional(),
  }),

  estimateRequest: Joi.object({
    budget: Joi.number().min(10000).max(10000000).required(),
    duration: Joi.number().integer().min(1).max(30).required(),
    groupSize: Joi.number().integer().min(1).max(50).required(),
  }),

  destinationFilter: Joi.object({
    season: Joi.string()
      .valid("spring", "summer", "autumn", "winter")
      .optional(),
    difficulty: Joi.string()
      .valid("easy", "moderate", "challenging", "strenuous")
      .optional(),

    tripType: Joi.string()
      .valid("trekking", "cultural", "wildlife", "adventure", "pilgrimage")
      .optional(),
    minDuration: Joi.number().integer().min(1).optional(),
    maxDuration: Joi.number().integer().max(30).optional(),
  }),

  searchQuery: Joi.object({
    q: Joi.string().min(2).max(100).required().messages({
      "string.base": "Search query must be a string",
      "string.min": "Search query must have at least 2 characters",
      "string.max": "Search query cannot exceed 100 characters",
      "any.required": "Search query is required",
    }),
  }),

  idParam: Joi.object({
    id: Joi.string().uuid().required().messages({
      "string.base": "ID must be a string",
      "string.uuid": "ID must be a valid UUID",
      "any.required": "ID is required",
    }),
  }),
};

const validate = (schema, property = "body") => {
  return (req, res, next) => {
    const { error, value } = schema.validate(req[property], {
      abortEarly: false,
      stripUnknown: true,
    });

    if (error) {
      const errors = error.details.map((detail) => ({
        field: detail.path.join("."),
        message: detail.message,
      }));

      return res.status(400).json({
        success: false,
        message: "Validation error",
        errors,
      });
    }
    req[property] = value;
    next();
  };
};

const validators = {
  validateBudgetDuration: (budget, duration) => {
    const minBudgetPerDay = 2000;
    const minTotal = minBudgetPerDay * duration;

    if (budget < minTotal) {
      return {
        valid: false,
        message: `Minimum budget for ${duration} days should be NPR ${minTotal.toLocaleString()}`,
      };
    }

    return { valid: true };
  },

  validateSeasonDestination: (season, bestSeasons) => {
    if (!bestSeasons || bestSeasons.length === 0) {
      return { valid: true, warning: null };
    }

    if (!bestSeasons.includes(season)) {
      return {
        valid: true,
        warning: `${season} is not the ideal season for this destination. Best seasons are: ${bestSeasons.join(", ")}`,
      };
    }

    return { valid: true, warning: null };
  },

  validateDurationDestination: (duration, min, max) => {
    if (duration < min) {
      return {
        valid: true,
        warning: `Minimum recommended duration for this destination is ${min} days`,
      };
    }

    if (duration > max) {
      return {
        valid: true,
        warning: `You have ${duration - max} extra days. Consider adding side trips or rest days.`,
      };
    }

    return {
      valid: true,
    };
  },
};

export { schemas, validate, validators };
export default validators;
