import { validateBike, validatePartialBike } from '../schemes/bikes.js'

export class BikeController {
  constructor ({ bikeModel }) {
    this.bikeModel = bikeModel
  }

  findBikeById = async (id) => {
    return await this.bikeModel.getById({ id })
  }

  getAll = async (req, res) => {
    const { marca, categoria, search, cilindrada, order_by: orderBy } = req.query
    const bikes = await this.bikeModel.getAll({ marca, categoria, search, cilindrada, orderBy })
    res.json(bikes)
  }

  getById = async (req, res) => {
    const { id } = req.params
    const bike = await this.findBikeById(id)

    if (bike) return res.json(bike)

    res.status(404).json({ message: 'No se ha encontrado esta moto.' })
  }

  getImages = async (req, res) => {
    const { id } = req.params
    const images = await this.bikeModel.getImages({ id })

    if (images) return res.json(images)

    res.status(404).json({ message: 'No se han encontrado imagenes de esta moto.' })
  }

  getRelated = async (req, res) => {
    const { id } = req.params
    const bike = await this.findBikeById(id)

    if (!bike) {
      return res.status(404).json({ message: 'Moto no encontrada.' })
    }

    const relatedBikes = await this.bikeModel.getRelated({
      id,
      brandId: bike.brand_id,
      categoryId: bike.category_id,
      engineCapacity: bike.engine_capacity
    })

    if (relatedBikes) return res.json(relatedBikes)

    res.status(404).json({ message: 'Moto no encontrada.' })
  }

  create = async (req, res) => {
    const result = validateBike(req.body)

    if (result.error) {
      return res.status(422).json({ error: JSON.parse(result.error.message) })
    }

    const newBike = await this.bikeModel.create({ input: result.data })

    res.status(201).json(newBike)
  }

  delete = async (req, res) => {
    const { id } = req.params

    const result = await this.bikeModel.delete({ id })

    if (!result) {
      return res
        .status(404)
        .json({ message: 'No se ha encontrado esta moto.' })
    }

    res.json({ message: 'Moto eliminada correctamente.' })
  }

  update = async (req, res) => {
    const result = validatePartialBike(req.body)

    if (result.error) {
      return res.status(422).json({ error: JSON.parse(result.error.message) })
    }

    const { id } = req.params
    const updateBike = await this.bikeModel.update({ id, input: result.data })

    if (!updateBike) {
      return res
        .status(404)
        .json({ message: 'No se ha encontrado esta moto.' })
    }

    return res.json(updateBike)
  }
}
