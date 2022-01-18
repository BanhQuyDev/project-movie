const { Router } = require("express");
const { News } = require("../models");
const {
  getAllNews,
  createNews,
  deleteNews,
  getDetailNews,
  updateNews,
} = require("../controllers/news.controller");
const {
  checkExist,
} = require("../middlewares/validations/check-exist-middleware");
const { checkDuplicate } = require("../middlewares/validations/check-duplicate-middleware");
const newsRouter = Router();
//http://localhost:7000/api/v1/news
newsRouter.get("/", getAllNews);
//http://localhost:7000/api/v1/news/:id
newsRouter.get("/:id",[checkExist(News)],getDetailNews);
//http://localhost:7000/api/v1/news
newsRouter.post("/",checkDuplicate(News),createNews);
//http://localhost:7000/api/v1/news/:id
newsRouter.put("/:id",checkExist(News),updateNews);
//http://localhost:7000/api/v1/news/:id
newsRouter.delete("/:id", checkExist(News), deleteNews);
module.exports = {
  newsRouter,
};
