# ForgeCoach scenery: pair bands (`pairs-v1-work` branch)

This branch holds ONLY the pair-band pack: `pairs.json` at the root (ForgeCoach scenery spec 1.9) and its pictures
under `pairs/<a>-<b>/`, so a CDN serves a tag of it in full apart from the main pack (the live pack is 46 of jsDelivr's
50 MB per ref). Load it as `https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pairs-v2/` (the manifest is
`pairs.json`).

**pairs-v2** (2026-10-17) is pairs-v1 with two places replaced by their shock land's look, the owner's choice from the
stage-2 options: **plains+swamp is Godless Shrine** (one broken pale shrine among the bleached stones on the dark peat
moor) in place of Scrubland, and **forest+island is Breeding Pool** (jungle mounds standing in a turquoise primordial
lagoon) in place of Tropical Island, each made at all three stages with its frames as the other eight were. The other
eight pairs' files are pairs-v1's, unchanged. `dual` still names the pair's dual land (the caption reads `dual (shock)`),
and every pair carries a `place` (the look in our words), which the reader ignores. Tags `pairs-v1` (the ten dual looks)
and the draft `pairs-v0` stay at their tags.

When one side of ForgeCoach's board has two colours, the seam between their two pictures becomes a third painted place,
the colour pair's own (named for its dual land), which widens with every land that is both colours.

| Pair | Colours | Dual | Shock | The look | Stages | Frames |
| --- | --- | --- | --- | --- | --- | --- |
| `forest+island` | UG | Tropical Island | Breeding Pool | **Breeding Pool** (shock): jungle mounds standing in a turquoise primordial lagoon | 2.46 MB | 1.12 MB |
| `forest+mountain` | RG | Taiga | Stomping Ground | Taiga: tall dark conifers climbing red volcanic slopes | 2.18 MB | 0.96 MB |
| `forest+plains` | GW | Savannah | Temple Garden | Savannah: golden grass with scattered broad trees and a bright horizon | 2.29 MB | 1.07 MB |
| `forest+swamp` | BG | Bayou | Overgrown Tomb | Bayou: flooded cypress swamp, green water, hanging moss | 1.96 MB | 0.96 MB |
| `island+mountain` | UR | Volcanic Island | Steam Vents | Volcanic Island: a black volcanic island in a turquoise sea, lava meeting water in steam | 2.30 MB | 1.04 MB |
| `island+plains` | WU | Tundra | Hallowed Fountain | Tundra: a frozen white plain meeting a cold blue sea, ice shelf and pale sky | 1.90 MB | 0.78 MB |
| `island+swamp` | UB | Underground Sea | Watery Grave | Underground Sea: a black cavern sea under a vaulted rock ceiling, bioluminescent water | 2.07 MB | 0.71 MB |
| `mountain+plains` | RW | Plateau | Sacred Foundry | Plateau: a high red-rock mesa under a wide bright sky, pale grass on top | 2.25 MB | 0.96 MB |
| `mountain+swamp` | BR | Badlands | Blood Crypt | Badlands: cracked black earth and red rock, a dry scorched gorge with embers | 2.83 MB | 1.36 MB |
| `plains+swamp` | WB | Scrubland | Godless Shrine | **Godless Shrine** (shock): one broken pale shrine among the bleached stones on the dark peat moor | 2.29 MB | 1.08 MB |

The names are for the caption only; the pictures are places painted from the names in our own words.

## Spec 1.9 (draft): `pairs.json`

Top level: `schema` 1, `spec` "1.9", `name`, `author`, `license`, `note`, and `pairs`, keyed by the two biomes in
alphabetical order joined by `+` (`forest+island`); the art has the key's first biome on its left (ForgeCoach mirrors it
for the board's other order). Per pair:

- `dual`, `shock`: the land names, for a caption only. `place` (pairs-v2): the look in words; not read by the app.
- `band`: `{min, perDual, max}` = `{0.10, 0.04, 0.34}`: the band's width as a share of the half's width: `min` as soon as
  the side has both colours, `perDual` more for each land that is both colours, at most `max` (a full middle third at six).
  The two neighbouring panels give up half of it each.
- `stageMap`: `[[1, 2], [3, 4], [5, 6]]`: the pair's stage k follows the LOWER of its two neighbours' stages; neighbour
  stages 1-2 show pair stage 1, 3-4 stage 2, 5-6 stage 3.
