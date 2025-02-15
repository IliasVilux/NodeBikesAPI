import { createRequire } from 'node:module'
import { randomUUID } from 'node:crypto'

const require = createRequire(import.meta.url)
const bikes = require('../../json/bikes.json')
const brands = require('../../json/brands.json')
const categories = require('../../json/categories.json')

export class BikeModel {
  static async getAll ({ marca, categoria, search, cilindrada }) {
    let filteredBikes = bikes

    if (marca) {
      const brand = brands.find(brand => brand.id === Number(marca))
      if (!brand) return []
      filteredBikes = filteredBikes.filter(bike => bike.brand_id === brand.id)
    }

    if (categoria) {
      const category = categories.find(category => category.id === Number(categoria))
      if (!category) return []
      filteredBikes = filteredBikes.filter(bike => bike.category_id === category.id)
    }

    if (search) {
      const searchLower = search.toLowerCase()
      filteredBikes = filteredBikes.filter(bike => {
        const bikeName = bike.name.toLowerCase()
        const brand = brands.find(b => b.id === bike.brand_id)?.name.toLowerCase() || ''
        return bikeName.includes(searchLower) || brand.includes(searchLower)
      })
    }

    if (cilindrada) {
      switch (cilindrada) {
        case '49':
          filteredBikes = filteredBikes.filter(bike => bike.engine_capacity === 49)
          break
        case '125':
          filteredBikes = filteredBikes.filter(bike => bike.engine_capacity === 125)
          break
        case '200-400':
          filteredBikes = filteredBikes.filter(bike => bike.engine_capacity >= 200 && bike.engine_capacity <= 400)
          break
        case '400-600':
          filteredBikes = filteredBikes.filter(bike => bike.engine_capacity >= 400 && bike.engine_capacity <= 600)
          break
        case '600-800':
          filteredBikes = filteredBikes.filter(bike => bike.engine_capacity >= 600 && bike.engine_capacity <= 800)
          break
        case '900':
          filteredBikes = filteredBikes.filter(bike => bike.engine_capacity >= 900)
          break
      }
    }

    return filteredBikes
  }

  static async getById ({ id }) {
    return bikes.find(bike => bike.id === id)
  }

  static async create ({ input }) {
    const newBike = {
      id: randomUUID(),
      ...input
    }
    bikes.push(newBike)

    return newBike
  }

  static async delete ({ id }) {
    const bikeIndex = bikes.findIndex(bike => bike.id === id)

    if (bikeIndex === -1) {
      return false
    }

    bikes.splice(bikeIndex, 1)
    return true
  }

  static async update ({ id, input }) {
    const bikeIndex = bikes.findIndex(bike => bike.id === id)

    if (bikeIndex === -1) {
      return false
    }

    bikes[bikeIndex] = {
      ...bikes[bikeIndex],
      ...input
    }

    return bikes[bikeIndex]
  }
}
