import { validateBrand } from '../schemes/brands.js'

export class BrandController {
  constructor ({ brandModel }) {
    this.brandModel = brandModel
  }

  getAll = async (req, res) => {
    const brands = await this.brandModel.getAll()
    res.json(brands)
  }

  getById = async (req, res) => {
    const { id } = req.params
    const brand = await this.brandModel.getById({ id })

    if (brand) return res.json(brand)

    res.status(404).json({ message: 'No se ha encontrado esta moto.' })
  }

  create = async (req, res) => {
    const result = validateBrand(req.body)

    if (result.error) {
      return res.status(422).json({ error: JSON.parse(result.error.message) })
    }

    const newBrand = await this.brandModel.create({ input: result.data })

    res.status(201).json(newBrand)
  }

  delete = async (req, res) => {
    const { id } = req.params

    const result = await this.brandModel.delete({ id })

    if (!result) {
      return res.status(404).json({ message: 'No se ha encontrado esta marca.' })
    }

    res.json({ message: 'Marca eliminada correctamente.' })
  }

  update = async (req, res) => {
    const result = validateBrand(req.body)

    if (result.error) {
      return res.status(422).json({ error: JSON.parse(result.error.message) })
    }

    const { id } = req.params
    const updateBrand = await this.brandModel.update({ id, input: result.data })

    if (!updateBrand) {
      return res.status(404).json({ message: 'No se ha encontrado esta marca.' })
    }

    return res.json(updateBrand)
  }
}
