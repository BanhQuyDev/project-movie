const { Cinema, sequelize } = require("../models");

const getListCinema = async (req, res) => {
  try {
    const querySql = `
    select * from Cinemas
`;
    const [results] = await sequelize.query(querySql);
    res.status(200).send([results]);
  } catch (error) {
    res.status(500).send(error);
  }
};
const getDetailCinema = async (req, res) => {
  try {
    const { id } = req.params;
    const cinema = await Cinema.findByPk(id);
    res.status(200).send(cinema);
  } catch (error) {
    res.status(500).send(error);
  }
};
const createCinema = async (req, res) => {
  try {
    const { id, name, address, image, cineplexId } = req.body;
    const newCinema = await Cinema.create({
      id,
      name,
      address,
      image,
      cineplexId,
    });
    res.status(201).send(newCinema);
  } catch (error) {
    res.status(500).send(error);
  }
};
const updateCinema = async (req, res) => {
  try {
    const { id } = req.params;
    const { name, address, image, cineplexId } = req.body;
    await Cinema.update(
      { name, address, image, cineplexId },
      { where: { id } }
    );
    const index = await Cinema.findByPk(id);
    res.status(200).send(index);
  } catch (error) {
    res.status(500).send(error);
  }
};
const deleteCinema = async (req, res) => {
  try {
    const {id} = req.params;
    const index = await Cinema.findByPk(id);
    await Cinema.destroy({where:{id}});
    res.status(200).send(index);
  } catch (error) {
    res.status(500).send(error);
  }
}
module.exports = {
  getListCinema,
  getDetailCinema,
  createCinema,
  updateCinema,
  deleteCinema
};
