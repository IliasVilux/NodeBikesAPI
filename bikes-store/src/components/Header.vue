<script setup>
import { RouterLink } from 'vue-router'

import Svg from '@/components/Svg.vue'
import SearchBar from '@/components/SearchBar.vue'
</script>

<template>
  <header class="w-full bg-white">
    <nav
      class="max-w-4xl mx-auto flex flex-col md:flex-row items-center justify-between py-2 px-2 md:px-0 gap-y-2"
    >
      <RouterLink to="/">
        <Svg name="logo" />
      </RouterLink>
      <SearchBar />
    </nav>
  </header>
</template>
