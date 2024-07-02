import server from './server.js';
import { SERVER_PORT } from './config.js';

server.listen(SERVER_PORT);
console.log("server corriendo en el puerto: ", SERVER_PORT)