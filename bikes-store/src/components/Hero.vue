<script setup>
import { RouterLink } from 'vue-router'
</script>

<template>
  <section class="relative py-28 flex items-center">
    <img
      src="https://cdn2.yamaha-motor.eu/prod/product-assets/2023/XTZ700DSP/2023-Yamaha-XTZ700DSP-EU-Trophy_Blue-Action-005-03.jpg"
      alt="Fondo"
      class="absolute inset-0 w-full h-full object-cover object-[0%_30%] -z-10"
    />

    <div class="absolute inset-0 bg-gradient-to-r from-black via-transparent to-transparent"></div>

    <div class="z-10 ms-4 lg:ms-36">
      <h1
        class="text-4xl lg:text-5xl font-light leading-[1.3] lg:leading-[1.3] bg-gradient-to-tr from-text-gradient-dark to-text-gradient-light text-transparent bg-clip-text max-w-96"
      >
        ¿Cuál va a ser tu siguiente moto?
      </h1>
      <RouterLink :to="{ name: 'bikes' }">
        <p class="font-light text-accent-blue-light mt-4">
          Entra para encontrar la moto que deseas
        </p>
      </RouterLink>
    </div>
  </section>
</template>
