const { News } = require("../models");
const getAllNews = async (req, res) => {
  try {
    const news = await News.findAll({
      attributes: ["id", "title", "description", "image"],
    });
    res.status(200).send(news);
  } catch (error) {
    res.status(500).send(error);
  }
};
const getDetailNews = async (req, res) => {
  try {
    const { id } = req.params;
    const index = await News.findByPk(id);
    res.status(200).send(index);
  } catch (error) {
    res.status(500).send(error);
  }
};
const createNews = async (req, res) => {
  try {
    const { id, title, description, image } = req.body;
    const newNews = await News.create({
      id,
      title,
      description,
      image,
    });
    res.status(201).send(newNews);
  } catch (error) {
    res.status(500).send(error);
  }
};
const deleteNews = async (req, res) => {
  try {
    const { id } = req.params;
    const index = await News.findByPk(id);
    await News.destroy({
      where: {
        id,
      },
    }),
      res.status(200).send(index);
  } catch (error) {
    res.status(500).send(error);
  }
};
const updateNews = async (req, res) => {
  try {
    const { id } = req.params;
    const { title, description, image } = req.body;
    await News.update(
      {
        title,
        description,
        image,
      },
      {
        where: {
          id,
        },
      }
    );
    const newsNews = await News.findByPk(id);
    res.status(200).send(newsNews);
  } catch (error) {
    res.status(500).send(error);
  }
};
module.exports = {
  getAllNews,
  createNews,
  deleteNews,
  getDetailNews,
  updateNews,
};
