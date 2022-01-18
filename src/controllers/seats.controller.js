const {Seat,Showtime, sequelize,} = require("../models");
const { QueryTypes } = require("sequelize");
const getListSeats = async (req, res) => {
    try {
        const {startTime} = req.body;
        const querySql = `
        select seats.id,seats.name,seats.status,seats.price,seats.type
        from showtimes,seats
        where showtimes.startTime = :startTime
        group by seats.id,seats.name,seats.status,seats.price,seats.type
        `;
        const result = await sequelize.query(querySql,{
            replacements:{startTime:startTime},
            type: QueryTypes.SELECT,
        });
        res.status(200).send(result);
    } catch (error) {
        res.status(500).send(error);
    }
}
const getAllListSeats = async (req, res) => {
    try {
        const list = await Seat.findAll({});
        res.status(200).send(list);
    } catch (error) {
        res.status(500).send(error);
    }
}
const getDetailSeats = async (req, res) => {
    try {
        const {id} = req.params;
        const index = await Seat.findByPk(id);
        res.status(200).send(index);
    } catch (error) {
        res.status(500).send(error);
    }
}
const createSeats = async (req, res) => {
    try {
        const {id,name,status,price,type,showtimeId} = req.body;
        const newSeats = await Seat.create({
            id,name,status,price,type,showtimeId
        });
        res.status(201).send(newSeats);
    } catch (error) {
        res.status(500).send(error);
    }
}
const updateSeats = async (req, res) => {
    try {
        const {id} = req.params;
        const {name,status,price,type,showtimeId} = req.body;
        await Seat.update({name,status,price,type,showtimeId},{where: { id }});
        const index = await Seat.findByPk(id);
        res.status(200).send(index);
    } catch (error) {
        res.status(500).send(error);
    }
}
const deleteSeats = async (req, res) => {
    try {
        const {id} = req.params;
        const index = await Seat.findByPk(id);
        await Seat.destroy({where: { id }});
        res.status(200).send(index);
    } catch (error) {
        res.status(500).send(error);
    }
}
module.exports={
    getListSeats,
    getAllListSeats,
    getDetailSeats,
    createSeats,
    updateSeats,
    deleteSeats
}