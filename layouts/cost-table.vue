<!--
Cost table layout: centered table with click-driven cell highlights.
`table` (frontmatter) names the highlight set in style.css (e.g. cost-single);
the wrapper gets `hl-N` following $clicks. `note` adds a muted footnote.
-->
<script setup>
import { useSlideContext } from '@slidev/client'

defineProps({
  table: { type: String, required: true },
  note: { type: String, default: '' },
})

const { $clicks } = useSlideContext()
</script>

<template>
  <div class="slidev-layout center h-full grid place-content-center">
    <div class="my-auto">
      <div class="cost-hl" :class="[table, `hl-${$clicks}`]">
        <slot />
      </div>
      <p v-if="note" class="text-sm text-right" style="color: var(--c-muted)">{{ note }}</p>
    </div>
  </div>
</template>
