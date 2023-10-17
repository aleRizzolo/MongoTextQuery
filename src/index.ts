import * as dotenv from "dotenv"
import express, { Express } from "express"

import { connectToDatabase } from "./db"

dotenv.config()

const port = process.env.PORT || 8080
const app: Express = express()

app.use(express.json())

//app.use("/api", fetchDbRouter)

connectToDatabase()

app.listen(port, () => {
  console.info(`⚡️ Server is listening at ${port}`)
})
