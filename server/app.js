import cors from 'cors';
import express, { json } from 'express';
import { createBikeRouter } from './routes/bikes.js';
import 'dotenv/config';

export const createApp = ({ bikeModel }) => {
    const app = express();
    app.use(json());
    app.use(cors());
    app.disable('x-powered-by');
    
    app.use('/motos', createBikeRouter({ bikeModel }));
    
    const PORT = process.env.PORT ?? 3000;
    
    app.listen(PORT, () => {
        console.log(`Server is running on http://localhost:${PORT}`);
    })
};