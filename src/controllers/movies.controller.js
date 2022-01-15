const { Movie } = require("../models");

const getAllMovie = async (req, res) => {
  try {
    const movieList = await Movie.findAll({

    });
    res.status(200).send(movieList);
  } catch (error) {
    res.status(500).send(error);
  }
};
const getDetailsMovies = async (req, res) => {
  try {
    const { id } = req.params;
    const movie = await Movie.findByPk(id);
    res.status(200).send(movie);
  } catch (error) {
    res.status(500).send(error);
  }
};
const createMovie = async (req, res) => {
  try {
    const {
      id,
      name,
      alias,
      poster,
      trailer,
      duration,
      description,
      comingDate,
      status
    } = req.body;
    const newMovie = await Movie.create({
      id,
      name,
      alias,
      poster,
      trailer,
      duration,
      description,
      comingDate,
      status
    });
    res.status(201).send(newMovie);
  } catch (error) {
    res.status(500).send(error);
  }
};
const updateMovie = async (req, res) => {
  try {
    const { id } = req.params;
    const { name, alias, poster, trailer, duration, description, comingDate,status } =
      req.body;
    await Movie.update(
      { name, alias, poster, trailer, duration, description, comingDate,status},
      {
        where: {
          id,
        },
      }
    );
    const index = await Movie.findByPk(id);
    res.status(200).send(index);
  } catch (error) {
    res.status(500).send(error);
  }
};
const deleteMovie = async (req, res) => {
  try {
    const { id } = res.params;
    const movie = await Movie.findByPk(id);
    await Movie.destroy({
      where: {
        id,
      },
    });
    res.status(200).send(movie);
  } catch (error) {
    res.status(500).send(error);
  }
};

//danh sách những phim sắp chiếu , đang chiếu và xuất chiều đặc biệt
const listMovieScreenings =(status) => async (req, res) => {
  try {
    const list = await Movie.findAll({
      where: {
        status,
      },
    });
    res.status(200).send(list);
  } catch (error) {
    res.status(500).send(error);
  }
};
module.exports = {
  getAllMovie,
  getDetailsMovies,
  createMovie,
  deleteMovie,
  updateMovie,
  listMovieScreenings,
};
