const {Router} = require('express');
const {Showtime} = require('../models');
const { getListShowTimesFollowMovieAndCinema, getAllListShowTime, getDetailsShowTime, createShowTime, updateShowTime, deleteShowtime } = require('../controllers/showtimes.controller');
const {checkExist} = require('../middlewares/validations/check-exist-middleware');
const { checkDuplicate } = require('../middlewares/validations/check-duplicate-middleware');
const showTime = Router();

//http://localhost:7000/api/v1/showtime
showTime.get("/",getListShowTimesFollowMovieAndCinema);
//http://localhost:7000/api/v1/showtime/allList
showTime.get("/allList",getAllListShowTime);
//http://localhost:7000/api/v1/showtime/:id
showTime.get("/:id",checkExist(Showtime),getDetailsShowTime)
//http://localhost:7000/api/v1/showtime
showTime.post("/",checkDuplicate(Showtime),createShowTime);
//http://localhost:7000/api/v1/showtime/:id
showTime.put("/:id",checkExist(Showtime),updateShowTime);
//http://localhost:7000/api/v1/showtime/:id
showTime.delete("/:id",checkExist(Showtime),deleteShowtime);
module.exports ={
    showTime,
}