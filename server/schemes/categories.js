import z from 'zod'

export const categorySchema = z.object({
  name: z.string({
    invalid_type_error: 'El nombre debe ser un string',
    required_error: 'El nombre es requerido'
  })
})

export function validateCategory (object) {
  return categorySchema.safeParse(object)
}
