const { Router } = require("express");
const { getAllMovie, getDetailsMovies, createMovie, deleteMovie, updateMovie, listMovieScreenings, listUpComingMovie, listSpecialScreeningMovie } = require("../controllers/movies.controller");
const { checkDuplicate } = require("../middlewares/validations/check-duplicate-middleware");
const { checkExist } = require("../middlewares/validations/check-exist-middleware");
const {Movie}=require("../models");
const moviesRouter = Router();
//http://localhost:7000/api/v1/movies
moviesRouter.get("/",getAllMovie);
//http://localhost:7000/api/v1/movies/id
moviesRouter.get("/:id",[checkExist(Movie)],getDetailsMovies);
//http://localhost:7000/api/v1/movies
moviesRouter.post("/",checkDuplicate(Movie),createMovie);
//http://localhost:7000/api/v1/movies/id
moviesRouter.put("/:id",[checkExist(Movie)],updateMovie)
//http://localhost:7000/api/v1/movies/id
moviesRouter.delete("/:id",[checkExist(Movie)],deleteMovie);
//http://localhost:7000/api/v1/movies/status/moviescreening
moviesRouter.get("/status/moviescreening",listMovieScreenings);
//http://localhost:7000/api/v1/movies/status/upcomingmovie
moviesRouter.get("/status/upcomingmovie",listUpComingMovie);
//http://localhost:7000/api/v1/movies/status/specialscreeningmovie
moviesRouter.get("/status/specialscreeningmovie",listSpecialScreeningMovie);

module.exports = {
    moviesRouter,
}
