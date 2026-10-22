<!--
Big text layout (Takahashi method style): centered huge text, scaled so the
widest line fills the slide width (minus 15% padding on each side).
The font size is capped at `maxSize` px (overridable via frontmatter).
-->
<script setup>
import { ref, onMounted, onBeforeUnmount } from 'vue'

const props = defineProps({
  maxSize: { type: Number, default: 70 },
})

const box = ref()
const text = ref()
const BASE = 100

function fit() {
  const b = box.value, t = text.value
  if (!b || !t) return
  t.style.fontSize = BASE + 'px'
  if (!t.offsetWidth || !b.clientWidth) return // hidden slide
  const s = Math.min(b.clientWidth / t.offsetWidth, b.clientHeight / t.offsetHeight)
  t.style.fontSize = Math.min(BASE * s * 0.995, props.maxSize) + 'px'
}

let observer
onMounted(() => {
  fit()
  document.fonts?.ready.then(fit)
  observer = new ResizeObserver(fit)
  observer.observe(box.value)
})
onBeforeUnmount(() => observer?.disconnect())
</script>

<template>
  <div class="slidev-layout bigtext">
    <div ref="box" class="bigtext-box">
      <div ref="text" class="bigtext-text"><slot /></div>
    </div>
  </div>
</template>

<style>
.slidev-layout.bigtext {
  padding: 6% 15%;
}

.bigtext-box {
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.bigtext-text {
  display: inline-block;
  white-space: nowrap;
  text-align: center;
  font-weight: 700;
  line-height: 1.25;
}

.slidev-layout .bigtext-text * {
  font-size: inherit;
  line-height: inherit;
  margin: 0;
}

.slidev-layout .bigtext-text > * + * {
  margin-top: 0.5em;
}
</style>
