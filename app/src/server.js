const express = require("express");

const app = express();
const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.json({
    message: "Hello from Node.js, Kubernetes, Argo CD, and GitHub Actions!",
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