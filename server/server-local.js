import { createApp } from './app.js'
import { BikeModel } from './models/local-fs/bike.js'
import { BrandModel } from './models/local-fs/brand.js'
import { CategoryModel } from './models/local-fs/category.js'

createApp({ bikeModel: BikeModel, brandModel: BrandModel, categoryModel: CategoryModel })
