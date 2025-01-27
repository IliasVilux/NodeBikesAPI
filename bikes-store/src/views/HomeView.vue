<script setup>
import axios from 'axios'
import { onMounted } from 'vue'
import { ref } from 'vue'
import { RouterLink } from 'vue-router'
import PromoHeader from '@/components/PromoHeader.vue'

import GlobalCard from '@/components/GlobalCard.vue'
import Svg from '@/components/Svg.vue'

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
  <p>adsa</p>
</template>
