import { Pool } from "pg";
import config from "../config/env.js";

const pool = new Pool({
  host: config.database.host,
  port: config.database.port,
  database: config.database.name,
  user: config.database.user,
  password: config.database.password,
  max: config.database.max,
  idleTimeoutMillis: config.database.idleTimeoutMillis,
  connectionTimeoutMillis: config.database.connectionTimeoutMillis,
});


//connect the database to the backend
pool.on("connect", () => {
  console.log("Connected to PostgresDB");
});

pool.on("error", (err) => {
  console.error("Unexpected Error", err);
  process.exit(1);
});

const query = async (text, params) => {
  const start = Date.now();
  try {
    const result = await pool.query(text, params);
    const duration = Date.now() - start;

    if (config.server.env === "development") {
      console.log("Executed Query", { text, duration, rows: result.rowCount });
    }

    return result;
  } catch (error) {
    console.error("Database query error", error);
    throw error;
  }
};

const transaction = async (callback) => {
  const client = await pool.connect();

  try {
    await client.query("BEGIN");
    const result = await callback(client);
    await client.query("COMMIT");
    return result;
  } catch (error) {
    await client.query("ROLLBACK");
    throw error;
  } finally {
    client.release();
  }
};

const testConnection = async () => {
  try {
    const result = await query("SELECT NOW() as current_time");
    console.log(
      "Databse connection test successful: ",
      result.rows[0].current_time,
    );
    return true;
  } catch (error) {
    console.error("Database connection test failed", error.message);
    return false;
  }
};

//closes the database pool when the application is shutting down
const closePool = async () => {
  try {
    await pool.end();
    console.log("Database pool closed successfully");
  } catch (error) {
    console.error("Error closing Database pool", error);
  }
};

export { query, transaction, testConnection, closePool };

export default query;
