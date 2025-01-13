<script setup>
import { RouterView } from 'vue-router'

import Footer from '@/components/Footer.vue'
import Header from '@/components/Header.vue'
import PromoHeader from '@/components/PromoHeader.vue'
</script>

<template>
  <PromoHeader />
  <Header />
  <RouterView />
  <Footer />
</template>
