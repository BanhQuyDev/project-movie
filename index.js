const express = require("express");
const dotenv = require('dotenv')
const { rootRouter } = require("./src/routers/root.router");
const path = require("path");
dotenv.config();
const app = express();
//set up định dạng body thành json
app.use(express.json());
//setup stati file
const pathPublicDirectory = path.join(__dirname,"./public");
app.use("/public",express.static(pathPublicDirectory))
//http://localhost:7000/api/v1
app.use("/api/v1",rootRouter);
const port = process.env.PORT;
app.listen(port, () => {
  console.log("app run on port: " + port);
});
