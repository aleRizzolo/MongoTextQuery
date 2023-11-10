import cors from "cors"
import * as dotenv from "dotenv"
import logger from "./utils/logger"
import { connectToDatabase } from "./db"
import express, { Express } from "express"
import articleRouter from "./routes/routes"

dotenv.config()

const port = process.env.PORT || 8080
const app: Express = express()

app.use(express.json())
app.use(cors())

app.use("/api", articleRouter)

connectToDatabase()

app.listen(port, () => {
  logger.info(`⚡️ Server is listening at ${port} in ${process.env.NODE_ENV} mode`)
})

export default app
