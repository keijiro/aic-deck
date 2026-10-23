<!--
Full-screen video layout: plays `video` (frontmatter) edge to edge on black,
with sound, restarting from the beginning each time the slide is entered.
-->
<script setup>
defineProps({
  video: { type: String, required: true },
})
</script>

<template>
  <div class="slidev-layout fullvideo">
    <SlidevVideo class="fullvideo-player" autoplay autoreset="slide">
      <source :src="video" type="video/mp4" />
    </SlidevVideo>
  </div>
</template>

<style>
.slidev-layout.fullvideo {
  padding: 0;
  background: black;
}

.fullvideo-player {
  width: 100%;
  height: 100%;
  object-fit: contain;
}
</style>
