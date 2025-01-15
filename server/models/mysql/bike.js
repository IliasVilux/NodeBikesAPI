import mysql from 'mysql2/promise';
import dotenv from 'dotenv';

dotenv.config();

// Configuración por defecto
const DEFAULT_CONFIG = {
    host: 'localhost',
    user: 'root',
    port: 3306,
    password: '',
    database: 'bikesdb'
};

const connectionString = {
    host: process.env.DB_HOST || DEFAULT_CONFIG.host,
    user: process.env.DB_USER || DEFAULT_CONFIG.user,
    port: process.env.DB_PORT || DEFAULT_CONFIG.port,
    password: process.env.DB_PASSWORD || DEFAULT_CONFIG.password,
    database: process.env.DB_NAME || DEFAULT_CONFIG.database
};

const connection = await mysql.createConnection(connectionString);

export class BikeModel {
    static async getAll({ marca, categoria }) {
        let query = 'SELECT * FROM bike';
        const params = [];
        const conditions = [];

        if (marca) {
            const [brand] = await connection.query('SELECT * FROM brand WHERE id = ?;', [marca]);
            if (!brand.length) return [];
            conditions.push('brand_id = ?');
            params.push(brand[0].id);
        }

        if (categoria) {
            const [category] = await connection.query('SELECT * FROM category WHERE id = ?;', [categoria]);
            if (!category.length) return [];
            conditions.push('category_id = ?');
            params.push(category[0].id);
        }

        if (conditions.length) {
            query += ' WHERE ' + conditions.join(' AND ');
        }

        const [bikes] = await connection.query(query, params);
        return bikes;
    }

    static async getById({ id }) {
        const [ bike ] = await connection.query('SELECT * FROM bike WHERE id = ?;', [ id ]);
        if (!bike.length) return null;
        return bike[0];
    }

    static async create({ input }) {
        const {
            name,
            year,
            poster,
            engine_capacity,
            brand_id,
        } = input;

        const [uuidResult] = await connection.query('SELECT UUID() uuid;');
        const [{ uuid }] = uuidResult;

        try {
            await connection.query(`INSERT INTO bike (id, name, year, poster, engine_capacity, brand_id) VALUES (?, ?, ?, ?, ?, ?);`, [ uuid, name, year, poster, engine_capacity, brand_id ]);
        } catch (error) {
            console.log(error);
            throw new Error('No se ha podido crear la moto.');
        }

        const [bike] = await connection.query('SELECT * FROM bike WHERE id = ?;', [ uuid ]);
        return bike[0];
    }

    static async delete({ id }) {
        try {
            await connection.query('DELETE FROM bike WHERE id = ?;', [ id ]);
            return true;
        } catch (error) {
            console.log(error);
            return false;
        }
    }

    static async update({ id, input }) {
        try {
            const [bike] = await connection.query(
                'SELECT * FROM bike WHERE id = ?;', [id]
            );
    
            if (!bike.length) throw new Error('La moto no existe o no se pudo actualizar.');
            
            const updates = [];
            const values = [];
            for (const [key, value] of Object.entries(input)) {
                updates.push(`${key} = ?`);
                values.push(value);
            }

            if (updates.length === 0) return bike[0];

            await connection.query(
                `UPDATE bike SET ${updates.join(', ')} WHERE id = ?;`,
                [...values, id]
            );
        } catch (error) {
            console.log(error);
            return null;
        }

        const [bike] = await connection.query('SELECT * FROM bike WHERE id = ?;', [ id ]);
        return bike[0];
    }
}