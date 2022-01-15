const multer = require("multer");
const { getExtensionFile } = require("../../utils/get-extension-file");
const uploadImageSignle = (typeImage) => {
  const storage = multer.diskStorage({
    destination: (req, file, cb) => {
      cb(null, `./public/images/${typeImage}`); // đường dẫn thư mục để lưu file
    },
    filename: (req, file, cb) => {
      cb(null, Date.now() + "_" + file.originalname);
    }, //set up cái tên file gửi lên
  });
  const upload = multer({
    storage,
    fileFilter: (req, file, cb) => {
      const extensionImageList = ["png", "jpg", "jpeg", "gif", "webp"];
      const extensionFile = getExtensionFile(file.originalname);
      if(extensionImageList.includes(extensionFile)){
        cb(null,true);
      }else{
        cb(new Error("extension không hợp lệ"))
      }
    },
  });
  return upload.single(typeImage);
};
module.exports = {
  uploadImageSignle,
};
// function cb(err,result){
//     if(err) throw new Error(err);
//     return result;
// }
