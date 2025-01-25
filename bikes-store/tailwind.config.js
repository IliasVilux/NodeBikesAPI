/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        background: '#F9FAFB',
        'text-primary': '#2D2F33',
        'text-secondary': '#6B7280',
        'text-gradient-dark': '#82869F',
        'text-gradient-light': '#FFFFFF',
        'accent-blue': '#2563EB',
        'accent-blue-light': '#DBEAFE',
        'accent-orange': '#F59E0B',
        success: '#10B981',
        error: '#EF4444',
        border: '#90A4AE',
      }
    },
  },
  plugins: [],
}

