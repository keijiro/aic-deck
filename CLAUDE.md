# CLAUDE.md

## Color scheme

Use only the palette defined as CSS variables in `style.css`:
`--c-red` #FF003C · `--c-orange` #FF8A00 · `--c-yellow` #FABE28 · `--c-lime` #88C100 · `--c-green` #00C176
(plus `--c-muted` for de-emphasized gray; black and white are fine as-is).

- Reference colors via `var(--c-*)`; never hardcode hex values in slides.
- In SVG, use CSS (`fill: var(--c-red)`) or the `style` attribute — `fill="var(...)"` as a presentation attribute does not work.
- Existing roles: initial context = red, added context = green, lines/arrows/captions = yellow.
