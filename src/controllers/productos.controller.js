import { dbConn } from '../db.js';

export const getProductos = async (req, res) => {
    try {
        const result = await dbConn.query(`SELECT p.id_producto,p.nombre, p.precio,cat.descripcion,p.fecha_carga from productos p 
        INNER JOIN categorias_productos cat ON p.id_categoria_producto =cat.id_categoria_producto`, [])
        res.json(result[0])
    }
    catch (error) {
        return res.status(500).json({ "message": "internal error" });
    }

}

export const getProducto = async (req, res) => {
    try {
        const id_producto = req.params.id;

        const [result] = await dbConn.query('SELECT * FROM productos WHERE id_producto = ?', [id_producto]);

        if (result.length <= 0) {
            res.status(404).json({ message: "Producto not found" });
        } else {
            res.json(result[0]);
        }
    } catch (error) {
        return res.status(500).json({ message: "Internal error" });
    }
}

export const crearProducto = async (req, res) => {
    try {
        const { id_categoria_producto, nombre, precio } = req.body;
        const [result] = await dbConn.query('INSERT INTO productos (id_categoria_producto, nombre, precio) VALUES (?, ?, ?)', [id_categoria_producto, nombre, precio]);
        res.json(result);
    }
    catch (error) {
        console.log("error insertando el producto: " + error);
        return res.status(500).json({ "message": "internal error" });
    }

}

export const updateProducto = async (req, res) => {
    try {
        const { id } = req.params;
        const {precio}=req.body


        // Consulta SQL parametrizada para UPDATE, CURRENT_TIMESTAMP = fecha y hora del servidor de la base de datos
        const query = `
            UPDATE productos
            SET precio = ?, fecha_update = CURRENT_TIMESTAMP
            WHERE id_producto = ?`;
        const [result] = await dbConn.query(query, [precio,id]);

        if (result.affectedRows === 0) {
            res.status(404).json({ message: "Producto not found" });
        }
        else {
            res.json({ message: "Producto actualizado" });
        }

    }
    catch (error) {
        console.log("error actualizando el producto: " + error);
        return res.status(500).json({ "message": "internal error" });
    }

}

export const borrarProducto = async (req, res) => {
    try {
        const { id } = req.params;
        console.log("Borrar producto id: " + id);

        const [result] = await dbConn.query("DELETE FROM productos WHERE id_producto = ?", [id]);

        if (result.affectedRows === 0) {
            res.status(404).json({ message: "Producto not found" });
        } else {
            res.json({ message: "Producto borrado... para siempre :)" });
        }
    } catch (error) {
        console.log("Error borrando el producto: " + error);
        return res.status(500).json({ message: "Internal error" });
    }
}