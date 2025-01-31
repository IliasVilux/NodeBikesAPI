<script setup>
import { RouterLink } from 'vue-router'
import Svg from '@/components/Svg.vue'

const { item, type } = defineProps({
  item: {
    type: Object,
    required: true,
  },
  type: {
    type: String,
    required: true,
  },
})

const getImagePath = (name, category) => {
  return new URL(`/src/assets/images/${category}/${name.toLowerCase()}.png`, import.meta.url).href
}

const getLink = () => {
  switch (type) {
    case 'brand':
      return { name: 'bikes', query: { marca: item.id } }
    case 'category':
      return { name: 'bikes', query: { categoria: item.id } }
    default:
      return { name: 'bikes' }
  }
}
</script>

<template>
  <RouterLink :to="getLink()" class="hover:-translate-y-1 transition duration-300">
    <div class="bg-white aspect-square rounded-2xl overflow-hidden border border-border-light flex flex-col items-center">
      <img :src="getImagePath(item.name, type)" :alt="item.name" class="size-20 md:size-36 lg:size-28 xl:size-44 object-contain flex-grow" />

      <div class="w-full text-accent-blue-light bg-accent-blue flex justify-between px-6 py-3">
        <p class="lg:text-lg truncate uppercase">{{ item.name }}</p>
        <Svg name="arrow-right" class="size-6 text-accent-orange" />
      </div>
    </div>
  </RouterLink>
</template>
