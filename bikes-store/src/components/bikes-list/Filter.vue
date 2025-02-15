<script setup>
import { onMounted, onUnmounted, ref } from 'vue'
import { RouterLink, useRoute } from 'vue-router'
import axios from 'axios'

import Svg from '@/components/common/Svg.vue'

const route = useRoute()

const isFiltersOpenMobile = ref(false)
const openDropdowns = ref({
  category: false,
  engine_capacity: false,
  brand: false,
})

const filterRef = ref(null)

const toggleDropdown = (key) => {
  for (const k in openDropdowns.value) {
    if (k != key) {
      openDropdowns.value[k] = false
    }
  }
  openDropdowns.value[key] = !openDropdowns.value[key]
}

const handleClickOutside = (event) => {
  if (filterRef.value && !filterRef.value.contains(event.target)) {
    openDropdowns.value = { category: false, engine_capacity: false, brand: false }
  }
}

onMounted(() => {
  document.addEventListener('click', handleClickOutside)
})

onUnmounted(() => {
  document.removeEventListener('click', handleClickOutside)
})

const engineCapacities = [
  { id: '49', name: '49cc' },
  { id: '125', name: '125cc' },
  { id: '200-400', name: '200-400cc' },
  { id: '400-600', name: '400-600cc' },
  { id: '600-800', name: '600-800cc' },
  { id: '900', name: '+900cc' },
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
  <div ref="filterRef" class="w-full bg-neutral-900">
    <button
      class="flex w-full items-center justify-center py-3 text-white md:hidden cursor-pointer"
      @click="isFiltersOpenMobile = !isFiltersOpenMobile"
    >
      <h3 class="text-xl">Filtros</h3>
      <Svg
        name="arrow-simple-down"
        class="ml-2 size-7 transition-transform"
        :class="{ 'rotate-180': isFiltersOpenMobile }"
      />
    </button>

    <div :class="{ hidden: !isFiltersOpenMobile, 'md:block': true }">
      <div class="mx-auto grid max-w-6xl grid-cols-1 gap-4 md:grid-cols-3 pb-2">
        <div v-for="filter in filters" :key="filter.id" class="relative">
          <button
            class="flex w-full items-center justify-between border-b border-accent-blue px-4 py-3 text-left"
            :class="openDropdowns[filter.id] ? 'bg-white text-primary shadow-xl' : 'text-white'"
            @click="toggleDropdown(filter.id)"
          >
            <span class="uppercase">{{ filter.name }}</span>
            <Svg
              name="arrow-simple-down"
              class="size-7 text-accent-orange transition-transform"
              :class="{ 'rotate-180': openDropdowns[filter.id] }"
            />
          </button>

          <div
            v-if="openDropdowns[filter.id]"
            class="absolute left-0 z-10 w-full rounded-b-2xl border-b-4 border-accent-blue bg-white shadow-md"
          >
            <RouterLink
              v-for="(option, i) in filter.options"
              :key="i"
              :to="{ name: 'bikes', query: { ...route.query, [filter.apiParam]: option.id } }"
              class="block cursor-pointer px-4 py-3 uppercase hover:font-medium"
            >
              {{ option.name }}
            </RouterLink>
          </div>
        </div>
      </div>

      <div
        v-if="Object.keys(route.query).length"
        class="flex flex-wrap justify-center gap-2 pt-1 pb-4 text-white"
      >
        <RouterLink
          v-for="(routeParam, key, index) in route.query"
          :key="index"
          :to="{
            name: 'bikes',
            query: Object.fromEntries(
              Object.entries(route.query).filter(([paramKey]) => paramKey !== key),
            ),
          }"
          class="flex items-center gap-3 rounded-full bg-accent-blue px-4 py-1 uppercase"
        >
          <p v-if="filters[0].options.length && key == 'categoria'">
            {{ filters[0].options.find((e) => e.id == routeParam)?.name }}
          </p>
          <p v-else-if="key == 'cilindrada'">{{ routeParam }}cc</p>
          <p v-else-if="filters[2].options.length && key == 'marca'">
            {{ filters[2].options.find((e) => e.id == routeParam)?.name }}
          </p>
          <Svg name="cross" class="size-5 cursor-pointer" />
        </RouterLink>
      </div>
    </div>
  </div>
</template>