- `stages`: three entries, each `{half: {src, src2x, phone: {src, src2x, subjectBand}, subjectBand, bytes}}` (spec 1.5's
  half shape): the desktop picture 2048 x 640 (`src2x` 4096 x 1280) and the phone picture 1024 x 1280 (`src2x` 1536 x
  1920), WebP quality 86. `subjectBand` is [0.35, 0.6] on the desktop; the phone pictures declare
  `[0.416, 0.514]`, because the desktop band sits in them as it does in the pack's own phone pictures (the
  middle 64% of the desktop picture's width, centred at 0.475 of the phone's height), not as the middle half outpainted
  evenly. `bytes` counts the four files.
- `transitions`: spec 1.7's shape, `{holdMs: 200, fadeMs: 180, steps: [{from, frames: [{src, phone}], bytes}]}`: in-between
  frames for the steps 1->2 and 2->3 (two to four per step), desktop and phone at 1x, WebP q86.

Budgets the reader warns past: 4 MB of stage pictures per pair, 2 MB of frames per pair, 45 MB for the pack. This tag:
272 referenced files and the manifest, **32,593,021 bytes** (32.59 MB).

## How they were made

On the owner's GTX 1080, 2026-10-16/17, the two shock looks' stages 1 and 3 and frames on 2026-10-17 (`~/scenery-packs/pair-scenery/`, its `SUMMARY.md`, the contact sheets and the mp4
previews there). DreamShaper XL 1.0 fp16 with the sdxl-vae-fp16-fix VAE, DPM++ 2M Karras, 34 steps, cfg 7.

1. **The neighbours' continuations.** For each biome at stages 1, 3 and 5, its right edge (or left edge) continued
   outward by 1536 px: each row's edge colour easing into the row's median, with grain, then img2img with a per-pixel
   strength (held over the neighbour, ~0.25 at its edge, 0.7 a few hundred px out), one seed per biome and side. Nothing of
   a neighbour is mirrored into a place (the concepts' mirror put the island's pink spit into Tundra, Underground Sea and
   Volcanic Island).
2. **Stage 2** (over the neighbours' stage 3): the concepts' three-panel composite (A's inner 512 px | the middle | B's
   inner 512 px, 3072 x 640) with the middle started from A's continuation cross-faded into B's, the place's masses painted
   over it in code, and the concepts' "differential" img2img (0.18 at the sides, 0.6-0.66 in the middle); the concepts'
   prompts and seeds, with the fixes below; the middle 2048 x 640 kept.
3. **Stages 1 and 3** (over the neighbours' stages 1 and 5): the stage-2 picture held as the middle anchor, moved to the
   stage's light (the difference between the two stages' continuations, blurred at 48 px), the stage's own continuations
   toward the edges, the same seed, img2img 0.52 in the middle with the stage's words (dawn and calm at 1; dusk, glow and
   drama at 3, as the biomes grow).
4. **Phone pictures:** the desktop place's middle 64% at the pack's phone position, the sky continued above and the
   foreground below, img2img at 896 x 1120 (0.62 outside the place, 0.2 over it; stages 1 and 3 anchored on stage 2's phone
   picture), the pack's tiled detail pass, then the detailed desktop band blended back in sharp (sg_pack3's phone finish).
5. **The detail pass:** the pack's own 2x tiled pass held by the tile ControlNet (desktop at 3456 x 1080, tile strength 0.5
   / 0.535 / 0.575 by stage, ControlNet 0.3; phone at 1792 x 2240, 0.42, ControlNet 0.4).
6. **Frames:** pack v7.2's recipe: frame k at t of the step is img2img 0.45 over the blend (1 - t) sN + t sN+1 of the two
   shipped pictures, one seed per pair, the two stages' prompts interpolated at t, each frame's colour matched to its blend.
   A pair step spans two of its neighbours' stages, so it changes more than a mono step (whole-step change 16-47 against the
   pack's 8-42): two frames where it is under 20, three under 30, four above (the reader's cap), with t spaced so the cuts
   come out even -- the cut out of a stage carries the repaint's own difference, so its gap is shorter; the eight steps
   that still missed after the first pass were refitted from their measured cuts (`tools/fit_sched.py`).

