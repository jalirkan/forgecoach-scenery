# ForgeCoach scenery: pair pictures (`pairs-v1-work` branch)

This branch holds ONLY the pair pack. **pairs-v6-draft** (2026-10-25) is a DRAFT for Justin's review, not a
release: pairs-v5's desktop pictures and manifest, plus, for three pairs, a **seam grid** (scenery spec 1.17, draft) —
the pair picture keyed by the two halves' OWN stages, `seams/<left>-<right>/s<i>x<j>-panorama.webp`, i the left
colour's stage and j the right's, painted for every (i, j) within one step (16 cells a pair, 48 in all, 3277 x 640,
WebP q80, sketch quality, desktop only). The three pairs: island|swamp, plains|mountain, swamp|forest (the left half is
the earlier colour in the fixed geography Island → Swamp → Plains → Forest → Mountain). The other seven pairs keep
pairs-v5's `stages` only.

Each cell is the left colour's mono picture at stage i and the right colour's at stage j, untouched outside a painted
seam in the middle (SYSTEM.md §C, the one-world rule: adding a land evolves one half's stage and never redraws the
other). A board whose halves are more than one stage apart shows the nearest painted cell (the heavier half exact).

Load it as `https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pairs-v6-draft/` (the manifest is `pairs.json`);
the phone pictures stay at pairs-v5-phone, the base phones at pairs-v4 and the element cut-outs at pairs-v2, all by
absolute URL. This tag: 150 pairs-v5 desktop pictures + 48 seam cells + the manifest, about 31.5 MB, plus this README,
PROVENANCE.txt and LICENSE.
