<!--
Muted loop clip. In print/export it shows the `-print.jpg` poster instead of playing.
-->
<script setup>
import { usePrintVideo } from '../utils/printVideo'

const props = defineProps({
  src: { type: String, required: true },
})

const { noPlay, poster, preload } = usePrintVideo(() => props.src)
</script>

<template>
  <video :src="src" :poster="poster" :preload="preload" :autoplay="!noPlay" muted loop playsinline />
</template>
