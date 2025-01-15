import { createRequire } from 'node:module';
import { randomUUID } from "node:crypto";

const require = createRequire(import.meta.url);
const bikes = require('../../json/bikes.json');
const brands = require('../../json/brands.json');
const categories = require('../../json/categories.json');

export class BikeModel {
    static async getAll({ marca, categoria }) {
        let filteredBikes = bikes;

        if (marca) {
            const brand = brands.find(brand => brand.id === Number(marca));
            if (!brand) return [];
            filteredBikes = filteredBikes.filter(bike => bike.brand_id === brand.id);
        }

        if (categoria) {
            const category = categories.find(category => category.id === Number(categoria));
            if (!category) return [];
            filteredBikes = filteredBikes.filter(bike => bike.category_id === category.id);
        }
        
        return filteredBikes;
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