**The shock looks** (pairs-v2): their stage 2 is the option round's pick (Godless Shrine seed 6502: a single-shrine
prompt with the shrine's footprint held at 0.6 x 0.6; Breeding Pool seed 6514: broad jungle masses in the lagoon, no
hold, 0.7), its stages 1 and 3 and its phones made over it exactly as the duals' (steps 3-5), its frames as step 6 with
one change for Godless Shrine: its frames are repainted at 0.30, not 0.45. At 0.45 the repaint moved the shrine's columns
and lintel from frame to frame and its stage 1 -> 2 cuts stayed at 11.4-12.2 however they were spaced (Scrubland's 12.5
was the same limit); at 0.30 the shrine stands still and the largest cut is 10.5. The stage pictures share one anchor, so
the lighter repaint shows no double image.

**Model-made lettering** found by eye on the bottom edges of ten shipped pictures (Bayou s1-s3 desktop, Underground Sea
s1 desktop, Plateau s1 and s3, Badlands s3 and Volcanic Island s1 phone; and in pairs-v2 Godless Shrine s2 desktop and
Breeding Pool s1 phone) was painted out at full size (inpainting plus matched grain), and in every frame of the steps
those pictures bound.

**The fixes on the concepts' picks.** Badlands: an ember layer painted in code (cracked-earth lines in perspective, a hot
core and a red glow, broken into runs) screened over the black ground only (dark and flat; a shadowed rock face is dark
but busy) after the detail pass, as the mountain's lava veins were restored in the ladder's final-r2: 0.9 at stage 2 (0.6
read too faint), a third of it at stage 1, 1.0 at stage 3. Tropical Island: a rounded, layered headland (three domed
terraces) in place of the square cliff block, new seeds, the two falls held by a lower strength over them. Plateau: a thin
pale-gold summit line painted into the guide and kept by a lower strength over the cap. All ten: the middle seeded from the
continuations instead of the mirror.

## Cuts (mean |grey difference| 0-255 between consecutive pictures, 512 x 160; phone 160 x 200)

Desktop:

| Step | Whole step | Cuts | Largest | Max/mean |
| --- | --- | --- | --- | --- |
| island+plains s1->s2 | 33.7 | 9.7 / 7.4 / 7.5 / 7.6 / 8.2 | 9.7 | 1.21 |
| island+plains s2->s3 | 38.7 | 8.6 / 8.9 / 8.9 / 9.0 / 9.8 | 9.8 | 1.09 |
| island+swamp s1->s2 | 27.6 | 10.0 / 9.3 / 9.2 / 9.1 | 10.0 | 1.07 |
| island+swamp s2->s3 | 16.0 | 7.8 / 7.3 / 9.0 | 9.0 | 1.12 |
| mountain+swamp s1->s2 | 46.0 | 10.5 / 10.9 / 10.8 / 10.4 / 10.5 | 10.9 | 1.03 |
| mountain+swamp s2->s3 | 36.1 | 9.0 / 8.2 / 8.7 / 8.6 / 9.9 | 9.9 | 1.11 |
| forest+mountain s1->s2 | 24.3 | 8.6 / 6.9 / 7.0 / 7.8 | 8.6 | 1.14 |
| forest+mountain s2->s3 | 41.5 | 9.1 / 9.4 / 9.4 / 9.5 / 9.9 | 9.9 | 1.05 |
| forest+plains s1->s2 | 27.0 | 8.3 / 7.1 / 7.0 / 7.0 / 7.4 | 8.3 | 1.12 |
| forest+plains s2->s3 | 40.5 | 9.1 / 9.1 / 9.2 / 9.3 / 9.6 | 9.6 | 1.04 |
| plains+swamp (Godless Shrine) s1->s2 | 44.7 | 9.3 / 10.3 / 10.4 / 10.5 / 9.7 | 10.5 | 1.04 |
| plains+swamp (Godless Shrine) s2->s3 | 39.8 | 8.7 / 9.4 / 9.6 / 9.3 / 7.7 | 9.6 | 1.07 |
| island+mountain s1->s2 | 36.9 | 10.7 / 8.8 / 8.9 / 8.6 / 9.3 | 10.7 | 1.16 |
| island+mountain s2->s3 | 38.6 | 9.4 / 9.0 / 8.9 / 8.9 / 10.7 | 10.7 | 1.14 |
| forest+swamp s1->s2 | 46.7 | 11.4 / 10.5 / 10.8 / 10.6 / 10.8 | 11.4 | 1.05 |
| forest+swamp s2->s3 | 36.7 | 8.5 / 8.5 / 8.4 / 8.5 / 9.1 | 9.1 | 1.06 |
| mountain+plains s1->s2 | 25.3 | 8.3 / 6.6 / 6.7 / 6.2 / 7.1 | 8.3 | 1.19 |
| mountain+plains s2->s3 | 45.1 | 9.6 / 10.3 / 10.2 / 10.2 / 9.7 | 10.3 | 1.03 |
| forest+island (Breeding Pool) s1->s2 | 33.9 | 10.1 / 8.4 / 8.5 / 8.4 / 8.9 | 10.1 | 1.14 |
| forest+island (Breeding Pool) s2->s3 | 36.5 | 8.7 / 8.4 / 8.4 / 8.5 / 10.2 | 10.2 | 1.16 |

