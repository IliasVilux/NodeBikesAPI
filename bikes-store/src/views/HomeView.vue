<script setup>
import { RouterLink } from 'vue-router'
import BrandCard from '@/components/BrandCard.vue'
import Svg from '@/components/Svg.vue'
</script>

<template>
  <!-- BENTO HERO -->
  <div class="max-w-7xl mx-auto mt-1 grid grid-rows-3 md:grid-cols-4 gap-1">
    <!-- Sección de texto y botón -->
    <div
      class="flex flex-col items-center justify-center row-span-2 md:col-span-1 h-full bg-blue-500 text-white text-center rounded-md px-3">
      <p>Acelera tus sueños,</p>
      <h2 class="mt-2 text-2xl font-bold uppercase leading-6">compra tu moto ideal</h2>
      <RouterLink to="/motos">
        <button
          class="mt-6 px-6 py-2 rounded-full bg-background text-text-primary uppercase hover:bg-accent hover:text-white transition duration-300">COMPRAR</button>
      </RouterLink>
    </div>

    <!-- Imagen con texto superpuesto -->
    <RouterLink to="/motos" class="relative flex items-center overflow-hidden row-span-2 md:col-span-3 rounded-md">
      <div class="z-10 w-full py-12 text-center text-white md:text-start md:max-w-72 md:ml-24">
        <p class="text-2xl font-semibold">¿Cuál va a ser tu siguiente moto?</p>
        <p class="mt-2 text-sm font-light">Entra para encontrar la moto que deseas</p>
      </div>
      <img
        src="https://cdn2.yamaha-motor.eu/prod/product-assets/2023/XTZ700DSP/2023-Yamaha-XTZ700DSP-EU-Trophy_Blue-Action-005-03.jpg"
        alt="Moto" class="absolute z-0 w-full h-full object-cover object-[0_35%]">
    </RouterLink>

    <!-- Logo oculto en pantallas pequeñas -->
    <div class="hidden md:flex w-full justify-center items-center h-full md:col-span-1 mx-auto bg-white rounded-md">
      <Svg name="logo" />
    </div>

    <!-- Sección de texto informativo -->
    <div class="hidden md:flex items-center p-5 md:col-span-3 bg-accent rounded-md">
      <p class="text-white">
        Lorem ipsum dolor sit, amet consectetur adipisicing elit. Molestiae minima dolore a et ab quasi soluta, iure
        natus nostrum. Esse quidem asperiores nostrum sapiente iusto rerum deleniti quo dolor magnam cum, modi, ipsa
        delectus dolorum praesentium officiis doloremque unde? Ullam!
      </p>
    </div>
  </div>

  <!-- BENTO NEWS -->
  <div>News</div>

  <!-- BRAND CARDS -->
  <div>
    <BrandCard />
  </div>
</template>
