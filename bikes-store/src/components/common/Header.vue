<script setup>
import { ref } from 'vue'

import Svg from '@/components/common/Svg.vue'
import SearchBar from '@/components/common/SearchBar.vue'

const isMobileMenuOpen = ref(true)
</script>

<template>
  <nav
    class="relative z-10 mx-auto mt-0 lg:mt-3 lg:absolute left-0 right-0 max-w-5xl lg:text-white lg:ps-7 lg:pe-3 lg:py-2 bg-white lg:bg-transparent lg:border lg:rounded-full backdrop-blur-sm"
  >
    <div class="flex justify-between">
      <div class="flex gap-x-6 items-center">
        <div>
          <button
            type="button"
            class="relative inline-flex items-center justify-center rounded-md p-2 lg:hidden"
            aria-controls="mobile-menu"
            aria-expanded="false"
            @click="isMobileMenuOpen = !isMobileMenuOpen"
          >
            <span class="absolute -inset-0.5"></span>
            <span class="sr-only">Open main menu</span>
            <Svg v-if="!isMobileMenuOpen" name="menu" class="size-5 text-text-primary" />
            <Svg v-else name="cross" class="size-6 text-text-primary lg:text-white" />
          </button>
          <RouterLink to="/" class="hidden lg:flex">
            <Svg name="logo" class="size-9 text-text-primary lg:text-white" />
          </RouterLink>
        </div>
        <div class="hidden lg:flex">
          <RouterLink
            :to="{ name: 'bikes' }"
            aria-current="page"
            class="hover:text-accent-orange transition duration-300"
          >
            <span class="font-semibold">Encuentra</span> tu moto
          </RouterLink>
        </div>
      </div>

      <div class="flex gap-x-6 items-center">
        <SearchBar />

        <div class="hidden lg:block">
          <div v-if="false === false">
            <RouterLink
              :to="{ name: 'home' }"
              class="hover:text-accent-blue-light transition duration-300 me-4"
              >Cerrar sesión
            </RouterLink>
          </div>
          <div v-else class="text-white">
            <RouterLink
              :to="{ name: 'home' }"
              class="hover:text-accent-blue-light transition duration-300"
              >Iniciar sesión
            </RouterLink>
            <RouterLink :to="{ name: 'home' }">
              <button
                class="whitespace-nowrap bg-accent-blue hover:bg-accent-blue-light hover:text-accent-blue transition duration-300 rounded-full py-1 px-4 ms-3"
              >
                Registrarse
              </button>
            </RouterLink>
          </div>
        </div>
      </div>
    </div>

    <div v-if="isMobileMenuOpen" class="absolute w-full bg-white lg:hidden" id="mobile-menu">
      <div class="space-y-1 mx-2 my-5">
        <RouterLink
          :to="{ name: 'bikes' }"
          aria-current="page"
          class="hover:text-accent-orange transition duration-300"
        >
          <span class="font-semibold">Encuentra</span> tu moto
        </RouterLink>
        <div class="border-t border-accent-blue-light pt-3">
          <RouterLink
            v-if="false === false"
            :to="{ name: 'home' }"
            class="hover:text-accent-orange transition duration-300"
            >Cerrar sesión
          </RouterLink>
          <div v-else class="flex justify-between items-center">
            <RouterLink
              :to="{ name: 'home' }"
              class="hover:text-accent-orange transition duration-300"
              >Iniciar sesión
            </RouterLink>
            <RouterLink
              :to="{ name: 'home' }"
              class="hover:text-accent-orange transition duration-300"
              >Registrarse
            </RouterLink>
          </div>
        </div>
      </div>
    </div>
  </nav>
</template>
