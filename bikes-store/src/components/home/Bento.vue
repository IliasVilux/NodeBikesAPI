<script setup>
import Svg from '@/components/common/Svg.vue'
</script>

<template>
  <div class="items-start lg:flex gap-4 max-w-screen-2xl mt-28 mx-auto px-4 lg:space-y-0 space-y-4">
    <div class="flex-1 flex flex-col px-10 py-7 space-y-4 bg-white border border-border-light rounded-2xl">
      <h4 class="text-2xl">
        Lorem, ipsum.
      </h4>
      <div class="space-y-3">
        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. A nulla impedit culpa iusto nihil eligendi omnis
          consequuntur minus sed reiciendis.</p>
        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aspernatur, veniam eaque. Iste assumenda ipsam
          officiis et sint quasi perspiciatis omnis nisi. Optio laudantium vitae numquam, nihil sunt quas placeat
          sapiente, aliquam reiciendis ipsum, repellat veniam!</p>
      </div>
      <div class="flex justify-end mt-4">
        <a href="#">
          <Svg name="arrow-link" class="size-6 text-accent-orange" />
        </a>
      </div>
    </div>

    <div class="flex-1 flex flex-col px-10 py-7 space-y-4 bg-white border border-border-light rounded-2xl">
      <h4 class="text-2xl">
        Lorem, ipsum dolor.
      </h4>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum libero mollitia excepturi cupiditate, nostrum
        nemo?</p>
      <div class="mt-4">
        <RouterLink :to="{ name: 'bikes' }" class="flex items-center text-accent-orange">
          <p>Descubre más</p>
          <Svg name="arrow-link" class="size-6" />
        </RouterLink>
      </div>
    </div>
  </div>
</template>
