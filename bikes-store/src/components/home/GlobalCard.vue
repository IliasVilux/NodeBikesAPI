<script setup>
import { RouterLink } from 'vue-router'

import Svg from '@/components/common/Svg.vue'

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
  return `/images/${category}/${name.toLowerCase()}.png`
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
  <RouterLink :to="getLink()" class="group hover:-translate-y-1 transition duration-300">
    <div
      class="flex flex-col items-center aspect-square overflow-hidden rounded-2xl border border-border-light bg-white"
    >
      <img
        :src="getImagePath(item.name, type)"
        :alt="item.name"
        class="size-20 md:size-36 lg:size-28 xl:size-44 flex-grow object-contain"
      />

      <div
        class="flex w-full justify-between px-6 py-3 bg-accent-blue text-accent-blue-light group-hover:bg-accent-blue-light group-hover:text-text-primary group-hover:border-t group-hover:border-border-light transition duration-200"
      >
        <p class="truncate uppercase lg:text-lg">{{ item.name }}</p>
        <Svg name="arrow-right" class="size-6 text-accent-orange" />
      </div>
    </div>
  </RouterLink>
</template>
