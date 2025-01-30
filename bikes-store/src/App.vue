<script setup>
import { RouterView } from 'vue-router'
</script>

<template>
  <div
    class="absolute inset-0 -z-10 h-full w-full bg-background [background:radial-gradient(125%_125%_at_50%_10%,#fff_40%,#DBEAFE_100%)]"
  ></div>
  <RouterView />
</template>
