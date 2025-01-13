import { createApp } from "./app.js";
import { BikeModel } from "./models/local-fs/bike.js";
import { BrandModel } from "./models/local-fs/brand.js";

createApp({ bikeModel: BikeModel, brandModel: BrandModel });