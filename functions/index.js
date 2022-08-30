const functions = require("firebase-functions");
const express = require("express");
const app = express();
const ticketRouter = require("./api/controllers/ticket_controller");
const counterRouter = require("./api/controllers/counter_controller");

app.use(express.json());
app.use("/ticket", ticketRouter);
app.use("/counter", counterRouter);

exports.api = functions.https.onRequest(app);

// To handle "Function Timeout" exception
exports.functionsTimeOut = functions.runWith({
  timeoutSeconds: 540,
});

exports.setupDatabase = functions.https.onRequest(require("./setup_database"));
