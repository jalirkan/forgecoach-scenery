# ForgeCoach scenery — pack-only branch

This branch holds ONLY the game-ready pack (`pack/`), so a CDN can serve a tag of it in full: jsDelivr refuses
any file of a git ref larger than 50 MB, and the `main` branch (the full-size masters, layers, loops and previews)
is about 300 MB. Every file here is byte-identical to the same path on `main` at the matching `pack-vN` tag;
files `scenery.json` does not reference are left out.

Tags on this branch: `pack-v5.1` = the pack of `pack-v5` on `main` (pack-v4's pictures, front layer only).
Load it as `https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pack-v5.1/pack/`.

Licence: CC BY 4.0 (see LICENSE). Art direction and provenance live on `main`.
