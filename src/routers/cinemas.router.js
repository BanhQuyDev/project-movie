const { Router } = require("express");
const {Cinema} = require("../models");
const { getListCinema, getDetailCinema, createCinema, updateCinema, deleteCinema } = require("../controllers/cinemas.controller");
const { checkExist } = require("../middlewares/validations/check-exist-middleware");
const { checkDuplicate } = require("../middlewares/validations/check-duplicate-middleware");
const cinemasRouter = Router();

//http://localhost:7000/api/v1/cinemas
cinemasRouter.get("/",getListCinema);
//http://localhost:7000/api/v1/cinemas/:id
cinemasRouter.get("/:id",checkExist(Cinema),getDetailCinema);
//http://localhost:7000/api/v1/cinemas
cinemasRouter.post("/",checkDuplicate(Cinema),createCinema);
//http://localhost:7000/api/v1/cinemas/:id
cinemasRouter.put("/:id",checkExist(Cinema),updateCinema);
//http://localhost:7000/api/v1/cinemas/:id
cinemasRouter.delete("/:id",checkExist(Cinema),deleteCinema);
module.exports = {
    cinemasRouter,
};