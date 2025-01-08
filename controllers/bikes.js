import { BikeModel } from "../models/mysql/bike.js";
import { validateBike, validatePartialBike } from "../schemes/bikes.js";

export class BikeController {
    static async getAll(req, res) {
        const { marca } = req.query;
        const bikes = await BikeModel.getAll({ marca });
        res.json(bikes);
    }

    static async getById(req, res) {
        const { id } = req.params;
        const bike = await BikeModel.getById({ id });

        if (bike) return res.json(bike);

        res.status(404).json({ message: 'No se ha encontrado esta moto.' });
    }

    static async create(req, res) {
        const result = validateBike(req.body);

        if (result.error) {
            return res.status(422).json({ error: JSON.parse(result.error.message) });
        }

        const newBike = await BikeModel.create({ input: result.data });

        res.status(201).json(newBike);
    }

    static async delete(req, res) {
        const { id } = req.params;

        const result = await BikeModel.delete({ id });

        if (!result) {
            return res.status(404).json({ message: 'No se ha encontrado esta moto.' });
        }

        res.json({ message: 'Moto eliminada correctamente.' });
    }

    static async update(req, res) {
        const result = validatePartialBike(req.body);

        if (result.error) {
            return res.status(422).json({ error: JSON.parse(result.error.message) });
        }

        const { id } = req.params;
        const updateBike = await BikeModel.update({ id, input: result.data });

        if (!updateBike) {
            return res.status(404).json({ message: 'No se ha encontrado esta moto.' });
        }

        return res.json(updateBike);
    }
}