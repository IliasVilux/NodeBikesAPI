<script setup>
import { ref, onMounted, watch } from 'vue'
import { useRoute } from 'vue-router'
import axios from 'axios'

import PromoHeader from '@/components/common/PromoHeader.vue'
import Header from '@/components/common/Header.vue'
import Footer from '@/components/common/Footer.vue'
import ImageCarousel from '@/components/bike-detail/ImageCarousel.vue'
import BikeSpecs from '@/components/bike-detail/BikeSpecs.vue'
import RelatedBikes from '@/components/bike-detail/RelatedBikes.vue'

const route = useRoute()

const bike = ref({})
const loading = ref(false)
const error = ref(null)

const fetchData = async () => {
  loading.value = true
  try {
    const responseBike = await axios.get(`${import.meta.env.VITE_API_URL}/motos/${route.params.id}`)
    const responseImages = await axios.get(
      `${import.meta.env.VITE_API_URL}/motos/${route.params.id}/images`,
    )
    bike.value.bike = responseBike.data
    bike.value.images = responseImages.data
  } catch (err) {
    error.value = err
  } finally {
    loading.value = false
  }
}

onMounted(fetchData)
watch(() => route.params.id, fetchData)
</script>

<template>
  <PromoHeader />
  <Header />
  <div v-if="loading">Loading...</div>
  <div v-else-if="error">Error: {{ error.message }}</div>
  <div v-else-if="bike && bike.bike && bike.images">
    <!-- IMAGE CAROUSEL -->
    <ImageCarousel :images="bike.images" />

    <!-- BIKE SPECS -->
    <BikeSpecs :bike="bike.bike" />

    <!-- RELATED BIKES -->
    <RelatedBikes :bikeId="bike.bike.id" />
  </div>
  <Footer />
</template>
