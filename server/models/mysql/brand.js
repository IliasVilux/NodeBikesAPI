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

export class BrandModel {
    static async getAll() {
        const [ brands ] = await connection.query('SELECT * FROM brand;');
        return brands;
    }

    static async getById({ id }) {
        const [ brand ] = await connection.query('SELECT * FROM brand WHERE id = ?;', [ id ]);
        if (!brand.length) return null;
        return brand;
    }

    static async create({ input }) {
        const {
            name,
        } = input;

        try {
            await connection.query(`INSERT INTO brand (name) VALUES (?);`, [ name ]);
        } catch (error) {
            console.log(error);
            throw new Error('No se ha podido crear la marca.');
        }

        const [brand] = await connection.query('SELECT * FROM brand WHERE name = ?;', [ name ]);
        return brand[0];
    }

    static async delete({ id }) {
        try {
            await connection.query('DELETE FROM brand WHERE id = ?;', [ id ]);
            return true;
        } catch (error) {
            console.log(error);
            return false;
        }
    }

    static async update({ id, input }) {
        try {
            const {
                name,
            } = input;

            const [brand] = await connection.query(
                'SELECT * FROM brand WHERE id = ?;', [id]
            );
    
            if (!brand.length) throw new Error('La marca no existe o no se pudo actualizar.');

            const [existingBrand] = await connection.query(
                'SELECT * FROM brand WHERE name = ?;', [name]
            );
            
            if (existingBrand.length) throw new Error('La marca con este nombre ya existe.');
            
            await connection.query(
                `UPDATE brand SET name = ? WHERE id = ?;`,
                [name, id]
            );
        } catch (error) {
            console.log(error);
            return null;
        }

        const [brand] = await connection.query('SELECT * FROM brand WHERE id = ?;', [ id ]);
        return brand[0];
    }
}