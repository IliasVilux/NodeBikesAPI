<script setup>
import { ref, onMounted, onUnmounted, computed } from 'vue'
import Svg from '@/components/Svg.vue'

const keywords = ['Yamaha', 'Honda', 'Kawasaki', 'Ténéré']
const currentIndex = ref(0)
const isAnimatingOut = ref(false)
const searchQuery = ref('')
const currentKeyword = computed(() => keywords[currentIndex.value])

const nextKeyword = () => {
    isAnimatingOut.value = true
    setTimeout(() => {
        isAnimatingOut.value = false
        currentIndex.value = (currentIndex.value + 1) % keywords.length
    }, 300)
}

let intervalId
onMounted(() => {
    intervalId = setInterval(nextKeyword, 4000)
})
onUnmounted(() => {
    clearInterval(intervalId)
})

const handleSubmit = (e) => {
    e.preventDefault()
    console.log(searchQuery.value)
}
</script>

<template>
    <form class="w-full md:w-72 flex items-center relative" @submit="handleSubmit">
        <!-- Contenedor del input -->
        <div
            class="w-full flex items-center border border-border rounded-full px-4 md:px-3 focus-within:ring-0 focus-within:border-black transition">
            <!-- Icono de lupa -->
            <Svg name="magnifying-glass" class="size-5 text-gray-500" />

            <!-- Placeholder animado -->
            <div class="absolute left-11 pointer-events-none text-gray-400"
                :class="{ 'opacity-0': searchQuery }">
                <span>Busca </span>
                <span class="font-semibold" :class="isAnimatingOut ? 'animate-slide-out' : 'animate-slide-in'">{{
                    currentKeyword }}</span>
            </div>

            <!-- Input -->
            <input v-model="searchQuery" type="search" placeholder="" autocomplete="off"
                class="size-full bg-transparent pl-2 py-2 focus:outline-none" />
        </div>

        <!-- Botón de búsqueda -->
        <button type="submit"
            class="text-xs text-white bg-accent hover:bg-accent-hover transition duration-300 rounded-full absolute right-[6px] top-1/2 -translate-y-1/2 px-4 md:px-2 py-2 md:py-1">Buscar</button>
    </form>
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
