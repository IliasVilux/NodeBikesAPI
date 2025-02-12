<script setup>
import { onMounted, ref } from 'vue'
import { RouterLink } from 'vue-router'
import axios from 'axios'

import Svg from '@/components/common/Svg.vue'

const isFiltersOpenMobile = ref(false)
const openDropdowns = ref({
  category: false,
  engine_capacity: false,
  brand: false,
})

const toggleDropdown = (key) => {
  for (const k in openDropdowns.value) {
    if (k != key) {
      openDropdowns.value[k] = false
    }
  }
  openDropdowns.value[key] = !openDropdowns.value[key]
}

const engineCapacities = [
  { id: '49', name: '49cc' },
  { id: '125', name: '125cc' },
  { id: '200-400', name: '200-400cc' },
  { id: '400-600', name: '400-600cc' },
  { id: '600-800', name: '600-800cc' },
  { id: '+900', name: '+900cc' },
]
const filters = ref([
  { id: 'category', name: 'Categoría', apiParam: 'categoria', options: [] },
  { id: 'engine_capacity', name: 'Cilindrada', apiParam: 'cilindrada', options: engineCapacities },
  { id: 'brand', name: 'Marca', apiParam: 'marca', options: [] },
])

const fetchData = async () => {
  try {
    const resCategories = await axios.get(`${import.meta.env.VITE_API_URL}/categorias`)
    filters.value[0].options = resCategories.data
  } catch (err) {
    filters.value[0].options = 'Error: ' + err
  }

  try {
    const resBrands = await axios.get(`${import.meta.env.VITE_API_URL}/marcas`)
    filters.value[2].options = resBrands.data
  } catch (err) {
    filters.value[2].options = 'Error: ' + err
  }
}

onMounted(fetchData)
</script>

<template>
  <div class="w-full bg-text-primary">
    <div
      class="lg:hidden text-white flex items-center justify-center gap-1 cursor-pointer py-4"
      @click="isFiltersOpenMobile = !isFiltersOpenMobile"
    >
      <h3 class="text-2xl">Filtros</h3>
      <Svg
        name="arrow-simple-down"
        class="size-7 transition-transform"
        :class="{ 'rotate-180': isFiltersOpenMobile }"
      />
    </div>
    <div
      class="max-w-screen-2xl mx-auto grid-cols-1 lg:grid-cols-3 gap-x-4"
      :class="{ hidden: !isFiltersOpenMobile, 'lg:grid': true }"
    >
      <div v-for="filter in filters" :key="filter.id" class="relative py-2">
        <!-- Botón del dropdown -->
        <div
          class="flex items-center justify-between border-b border-accent-blue cursor-pointer py-2 px-4"
          :class="{
            'bg-white rounded-t-2xl text-primary shadow-xl': openDropdowns[filter.id],
            'text-white': !openDropdowns[filter.id],
          }"
          @click="toggleDropdown(filter.id)"
        >
          <p class="uppercase">{{ filter.name }}</p>
          <Svg
            name="arrow-simple-down"
            class="size-7 transition-transform"
            :class="{ 'rotate-180': openDropdowns[filter.id] }"
          />
        </div>

        <!-- Dropdown con absolute y sombra -->
        <div
          v-if="openDropdowns[filter.id]"
          class="lg:absolute left-0 w-full bg-white border-b-4 rounded-b-2xl border-accent-blue shadow-lg z-10"
        >
          <p
            v-for="(option, i) in filter.options"
            :key="i"
            class="px-4 py-4 lg:py-2 hover:font-medium uppercase"
          >
            {{ option.name }}
          </p>
        </div>
      </div>
    </div>
  </div>
</template>
