<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

import PromoHeader from '@/components/PromoHeader.vue'
import Hero from '@/components/Hero.vue'
import Header from '@/components/Header.vue'
import CardsContainer from '@/components/CardsContainer.vue'
import Bento from '@/components/Bento.vue'
import Footer from '@/components/Footer.vue'

const brands = ref([])
const loadingBrands = ref(false)
const errorBrands = ref(null)

const categories = ref([])
const loadingCategories = ref(false)
const errorCategories = ref(null)

const fetchData = async () => {
  loadingBrands.value = true
  try {
    const responseBrands = await axios.get(`${import.meta.env.VITE_API_URL}/marcas`)
    brands.value = responseBrands.data
  } catch (err) {
    errorBrands.value = err
  } finally {
    loadingBrands.value = false
  }

  loadingCategories.value = true
  try {
    const responseCategories = await axios.get(`${import.meta.env.VITE_API_URL}/categorias`)
    categories.value = responseCategories.data
  } catch (err) {
    errorCategories.value = err
  } finally {
    loadingCategories.value = false
  }
}
onMounted(fetchData)
</script>

<template>
  <PromoHeader />
  <Header />
  <Hero />
  <CardsContainer :items="brands" itemsType="brand" :loading="loadingBrands" :error="errorBrands" />
  <Bento />
  <CardsContainer
    :items="categories"
    itemsType="category"
    :loading="loadingCategories"
    :error="errorCategories"
  />
  <Footer />
</template>
