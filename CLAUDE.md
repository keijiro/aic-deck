# CLAUDE.md

## Color scheme

Use only the palette defined as CSS variables in `style.css`:
`--c-red` #FF003C · `--c-orange` #FF8A00 · `--c-yellow` #FABE28 · `--c-lime` #88C100 · `--c-green` #00C176
(plus `--c-muted` for de-emphasized gray; black and white are fine as-is).

- Reference colors via `var(--c-*)`; never hardcode hex values in slides.
- In SVG, use CSS (`fill: var(--c-red)`) or the `style` attribute — `fill="var(...)"` as a presentation attribute does not work.
- Existing roles: initial context = red, added context = green, lines/arrows/captions = yellow.

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
