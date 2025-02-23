<script setup>
import { ref, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import Svg from '@/components/common/Svg.vue'

const route = useRoute()
const router = useRouter()

const orders = ref([
  { id: 'year', name: 'Año', value: null },
  { id: 'cilindrada', name: 'Cilindrada', value: null },
])

// Al montar, recuperar el estado desde la query
onMounted(() => {
  const query = route.query.order_by
  if (query) {
    const [id, value] = query.split('_')
    const order = orders.value.find((o) => o.id === id)
    if (order) order.value = value
  }
})

// Modificar el orden y actualizar la URL manualmente
const handleOrder = (order) => {
  if (order.value === null) {
    order.value = 'desc'
  } else if (order.value === 'desc') {
    order.value = 'asc'
  } else {
    order.value = null
  }

  const newQuery = { ...route.query }

  if (order.value !== null) {
    newQuery.order_by = `${order.id}_${order.value}`
  } else {
    delete newQuery.order_by
  }

  // Navegar manualmente después de modificar el valor
  router.push({ name: 'bikes', query: newQuery })
}
</script>

<template>
  <div class="mt-3 flex gap-x-6">
    <p>Ordenar por:</p>
    <div class="flex gap-x-2">
      <button
        v-for="order in orders"
        :key="order.id"
        @click="handleOrder(order)"
        class="flex items-center gap-x-2 cursor-pointer"
      >
        <p>{{ order.name }}</p>

        <Svg
          v-if="order.value === 'desc' || order.value === 'asc'"
          name="arrow-simple-down"
          class="size-5 text-accent-blue"
          :class="{ 'rotate-180': order.value === 'asc' }"
        />
        <span v-else class="relative flex size-2 mr-2">
          <span
            class="animate-ping absolute inline-flex h-full w-full rounded-full bg-accent-blue dark:bg-accent-blue opacity-75"
          ></span>
          <span
            class="relative inline-flex rounded-full size-2 bg-accent-blue dark:bg-accent-blue"
          ></span>
        </span>
      </button>
    </div>
  </div>
</template>
