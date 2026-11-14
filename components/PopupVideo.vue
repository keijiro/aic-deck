<!--
Pop-up video player: appears at click `at` covering the whole slide (full-screen fit,
no margin) and plays
`src` once with sound; the next click hides it (stopping playback if still running).
The slide needs `clicks:` in its frontmatter to cover `at + 1`.
In print/export it shows the `-print.jpg` poster (see utils/printVideo.ts).
-->
<script setup>
import { useSlideContext } from '@slidev/client'
import { computed } from 'vue'
import { usePrintVideo } from '../utils/printVideo'
import { withBase } from '../utils/base'

const props = defineProps({
  src: { type: String, required: true },
  at: { type: Number, default: 1 },
})

// Audio only in the play-mode window; presenter view shows the video muted.
const { $clicks, $renderContext } = useSlideContext()
const shown = computed(() => $clicks.value === props.at)
const url = computed(() => withBase(props.src))
const { noPlay, poster, preload } = usePrintVideo(() => url.value)
</script>

<template>
  <Transition name="popup-video">
    <div v-if="shown" class="popup-video">
      <video :src="url" :poster="poster" :preload="preload" :autoplay="!noPlay"
             :muted="$renderContext !== 'slide'" playsinline />
    </div>
  </Transition>
</template>

<style>
.popup-video {
  position: absolute;
  inset: 0;
  z-index: 10;
  display: flex;
  align-items: center;
  justify-content: center;
}

.popup-video video {
  width: 100%;
  height: 100%;
  object-fit: contain;
  background: black;
}

.popup-video-enter-active,
.popup-video-leave-active {
  transition: opacity 0.3s, transform 0.3s;
}

.popup-video-enter-from,
.popup-video-leave-to {
  opacity: 0;
  transform: scale(0.95);
}
</style>
