import crypto from 'node:crypto';
import express from 'express';
import { createRequire } from 'node:module';
import { validateBike, validatePartialBike } from './schemes/bikes.mjs';

const require = createRequire(import.meta.url);
const bikes = require('./bikes.json');

const app = express();
app.use(express.json());
app.disable('x-powered-by');

app.get('/', (req, res) => {
    res.json({ message: 'Hello World!' });
})

app.get('/motos', (req, res) => {
    const { marca } = req.query;

    if (marca) {
        const filteredBikes = bikes.filter(
            bike => bike.brand.toLowerCase().includes(marca.toLowerCase())
        )
        return res.json(filteredBikes);
    }
    res.json(bikes);
})

app.get('/motos/:id', (req, res) => {
    const { id } = req.params;

    const bike = bikes.find((bike) => bike.id === id);
    if (bike) return res.json(bike);
    res.status(404).json({ message: 'No se ha encontrado esta moto.' });
})

app.post('/motos', (req, res) => {
    const result = validateBike(req.body);

    if (result.error) {
        return res.status(422).json({ error: JSON.parse(result.error.message) });
    }

    const newBike = {
        id: crypto.randomUUID(),
        ...result.data
    }
    bikes.push(newBike);

    res.status(201).json(newBike);
})

app.patch('/motos/:id', (req, res) => {
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
})

const PORT = process.env.PORT ?? 3000;

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
})