const {
  Movie,
  Cinema,
  Showtime,
  cinemaMovie,
  sequelize,
} = require("../models");
const { QueryTypes } = require("sequelize");
const getListShowTimesFollowMovieAndCinema = async (req, res) => {
  try {
    const { nameMovie, nameCinema } = req.body;
    const querySql = `
    select showtimes.startTime 
    from showtimes,cinemas,cinemamovies,movies
    where showtimes.cinemaId = cinemas.id AND cinemas.id = cinemamovies.cinemaId 
    AND cinemamovies.movieId = movies.id AND movies.name like :nameMovie 
    AND cinemas.name like :nameCinema `;
    const result = await sequelize.query(querySql, {
      replacements: {
        nameMovie: nameMovie,
        nameCinema: nameCinema,
      },
      type: QueryTypes.SELECT,
    });
    res.status(200).send(result);
  } catch (error) {
    res.status(500).send(error);
  }
};
const getAllListShowTime = async (req, res) => {
  try {
    const list = await Showtime.findAll({});
    res.status(200).send(list);
  } catch (error) {
    res.status(500).send(error);
  }
};
const getDetailsShowTime = async (req, res) => {
  try {
    const { id } = req.params;
    const index = await Showtime.findByPk(id);
    res.status(200).send(index);
  } catch (error) {
    res.status(500).send(error);
  }
};
const createShowTime = async (req, res) => {
  try {
    const { id, startTime, cinemaId } = req.body;
    const showTime = await Showtime.create({
      id,
      startTime,
      cinemaId,
    });
    res.status(201).send(showTime);
  } catch (error) {
    res.status(500).send(error);
  }
};
const updateShowTime = async (req, res) => {
  try {
    const { id } = req.params;
    const { startTime, cinemaId } = req.body;
    await Showtime.update({ startTime, cinemaId }, { where: { id } });
    const index = await Showtime.findByPk(id);
    res.status(200).send(index);
  } catch (error) {
    res.status(500).send(error);
  }
};
const deleteShowtime = async (req, res) => {
  try {
    const { id } = req.params;
    const showTime = await Showtime.findByPk(id);
    await Showtime.destroy({
      where: {
        id,
      },
    });
    res.status(200).send(showTime);
  } catch (error) {
    res.status(500).send(error);
  }
};
module.exports = {
  getListShowTimesFollowMovieAndCinema,
  getAllListShowTime,
  getDetailsShowTime,
  createShowTime,
  updateShowTime,
  deleteShowtime,
};
