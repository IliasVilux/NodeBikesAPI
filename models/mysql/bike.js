import mysql from 'mysql2/promise';

const config = {
    host: 'localhost',
    user: 'root',
    port: 3306,
    password: '',
    database: 'bikesdb'
}

const connection = await mysql.createConnection(config);

export class BikeModel {
    static async getAll({ marca }) {
        if (marca) {
            const [brand] = await connection.query('SELECT * FROM brand WHERE name = ?;', [ marca ]);

            if (!brand.length) return [];

            const [ bikes ] = await connection.query('SELECT *, BIN_TO_UUID(id) id FROM bike WHERE brand_id = ?;', [ brand[0].id ]);
            return bikes;
        }

        const [ bikes ] = await connection.query('SELECT *, BIN_TO_UUID(id) id FROM bike;');
        return bikes;
    }

    static async getById({ id }) {
        const [ bike ] = await connection.query('SELECT *, BIN_TO_UUID(id) id FROM bike WHERE id = UUID_TO_BIN(?);', [ id ]);
        if (!bike.length) return null;
        return bike;
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
            await connection.query(`INSERT INTO bike (id, name, year, poster, engine_capacity, brand_id) VALUES (UUID_TO_BIN("${ uuid }"), ?, ?, ?, ?, ?);`, [ name, year, poster, engine_capacity, brand_id ]);
        } catch (error) {
            console.log(error);
            throw new Error('No se ha podido crear la moto.');
        }

        const [bike] = await connection.query('SELECT *, BIN_TO_UUID(id) id FROM bike WHERE id = UUID_TO_BIN(?);', [ uuid ]);
        return bike[0];
    }

    static async delete({ id }) {
        try {
            await connection.query('DELETE FROM bike WHERE id = UUID_TO_BIN(?);', [ id ]);
            return true;
        } catch (error) {
            console.log(error);
            return false;
        }
    }

    static async update({ id, input }) {
        try {
            const [bike] = await connection.query(
                'SELECT *, BIN_TO_UUID(id) id FROM bike WHERE id = UUID_TO_BIN(?);',
                [id]
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
                `UPDATE bike SET ${updates.join(', ')} WHERE id = UUID_TO_BIN(?);`,
                [...values, id]
            );
        } catch (error) {
            console.log(error);
            return null;
        }

        const [bike] = await connection.query('SELECT *, BIN_TO_UUID(id) id FROM bike WHERE id = UUID_TO_BIN(?);', [ id ]);
        return bike[0];
    }
}