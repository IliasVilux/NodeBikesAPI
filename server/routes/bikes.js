import { Router } from 'express'
import { BikeController } from '../controllers/bikes.js'

export const createBikeRouter = ({ bikeModel }) => {
  const bikesRouter = Router()
  const bikeController = new BikeController({ bikeModel })

  bikesRouter.get('/', bikeController.getAll)
  bikesRouter.post('/', bikeController.create)

  bikesRouter.get('/:id', bikeController.getById)
  bikesRouter.delete('/:id', bikeController.delete)
  bikesRouter.patch('/:id', bikeController.update)

  return bikesRouter
}
