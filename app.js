const express = require("express");
const morgan = require("morgan");
const ejsMate = require("ejs-mate");
const methodOverride = require("method-override");
const path = require("path");
const dotenv = require("dotenv");
const checkout = require("./controllers/checkout");

dotenv.config();
const app = express();

app.engine("ejs", ejsMate);
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "/views"));

app.use(methodOverride("_method"));
app.use(morgan("dev"));
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, "static")));

app.get("/", checkout.getIndexPage);

app.get("/checkout/pay", checkout.getPaymentForm);

app.post("/checkout/pay", checkout.makePayment);

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log("Listening on port 3000...");
});
