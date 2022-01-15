const { User } = require("../models");
const bycryptjs = require("bcryptjs");
const jsonwebtoken = require("jsonwebtoken");
const signIn = async (req, res) => {
  try {
    const { email, password } = req.body;
    const userLogin = await User.findOne({
      where: { email },
    });
    if (userLogin) {
      const isAuth = bycryptjs.compareSync(password, userLogin.password);
      if (isAuth) {
        /**
         *tạo jsonwebtoken
         */
        const payload = {
          id: userLogin.id,
          email: userLogin.email,
          role: userLogin.role,
        };
        const serectKey = "huyDoan";
        const token = jsonwebtoken.sign(payload, serectKey);
        res.status(200).send({
          messages: "Đăng nhập thành công",
          token,
        });
      } else {
        res.status(400).send({
          messages: "Password không chính xác",
        });
      }
    } else {
      res.status(404).send({
        messages: "Email không chính xác",
      });
    }
  } catch (error) {
    res.status(500).send(error);
  }
};
const signUp = async (req, res) => {
  /**
   * mã hóa password:
   * 1/ tạo chuỗi ngẫu nhiên
   * 2/ kết hợp password chuỗi ngẫu nhiên + password => hash
   */
  try {
    const { name, email, password, phone } = req.body;
    const salt = bycryptjs.genSaltSync(10);
    const hashPassword = bycryptjs.hashSync(password, salt);
    const newUser = await User.create({
      name,
      email,
      password: hashPassword,
      phone,
    });
    res.status(201).send(newUser);
  } catch (error) {
    res.status(500).send(error);
  }
};
const resetPassword = async (req, res) => {
  try {
    const { email } = req.body;
    const passWordDefault = "123456";
    const userDetail = await User.findOne({
      where: { email },
    });
    if (userDetail) {
      const salt = bycryptjs.genSaltSync(10);
      const hashPassword = bycryptjs.hashSync(passWordDefault, salt);
      userDetail.password = hashPassword;
      await userDetail.save();
      res.status(200).send({
        messages: "reset password thành công",
        newPassword: passWordDefault,
      });
    } else {
      res.status(404).send({
        messages: "Email không chính xác",
      });
    }
  } catch (error) {
    res.status(500).send(error);
  }
};
module.exports = {
  signIn,
  signUp,
  resetPassword,
};
