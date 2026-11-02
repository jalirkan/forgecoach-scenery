# ForgeCoach scenery: pair pictures (`pairs-v1-work` branch)

This branch holds ONLY the pair pack. **pairs-v7.1** (2026-11-02) is pairs-v6 -- pairs-v5's desktop pictures and the
seam grid for all ten pairs, each half at its own stage (scenery spec 1.17, sketch quality) -- with the manifest raised
to **scenery spec 1.18**: every one of the 160 grid cells now carries a `phone` picture and `elements`, the third
colour painted into the cell.

- `phone` on a cell: the cell as a phone panorama, 1638 x 1280, in a stage panorama's `phone` shape (`src`,
  `width`, `height`, `bytes`, `subjectBand`, `focal`, `safe`, `horizon`). The files are at the tag
  **pairs-v7-phone** (`seams/<left>-<right>/s<i>x<j>-panorama-phone.webp`, 160 pictures, 13.6 MB), named by absolute
  URL, since they do not fit this ref beside the desktop pictures.
- `elements.<C>.<left|right>` on a cell: the third colour C (W U B R G, never one of the pair's own) grown into the
  heavier half's ground of that very cell, 3277 x 640 like the cell; `left` where i > j, `right` where i < j, both
  where i = j -- 66 pictures a pair, 660 in all, at the tag **pairs-v7-pin**
  (`seams/<left>-<right>/s<i>x<j>+<C><L|R>-panorama.webp`, 48.3 MB), by absolute URL. The sides are in the cell's own
  (geography) order. A painted-in cell has no phone picture of its own: on a phone the third colour draws nothing.

The grid itself is pairs-v6's, byte for byte: `seams/<left>-<right>/s<i>x<j>-panorama.webp`, i the left colour's
stage and j the right's, every (i, j) within one step, the left half the earlier colour in the fixed geography
Island -> Swamp -> Plains -> Forest -> Mountain. Each cell is the left colour's mono picture at stage i and the right
colour's at stage j, untouched outside a painted seam in the middle (SYSTEM.md's one-world rule).

Load it as `https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pairs-v7.1/` (the manifest is `pairs.json`); the pairs-v5 element phones stay at
pairs-v5-phone, the base phones at pairs-v4 and the element cut-outs at pairs-v2, all by absolute URL. This tag: 150
pairs-v5 desktop pictures + 160 seam cells + the manifest, 39.7 MB, plus this README, PROVENANCE.txt and LICENSE.

pairs-v7.1 supersedes pairs-v7 (the same day): the pictures and every URL are the same, and only the manifest's `name`
and `note` changed -- pairs-v7's still called itself "pairs-v6 draft", the writer's old fixed wording, which the board's
pairs line prints. Load pairs-v7.1.
