import jwt from 'jsonwebtoken'
const secretKey="prueba"

export const login =(req,res)=>{
    const { username, password } = req.body;

    if (username == 'lionel' && password == 'messi') {
        const token = jwt.sign({ id: username }, secretKey, {
            expiresIn: '10m'    
            });
        res.status(200).json({ auth: true, token: token });
    } else {
        res.status(401).json({ message: 'incorrecto' });
    }
}

export const register=(req,res)=>{

    //

}