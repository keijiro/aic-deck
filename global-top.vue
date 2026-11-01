<!--
Brand marks (Unity logo / "UNITE/") on every slide, see components/BrandOverlay.vue.
Review-copy warning overlaid on every slide in exported files (PDF/PNG/PPTX).
Not shown in the dev server or the static site build.
-->
<script setup lang="ts">
import { useNav } from '@slidev/client'

const { isPrintMode } = useNav()
</script>

<template>
  <BrandOverlay />
  <div v-if="isPrintMode" class="review-copy">
    <div class="review-copy-mark">確認用</div>
    <div class="review-copy-banner">このファイルは確認用です。本番での使用を禁止します。</div>
  </div>
</template>
