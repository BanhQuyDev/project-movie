const {Router}=require("express");
const { getListSeats } = require("../controllers/seats.controller");
const seatsRouter = Router();
//http://localhost:7000/api/v1/seat
seatsRouter.get("/",getListSeats);
module.exports={
    seatsRouter,
}