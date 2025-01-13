import { createApp } from "./app.js";
import { BikeModel } from "./models/mysql/bike.js";
import { BrandModel } from "./models/mysql/brand.js";

createApp({ bikeModel: BikeModel, brandModel: BrandModel });