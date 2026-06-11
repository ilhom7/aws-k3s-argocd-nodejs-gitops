const express = require("express");

const app = express();
const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.json({
    message: "Version 2 deployed by GitHub Actions and Argo CD!",
    version: process.env.APP_VERSION || "1.0.0"
  });
});

app.get("/health", (req, res) => {
  res.json({
    status: "healthy"
  });
});

app.listen(port, () => {
  console.log(`App listening on port ${port}`);
});