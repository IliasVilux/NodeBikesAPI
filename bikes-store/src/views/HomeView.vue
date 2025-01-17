<script setup>
import axios from 'axios'
import { onMounted } from 'vue'
import { ref } from 'vue'
import { RouterLink } from 'vue-router'

import GlobalCard from '@/components/GlobalCard.vue'
import Svg from '@/components/Svg.vue'

const brands = ref([])
const loadingBrands = ref(false)
const errorBrands = ref(null)

const categories = ref([])
const loadingCategories = ref(false)
const errorCategories = ref(null)

const fetchData = async () => {
  loadingBrands.value = true
  try {
    const responseBrands = await axios.get(`${import.meta.env.VITE_API_URL}/marcas`)
    brands.value = responseBrands.data
  } catch (err) {
    errorBrands.value = err
  } finally {
    loadingBrands.value = false
  }

  loadingCategories.value = true
  try {
    const responseCategories = await axios.get(`${import.meta.env.VITE_API_URL}/categorias`)
    categories.value = responseCategories.data
  } catch (err) {
    errorCategories.value = err
  } finally {
    loadingCategories.value = false
  }
}
onMounted(fetchData)
</script>

<template>
  <!-- BENTO HERO -->
  <div class="max-w-screen-2xl mx-auto mt-1 grid grid-rows-3 md:grid-cols-4 gap-1">
    <!-- Sección de texto y botón -->
    <div
      class="flex flex-col items-center justify-center row-span-2 md:col-span-1 h-full bg-blue-500 text-white text-center rounded-md px-3"
    >
      <p>Acelera tus sueños,</p>
      <h2 class="mt-2 text-2xl font-bold uppercase leading-6">compra tu moto ideal</h2>
      <RouterLink :to="{ name: 'bikes' }">
        <button
          class="text-white mt-6 px-6 py-2 rounded-full bg-blue-700 uppercase hover:bg-accent hover:text-white transition duration-300"
        >
          COMPRAR
        </button>
      </RouterLink>
    </div>

    <!-- Imagen con texto superpuesto -->
    <RouterLink
      :to="{ name: 'bikes' }"
      class="relative flex items-center overflow-hidden row-span-2 md:col-span-3 rounded-md"
    >
      <div class="z-10 w-full py-12 text-center text-white md:text-start md:max-w-72 md:ml-24">
        <p class="text-2xl font-semibold">¿Cuál va a ser tu siguiente moto?</p>
        <p class="mt-2 text-sm font-light">Entra para encontrar la moto que deseas</p>
      </div>
      <img
        src="https://cdn2.yamaha-motor.eu/prod/product-assets/2023/XTZ700DSP/2023-Yamaha-XTZ700DSP-EU-Trophy_Blue-Action-005-03.jpg"
        alt="Moto"
        class="absolute z-0 w-full h-full object-cover object-[0_35%]"
      />
    </RouterLink>

    <!-- Logo oculto en pantallas pequeñas -->
    <div
      class="hidden md:flex w-full justify-center items-center h-full md:col-span-1 mx-auto bg-white rounded-md"
    >
      <Svg name="logo" class="size-24" />
    </div>

    <!-- Sección de texto informativo -->
    <div class="hidden md:flex items-center p-12 md:col-span-3 bg-accent rounded-md">
      <p class="text-white">
        Lorem ipsum dolor sit, amet consectetur adipisicing elit. Molestiae minima dolore a et ab
        quasi soluta, iure natus nostrum. Esse quidem asperiores nostrum sapiente iusto rerum
        deleniti quo dolor magnam cum, modi, ipsa delectus dolorum praesentium officiis doloremque
        unde? Ullam!
      </p>
    </div>
  </div>

  <!-- SEARCH BY BRAND -->
  <div class="text-center mb-6 mt-32">
    <h1 class="text-3xl md:text-5xl font-semibold">Busca por marcas</h1>
    <RouterLink :to="{ name: 'bikes' }">
      <button class="mt-1 text-accent">Ver todos los modelos</button>
    </RouterLink>
  </div>
  <div class="max-w-7xl mx-auto">
    <div v-if="loadingBrands">Loading...</div>
    <div v-else-if="errorBrands">Error: {{ errorBrands.message }}</div>
    <div v-else class="grid grid-cols-2 md:grid-cols-5 gap-2">
      <GlobalCard v-for="brand in brands" :key="brand.id" :item="brand" type="brand" />
    </div>
  </div>

  <!-- SEARCH BY STYLE -->
  <div class="text-center mb-6 mt-32">
    <h1 class="text-3xl md:text-5xl font-semibold">Busca por estilo</h1>
    <RouterLink :to="{ name: 'bikes' }">
      <button class="mt-1 text-accent">Ver todos los modelos</button>
    </RouterLink>
  </div>
  <div class="max-w-7xl mx-auto">
    <div v-if="loadingCategories">Loading...</div>
    <div v-else-if="errorCategories">Error: {{ errorCategories.message }}</div>
    <div v-else class="grid grid-cols-2 md:grid-cols-5 gap-2">
      <GlobalCard
        v-for="category in categories"
        :key="category.id"
        :item="category"
        type="category"
      />
    </div>
  </div>
</template>
