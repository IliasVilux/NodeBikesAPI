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
  <div class="bg-white rounded-lg overflow-hidden flex flex-col relative">
    <RouterLink :to="{ name: 'bikes', query: { marca: bike.brand_id } }">
      <h4
        v-if="brand"
        class="text-xl text-white uppercase font-semibold bg-accent rounded-md px-4 py-2 relative z-10"
      >
        {{ brand }}
      </h4>
    </RouterLink>
    <img
      src=""
      :alt="'Imagen de la moto ' + brand + ' ' + bike.name"
      class="w-full aspect-[4/3] object-cover flex-grow bg-[#D9D9D9] -mt-1"
    />
    <RouterLink :to="{ name: 'detail', params: { id: bike.id } }">
      <div class="px-4 py-2 mt-auto hover:text-accent transition duration-300">
        <p class="text-sm text-text-secondary font-light">
          {{ bike.year }} | {{ bike.engine_capacity }}
        </p>
        <h4 class="text-xl font-semibold pb-7">{{ bike.name }}</h4>
      </div>
    </RouterLink>
  </div>
</template>
