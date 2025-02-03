<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'

const promoTexts = [
  'Las <strong>mejores motos</strong> al mejor precio, siempre cerca de ti.',
  'Tu moto ideal te espera: <strong>calidad, estilo y velocidad</strong>.',
  'Resolvemos tus dudas en menos de <strong>24 horas</strong>, garantizado.',
  'Encuentra tu próxima aventura sobre ruedas.',
  '<strong>Variedad, calidad y servicio</strong>: todo en un solo lugar.',
]
const currentTextIndex = ref(0)
const isAnimatingOut = ref(false)
const currentText = computed(() => promoTexts[currentTextIndex.value])

const nextText = () => {
  isAnimatingOut.value = true
  setTimeout(() => {
    isAnimatingOut.value = false
    currentTextIndex.value = (currentTextIndex.value + 1) % promoTexts.length
  }, 300)
}

let intervalId
onMounted(() => {
  intervalId = setInterval(nextText, 7000)
})
onUnmounted(() => {
  clearInterval(intervalId)
})
</script>

<template>
  <div class="flex w-full items-center justify-center bg-accent-blue px-6 py-2 text-white">
    <div class="relative overflow-hidden">
      <p
        v-html="currentText"
        class="text-sm transition-transform duration-300 ease-in-out"
        :class="isAnimatingOut ? 'animate-slide-out' : 'animate-slide-in'"
      ></p>
    </div>
  </div>
</template>

<style scoped>
@keyframes slide-in {
  0% {
    transform: translateY(50%);
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}

@keyframes slide-out {
  0% {
    transform: translateY(0);
    opacity: 1;
  }
  50% {
    opacity: 1;
  }
  100% {
    transform: translateY(-50%);
    opacity: 0;
  }
}

.animate-slide-in {
  animation: slide-in 300ms ease-in-out forwards;
}

.animate-slide-out {
  animation: slide-out 300ms ease-in-out forwards;
}
</style>
