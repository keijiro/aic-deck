<!--
Video split layout: muted loop clip `video` (frontmatter) on the left (3/5),
slide content on the right (2/5), no fade. Uses <LoopVideo> for print posters.
Optional `qr` (image path) is pinned to the bottom-right corner of the slide,
out of the text flow.
-->
<script setup>
defineProps({
  video: { type: String, required: true },
  qr: { type: String, default: null },
})
</script>

<template>
  <div class="slidev-layout video-split">
    <LoopVideo :src="video" />
    <div><slot /></div>
    <img v-if="qr" :src="qr" class="slide-qr" alt="QR code" />
  </div>
</template>

<style>
.slidev-layout.video-split {
  display: grid;
  grid-template-columns: minmax(0, 3fr) minmax(0, 2fr);
  gap: 40px;
  align-items: center;
}

.video-split video {
  width: 100%;
}

</style>
