const { Router } = require("express");
const { getAllMovie, getDetailsMovies, createMovie, deleteMovie, updateMovie, listMovieScreenings } = require("../controllers/movies.controller");
const { checkExist } = require("../middlewares/validations/check-exist-middleware");
const {Movie}=require("../models");
const moviesRouter = Router();
//http://localhost:7000/api/v1/movies
moviesRouter.get("/",getAllMovie);
//http://localhost:7000/api/v1/movies/id
moviesRouter.get("/:id",[checkExist(Movie)],getDetailsMovies);
//http://localhost:7000/api/v1/movies
moviesRouter.post("/",createMovie);
//http://localhost:7000/api/v1/movies/id
moviesRouter.put("/:id",[checkExist(Movie)],updateMovie)
//http://localhost:7000/api/v1/movies/id
moviesRouter.delete("/:id",[checkExist(Movie)],deleteMovie);
//http://localhost:7000/api/v1/movies/status/moviescreening (status:1 là đang chiếu)
moviesRouter.get("/status/moviescreening",listMovieScreenings("1"));
//http://localhost:7000/api/v1/movies/status/upcomingmovie
//(upcoming movie status:2)
moviesRouter.get("/status/upcomingmovie",listMovieScreenings("2"));
//http://localhost:7000/api/v1/movies/status/specialscreeningmovie
//(upcoming movie status:3)
moviesRouter.get("/status/specialscreeningmovie",listMovieScreenings("3"));

module.exports = {
    moviesRouter,
}