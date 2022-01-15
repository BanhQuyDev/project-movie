const {Seats,Showtime, sequelize,} = require("../models");
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

module.exports={
    
    getListSeats
}