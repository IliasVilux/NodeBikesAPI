<script setup>
import { ref, watch, onMounted } from 'vue'
import { RouterLink, useRoute } from 'vue-router'
import axios from 'axios'

import Filter from '@/components/Filter.vue'
import BikeCard from '@/components/BikeCard.vue'
import BrandHero from '@/components/BrandHero.vue'

const route = useRoute()

const bikes = ref([])
const loading = ref(false)
const error = ref(null)

const fetchData = async () => {
  loading.value = true
  try {
    const marca = route.query.marca
    const categoria = route.query.categoria

    let url = `${import.meta.env.VITE_API_URL}/motos`
    if (marca) {
      url += `?marca=${marca}`
    }
    if (categoria) {
      url += `?categoria=${categoria}`
    }

    const response = await axios.get(url)
    bikes.value = response.data
  } catch (err) {
    error.value = err
  } finally {
    loading.value = false
  }
}
onMounted(fetchData)
watch(() => route.query.marca, fetchData)
</script>

<template>
  <div v-if="loading">Loading...</div>
  <div v-else-if="error">Error: {{ error.message }}</div>
  <div v-else>
    <!-- FILTERS -->
    <Filter />

    <!-- ORDER BY -->
    <div>Order by:</div>

    <!-- LIST OF BIKES -->
    <div class="max-w-7xl mx-auto grid grid-cols-2 md:grid-cols-5 gap-2">
      <BikeCard v-for="bike in bikes" :key="bike.id" :bike="bike" />
    </div>

    <!-- LIST IF BRANDS -->
    <BrandHero />
  </div>
</template>
