const https = require("https");

module.exports.getIndexPage = (req, res) => {
  res.render("index");
}

module.exports.getPaymentForm = (req, res) => {
  res.render("checkout");
}

module.exports.makePayment = (req, res) => {
  const secretKey = process.env.SECRET_KEY;
  const userEmail = req.body.email;
  const userAmount = req.body.amount + "00"; // convert the amount to kobo equivalent due to paystack api requirement

  const options = {
    hostname: "api.paystack.co",
    port: 443,
    path: "/transaction/initialize",
    method: "POST",
    headers: {
      Authorization: `Bearer ${secretKey}`,
      "Content-Type": "application/json",
    },
  };

  const params = JSON.stringify({
    email: userEmail,
    amount: userAmount,
  });

  const paystackReq = https
    .request(options, (paystackRes) => {
      let data = "";

      paystackRes.on("data", (chunk) => {
        data += chunk;
      });

      paystackRes.on("end", () => {
        data = JSON.parse(data);
        // console.log(data);
        const paymentUrl = data.data.authorization_url;
        res.redirect(paymentUrl);
      });
    })
    .on("error", (error) => {
      console.error(error);
    });

  paystackReq.write(params);
  paystackReq.end();
};
