<script setup>
import { ref } from 'vue'
import axios from 'axios'
import { onMounted } from 'vue'

const bikes = ref([])
const loading = ref(false)
const error = ref(null)

const fetchData = async () => {
  loading.value = true
  try {
    const response = await axios.get('http://localhost:3000/motos')
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
    <ul v-else>
    <li v-for="bike in bikes" :key="bike.id">
        {{ bike }}
    </li>
    </ul>
</template>