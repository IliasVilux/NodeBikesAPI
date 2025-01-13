<script setup>
import { ref } from 'vue'
import axios from 'axios'
import { onMounted } from 'vue'
import { RouterLink } from 'vue-router'

import Filter from '@/components/Filter.vue'
import BikeCard from '@/components/BikeCard.vue'
import BrandHero from '@/components/BrandHero.vue'

const bikes = ref([])
const loading = ref(false)
const error = ref(null)

const fetchData = async () => {
  loading.value = true
  try {
    const response = await axios.get(`${import.meta.env.VITE_API_URL}/motos`)
    bikes.value = response.data
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
  <div v-else>
    <!-- FILTERS -->
    <Filter />

    <!-- ORDER BY -->
    <div>Order by:</div>

    <!-- LIST OF BIKES -->
    <div>
      <BikeCard />
    </div>

    <!-- LIST IF BRANDS -->
    <BrandHero />
  </div>
</template>
