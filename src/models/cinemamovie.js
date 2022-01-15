'use strict';
const {
  Model
} = require('sequelize');
const movie = require('./movie');
module.exports = (sequelize, DataTypes) => {
  class cinemaMovie extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate({Movie,Cinema}) {
      this.belongsTo(Movie,{foreignKey:"movieId"}),
      this.belongsTo(Cinema,{foreignKey:"cinemaId"})
    }
  };
  cinemaMovie.init({
    movieId: DataTypes.INTEGER,
    cinemaId:DataTypes.INTEGER,
  }, {
    sequelize,
    modelName: 'cinemaMovie',
  });
  return cinemaMovie;
};