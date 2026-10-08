# forgecoach-scenery

Original scenery art for [ForgeCoach](https://github.com/jalirkan/ForgeCoach): five land types
(island, mountain, swamp, plains, forest), each painted in four stages that **level up with the
player's mana** — one land is a calm, simple place; each stage is more intricate, vivid and
fantastical, until six or more lands is dreamlike eye candy.

The art is loaded by the game as a scenery pack; it is kept in this repo rather than in the game's
code so the code stays small. `ART-DIRECTION.md` in the ForgeCoach project describes the design.

## What is here

For each land type, `<biome>/`:

- `stage1.png` … `stage4.png` — the frames at 3456×1152 (3:1), and `stageN-1728.png` at half size.
  Stages are by land count: 1 · 2–3 · 4–5 · 6+.
- `layers/stageN/` — parallax layers (`sky`, `far`, `mid`, `near`, plus cut-outs that move as one
  piece) with `layers.json` giving each layer's depth and motion settings.
- `loop/` — one short looping effect for the top stage, as WebM with alpha and an MP4 fallback.
- `previews/stageN.mp4` — a 5-second moving preview of each stage.
- `<biome>-ladder.jpg`, `<biome>-board.jpg` — review sheets.

`overview.jpg` shows all twenty frames side by side; `changes.jpg` the last fix round;
`twocolour.jpg` how two colours share a player's half.

## How it was made

Every image was generated locally from the author's own text prompts with open-weight models, then
reworked through a painted-structure, anchored re-render and tiled detail pass; no existing images
were used as inputs, and no trading-card art, characters or names were referenced.
`PROVENANCE.txt` records every frame's model, settings, seed and the licence of each model used
(SDXL 1.0 and DreamShaper XL under CreativeML Open RAIL++-M, the fp16 VAE fix under MIT, the SDXL tile
ControlNet under Apache-2.0).

## Licence

The images, layers, loops and previews in this repository are released under
[Creative Commons Attribution 4.0 International](LICENSE) (CC BY 4.0). Attribute as
"ForgeCoach scenery by jalirkan".

## Loading the pack from a CDN: use the `pack-only` branch

jsDelivr refuses every file of a git ref larger than 50 MB, and this branch (the masters, layers, loops and
previews) is about 300 MB, so a `pack-vN` tag here cannot be served in full. The orphan branch `pack-only` holds
`pack/`'s referenced files alone (~31 MB), byte-identical to the same tag here. Load
`https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pack-v5.1/pack/` (pack-v5.1 = pack-v5's pack).
