import jwt from 'jsonwebtoken'
const secretKey="prueba"

export function validarToken(req, res, next) {

    const authHeader = req.headers['authorization'];
    
    if (!authHeader){
        return res.status(403).send('token inexistente')
    }
    const token = authHeader.split(' ')[1];
    if (!token) {
        return res.status(403).send('token requerido');
    }

    try {
        const decoded = jwt.verify(token, secretKey);
        req.user = decoded;
    } catch (err) {
        return res.status(401).send('Invalid Token');
    }

    next()

    // const { token } = req.body;
    // console.log("token: ", token);

    // if (token != "alfajor de maizena") {
    //     // si el token no es valido entonces respondo desde aca con un forbidden y corto el flujo,
    //     // nunca va a llegar a llamarse la funcion que esta despues de validarToken
    //     return res.status(403).json({ mensaje: "token invalido" });
    // }
    // else {
    //     // si el token es valido entonces continua el flujo y es llamada la funcion que está a continuación
    //     next();
    // }

    // next();
}