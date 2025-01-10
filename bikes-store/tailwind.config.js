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
        accent: '#6A0DAD',          // Morado vibrante (Pramac)
        'accent-hover': '#8230C9',  // Hover/activo
        success: '#4CAF50',         // Confirmaciones
        error: '#E57373',           // Errores
      }
    },
  },
  plugins: [],
}

