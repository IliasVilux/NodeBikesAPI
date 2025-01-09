import { createApp } from "./app.js";
import { BikeModel } from "./models/mysql/bike.js";

createApp({ bikeModel: BikeModel });