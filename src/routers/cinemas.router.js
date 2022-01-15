const { Router } = require("express");
const { getListCineplex, getListCinema } = require("../controllers/cinemas.controller");
const cinemasRouter = Router();

//http://localhost:7000/api/v1/cinemas
cinemasRouter.get("/", getListCineplex);
//http://localhost:7000/api/v1/cinemas/cinema-includes-cineplex
cinemasRouter.get("/cinema-includes-cineplex",getListCinema);
module.exports = {
    cinemasRouter,
};