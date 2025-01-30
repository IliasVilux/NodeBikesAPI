<script setup>
import { computed, onMounted, onUnmounted, ref } from 'vue'
import Svg from '@/components/Svg.vue'

const isOpen = ref(false)
const searchInput = ref(null)

const toggleSearch = () => {
  isOpen.value = !isOpen.value
  if (isOpen.value) {
    setTimeout(() => searchInput.value?.focus(), 50)
  }
}

const keywords = ['Yamaha', 'Honda', 'Kawasaki', 'Ténéré']
const currentIndex = ref(0)
const isAnimatingOut = ref(false)
const searchQuery = ref('')
const currentKeyword = computed(() => keywords[currentIndex.value])
let intervalId
onMounted(() => {
  intervalId = setInterval(nextKeyword, 4000)
})
onUnmounted(() => {
  clearInterval(intervalId)
})

const nextKeyword = () => {
  isAnimatingOut.value = true
  setTimeout(() => {
    isAnimatingOut.value = false
    currentIndex.value = (currentIndex.value + 1) % keywords.length
  }, 300)
}
</script>

<template>
  <div class="flex items-center h-10 my-2 lg:my-0">
    <button @click="toggleSearch" class="relative inline-flex items-center justify-center rounded-md p-2 lg:p-0">
      <Svg v-if="!isOpen" name="magnifying-glass" class="size-5" />
    </button>

    <div v-if="isOpen"
      class="w-full lg:w-64 h-full flex items-center bg-white border border-border-light rounded-full me-2 lg:me-0 ps-4 pe-2 md:ps-3 transition">
      <div class="text-text-secondary absolute pointer-events-none" :class="{ 'opacity-0': searchQuery }">
        <span>Busca </span>
        <span class="font-semibold" :class="isAnimatingOut ? 'animate-slide-out' : 'animate-slide-in'">{{ currentKeyword
          }}</span>
      </div>

      <input v-model="searchQuery" placeholder="" autocomplete="off"
        class="text-text-primary size-full bg-transparent focus:outline-none" />

      <button @click="toggleSearch">
        <Svg name="cross" class="size-6 text-text-secondary" />
      </button>
    </div>
  </div>
</template>

<style scoped>
@keyframes slide-in {
  0% {
    opacity: 0;
  }

  50% {
    opacity: 1;
  }

  100% {
    opacity: 1;
  }
}

@keyframes slide-out {
  0% {
    opacity: 1;
  }

  50% {
    opacity: 1;
  }

  100% {
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
