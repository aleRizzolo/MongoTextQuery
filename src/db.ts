import mongoose from "mongoose"

//suppress deprecation warning for strictQuery
mongoose.set("strictQuery", true)

// Amount of milliseconds to wait for a re-connection to the database
const RECONNECT_TIMEOUT = 5000

// Handle connection error then disconnect all connections
mongoose.connection.on("error", (error) => {
  // Log the error
  console.error("Error in MongoDb connection:", error)
  // Disconnect all connections
  mongoose.disconnect()
})

// Handle mongoose disconnections. Then try to reconnect
mongoose.connection.on("disconnected", function () {
  // Convert the reconnect timeout in seconds
  const timeout: number = RECONNECT_TIMEOUT / 1000

  // Get the current date and time in UTC
  const disconnectionDate: string = new Date().toISOString()

  console.info(`MongoDB disconnected! Trying to reconnect after ${timeout} sec...`, disconnectionDate)

  // After RECONNECT_TIMEOUT milliseconds try to reconnect to db
  setTimeout(connectToDatabase, RECONNECT_TIMEOUT)
})

export const connectToDatabase = async () => {
  console.info("Connecting to database...")

  const connection = await mongoose.connect(process.env.MONGODB_URL!)

  console.info("🍃 Database connection established!")

  return connection
}
