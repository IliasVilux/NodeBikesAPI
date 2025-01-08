import { createRequire } from 'node:module';
import { randomUUID } from "node:crypto";

const require = createRequire(import.meta.url);
const bikes = require('../bikes.json');

export class BikeModel {
    static async getAll({ marca }) {
        if (marca) {
            return bikes.filter(
                bike => bike.brand.toLowerCase().includes(marca.toLowerCase())
            )
        }
        
        return bikes;
    }

    static async getById({ id }) {
        return bikes.find(bike => bike.id === id);
    }

    static async create({ input }) {
        const newBike = {
            id: randomUUID(),
            ...input
        }
        bikes.push(newBike);

        return newBike;
    }

    static async delete({ id }) {
        const bikeIndex = bikes.findIndex(bike => bike.id === id);

        if (bikeIndex === -1) {
            return false;
        }

        bikes.splice(bikeIndex, 1);
        return true
    }

    static async update({ id, input }) {
        const bikeIndex = bikes.findIndex(bike => bike.id === id);

        if (bikeIndex === -1) {
            return false;
        }

        bikes[bikeIndex] = {
            ...bikes[bikeIndex],
            ...input
        }

        return bikes[bikeIndex];
    }
}