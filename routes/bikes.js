import { Router } from "express";
import { randomUUID } from "node:crypto";
import { createRequire } from 'node:module';
import { validateBike, validatePartialBike } from "../schemes/bikes.js";

const require = createRequire(import.meta.url);
const bikes = require('../bikes.json');
export const bikesRouter = Router();

bikesRouter.get('/', (req, res) => {
    const { marca } = req.query;

    if (marca) {
        const filteredBikes = bikes.filter(
            bike => bike.brand.toLowerCase().includes(marca.toLowerCase())
        )
        return res.json(filteredBikes);
    }
    res.json(bikes);
});

bikesRouter.get('/:id', (req, res) => {
    const { id } = req.params;

    const bike = bikes.find((bike) => bike.id === id);
    if (bike) return res.json(bike);
    res.status(404).json({ message: 'No se ha encontrado esta moto.' });
});

bikesRouter.post('/', (req, res) => {
    const result = validateBike(req.body);

    if (result.error) {
        return res.status(422).json({ error: JSON.parse(result.error.message) });
    }

    const newBike = {
        id: randomUUID(),
        ...result.data
    }
    bikes.push(newBike);

    res.status(201).json(newBike);
});

bikesRouter.delete('/:id', (req, res) => {
    const { id } = req.params;
    const bikeIndex = bikes.findIndex(bike => bike.id === id);

    if (bikeIndex === -1) {
        return res.status(404).json({ message: 'No se ha encontrado esta moto.' });
    }

    bikes.splice(bikeIndex, 1);
    res.json({ message: 'Moto eliminada correctamente.' });
});

bikesRouter.patch('/:id', (req, res) => {
    const result = validatePartialBike(req.body);

    if (result.error) {
        return res.status(422).json({ error: JSON.parse(result.error.message) });
    }

    const { id } = req.params;
    const bikeIndex = bikes.findIndex(bike => bike.id === id);
    
    if (bikeIndex  === -1) {
        return res.status(404).json({ message: 'No se ha encontrado esta moto.' });
    }

    const updateBike = {
        ...bikes[bikeIndex],
        ...result.data
    }
    bikes[bikeIndex] = updateBike;

    return res.json(updateBike);
});