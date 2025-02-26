<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import axios from 'axios'

import { useAuthStore } from '@/stores/auth'
import Svg from '@/components/common/Svg.vue'

const router = useRouter()
const authStore = useAuthStore()
const props = defineProps({
  mode: {
    type: String,
    required: true,
  },
})
const formData = ref({
  email: '',
  password: '',
})
const error = ref('')

const handleLogin = async () => {
  console.log(1)
  await axios
    .post('https://reqres.in/api/login', {
      ...formData.value,
    })
    .then((response) => {
      authStore.setToken(response.data.token)
      router.push({ name: 'home' })
    })
    .catch((err) => {
      error.value = err.response?.data?.error
    })
}
const handleRegister = async () => {
  console.log(2)
  await axios
    .post('https://reqres.in/api/register', {
      ...formData.value,
    })
    .then((response) => {
      authStore.setToken(response.data.token)
      router.push({ name: 'home' })
    })
    .catch((err) => {
      error.value = err.response?.data?.error
    })
}
const handleSubmit = () => {
  console.log(3)
  console.log(formData.value.email)
  console.log(props.mode)
  if (formData.value.email && formData.value.password) {
    props.mode === 'login' ? handleLogin() : handleRegister()
  } else {
    error.value = 'Rellene los campos obligatorios'
  }
}
</script>

<template>
  <div class="flex items-center justify-center min-h-screen bg-background">
    <form
      @submit.prevent="handleSubmit"
      class="bg-white rounded-2xl w-[30rem] border border-border overflow-hidden"
    >
      <RouterLink
        to="/"
        class="flex items-center justify-between px-10 py-3 text-white bg-accent-blue hover:bg-accent-blue-light hover:text-text-primary transition-all duration-300"
      >
        <Svg name="logo" class="size-9" />
        <h4 class="text-xl font-semibold uppercase">Bikes API</h4>
      </RouterLink>

      <input
        type="email"
        class="form-control border border-border-light w-full m-7 mb-1 px-4 py-2 rounded-2xl bg-transparent text-text-primary focus:outline-none"
        v-model="formData.email"
        placeholder="Introduce tu correo"
      />
      <input
        type="password"
        class="form-control border border-border-light w-full m-7 mt-1 px-4 py-2 rounded-2xl bg-transparent text-text-primary focus:outline-none"
        v-model="formData.password"
        placeholder="Introduce tu contraseña"
      />

      <div class="mx-7 flex items-center mb-7 gap-2">
        <button
          type="submit"
          class="bg-accent-blue hover:bg-accent-blue-light hover:text-accent-blue transition duration-300 rounded-full py-1 px-4 text-white"
        >
          {{ props.mode == 'login' ? 'Iniciar sesión' : 'Registrarse' }}
        </button>
        <p v-if="error" class="font-light text-accent-orange">Error: {{ error }}</p>
      </div>
    </form>
  </div>
</template>
