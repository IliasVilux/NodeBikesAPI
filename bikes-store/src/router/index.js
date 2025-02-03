import { createRouter, createWebHistory } from 'vue-router'

import HomeView from '@/views/HomeView.vue'
import BikesView from '@/views/BikesListView.vue'
import DetailView from '@/views/BikeDetailView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
    },
    {
      path: '/motos',
      name: 'bikes',
      component: BikesView,
    },
    {
      path: '/moto/:id',
      name: 'detail',
      component: DetailView,
    },
  ],
})

export default router
