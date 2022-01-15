const { Router } = require("express");
const { authRouter } = require("./auth.router");
const { cinemasRouter } = require("./cinemas.router");
const { moviesRouter } = require("./movies.router");
const { newsRouter } = require("./news.router");
const { seatsRouter } = require("./seats.router");
const { showTime } = require("./showtime.router");
const { userRouter } = require("./user.router");
const rootRouter = Router();
//http://localhost:7000/api/v1/users
rootRouter.use("/users", userRouter);
//http://localhost:7000/api/v1/auth
rootRouter.use("/auth", authRouter);
//http://localhost:7000/api/v1/cinemas
rootRouter.use("/cinemas", cinemasRouter);
//http://localhost:7000/api/v1/movies
rootRouter.use("/movies", moviesRouter);
//http://localhost:7000/api/v1/news
rootRouter.use("/news",newsRouter);
//http://localhost:7000/api/v1/showtime
rootRouter.use("/showtime",showTime);
//http://localhost:7000/api/v1/seat
rootRouter.use("/seat",seatsRouter);
module.exports = {
  rootRouter,
};
