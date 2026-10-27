<!--
Drifting muted loop clips: each slot fades in at a random spot, drifts outward
from the slide center and fades out, then respawns elsewhere with the next clip.
Slots are phase-staggered so several clips are always on screen.
In print/export the animation is paused (each slot frozen at its own phase).
-->
<script setup>
import { reactive } from 'vue'
import { usePrintVideo } from '../utils/printVideo'

const props = defineProps({
  srcs: { type: Array, required: true },
  slots: { type: Number, default: 5 },
  duration: { type: Number, default: 9 },
})

const { noPlay } = usePrintVideo(() => '')

const GOLDEN_ANGLE = 2.39996
let spawn = 0

function place(slot) {
  const k = spawn++
  const angle = k * GOLDEN_ANGLE + (Math.random() - 0.5) * 0.6
  const radius = 0.1 + Math.random() * 0.2
  const dx = Math.cos(angle), dy = Math.sin(angle)
  slot.src = props.srcs[k % props.srcs.length]
  slot.x = 50 + dx * radius * 100
  slot.y = 50 + dy * radius * 100
  slot.dx = dx * 360
  slot.dy = dy * 220
}

const items = reactive(Array.from({ length: props.slots }, () => ({})))
items.forEach(place)
</script>

<template>
  <div class="video-drift" :class="{ paused: noPlay }">
    <div
      v-for="(s, i) in items" :key="i"
      class="item"
      :style="{
        left: s.x + '%', top: s.y + '%',
        '--dx': s.dx + 'px', '--dy': s.dy + 'px',
        animationDuration: duration + 's',
        animationDelay: -i * duration / slots + 's',
      }"
      @animationiteration="place(s)"
    >
      <LoopVideo :src="s.src" />
    </div>
  </div>
</template>

<style>
.video-drift {
  position: absolute;
  inset: 0;
  overflow: hidden;
}

.video-drift .item {
  position: absolute;
  width: 34%;
  animation: video-drift linear infinite;
}

.video-drift.paused .item {
  animation-play-state: paused;
}

.video-drift video {
  display: block;
  width: 100%;
  aspect-ratio: 16 / 9;
  object-fit: cover;
  --fade: 16px;
  mask-image:
    linear-gradient(to right, transparent, black var(--fade), black calc(100% - var(--fade)), transparent),
    linear-gradient(to bottom, transparent, black var(--fade), black calc(100% - var(--fade)), transparent);
  mask-composite: intersect;
}

@keyframes video-drift {
  0% {
    opacity: 0;
    transform: translate(-50%, -50%) scale(0.85);
  }
  20%, 65% {
    opacity: 1;
  }
  100% {
    opacity: 0;
    transform: translate(calc(-50% + var(--dx)), calc(-50% + var(--dy))) scale(1.15);
  }
}
</style>
