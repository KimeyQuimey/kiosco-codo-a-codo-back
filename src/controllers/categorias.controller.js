import { dbConn } from '../db.js';

export const getCategorias = async (req, res) => {

    try {
        const result = await dbConn.query(`SELECT * FROM categorias_productos`, [])
        res.json(result[0])
    }
    catch (error) {

        return res.status(500).json({ "message": "internal error" });
    }

}