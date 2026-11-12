<!--
Cover layout, following the Unite 2026 template ("Cover + Title").
Background: public/images/unite/cover.jpg. The slide content (normally a single
`# Title`) is left-aligned and vertically centered in the template's title box,
converted to the 980px canvas: left 132.9px, top 145.7px, 714.2 x 223.8px, weight 600. The template's 40pt (54.4px)
is reduced to 37px (1st line) / 43px (2nd and 3rd lines) to fit the long Japanese title
to the box width.
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
  text-align: left;
}

.slidev-layout .cover-title h1 {
  font-size: 37px;
  font-weight: 600;
  line-height: 1.5;
  letter-spacing: -0.03em;
  white-space: nowrap;
  /* lighter gray: muted mixed with white; half (0.5px) of the width shows outside the glyphs */
  -webkit-text-stroke: 1px color-mix(in srgb, var(--c-muted), white 50%);
  paint-order: stroke fill; /* outline outside the glyphs, not eating into them */
  margin: 0;
}

/* Slightly larger main lines (2nd and 3rd), wrapped in `<span class="cover-main">`
   (a block, so it starts on a new line and gets its own, tighter line height) */
.slidev-layout .cover-title h1 .cover-main {
  display: block;
  margin-top: 0.15em;
  font-size: 43px;
  line-height: 1.3;
  letter-spacing: -0.06em;
}

/* Latin words keep the base tracking (-0.03em, same ratio as the 1st line) */
.slidev-layout .cover-title h1 .latin {
  letter-spacing: -0.03em;
}

/* Slightly smaller kana, wrapped manually in the title (`<span class="kana">`) */
.slidev-layout .cover-title h1 .kana {
  font-size: 0.88em;
}
</style>
