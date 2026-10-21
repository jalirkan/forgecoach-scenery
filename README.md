# ForgeCoach scenery: pair bands (`pairs-v1-work` branch)

This branch holds ONLY the pair pack: `pairs.json` at the root (ForgeCoach scenery spec 1.12) and its pictures under
`pairs/<a>-<b>/`, so a CDN serves a tag of it in full apart from the main pack. Load it as
`https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pairs-v3/` (the manifest is `pairs.json`).

**pairs-v3** (2026-10-21) is the **meeting road** (the owner's pick of 2026-10-19, "go with the road"): every pair is a
*motif pair* (spec 1.12). Where two biomes meet on one side of ForgeCoach's half board, the seam stays the plain seam and
the pair's motif is drawn over it: the road, river or causeway both lands share, running from the foreground up the seam
to the horizon, a transparent picture whose own soft banks are the band's edges, so nothing is cut. It grows with the pair
stage: a faint track, a worn road, the full road. pairs-v2 (the ten painted places, two as their shock look), pairs-v1 and
the draft pairs-v0 stay at their tags.

| Pair | Colours | Dual | Shock | The motif |
| --- | --- | --- | --- | --- |
| `forest+island` | UG | Tropical Island | Breeding Pool | a turquoise stream, then a river winding between mossy jungle banks |
| `forest+mountain` | RG | Taiga | Stomping Ground | a red-earth trail climbing the ridge between moss and red rock |
| `forest+plains` | GW | Savannah | Temple Garden | a dirt path along the wood's edge into the golden grass |
| `forest+swamp` | BG | Bayou | Overgrown Tomb | a sunk log, then a wooden boardwalk over the bog into the cypress mist |
| `island+mountain` | UR | Volcanic Island | Steam Vents | a black spit, then a lava channel steaming where it meets the sea |
| `island+plains` | WU | Tundra | Hallowed Fountain | a thin ice crack, an ice ridge, then a road of ice blocks to the horizon |
| `island+swamp` | UB | Underground Sea | Watery Grave | a faint glow, then a glowing teal river between dark rocks |
| `mountain+plains` | RW | Plateau | Sacred Foundry | a pale dirt road winding up into the red foothills |
| `mountain+swamp` | BR | Badlands | Blood Crypt | embers, then a black road whose cracks glow with lava |
| `plains+swamp` | WB | Scrubland | Godless Shrine | stepping stones, a stone path, then a causeway of pale flagstones over the moor |

The names are for the caption only; the motifs are painted from our own words.

## Spec 1.12: `pairs.json`

Top level: `schema` 1, `spec` "1.12", `name`, `author`, `license`, `note`, and `pairs`, keyed by the two biomes in
alphabetical order joined by `+`; the art has the key's first biome on its left (ForgeCoach mirrors it for the other order).
Per pair:

- `dual`, `shock`: the land names, for a caption only. `place`: the motif in words; not read by the app.
- `band`: `{min 0.2, perDual 0.03, max 0.32}`: the motif's drawn width as a share of the half's width (0.20 with no
  duals, +0.03 per land that is both colours, at most 0.32; never wider than either neighbour's share). The neighbours give
  up no width: the seam under it is the plain seam.
- `stageMap`: `[[1, 2], [3, 4], [5, 6]]` (neighbour stages 1-2 show pair stage 1, 3-4 stage 2, 5-6 stage 3).
- `stages`: three `{motif: {src, src2x, width, height, phone: {src, src2x, width, height}, bytes}}` and no `half`:
  transparent WebP at the band's own size, the half's full height and the band's width (desktop 532 x 640, `src2x` 1064 x
  1280; phone 266 x 1024, `src2x` 532 x 2048), drawn stretched to the box, centred on the seam.
- `motifTransitions`: spec 1.7's shape, `{holdMs 200, fadeMs 180, steps: [{from, frames: [{src, phone}], bytes}]}`: two
  transparent in-betweens per step, desktop and phone at 1x.

This tag: 200 referenced files and the manifest, **7,817,787 bytes** (7.82 MB).

## How they were made

On the owner's GTX 1080, 2026-10-19/21 (`~/scenery-packs/seams-v1/road/`, its `SUMMARY.md`, sheets and preview).
DreamShaper XL 1.0 fp16 with the sdxl-vae-fp16-fix VAE, DPM++ 2M Karras, 34 steps, cfg 7.

1. **The plain seam.** For each pair and pair stage k, its two neighbours' pack-v9 pictures at stage 1, 3 or 5 composited as
   ForgeCoach draws a plain seam (equal shares, the 10% gradient overlap): desktop 3072 x 960, phone 1536 x 1536.
2. **A guide painted in code:** the road's wedge in perspective, centred on the seam, a half-width of 0.022 / 0.040 /
   0.058 of the half at the bottom and a point on the horizon (0.45 of the height, 0.50 on the phone), filled with the
   motif's material (water, red earth, planks, basalt with a lava core, ice, flagstones, cracked earth with ember veins) at
   0.38 / 0.55 / 0.70 opacity, with grain.
3. **img2img with a strength map** (pair_gen.py's per-pixel strength): the road and a margin at 0.58 / 0.66 / 0.72 (phone
   +0.06), the banks falling to 0.12 at the box's sides, 0.04 above the horizon; one prompt per pair and stage; two seeds a
   pair, the same at all three stages, so the three are one road. Picks by eye, per pair and shape (Tundra's stages 1-2 in a
   second round, stronger).
4. **The motif** is the box (0.26 of the half wide, the full height) cut from the repaint with **the strength map's own soft
   wedge as the alpha**: 1 over the road and its near banks, 0 at the box's sides and above the horizon.
5. **Frames:** img2img 0.38 over the blend of the two stages' repaints at t = 0.35 and 0.68, the two prompts interpolated,
   colour-matched to the blend, the alpha the blend of the two stages' alphas.

No night variant: a stage-3 motif is painted in stage-5 light and also shown beside stage 6.
