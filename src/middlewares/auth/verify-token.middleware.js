const jwt = require("jsonwebtoken");
const autheticate = (req, res, next) => {
  const token = req.header("token");
  try {
    const serectKey = "huyDoan";
    const decode = jwt.verify(token, serectKey);
    req.user = decode;
    next();
  } catch (error) {
    res.status(401).send({
      message: "Bạn chưa đăng nhập",
    });
  }
};

const authorzie = (arrayRole) => (req, res, next) => {
  try {
    const { user } = req;
    if (arrayRole.includes(user.role)) {
      next();
    } else {
      res.status(403).send({
        message: "Bạn đã đăng nhập, nhưng không đủ quyền",
      });
    }
  } catch (error) {
    res.status(500).send(error);
  }
};
module.exports = {
  autheticate,
  authorzie,
};
