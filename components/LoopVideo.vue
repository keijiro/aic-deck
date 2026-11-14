<!--
Muted loop clip. In print/export it shows the `-print.jpg` poster instead of playing.
-->
<script setup>
import { computed } from 'vue'
import { usePrintVideo } from '../utils/printVideo'
import { withBase } from '../utils/base'

const props = defineProps({
  src: { type: String, required: true },
})

const url = computed(() => withBase(props.src))
const { noPlay, poster, preload } = usePrintVideo(() => url.value)
</script>

<template>
  <video :src="url" :poster="poster" :preload="preload" :autoplay="!noPlay" muted loop playsinline />
</template>
