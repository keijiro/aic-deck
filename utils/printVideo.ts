// Print/export support for videos. Headless Chromium (used by `slidev export`)
// does not paint seeked video frames, so in print contexts videos show a
// pre-extracted poster (`foo.mp4` -> `foo-print.jpg`) and are not loaded.
import { useNav, useSlideContext } from '@slidev/client'
import { computed } from 'vue'

export function usePrintVideo(src: () => string) {
  const { $renderContext } = useSlideContext()
  const { isPrintMode } = useNav()
  const noPlay = computed(() => isPrintMode.value || !['slide', 'presenter'].includes($renderContext.value))
  const poster = computed(() => noPlay.value ? src().replace(/\.mp4$/, '-print.jpg') : undefined)
  const preload = computed(() => noPlay.value ? 'none' : 'auto')
  return { noPlay, poster, preload }
}
