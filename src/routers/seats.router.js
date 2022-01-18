const {Router}=require("express");
const { getListSeats, getAllListSeats, getDetailSeats, createSeats, updateSeats, deleteSeats, bookingSeats } = require("../controllers/seats.controller");
const { checkDuplicate } = require("../middlewares/validations/check-duplicate-middleware");
const { checkExist, checkExistSeat } = require("../middlewares/validations/check-exist-middleware");
const {Seat} = require("../models")
const seatsRouter = Router();
//http://localhost:7000/api/v1/seat
seatsRouter.get("/",getListSeats);
//http://localhost:7000/api/v1/seat/allList
seatsRouter.get("/allList",getAllListSeats);
//http://localhost:7000/api/v1/seat/:id
seatsRouter.get("/:id",checkExist(Seat),getDetailSeats);
//http://localhost:7000/api/v1/seat
seatsRouter.post("/",checkDuplicate(Seat),createSeats);
//http://localhost:7000/api/v1/seat/:id
seatsRouter.put("/:id",checkExist(Seat),updateSeats);
//http://localhost:7000/api/v1/seat/:id
seatsRouter.delete("/:id",checkExist(Seat),deleteSeats);
//http://localhost:7000/api/v1/seat/booking/:id
seatsRouter.put("/booking/:id",[checkExist(Seat),checkExistSeat],bookingSeats)
module.exports={
    seatsRouter,
}