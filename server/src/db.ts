import mongoose from "mongoose"
import logger from "./utils/logger"

let connection

//suppress deprecation warning for strictQuery
mongoose.set("strictQuery", true)

// Amount of milliseconds to wait for a re-connection to the database
const RECONNECT_TIMEOUT = 5000

// Handle connection error then disconnect all connections
mongoose.connection.on("error", (error) => {
  // Log the error
  logger.error("Error in MongoDb connection:", error)
  // Disconnect all connections
  mongoose.disconnect()
})

// Handle mongoose disconnections. Then try to reconnect
mongoose.connection.on("disconnected", function () {
  // Convert the reconnect timeout in seconds
  const timeout: number = RECONNECT_TIMEOUT / 1000

  // Get the current date and time in UTC
  const disconnectionDate: string = new Date().toISOString()

  logger.info(`MongoDB disconnected! Trying to reconnect after ${timeout} sec...`, disconnectionDate)

  // After RECONNECT_TIMEOUT milliseconds try to reconnect to db
  setTimeout(connectToDatabase, RECONNECT_TIMEOUT)
})

export const connectToDatabase = async () => {
  logger.info("Connecting to database...")

  if (process.env.NODE_ENV == "production") {
    connection = await mongoose.connect(process.env.MONGODB_URL!)
  } else {
    connection = await mongoose.connect(process.env.MONGO_TEST!)
  }

  logger.info("🍃 Database connection established! ")

  return connection
}

export const db = mongoose.connection
