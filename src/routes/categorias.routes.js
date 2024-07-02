import { Router } from 'express';
import { getCategorias } from '../controllers/categorias.controller.js';
import { validarToken } from '../middlewares/validarToken.js';

const router = Router();

router.get("/api/categorias",validarToken, getCategorias);

export default router;