import { createRequire } from 'node:module'

const require = createRequire(import.meta.url)
const categories = require('../../json/categories.json')

export class CategoryModel {
  static async getAll () {
    return categories
  }

  static async getById ({ id }) {
    return categories.find(category => category.id === id)
  }

  static async create ({ input }) {
    const newCategory = {
      ...input
    }
    categories.push(newCategory)

    return newCategory
  }

  static async delete ({ id }) {
    const categoryIndex = categories.findIndex(category => category.id === id)

    if (categoryIndex === -1) {
      return false
    }

    categories.splice(categoryIndex, 1)
    return true
  }

  static async update ({ id, input }) {
    const categoryIndex = categories.findIndex(category => category.id === id)

    if (categoryIndex === -1) {
      return false
    }

    categories[categoryIndex] = {
      ...categories[categoryIndex],
      ...input
    }

    return categories[categoryIndex]
  }
}