Phone:

| Step | Whole step | Cuts | Largest | Max/mean |
| --- | --- | --- | --- | --- |
| island+plains s1->s2 | 36.0 | 9.9 / 8.0 / 8.1 / 7.8 / 8.6 | 9.9 | 1.16 |
| island+plains s2->s3 | 37.6 | 8.2 / 8.7 / 8.4 / 8.7 / 9.2 | 9.2 | 1.06 |
| island+swamp s1->s2 | 19.1 | 9.3 / 6.5 / 6.6 / 6.8 | 9.3 | 1.27 |
| island+swamp s2->s3 | 11.6 | 6.0 / 5.7 / 8.0 | 8.0 | 1.21 |
| mountain+swamp s1->s2 | 45.7 | 10.6 / 10.6 / 10.5 / 10.6 / 10.6 | 10.6 | 1.0 |
| mountain+swamp s2->s3 | 32.7 | 8.3 / 7.8 / 7.8 / 7.9 / 9.8 | 9.8 | 1.18 |
| forest+mountain s1->s2 | 29.7 | 9.0 / 8.7 / 8.5 / 9.1 | 9.1 | 1.03 |
| forest+mountain s2->s3 | 37.4 | 8.2 / 8.5 / 8.6 / 8.6 / 8.7 | 8.7 | 1.02 |
| forest+plains s1->s2 | 33.0 | 8.8 / 8.7 / 8.4 / 8.4 / 8.5 | 8.8 | 1.03 |
| forest+plains s2->s3 | 38.1 | 8.5 / 8.7 / 8.7 / 8.8 / 10.1 | 10.1 | 1.13 |
| plains+swamp (Godless Shrine) s1->s2 | 43.9 | 8.2 / 10.1 / 10.1 / 10.0 / 8.9 | 10.1 | 1.07 |
| plains+swamp (Godless Shrine) s2->s3 | 33.3 | 7.0 / 7.7 / 7.9 / 7.8 / 6.0 | 7.9 | 1.09 |
| island+mountain s1->s2 | 40.6 | 9.5 / 9.6 / 9.7 / 9.5 / 9.4 | 9.7 | 1.02 |
| island+mountain s2->s3 | 37.5 | 8.7 / 8.6 / 8.7 / 8.6 / 9.6 | 9.6 | 1.08 |
| forest+swamp s1->s2 | 44.6 | 10.6 / 10.0 / 10.4 / 10.1 / 10.2 | 10.6 | 1.03 |
| forest+swamp s2->s3 | 34.3 | 7.8 / 7.8 / 7.8 / 7.9 / 8.3 | 8.3 | 1.05 |
| mountain+plains s1->s2 | 31.2 | 7.5 / 8.3 / 8.2 / 7.6 / 6.9 | 8.3 | 1.07 |
| mountain+plains s2->s3 | 39.9 | 8.1 / 9.1 / 9.1 / 9.1 / 8.6 | 9.1 | 1.04 |
| forest+island (Breeding Pool) s1->s2 | 37.2 | 10.4 / 9.4 / 9.2 / 9.4 / 9.5 | 10.4 | 1.09 |
| forest+island (Breeding Pool) s2->s3 | 36.9 | 9.1 / 8.5 / 8.5 / 8.6 / 10.4 | 10.4 | 1.16 |

No web images, card art or private files were used as inputs; the only image inputs are this project's own pack pictures
(forgecoach-scenery `pack/`, branch `pack-v7-work`) and guides painted in code. Licence: CC BY 4.0 (see LICENSE).
Provenance: `PROVENANCE.txt`.
