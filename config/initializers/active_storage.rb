# Disables libvips' "unfuzzed" untrusted image loaders (CVE-2026-66066).
# image_processing/ruby-vips lazy-load their native backend, so it won't be
# defined yet at this point in boot -- require it explicitly to guarantee
# this hardening is actually applied, even before anything attaches files.
require "vips"
Vips.block_untrusted(true)
