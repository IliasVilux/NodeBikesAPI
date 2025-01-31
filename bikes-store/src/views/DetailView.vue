<script setup>
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import axios from 'axios'

import BikeCard from '@/components/BikeCard.vue'
import BikeSpecs from '@/components/BikeSpecs.vue'

const route = useRoute()

const bike = ref({})
const loading = ref(false)
const error = ref(null)

const fetchData = async () => {
  loading.value = true
  try {
    const response = await axios.get(`${import.meta.env.VITE_API_URL}/motos/${route.params.id}`)
    bike.value = response.data
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
    <!-- IMAGE CAROUSEL -->
    <div>Images</div>

    <!-- BIKE SPECS -->
    <BikeSpecs />

    <!-- SIMILAR BIKES -->
    <div>
      <BikeCard />
    </div>
  </div>
</template>
