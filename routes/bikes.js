import { Router } from "express";
import { BikeController } from "../controllers/bikes.js";

export const bikesRouter = Router();

bikesRouter.get('/', BikeController.getAll);
bikesRouter.post('/', BikeController.create);

bikesRouter.get('/:id', BikeController.getById);
bikesRouter.delete('/:id', BikeController.delete);
bikesRouter.patch('/:id', BikeController.update);