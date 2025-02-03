import { validateCategory } from '../schemes/categories.js'

export class CategoryController {
  constructor ({ categoryModel }) {
    this.categoryModel = categoryModel
  }

  getAll = async (req, res) => {
    const categories = await this.categoryModel.getAll()
    res.json(categories)
  }

  getById = async (req, res) => {
    const { id } = req.params
    const category = await this.categoryModel.getById({ id })

    if (category) return res.json(category)

    res.status(404).json({ message: 'No se ha encontrado esta moto.' })
  }

  create = async (req, res) => {
    const result = validateCategory(req.body)

    if (result.error) {
      return res.status(422).json({ error: JSON.parse(result.error.message) })
    }

    const newCategory = await this.categoryModel.create({ input: result.data })

    res.status(201).json(newCategory)
  }

  delete = async (req, res) => {
    const { id } = req.params

    const result = await this.categoryModel.delete({ id })

    if (!result) {
      return res.status(404).json({ message: 'No se ha encontrado esta marca.' })
    }

    res.json({ message: 'Marca eliminada correctamente.' })
  }

  update = async (req, res) => {
    const result = validateCategory(req.body)

    if (result.error) {
      return res.status(422).json({ error: JSON.parse(result.error.message) })
    }

    const { id } = req.params
    const updateCategory = await this.categoryModel.update({ id, input: result.data })

    if (!updateCategory) {
      return res.status(404).json({ message: 'No se ha encontrado esta marca.' })
    }

    return res.json(updateCategory)
  }
}
