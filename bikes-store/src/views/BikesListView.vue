<script setup>
import { ref, watch, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import axios from 'axios'

import PromoHeader from '@/components/common/PromoHeader.vue'
import Header from '@/components/common/Header.vue'
import Filter from '@/components/bikes-list/Filter.vue'
import Order from '@/components/bikes-list/Order.vue'
import BikeCard from '@/components/common/BikeCard.vue'
import BrandHero from '@/components/bikes-list/BrandHero.vue'
import Footer from '@/components/common/Footer.vue'

const route = useRoute()

const bikes = ref([])
const loading = ref(false)
const error = ref(null)

const fetchData = async () => {
  loading.value = true
  try {
    const { marca, categoria, search, cilindrada, order_by } = route.query

    let url = `${import.meta.env.VITE_API_URL}/motos`
    if (marca) {
      url += `?marca=${marca}`
    }
    if (categoria) {
      url += `?categoria=${categoria}`
    }
    if (cilindrada) {
      url += `?cilindrada=${cilindrada}`
    }
    if (search) {
      url += `?search=${search}`
    }
    if (order_by) {
      url += `?order_by=${order_by}`
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
watch(() => route.query, fetchData)
</script>

<template>
  <PromoHeader />
  <Header />

  <div v-if="loading">Loading...</div>
  <div v-else-if="error">Error: {{ error.message }}</div>
  <div v-else>
    <!-- FILTERS -->
    <Filter />

    <!-- ORDER BY -->

    <div class="max-w-screen-2xl mx-auto px-4">
      <Order />

      <!-- LIST OF BIKES -->
      <div class="mt-28">
        <p class="mb-3 text-text-secondary">{{ bikes.length }} resultados</p>
        <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
          <BikeCard v-for="bike in bikes" :key="bike.id" :bike="bike" />
        </div>
      </div>
    </div>

    <!-- LIST IF BRANDS -->
    <BrandHero />
    <Footer />
  </div>
</template>
