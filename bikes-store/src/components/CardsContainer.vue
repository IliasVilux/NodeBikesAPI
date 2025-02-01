<script setup>
import { RouterLink } from 'vue-router'

import GlobalCard from '@/components/GlobalCard.vue'

defineProps({
  items: {
    type: Object,
    required: true,
  },
  itemsType: {
    type: String,
    required: true,
  },
  loading: {
    type: Boolean,
    required: true,
  },
  error: {
    type: Object,
    required: false,
  },
})

const itemsTranslate = {
  brand: 'Marca',
  category: 'Estilo',
}
</script>

<template>
  <div class="max-w-screen-2xl mx-auto px-4 mt-28">
    <div class="flex justify-between items-baseline mb-8">
      <h4 class="text-2xl">
        Buscar por <span class="capitalize">{{ itemsTranslate[itemsType] }}</span>
      </h4>
      <RouterLink
        :to="{ name: 'bikes' }"
        class="text-text-secondary hover:text-accent-orange transition duration-300"
      >
        Mostrar todos
      </RouterLink>
    </div>

    <div v-if="loading" class="text-center bg-white border border-border-light rounded-2xl p-4">
      Cargando...
    </div>

    <div v-else-if="error" class="bg-white border border-border-light rounded-2xl p-4">
      Error: {{ error }}
    </div>

    <div v-else class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
      <GlobalCard v-for="item in items" :key="item.id" :item="item" :type="itemsType" />
    </div>
  </div>
</template>
