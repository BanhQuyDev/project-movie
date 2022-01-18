const { configEnv } = require("../config");
const { User, sequelize } = require("../models");
const bycryptjs = require("bcryptjs");
/**
 * lấy danh sách người dùng
 *  url: http://localhost:7000/users
 * method:get
 */
const findAllUser = async (req, res) => {
  try {
    const userList = await User.findAll({
      // attributes:["id","name","email","phone","role","createdAt","updateAt"],
      attributes: {
        exclude: ["password"],
      },
    });
    res.status(200).send(userList);
  } catch (error) {
    res.status(500).send(error);
  }
};
/**
 * lấy thông tin chi tiết người dùng
 *  url: http://localhost:7000/users/1
 * method:get
 */
const findDetailUser = async (req, res) => {
  try {
    const { id } = req.params;
    const user = await User.findByPk(id);
    res.status(200).send(user);
  } catch (error) {
    res.status(500).send(error);
  }
};
/**
 * thêm người dùng
 *  url: http://localhost:7000/users
 * method:post
 * data:{....}
 */
const createUser = async (req, res) => {
  try {
    const { id,name, email, password, phone, role } = req.body;
    //c1
    // const newUser = User.build({name, email, password, phone, role});
    // await newUser.save();
    //c2
    const salt = bycryptjs.genSaltSync(10);
    const hashPassword = bycryptjs.hashSync(password, salt);
    const newUser = await User.create({
      id,
      name,
      email,
      password: hashPassword,
      phone,
      role,
    });
    res.status(201).send(newUser);
  } catch (error) {
    res.status(500).send(error);
  }
};
/**
 * cập nhât người dùng
 *  url: http://localhost:7000/users/1
 * method:put/patch
 * data: {....}
 */
const updateUser = async (req, res) => {
  try {
    const { id } = req.params;
    const { name,email, password, phone, role } = req.body;
    await User.update(
      { name, email, password, phone, role },
      {
        where: {
          id,
        },
      }
    );
    const index = await User.findByPk(id);
    res.status(200).send(index);
  } catch (error) {
    res.status(500).send(error);
  }
};
/**
 * xóa người dùng
 *  url: http://localhost:7000/users/1
 * method: delete
 */
const deleteUser = async (req, res) => {
  const user = res.user;
  try {
    const { id } = req.params;
    const index = await User.findByPk(id);
    await User.destroy({
      where: {
        id,
      },
    });
    res.status(200).send(index);
  } catch (error) {
    res.status(500).send(error);
  }
};
const uploadAvartar = async (req, res) => {
  try {
    const { user, file } = req;
    const urlImage = configEnv.server.host + file.path;
    const userUpLoadAvatar = await User.findByPk(user.id);
    userUpLoadAvatar.avatar = urlImage;
    await userUpLoadAvatar.save();
    res.status(200).send("upload sucessfull");
  } catch (error) {
    res.status(500).send(error);
  }
};
module.exports = {
  findAllUser,
  findDetailUser,
  createUser,
  updateUser,
  deleteUser,
  uploadAvartar,
};
