const express = require("express");
const { Pool } = require("pg");

const app = express();

const port = process.env.PORT || 3000;

const pool = new Pool({
  host: process.env.DB_HOST || "db",
  port: process.env.DB_PORT || 5432,
  user: process.env.DB_USER || "inventory",
  password: process.env.DB_PASSWORD || "inventory123",
  database: process.env.DB_NAME || "inventory"
});

app.get("/", (req, res) => {
  res.json({
    service: "inventory-api-v2",
    status: "running"
  });
});

app.get("/health", (req, res) => {
  res.json({
    status: "healthy"
  });
});

app.get("/db-test", async (req, res) => {
  try {
    const result = await pool.query("SELECT NOW()");

    res.json({
      database: "connected",
      time: result.rows[0].now
    });
  } catch (error) {
    res.status(500).json({
      database: "connection failed",
      error: error.message
    });
  }
});

app.listen(port, () => {
  console.log(`Inventory API running on port ${port}`);
});
