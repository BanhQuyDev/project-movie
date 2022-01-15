'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Movie extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate({Ticket,cinemaMovie}) {
      this.hasMany(Ticket,{foreignKey:"movieId"}),
      this.hasMany(cinemaMovie,{foreignKey:"movieId"})
    }
  };
  Movie.init({
    name: DataTypes.STRING,
    alias: DataTypes.STRING,
    poster: DataTypes.STRING,
    trailer: DataTypes.STRING,
    duration: DataTypes.INTEGER,
    description: DataTypes.TEXT,
    comingDate: DataTypes.DATE,
    status:DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Movie',
  });
  return Movie;
};