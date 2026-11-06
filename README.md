# ForgeCoach scenery: pair pictures (`pairs-v1-work` line; this tree is branch `pairs-v8-work`)

This branch holds ONLY the pair pack. **pairs-v8** (2026-11-06) is the seam grid of scenery spec 1.17/1.18 painted in oil:
oil-v2's 160 seam cells for the ten pairs, each with its phone picture, against pack v10's oil monos (the owner's four
redesigned lands and oil-v1's forest; every pair repainted, the forest's four too). Read under
`?pairfull=1` (ForgeCoach's `FORGECOACH_PAIRS_FULL_URL`); the board without the flag keeps its own pairs.

- A cell `seams/<left>-<right>/s<i>x<j>-panorama.webp` (3277 x 640) is the left colour's pack v10 mono half at stage i on its
  left edge and the right colour's at stage j on its right edge, mirrored (both landmarks at the canvas's outer edges, both
  suns or moons near the middle), the seam painted in u 0.38-0.62 only, the left half the earlier colour in the fixed
  geography Island -> Swamp -> Plains -> Forest -> Mountain; every (i, j) within one step, 16 cells a pair. Outside the
  ring every pixel below the horizon, and every landmark, is the two monos' exactly; above it the cell has one sky (the
  seam sky pass), so a land step changes one half's ground and landmark and tints the whole sky toward the new hour.
- Its phone picture `seams/<left>-<right>/s<i>x<j>-panorama-phone.webp` (1638 x 1280) is the two mono phone pictures placed
  the same way, the seam carried in from the desktop cell. **In this ref, named relatively**: the desktop cells (13.5 MB)
  and the phone cells (14.3 MB) fit one ref together now that the pairs-v5 pictures are gone (below), so there is no
  `pairs-v8-phone` tag.
- No painted-in third colour on a cell (spec 1.18's `elements`): pairs-v7-pin's 660 were painted into the old monos. A third
  colour draws its 1.14 cut-out (pack v10's `pieces`, spec 1.19 a), on a phone its phone piece.

Each pair keeps its `dual`, `shock`, `place`, `band` and `stageMap`, and its three `stages` keep only their 1.9 `half`
(pairs-v2's pictures, by absolute URL): ForgeCoach plans a whole-half pair, and reads a grid at all, only for a pair whose
stage 1 has a half. They are drawn only if a cell fails to load, or loads later than its stage half when a page opens on a
two-colour board, or after the 8 s hold, and in the 1.9 band the board draws while nothing of the pair has loaded. Dropped
from pairs-v7.1's entries: the stages' 1.15 `panorama` (each cell now carries the `subjectBand`, `focal` and `safe` -- and
its phone's `focal` and `safe` -- it took from stage 1's panorama, the same values, so every cell reads exactly as before),
the stages' 1.16 painted-in `elements` (never drawn on a pair with a grid, only fetched), and the pairs' 1.7 `transitions`
(band frames, never played by the whole-half picture; a band's step cross-fades).

Load it as `https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pairs-v8/` (the manifest is `pairs.json`). This tag: 320
pictures (27,749,100 bytes) and the manifest (195,774 bytes), plus this README, PROVENANCE.txt and LICENSE.
(An earlier build of this tree from oil-v1's cells was made on 2026-11-05 and never tagged.)
