import { createRequire } from 'node:module';

const require = createRequire(import.meta.url);
const brands = require('../../brands.json');

export class BrandModel {
    static async getAll() {
        return brands;
    }

    static async getById({ id }) {
        return brands.find(brand => brand.id === id);
    }

    static async create({ input }) {
        const newBrand = {
            ...input
        }
        brands.push(newBrand);

        return newBrand;
    }

    static async delete({ id }) {
        const brandIndex = brands.findIndex(brand => brand.id === id);

        if (brandIndex === -1) {
            return false;
        }

        brands.splice(brandIndex, 1);
        return true
    }

    static async update({ id, input }) {
        const brandIndex = brands.findIndex(brand => brand.id === id);

        if (brandIndex === -1) {
            return false;
        }

        brands[brandIndex] = {
            ...brands[brandIndex],
            ...input
        }

        return brands[brandIndex];
    }
}