<script setup>
import { RouterLink } from 'vue-router'
import { ref, onMounted } from 'vue'
import axios from 'axios'

const brands = ref([])
const loading = ref(false)
const error = ref(null)

const fetchData = async () => {
  loading.value = true
  try {
    const responseBrands = await axios.get(`${import.meta.env.VITE_API_URL}/marcas`)
    brands.value = responseBrands.data
  } catch (err) {
    error.value = err
  } finally {
    loading.value = false
  }
}
onMounted(fetchData)
</script>

<template>
  <div v-if="loading">Loading...</div>
  <div v-else-if="error">Error: {{ error.message }}</div>
  <div v-else class="bg-accent-blue-light border-y border-border mt-28 py-10">
    <div class="max-w-screen-2xl mx-auto flex flex-wrap gap-4 justify-center">
      <RouterLink
        :to="{ name: 'bikes', query: { marca: brand.id } }"
        v-for="brand in brands"
        :key="brand.id"
        class="flex items-center bg-white px-20 rounded-full hover:-translate-y-1 border hover:border-accent-blue transition duration-300"
      >
        <img
          :src="`/images/brand/${brand.name.toLowerCase()}.png`"
          :alt="brand.name"
          class="size-14 object-contain"
        />
      </RouterLink>
    </div>
  </div>
</template>
