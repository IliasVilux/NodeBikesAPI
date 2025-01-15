<script setup>
import { RouterLink } from 'vue-router'
import Svg from '@/components/Svg.vue'

defineProps({
    brand: {
        type: Object,
        required: true,
    }
})
</script>

<template>
    <RouterLink to="/">
        <div class="bg-card rounded-md shadow-lg grid grid-rows-4 grid-cols-3 overflow-hidden">
        <div class="row-span-3 col-span-2 flex items-center justify-center aspect-[4/3] group">
            <img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pngall.com%2Fwp-content%2Fuploads%2F11%2FYamaha-Logo-PNG-Image-File.png&f=1&nofb=1&ipt=48710cf17b9a61b05cc546ac8238ea6d23eba5642f68abe4f1e14c81c0f06b0b&ipo=images" alt="" class="size-20 transition-transform duration-300 ease-in-out group-hover:scale-105">
        </div>
        <div class="row-span-3 col-span-1 bg-border"></div>
        <div class="col-span-2 bg-accent-hover flex items-center px-5 py-2">
            <h3 class="uppercase text-white text-sm font-bold truncate">{{ brand.name }}</h3>
        </div>
        <div class="bg-accent text-white flex items-center justify-center">
            <Svg name="arrow-right" class="size-5" />
        </div>
    </div>
    </RouterLink>
</template>
