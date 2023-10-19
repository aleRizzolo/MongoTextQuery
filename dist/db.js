"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.db = exports.connectToDatabase = void 0;
const mongoose_1 = __importDefault(require("mongoose"));
const logger_1 = __importDefault(require("./utils/logger"));
//suppress deprecation warning for strictQuery
mongoose_1.default.set("strictQuery", true);
// Amount of milliseconds to wait for a re-connection to the database
const RECONNECT_TIMEOUT = 5000;
// Handle connection error then disconnect all connections
mongoose_1.default.connection.on("error", (error) => {
    // Log the error
    logger_1.default.error("Error in MongoDb connection:", error);
    // Disconnect all connections
    mongoose_1.default.disconnect();
});
// Handle mongoose disconnections. Then try to reconnect
mongoose_1.default.connection.on("disconnected", function () {
    // Convert the reconnect timeout in seconds
    const timeout = RECONNECT_TIMEOUT / 1000;
    // Get the current date and time in UTC
    const disconnectionDate = new Date().toISOString();
    logger_1.default.info(`MongoDB disconnected! Trying to reconnect after ${timeout} sec...`, disconnectionDate);
    // After RECONNECT_TIMEOUT milliseconds try to reconnect to db
    setTimeout(exports.connectToDatabase, RECONNECT_TIMEOUT);
});
const connectToDatabase = async () => {
    logger_1.default.info("Connecting to database...");
    const connection = await mongoose_1.default.connect(process.env.MONGODB_URL);
    logger_1.default.info("🍃 Database connection established!");
    return connection;
};
exports.connectToDatabase = connectToDatabase;
exports.db = mongoose_1.default.connection;
