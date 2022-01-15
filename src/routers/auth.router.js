const { Router } = require("express");
const { signUp, signIn, resetPassword } = require("../controllers/auth.controllers");
const authRouter = Router();

//http://localhost:7000/api/v1/auth/sign-in
authRouter.post("/sign-in", signIn);
//http://localhost:7000/api/v1/auth/sign-up
authRouter.post("/sign-up", signUp);
//http://localhost:7000/api/v1/auth/reset
authRouter.post("/reset",resetPassword);
module.exports = {
  authRouter,
};
