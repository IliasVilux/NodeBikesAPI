<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'
import BikeCard from '@/components/common/BikeCard.vue'

const props = defineProps({
  bikeId: {
    type: String,
    required: true
  }
})
const relatedBikes = ref([])

const fetchRelatedBikes = async () => {
  try {
    const responseRelatedBikes = await axios.get(
      `${import.meta.env.VITE_API_URL}/motos/${props.bikeId}/related`,
    )
    relatedBikes.value = responseRelatedBikes.data
  } catch (err) {
    console.log(err)
  }
}

onMounted(() => {
  fetchRelatedBikes()
})
</script>

<template>
  <div v-if="relatedBikes.length > 0" class="max-w-screen-xl mx-auto px-4">
      <div class="mt-28">
        <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
          <BikeCard v-for="bike in relatedBikes" :key="bike.id" :bike="bike" />
        </div>
      </div>
    </div>
</template>
