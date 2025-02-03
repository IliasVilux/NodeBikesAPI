import mysql from 'mysql2/promise'
import dotenv from 'dotenv'

dotenv.config()

// Configuración por defecto
const DEFAULT_CONFIG = {
  host: 'localhost',
  user: 'root',
  port: 3306,
  password: '',
  database: 'bikesdb'
}

const connectionString = {
  host: process.env.DB_HOST || DEFAULT_CONFIG.host,
  user: process.env.DB_USER || DEFAULT_CONFIG.user,
  port: process.env.DB_PORT || DEFAULT_CONFIG.port,
  password: process.env.DB_PASSWORD || DEFAULT_CONFIG.password,
  database: process.env.DB_NAME || DEFAULT_CONFIG.database
}

const connection = await mysql.createConnection(connectionString)

export class CategoryModel {
  static async getAll () {
    const [categories] = await connection.query('SELECT * FROM category;')
    return categories
  }

  static async getById ({ id }) {
    const [category] = await connection.query('SELECT * FROM category WHERE id = ?;', [id])
    if (!category.length) return null
    return category
  }

  static async create ({ input }) {
    const {
      name
    } = input

    try {
      await connection.query('INSERT INTO category (name) VALUES (?);', [name])
    } catch (error) {
      console.log(error)
      throw new Error('No se ha podido crear la categoría.')
    }

    const [category] = await connection.query('SELECT * FROM category WHERE name = ?;', [name])
    return category[0]
  }

  static async delete ({ id }) {
    try {
      await connection.query('DELETE FROM category WHERE id = ?;', [id])
      return true
    } catch (error) {
      console.log(error)
      return false
    }
  }

  static async update ({ id, input }) {
    try {
      const {
        name
      } = input

      const [category] = await connection.query(
        'SELECT * FROM category WHERE id = ?;', [id]
      )

      if (!category.length) throw new Error('La categoría no existe o no se pudo actualizar.')

      const [existingCategory] = await connection.query(
        'SELECT * FROM category WHERE name = ?;', [name]
      )

      if (existingCategory.length) throw new Error('La categoría con este nombre ya existe.')

      await connection.query(
        'UPDATE category SET name = ? WHERE id = ?;',
        [name, id]
      )
    } catch (error) {
      console.log(error)
      return null
    }

    const [category] = await connection.query('SELECT * FROM category WHERE id = ?;', [id])
    return category[0]
  }
}
