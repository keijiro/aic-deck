# CLAUDE.md

## Color scheme

Use only the palette defined as CSS variables in `style.css`:
`--c-red` #FF003C · `--c-orange` #FF8A00 · `--c-yellow` #FABE28 · `--c-lime` #88C100 · `--c-green` #00C176
(plus `--c-muted` for de-emphasized gray; black and white are fine as-is).

- Reference colors via `var(--c-*)`; never hardcode hex values in slides.
- In SVG, use CSS (`fill: var(--c-red)`) or the `style` attribute — `fill="var(...)"` as a presentation attribute does not work.
- Existing roles: initial context = red, added context = green, lines/arrows/captions = yellow.

## Video

- Full-screen video with sound: `layout: fullvideo` with `video: /videos/...` in the frontmatter
  (uses `SlidevVideo`, restarts each time the slide is entered).
- Video left, text right (muted loop, no fade): `layout: video-split` with `video: /videos/...`;
  the slide content goes to the right column.
- Muted loop clip grid: `<LoopVideo src="/videos/..." />` inside `.video-grid`
  (2x2 grid, edges faded) from `style.css`. Use `LoopVideo` for any muted loop clip, not plain `<video>`.
- Don't add per-slide `<style>` blocks for video layout; extend the shared layouts/classes instead.

### Video in print/export

Headless Chromium (used by `slidev export`) does not paint seeked video frames, so videos would
export as black. All video layouts/components go through `utils/printVideo.ts`: in print contexts
they show a poster `foo-print.jpg` next to `foo.mp4`, don't autoplay, and use `preload="none"`.

- When adding a video, generate its poster (3s frame; use the midpoint for clips shorter than that):
  `ffmpeg -ss 3 -i public/videos/foo.mp4 -frames:v 1 -q:v 3 public/videos/foo-print.jpg`
- Export with `pnpm export` (adds `--wait 1500 --wait-until load --timeout 90000`; the default
  networkidle wait times out on video loading). Extra args pass through, e.g. `pnpm export --format pptx`.
- Every exported page (PDF/PNG/PPTX) gets a "review copy only" warning overlay from `global-top.vue`
  (shown only in print mode; the dev server and static build are unaffected).

## Diagrams and tables

- Diagram SVGs get the `dia` class for the shared base in `style.css`: centered white text,
  `.caption` (yellow), `.total` (bold, black outline), `.bracket`, and the context roles
  `.init` (red) / `.added` (green). Keep only font sizes and slide-specific rules per slide.
- Arrows: `<path class="dia-arrow">` (marching yellow dashes with the shared `#arrow-head` marker
  from `global-bottom.vue`); add `solid` for a static line. Don't define per-slide markers.
- Cost tables: `layout: cost-table` with `table: cost-xxx` (highlight set in `style.css`, driven by
  `$clicks`), optional `note:` footnote, and `clicks: N`; the slide content is the Markdown table.

## Visual check

When a visual check of a slide is needed, render it to PNG with Slidev's exporter
(headless Chromium via `playwright-chromium`) instead of Claude in Chrome:

```sh
pnpm export --format png --range <N> --with-clicks --output <scratchpad>/shot
```

- Produces `<scratchpad>/shot/<NNN>-<click>.png` (one image per click step); Read the image.
- `--range` accepts lists like `3,10-12`. No dev server needed; it starts its own.
- Animations (marching arrows) are captured as a single frame; videos show their `-print.jpg` poster.

## Edit instructions

Edit instructions are passed inside the .md files as comment blocks like this:

```
<!-- EDIT HERE
Make the font on this slide a bit larger
Change the transition to the next slide to a fade
-->
```

Such a comment is an instruction to edit the slide (page) where the comment is placed.
Once the edit is done, remove the comment block.
