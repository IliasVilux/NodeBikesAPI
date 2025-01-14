/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        background: '#F5F5F7',      // Fondo principal
        card: '#FAFAFA',            // Fondo de tarjetas
        'text-primary': '#2C2C2E',  // Texto principal
        'text-secondary': '#636366',// Texto secundario
        accent: '#8230C9',          // Morado vibrante (Pramac)
        'accent-hover': '#6A0DAD',  // Hover/activo
        success: '#4CAF50',         // Confirmaciones
        error: '#E57373',           // Errores
        border: '#90A4AE',          // Bordes
      }
    },
  },
  plugins: [],
}

