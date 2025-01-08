import express, { json } from 'express';
import { bikesRouter } from './routes/bikes.js';

const app = express();
app.use(json());
app.disable('x-powered-by');

app.use('/motos', bikesRouter);

const PORT = process.env.PORT ?? 3000;

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
})