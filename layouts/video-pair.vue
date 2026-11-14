<!--
Video pair layout: two projects stacked vertically, each row with a muted loop clip
on the left and its text on the right. Frontmatter `videos` (two paths) and optional
`qrs` (two image paths, same order); `::top::` / `::bottom::` slots hold the text.
Each QR code keeps the shared `.slide-qr` size and sits at the right end of its row.
-->
<script setup>
import { withBase } from '../utils/base'

defineProps({
  videos: { type: Array, required: true },
  qrs: { type: Array, default: () => [] },
})
</script>

<template>
  <div class="slidev-layout video-pair">
    <div v-for="(slot, i) in ['top', 'bottom']" :key="slot" class="video-pair-row">
      <LoopVideo :src="videos[i]" />
      <div><slot :name="slot" /></div>
      <img v-if="qrs[i]" :src="withBase(qrs[i])" class="slide-qr" alt="QR code" />
    </div>
  </div>
</template>

<style>
.slidev-layout.video-pair {
  display: grid;
  grid-template-rows: repeat(2, minmax(0, 1fr));
  gap: 24px;
  /* Shift right: more room from the logo on the left, the QR codes move closer to the edge */
  padding-left: 96px;
  padding-right: 32px;
}

.video-pair-row {
  display: grid;
  grid-template-columns: auto minmax(0, 1fr) auto;
  gap: 40px;
  align-items: center;
  min-height: 0;
}

/* Fixed width so that two 16:9 clips fit the slide height */
.video-pair-row video {
  width: 380px;
}

.video-pair-row h1 {
  margin-bottom: 0.5rem;
}

/* Per-row QR: same size as .slide-qr, but in the row's flow instead of the corner */
.video-pair-row .slide-qr {
  position: static;
  align-self: end;
}
</style>
