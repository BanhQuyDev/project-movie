const {
  Movie,
  Cinema,
  Showtime,
  cinemaMovie,
  sequelize,
} = require("../models");
const { QueryTypes } = require("sequelize");
const getListShowTimesMovies = async (req, res) => {
  try {
    const { nameMovie, nameCinema,startTime } = req.body;
    const querySql = `
    select movies.name as movie ,cinemas.name as cinema, showtimes.startTime 
    from showtimes,cinemas,cinemamovies,movies
    where showtimes.cinemaId = cinemas.id AND cinemas.id = cinemamovies.cinemaId 
    AND cinemamovies.movieId = movies.id AND movies.name like :nameMovie 
    AND cinemas.name like :nameCinema AND showtimes.startTime = :startTime
        `;
    const result = await sequelize.query(querySql, {
      replacements: {nameMovie: nameMovie,nameCinema:nameCinema,startTime:startTime},
      type: QueryTypes.SELECT,
    });
    res.status(200).send(result);
  } catch (error) {
    res.status(500).send(error);
  }
};
module.exports = {
  getListShowTimesMovies,
};
