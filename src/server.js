import express from 'express'; 
import cors from 'cors';
import productosRoutes from './routes/productos.routes.js';
import categoriasRoutes from './routes/categorias.routes.js'
import loginRoutes from './routes/auth.routes.js'
import { validarToken } from './middlewares/validarToken.js';

// iniciar la app
const app = express();
app.use(express.json());
app.use(cors());           

const URL_BASE = "/api";

// // rutas
// app.use(express.static(path.join(path.resolve(), 'public')));

// app.get('/login', (req, res) => {
//     res.sendFile(path.join(path.resolve(), 'public', 'login.html'));
// });

// app.get('/productos', (req, res) => {
//     res.sendFile(path.join(path.resolve(), 'public', 'productos.html'));
// });

app.use(loginRoutes)
app.use(productosRoutes);
app.use(categoriasRoutes)

// 404
app.use((req, res, next) => {
    res.status(404).json({ "message": "not found" });
});


export default app;