import dotenv from "dotenv";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

dotenv.config({ path: path.join(__dirname, "../../.env") });

const config = {
  server: {
    port: parseInt(process.env.PORT, 10) || 5000,
    env: process.env.NODE_ENV || "development",
    apiPrefix: process.env.API_PREFIX || "/api",
    maxRequestSize: process.env.MAX_REQUEST_SIZE || "10mb",
    unsplash: {
      accessKey: process.env.UNSPLASH_ACCESS_KEY || "",
    },
  },

  database: {
    host: process.env.DB_HOST || "localhost",
    port: parseInt(process.env.DB_PORT) || 5432,
    name: process.env.DB_NAME || "trek_planner",
    user: process.env.DB_USER || "postgres",
    password: process.env.DB_PASSWORD || "",
    max: 20,
    idleTimeoutMillis: 30000,
    connectionTimeoutMillis: 2000,
  },

  cors: {
    origin: process.env.CORS_ORIGIN || "http://localhost:3000",
    credentials: true,
  },

  ml: {
    serviceUrl: process.env.ML_SERVICE_URL || "http://localhost:8000",
    timeout: parseInt(process.env.ML_SERVICE_TIMEOUT, 10) || 30000,
  },

  logging: {
    level: process.env.LOG_LEVEL || "info",
  },
};

const requiredEnvVars = ["DB_PASSWORD"];

const missingEnvVars = requiredEnvVars.filter((envVar) => !process.env[envVar]);

if (missingEnvVars.length > 0 && config.server.env === "production") {
  console.log(
    "Missing required environment variables: ",
    missingEnvVars.join(","),
  );
  process.exit(1);
}

export default config;
