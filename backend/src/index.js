import express from "express";
import cors from "cors";
import helmet from "helmet";
import morgan from "morgan";
import compression from "compression";

import config from "./config/env.js";
import { testConnection, closePool } from "./db/db.js";
import plannerRoutes from "./routes/planner.routes.js";
import plannerController from "./controller/planner.controller.js";

const app = express();

app.use(helmet());

app.use(
  cors({
    origin: config.cors.origin,
    credentials: config.cors.credentials,
  }),
);

app.use(
  express.json({
    limit: config.server.maxRequestSize,
  }),
);

app.use(
  express.urlencoded({ extended: true, limit: config.server.maxRequestSize }),
);

app.use(compression());

if (config.server.env === "development") {
  app.use(morgan("dev"));
}

app.use((req, res, next) => {
  console.log(`${req.method} ${req.path}`);
  next();
});

app.get("/health", plannerController.healthCheck);
app.get(`${config.server.apiPrefix}/health`, plannerController.healthCheck);

app.use(`${config.server.apiPrefix}/planner`, plannerRoutes);

app.get("/", (req, res) => {
  res.json({
    message: "Smart Trek & Travel Planner API",
    version: "1.0.0",
    endpoints: {
      health: "/health",
      plan: `${config.server.apiPrefix}/planner/plan`,
      destinations: `${config.server.apiPrefix}/planner/destinations`,
      estimate: `${config.server.apiPrefix}/planner/estimate`,
    },
    documentation: "See README.md for API documentation",
  });
});

app.use((req, res) => {
  res.status(404).json({
    success: false,
    message: "Endpoint not found",
    path: req.path,
  });
});

app.use((err, req, res, next) => {
  console.error("Error:", err);

  if (err.code && err.code.startsWith("23")) {
    return res.status(400).json({
      success: false,
      message: "Database constraint error",
      error:
        config.server.env === "development"
          ? err.message
          : "Invalid data provided",
    });
  }

  if (err.isJoi) {
    return res.status(400).json({
      success: false,
      message: "Validation error",
      errors: err.details,
    });
  }

  const statusCode = err.statusCode || 500;
  const message = err.message || "Internal server error";

  res.status(statusCode).json({
    success: false,
    message,
    error: config.server.env === "development" ? err.stack : undefined,
  });
});

const startServer = async () => {
  try {
    console.log("🔍 Testing database connection...");
    const dbConnected = await testConnection();

    if (!dbConnected) {
      console.error("❌ Failed to connect to database. Exiting...");
      process.exit(1);
    }

    const server = app.listen(config.server.port, () => {
      console.log("");
      console.log("========================================");
      console.log(" Trek Planner Backend Server Started");
      console.log("========================================");
      console.log(` Environment: ${config.server.env}`);
      console.log(` Server: http://localhost:${config.server.port}`);
      console.log(` API Prefix: ${config.server.apiPrefix}`);
      console.log(` Database: ${config.database.name}@${config.database.host}`);
      console.log(` CORS Origin: ${config.cors.origin}`);
      console.log("========================================");
      console.log("");
    });

    const gracefulShutdown = async (signal) => {
      console.log(`Received ${signal}, shutting down gracefully...`);

      server.close(async () => {
        console.log("HTTP server closed");

        await closePool();

        console.log("Graceful shutdown complete");
        process.exit(0);
      });

      setTimeout(() => {
        console.error("Forced shutdown after timeout");
        process.exit(1);
      }, 10000);
    };

    process.on("SIGTERM", () => gracefulShutdown("SIGTERM"));
    process.on("SIGINT", () => gracefulShutdown("SIGINT"));

    process.on("uncaughtException", (err) => {
      console.error("Uncaught Exception:", err);
      gracefulShutdown("uncaughtException");
    });

    process.on("unhandledRejection", (reason, promise) => {
      console.error("Unhandled Rejection at:", promise, "reason:", reason);
      gracefulShutdown("unhandledRejection");
    });
  } catch (error) {
    console.error("Failed to start server:", error);
    process.exit(1);
  }
};

startServer();

export default app;
