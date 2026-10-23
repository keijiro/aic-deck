<!--
Video split layout: muted loop clip `video` (frontmatter) on the left (3/5),
slide content on the right (2/5), no fade.
-->
<script setup>
defineProps({
  video: { type: String, required: true },
})
</script>

<template>
  <div class="slidev-layout video-split">
    <video :src="video" muted autoplay loop playsinline />
    <div><slot /></div>
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
