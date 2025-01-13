import z from 'zod';

export const brandSchema = z.object({
    name: z.string({
        invalid_type_error: 'El nombre debe ser un string',
        required_error: 'El nombre es requerido'
    }),
})

export function validateBrand(object) {
    return brandSchema.safeParse(object);
}