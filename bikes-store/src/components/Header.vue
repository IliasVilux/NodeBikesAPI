<script setup>
import Svg from '@/components/Svg.vue'
import SearchBar from '@/components/SearchBar.vue';
</script>

<template>
    <header class="w-full bg-white">
        <nav class="max-w-4xl mx-auto flex items-center justify-between py-2 px-2 md:px-0">
            <Svg name="logo" />
            <SearchBar />
        </nav>
    </header>
</template>
