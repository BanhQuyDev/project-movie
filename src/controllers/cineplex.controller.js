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
const getDetailCineplex = async (req, res) => {
  try {
    const { id } = req.params;
    const cineplex = await Cineplex.findByPk(id);
    res.status(200).send(cineplex);
  } catch (error) {
    res.status(500).send(error);
  }
};
const createCineplex = async (req, res) => {
  try {
    const { id, name, logo } = req.body;
    const newCineplex = await Cineplex.create({ id, name, logo });
    res.status(201).send(newCineplex);
  } catch (error) {
    res.status(500).send(error);
  }
};
const updateCineplex = async (req, res) => {
  try {
    const { id } = req.params;
    const { name, logo } = req.body;
    await Cineplex.update(
      {
        name,
        logo,
      },
      { where: { id } }
    );
    const index = await Cineplex.findByPk(id);
    res.status(200).send(index);
  } catch (error) {
    res.status(500).send(error);
  }
};
const deleteCineplex = async (req, res) => {
    try {
        const {id} = req.params;
        const cineplex = await Cineplex.findByPk(id);
        await Cineplex.destroy({
            where:{
                id,
            }
        });
        res.status(200).send(cineplex);
    } catch (error) {
        res.status(500).send(error);
    }
}
module.exports = {
  getListCineplex,
  getDetailCineplex,
  createCineplex,
  updateCineplex,
  deleteCineplex
};
