<script setup>
import { Swiper, SwiperSlide } from 'swiper/vue'
import { Navigation, EffectCoverflow } from 'swiper/modules'
import 'swiper/css'
import 'swiper/css/navigation'
import 'swiper/css/effect-coverflow'

defineProps({
  images: {
    type: Object,
    required: true,
  },
})

const modules = [Navigation, EffectCoverflow]
</script>

<template>
  <div class="w-full">
    <Swiper
      :modules="modules"
      :loop="true"
      :effect="'coverflow'"
      :navigation="true"
      :coverflow-effect="{
        depth: 500,
        rotate: 10,
        slideShadows: true,
        stretch: 120,
      }"
      :centeredSlides="true"
      :breakpoints="{
        640: { slidesPerView: 1 },
        1024: { slidesPerView: 1.5 },
      }"
      class="w-full max-w-4xl"
    >
      <SwiperSlide v-for="image in images" :key="image.id">
        <img :src="image.image_url" alt="Imagen de moto" class="w-full h-auto object-cover" />
      </SwiperSlide>
    </Swiper>
  </div>
</template>
