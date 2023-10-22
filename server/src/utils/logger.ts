import { createLogger, format, transports } from "winston"

const logger = createLogger({
  level: process.env.NODE_ENV === "production" ? "info" : "debug",
  format: format.combine(
    format.timestamp(),
    format.printf(({ level, message, timestamp }) => `${timestamp} ${level}: ${message}`)
  ),
  transports: [
    new transports.Console(),
    // Add any additional transports you need (e.g., file transport)
  ],
})

export default logger
