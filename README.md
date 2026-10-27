# ForgeCoach scenery: pair pictures (`pairs-v1-work` branch)

This branch holds ONLY the pair pack. **pairs-v6** (2026-10-27) is the `?pairfull=1` default, for Justin's review on
the live board, not a finished release: pairs-v5's desktop pictures and manifest, plus, for all ten pairs, a **seam
grid** (scenery spec 1.17) — the pair picture keyed by the two halves' OWN stages,
`seams/<left>-<right>/s<i>x<j>-panorama.webp`, i the left colour's stage and j the right's, painted for every (i, j)
within one step (16 cells a pair, 160 in all, 3277 x 640, WebP q80, sketch quality, desktop only; a phone draws
pairs-v5's stages). The left half is the earlier colour in the fixed geography Island → Swamp → Plains → Forest →
Mountain: island|swamp, island|plains, island|forest, island|mountain, swamp|plains, swamp|forest, swamp|mountain,
plains|forest, plains|mountain, forest|mountain.

Each cell is the left colour's mono picture at stage i and the right colour's at stage j, untouched outside a painted
seam in the middle (SYSTEM.md §C, the one-world rule: adding a land evolves one half's stage and never redraws the
other). A board whose halves are more than one stage apart shows the nearest painted cell (the heavier half exact).

Load it as `https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pairs-v6/` (the manifest is `pairs.json`); the
phone pictures stay at pairs-v5-phone, the base phones at pairs-v4 and the element cut-outs at pairs-v2, all by
absolute URL. This tag: 150 pairs-v5 desktop pictures + 160 seam cells + the manifest, about 37.4 MB, plus this
README, PROVENANCE.txt and LICENSE. pairs-v6-draft (2026-10-25) was the same with three pairs' grids.
