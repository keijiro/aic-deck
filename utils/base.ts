// Prefixes the deploy base (`--base` / `import.meta.env.BASE_URL`) to absolute
// public-asset paths like `/videos/foo.mp4`. Vite rewrites static `src`/`href`
// in templates and `url()` in CSS, but not paths passed at runtime (frontmatter
// `video:`/`qr:`, component props), so those go through this helper.
export function withBase(path: string): string {
  const base = import.meta.env.BASE_URL
  if (!path || !path.startsWith('/') || path.startsWith(base)) return path
  return base + path.slice(1)
}
