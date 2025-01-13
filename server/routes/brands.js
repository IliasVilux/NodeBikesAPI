import { Router } from "express";
import { BrandController } from "../controllers/brands.js";

export const createBrandRouter = ({ brandModel }) => {
    const brandRouter = Router();
    const brandController = new BrandController({ brandModel });
    
    brandRouter.get('/', brandController.getAll);
    brandRouter.post('/', brandController.create);
    
    brandRouter.get('/:id', brandController.getById);
    brandRouter.delete('/:id', brandController.delete);
    brandRouter.patch('/:id', brandController.update);

    return brandRouter;
};