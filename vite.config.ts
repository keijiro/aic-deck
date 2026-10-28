export default {
  server: {
    fs: {
      // Workaround for Slidev 53.0.0: slidev:slide-import-guard rejects the
      // virtual `?vue&type=style` import of slides with a <style> block as
      // "outside of server.fs.allow". The guard only runs when strict is on.
      strict: false,
    },
  },
}
