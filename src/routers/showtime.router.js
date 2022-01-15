const {Router} = require('express');
const { getListShowTimesMovies } = require('../controllers/showtimes.controller');
const showTime = Router();

//http://localhost:7000/api/v1/showtime
showTime.get("/",getListShowTimesMovies);
module.exports ={
    showTime,
}