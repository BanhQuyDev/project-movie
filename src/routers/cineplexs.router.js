const {Router} = require('express');
const { Cineplex} = require("../models");
const { getListCineplex, getDetailCineplex, createCineplex, updateCineplex, deleteCineplex } = require('../controllers/cineplex.controller');
const { checkExist } = require('../middlewares/validations/check-exist-middleware');
const { checkDuplicate } = require('../middlewares/validations/check-duplicate-middleware');
const cineplexRouter = Router();

//http://localhost:7000/api/v1/cineplexs
cineplexRouter.get("/",getListCineplex);
//http://localhost:7000/api/v1/cineplexs/:id
cineplexRouter.get("/:id",checkExist(Cineplex),getDetailCineplex);
//http://localhost:7000/api/v1/cineplexs
cineplexRouter.post("/",checkDuplicate(Cineplex),createCineplex);
//http://localhost:7000/api/v1/cineplexs/:id
cineplexRouter.put("/:id",checkExist(Cineplex),updateCineplex)
//http://localhost:7000/api/v1/cineplexs/:id
cineplexRouter.delete("/:id",checkExist(Cineplex),deleteCineplex);
module.exports ={
    cineplexRouter,
}
