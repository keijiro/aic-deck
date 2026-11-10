<!--
Cover layout, following the Unite 2026 template ("Cover + Title").
Background: public/images/unite/cover.jpg. The slide content (normally a single
`# Title`) is centered in the template's title box, converted to the 980px canvas:
left 132.9px, top 145.7px, 714.2 x 223.8px, 40pt (54.4px) / weight 400.
-->
<template>
  <div class="slidev-layout cover">
    <div class="cover-title"><slot /></div>
  </div>
</template>

<style>
.slidev-layout.cover {
  background: url('/images/unite/cover.jpg') center / cover no-repeat;
}

.cover-title {
  position: absolute;
  left: 132.9px;
  top: 145.7px;
  width: 714.2px;
  height: 223.8px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  text-align: center;
}

.slidev-layout .cover-title h1 {
  font-size: 54.4px;
  font-weight: 400;
  line-height: 1.2;
  margin: 0;
}
</style>
