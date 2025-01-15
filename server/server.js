import { createApp } from "./app.js";
import { BikeModel } from "./models/mysql/bike.js";
import { BrandModel } from "./models/mysql/brand.js";
import { CategoryModel } from "./models/mysql/category.js";

createApp({ bikeModel: BikeModel, brandModel: BrandModel, categoryModel: CategoryModel });