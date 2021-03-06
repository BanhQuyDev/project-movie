const { Router } = require("express");
const {
  findAllUser,
  findDetailUser,
  createUser,
  updateUser,
  deleteUser,
  uploadAvartar,
} = require("../controllers/user.controller");
const {
  authenticate: authenticate,
  authorzie,
} = require("../middlewares/auth/verify-token.middleware");
const {
  uploadImageSignle,
} = require("../middlewares/uploads/upload-images.middlewares");
const {
  checkExist,
} = require("../middlewares/validations/check-exist-middleware");
const {checkDuplicate} = require("../middlewares/validations/check-duplicate-middleware");
const { User } = require("../models");
const userRouter = Router();
//http://localhost:7000/api/v1/users/upload-avartar
userRouter.post(
  "/upload-avartar",
  [uploadImageSignle("avatar"), authenticate],
  uploadAvartar
);
//http://localhost:7000/api/v1/users
userRouter.get("/", [], findAllUser);
//http://localhost:7000/api/v1/users/:id
userRouter.get("/:id", [checkExist(User)], findDetailUser);
//http://localhost:7000/api/v1/users
userRouter.post("/",[checkDuplicate(User)],createUser);
//http://localhost:7000/api/v1/users/:id
userRouter.put("/:id", [checkExist(User)], updateUser);
//http://localhost:7000/api/v1/users/:id
userRouter.delete(
  "/:id",
  [authenticate, authorzie(["ADMIN", "SUPER_ADMIN"]), checkExist(User)],
  deleteUser
);
module.exports = {
  userRouter,
};
