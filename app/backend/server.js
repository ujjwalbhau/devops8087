const express = require("express");
const app = express();

// Azure injects this PORT dynamically
const PORT = process.env.PORT;

app.use(express.static("public"));

app.get("/api/health", (req, res) => {
  res.json({
    message: "Hello, I am doing great! This response is from the API endpoint.",
    status: "OK",
    environment: process.env.WEBSITE_SLOT_NAME || "production"
  });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
