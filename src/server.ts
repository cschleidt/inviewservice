import dotenv from "dotenv"
import Express, { json } from 'express'
import router from './router'
import cors from 'cors'
import morgan from 'morgan'


dotenv.config()
const App = Express()
const PORT = process.env.PORT || 8000

App.use(morgan('short'))
    .use(json())
    .use(router)
    .use(cors())

// Handling non matching request from the client
App.use((req, res) => {
    res.status(404).send("<h1>Page not found on the server</h1>");
    res.setHeader('Access-Control-Allow-Origin', 'http://localhost:3000');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
})

App.listen(PORT, () => {
    console.log(`Running at http://127.0.0.1:${PORT}/`);
})