import { Router } from 'express';
import { getProductos, getProducto, crearProducto, updateProducto, borrarProducto } from '../controllers/productos.controller.js';
import { validarToken } from '../middlewares/validarToken.js';

const router = Router();


// get productos
router.get("/api/productos",validarToken, getProductos);

// get producto get_byId
router.get("/api/productos/:id",validarToken,getProducto);

// agregar producto
router.post("/api/productos",validarToken, crearProducto);

// modificar producto
router.put("/api/productos/:id",validarToken, updateProducto);

// borrar producto
router.delete("/api/productos/:id",validarToken, borrarProducto);


export default router;