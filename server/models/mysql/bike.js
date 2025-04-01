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

export class BikeModel {
  static async getAll ({ marca, categoria, search, cilindrada, orderBy }) {
    let query = `
      SELECT bike.*, bike_images.image_url 
      FROM bike
      JOIN brand ON bike.brand_id = brand.id
      LEFT JOIN bike_images ON bike.id = bike_images.bike_id AND bike_images.is_main = true
    `
    const params = []
    const conditions = []

    if (marca) {
      conditions.push('bike.brand_id = ?')
      params.push(marca)
    }

    if (categoria) {
      conditions.push('bike.category_id = ?')
      params.push(categoria)
    }

    if (search) {
      conditions.push('(bike.name LIKE ? OR brand.name LIKE ?)')
      const searchTerm = `%${search}%`
      params.push(searchTerm, searchTerm)
    }

    if (cilindrada) {
      switch (cilindrada) {
        case '49':
          conditions.push('bike.engine_capacity = 49')
          break
        case '125':
          conditions.push('bike.engine_capacity = 125')
          break
        case '200-400':
          conditions.push('bike.engine_capacity BETWEEN 200 AND 400')
          break
        case '400-600':
          conditions.push('bike.engine_capacity BETWEEN 400 AND 600')
          break
        case '600-800':
          conditions.push('bike.engine_capacity BETWEEN 600 AND 800')
          break
        case '900':
          conditions.push('bike.engine_capacity >= 900')
          break
      }
    }

    if (conditions.length) {
      query += ' WHERE ' + conditions.join(' AND ')
    }

    if (orderBy) {
      switch (orderBy) {
        case 'year_asc':
          query += ' ORDER BY bike.year ASC'
          break
        case 'year_desc':
          query += ' ORDER BY bike.year DESC'
          break
        case 'cilindrada_asc':
          query += ' ORDER BY bike.engine_capacity ASC'
          break
        case 'cilindrada_desc':
          query += ' ORDER BY bike.engine_capacity DESC'
          break
      }
    }

    const [bikes] = await connection.query(query, params)
    return bikes
  }

  static async getById ({ id }) {
    const [bike] = await connection.query('SELECT * FROM bike WHERE id = ?;', [id])
    if (!bike.length) return null
    return bike[0]
  }

  static async getImages ({ id }) {
    const [images] = await connection.query('SELECT * FROM bike_images WHERE bike_id = ?;', [id])
    if (!images.length) return null
    return images[0]
  }

  static async create ({ input }) {
    const {
      name,
      year,
      poster,
      engineCapacity,
      brandId
    } = input

    const [uuidResult] = await connection.query('SELECT UUID() uuid;')
    const [{ uuid }] = uuidResult

    try {
      await connection.query('INSERT INTO bike (id, name, year, poster, engine_capacity, brand_id) VALUES (?, ?, ?, ?, ?, ?);', [uuid, name, year, poster, engineCapacity, brandId])
    } catch (error) {
      console.log(error)
      throw new Error('No se ha podido crear la moto.')
    }

    const [bike] = await connection.query('SELECT * FROM bike WHERE id = ?;', [uuid])
    return bike[0]
  }

  static async delete ({ id }) {
    try {
      await connection.query('DELETE FROM bike WHERE id = ?;', [id])
      return true
    } catch (error) {
      console.log(error)
      return false
    }
  }

  static async update ({ id, input }) {
    try {
      const [bike] = await connection.query(
        'SELECT * FROM bike WHERE id = ?;', [id]
      )

      if (!bike.length) throw new Error('La moto no existe o no se pudo actualizar.')

      const updates = []
      const values = []
      for (const [key, value] of Object.entries(input)) {
        updates.push(`${key} = ?`)
        values.push(value)
      }

      if (updates.length === 0) return bike[0]

      await connection.query(
        `UPDATE bike SET ${updates.join(', ')} WHERE id = ?;`,
        [...values, id]
      )
    } catch (error) {
      console.log(error)
      return null
    }

    const [bike] = await connection.query('SELECT * FROM bike WHERE id = ?;', [id])
    return bike[0]
  }
}
