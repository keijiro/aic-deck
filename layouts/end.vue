<!--
End layout, following the Unite 2026 template ("Thank you").
Background: public/images/unite/thanks.jpg. Shows "Thank you" unless the slide
has content. Text box converted to the 980px canvas:
left 68.6px, top 120.5px, 303.2 x 310.2px, 36pt (49px) / weight 500, left-aligned.
-->
<template>
  <div class="slidev-layout end">
    <div class="end-text">
      <slot><h1>Thank you</h1></slot>
    </div>
  </div>
</template>

<style>
.slidev-layout.end {
  background: url('/images/unite/thanks.jpg') center / cover no-repeat;
}

.end-text {
  position: absolute;
  left: 68.6px;
  top: 120.5px;
  width: 303.2px;
  height: 310.2px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.slidev-layout .end-text h1 {
  font-size: 49px;
  font-weight: 500;
  line-height: 1.2;
  margin: 0;
}
</style>
