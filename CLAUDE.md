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
- Muted loop clip grid: plain `<video muted autoplay loop playsinline>` inside `.video-grid`
  (2x2 grid, edges faded) from `style.css`.
- Don't add per-slide `<style>` blocks for video layout; extend the shared layouts/classes instead.

## Diagrams and tables

- Diagram SVGs get the `dia` class for the shared base in `style.css`: centered white text,
  `.caption` (yellow), `.total` (bold, black outline), `.bracket`, and the context roles
  `.init` (red) / `.added` (green). Keep only font sizes and slide-specific rules per slide.
- Arrows: `<path class="dia-arrow">` (marching yellow dashes with the shared `#arrow-head` marker
  from `global-bottom.vue`); add `solid` for a static line. Don't define per-slide markers.
- Cost tables: `layout: cost-table` with `table: cost-xxx` (highlight set in `style.css`, driven by
  `$clicks`), optional `note:` footnote, and `clicks: N`; the slide content is the Markdown table.

## Visual check

When a visual check of a slide is needed, use a screenshot of the dev server open in Safari
(AppleScript is enabled in Safari) instead of Claude in Chrome:

1. Navigate with the slidev MCP tool `slidev-goto-slide` (use `clicks` for animation steps).
2. Get the window ID: `osascript -e 'tell application "Safari" to get id of window 1'`
   (re-query each time; it changes when the window is reopened).
3. Capture: `screencapture -x -o -l <window-id> <scratchpad>/slide.png`, then Read the image.

The capture is of the on-screen window, so it must not be minimized or covered.

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
