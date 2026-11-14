<!--
Full-screen video layout: plays `video` (frontmatter) edge to edge on black,
with sound, restarting from the beginning each time the slide is entered.
In print/export it shows the `-print.jpg` poster (see utils/printVideo.ts).
-->
<script setup>
import { useSlideContext } from '@slidev/client'
import { computed } from 'vue'
import { usePrintVideo } from '../utils/printVideo'
import { withBase } from '../utils/base'

const props = defineProps({
  video: { type: String, required: true },
})

const url = computed(() => withBase(props.video))
const { poster, preload } = usePrintVideo(() => url.value)

// Audio only in the play-mode window; presenter view shows the video muted.
const { $renderContext } = useSlideContext()
</script>

<template>
  <div class="slidev-layout fullvideo">
    <SlidevVideo class="fullvideo-player" autoplay autoreset="slide"
                 :print-poster="poster" :preload="preload"
                 :muted="$renderContext !== 'slide'">
      <source :src="url" type="video/mp4" />
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
