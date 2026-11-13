<!--
Connection test layout (venue check before the talk): plays `video` (frontmatter)
with sound, autoplay, looping, with the slide content (notice text) below it.
In print/export it shows the `-print.jpg` poster (see utils/printVideo.ts).
-->
<script setup>
import { useSlideContext } from '@slidev/client'
import { usePrintVideo } from '../utils/printVideo'

const props = defineProps({
  video: { type: String, required: true },
})

const { poster, preload } = usePrintVideo(() => props.video)

// Audio only in the play-mode window; presenter view shows the video muted.
const { $renderContext } = useSlideContext()
</script>

<template>
  <div class="slidev-layout conntest">
    <SlidevVideo class="conntest-player" autoplay loop
                 :print-poster="poster" :preload="preload"
                 :muted="$renderContext !== 'slide'">
      <source :src="video" type="video/mp4" />
    </SlidevVideo>
    <div class="conntest-text"><slot /></div>
  </div>
</template>

<style>
.slidev-layout.conntest {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 28px;
  background: black;
}

.conntest-player {
  height: 62%;
  max-width: 100%;
}

.conntest-text {
  color: var(--c-red);
  text-align: center;
}

.conntest-text p {
  margin: 0.3em 0;
  font-size: 1.1rem;
  line-height: 1.5;
}
</style>
