const { Cineplex, Cinema, sequelize } = require("../models");
const getListCineplex = async (req, res) => {
  try {
    const cineplexList = await Cineplex.findAll({
      include: [{ model: Cinema }],
    });
    res.status(200).send(cineplexList);
  } catch (error) {
    res.status(500).send(error);
  }
};
const getListCinema = async (req, res) => {
  try {
    const querySql = `
    select * from Cinemas
`;
    const [results, metadata] = await sequelize.query(querySql);
    res.status(200).send([results, metadata]);
  } catch (error) {
    res.status(500).send(error);
  }
};

module.exports = {
  getListCineplex,
  getListCinema,
};
