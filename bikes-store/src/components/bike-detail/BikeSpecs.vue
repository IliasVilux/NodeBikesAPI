<script setup>
import axios from 'axios'
import { onMounted, ref } from 'vue'
import { RouterLink } from 'vue-router'

const props = defineProps({
  bike: {
    type: Object,
    required: true,
  },
})

const brand = ref('')
const category = ref('')

const fetchData = async () => {
  try {
    const responseBrand = await axios.get(
      `${import.meta.env.VITE_API_URL}/marcas/${props.bike.brand_id}`,
    )
    const responseCategory = await axios.get(
      `${import.meta.env.VITE_API_URL}/categorias/${props.bike.category_id}`,
    )

    brand.value = responseBrand.data[0].name
    category.value = responseCategory.data[0].name
  } catch (err) {
    console.log(err)
  }
}

onMounted(fetchData)
</script>

<template>
  <div v-if="brand && category" class="w-full bg-white border-y border-border-light my-20">
    <section class="max-w-screen-2xl mx-auto px-4 py-12">
      <h4 class="text-xl font-semibold">
        DETALLES DE LA MOTO
      </h4>
      <p class="mt-4 mb-12">
        Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aspernatur, veniam eaque. Iste
        assumenda ipsam officiis et sint quasi perspiciatis omnis nisi. Optio laudantium vitae
        numquam, nihil sunt quas placeat sapiente, aliquam reiciendis ipsum, repellat veniam!
      </p>
      <div class="w-full max-w-7xl mx-auto flex flex-wrap justify-center gap-y-6">
        <div class="flex items-center px-3 border-e-2 border-border-light h-4">
          <p class="uppercase mr-4">Cilindrada</p>
          <p class="font-bold">{{ bike.engine_capacity }}cc</p>
        </div>
        <div class="flex items-center px-3 border-e-2 border-border-light h-4">
          <p class="uppercase mr-4">Marca</p>
          <p class="font-bold">Yamaha</p>
        </div>
        <div class="flex items-center px-3 border-e-2 border-border-light h-4">
          <p class="uppercase mr-4">Modelo</p>
          <p class="font-bold">{{ bike.name }}</p>
        </div>
        <div class="flex items-center px-3 border-e-2 border-border-light h-4">
          <p class="uppercase mr-4">Año</p>
          <p class="font-bold">{{ bike.year }}</p>
        </div>
        <div class="flex items-center px-3 border-e-2 border-border-light h-4">
          <p class="uppercase mr-4">Marca</p>
          <p class="font-bold">{{ brand }}</p>
        </div>
        <div class="flex items-center px-3 h-4">
          <p class="uppercase mr-4">Estilo</p>
          <p class="font-bold">{{ category }}</p>
        </div>
      </div>
    </section>
  </div>
</template>
