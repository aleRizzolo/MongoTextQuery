import cors from "cors"
import * as dotenv from "dotenv"
import logger from "./utils/logger"
import { connectToDatabase } from "./db"
import express, { Express } from "express"
import articleRouter from "./routes/routes"

dotenv.config()

const port = process.env.PORT || 3000
const app: Express = express()

app.use(cors())
app.use(express.json())

app.use("/api", articleRouter)

connectToDatabase()

app.listen(port, () => {
  logger.info(`⚡️ Server is listening at ${port} in ${process.env.NODE_ENV} mode`)
})
