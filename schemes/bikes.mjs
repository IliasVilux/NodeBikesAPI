import z from 'zod';

export const bikeSchema = z.object({
    name: z.string({
        invalid_type_error: 'El nombre debe ser un string',
        required_error: 'El nombre es requerido'
    }),
    year: z.number().int().min(1900).max(new Date().getFullYear() + 1),
    brand: z.string(),
    image: z.string().url(),
    engine_capacity: z.number().int().positive()
})

export function validateBike(object) {
    return bikeSchema.safeParse(object);
}

export function validatePartialBike(object) {
    return bikeSchema.partial().safeParse(object);
}