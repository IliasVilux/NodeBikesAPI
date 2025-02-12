<script setup>
import axios from 'axios'
import { onMounted, ref } from 'vue'
import { RouterLink } from 'vue-router'

const props = defineProps({
  bike: {
    type: Object,
    required: true,
  },
})

const brand = ref('')

const fetchData = async () => {
  try {
    const responseBrand = await axios.get(
      `${import.meta.env.VITE_API_URL}/marcas/${props.bike.brand_id}`,
    )
    brand.value = responseBrand.data[0].name
  } catch (err) {
    console.log(err)
  }
}

onMounted(fetchData)
</script>

<template>
  <div
    class="group flex flex-col overflow-hidden rounded-2xl border border-border-light bg-white transition duration-300 hover:-translate-y-1"
  >
    <RouterLink :to="{ name: 'bikes', query: { marca: bike.brand_id } }">
      <h4
        v-if="brand"
        class="z-10 bg-accent-blue px-4 py-2 text-xl font-semibold uppercase text-white hover:text-accent-blue-light transition duration-300"
      >
        {{ brand }}
      </h4>
    </RouterLink>

    <RouterLink :to="{ name: 'detail', params: { id: bike.id } }">
      <img
        src=""
        :alt="'Imagen de la moto ' + brand + ' ' + bike.name"
        class="w-full flex-grow bg-[#D9D9D9] object-cover aspect-[4/3] -mt-1"
      />
      <div class="mt-auto px-4 py-2 transition duration-300 group-hover:text-accent-blue">
        <p class="text-sm font-light text-text-secondary">
          {{ bike.year }} | {{ bike.engine_capacity }}
        </p>
        <h4 class="pb-7 text-xl font-semibold">{{ bike.name }}</h4>
      </div>
    </RouterLink>
  </div>
</template>
