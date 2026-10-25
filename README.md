# ForgeCoach scenery: pair pictures (`pairs-v1-work` branch)

This branch holds ONLY the pair pack: `pairs.json` at the root (ForgeCoach scenery spec 1.16.1) and its pictures under
`pairs/<a>-<b>/`, so a CDN serves a tag of it in full apart from the main pack. Load it as
`https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pairs-v5/` (the manifest is `pairs.json`).

**pairs-v5** (2026-10-24) is pairs-v4's ten **whole-half panoramas with the third colour painted in**. The 1.14 cut-out
elements read as a sticker on a painting (Justin, 2026-10-24, after the scenery review), so an element is now painted
INTO the place: for every pair panorama at stages 2 and 3, for each of the three colours outside the pair, and for each
side, a version of that same panorama with the colour's feature grown on that side's ground, at the scene's own hour
and light, clear of the transition. The reader draws the side of the heavier pair colour (spec 1.16.1, sided).

The features: white, a light shaft onto squat weathered standing stones or a pale path; blue, a river or stream (a
channel across snow, rapids out of a forest floor); black, dead trees or a black channel; red, a dark crag carried by
the ember glow on its ground, with smoke; green, standing trees -- and, on three slots where green on a dark night
ground kept painting as lime, a **moss** motif (moss and ferns over the ground, vines on dead trees on the fen) instead:
island+mountain s2 and s3 green-right, mountain+swamp s3 green-right.

## What is in this tag

- `pairs.json` (spec 1.16.1): pairs-v4's manifest, every stage's fields unchanged, and at stages 2 and 3 an `elements`
  block: `{<C>: {left: {src, bytes, phone: {src, bytes}}, right: {...}}}` for the three colours outside the pair. `left`
  and `right` follow the pair key's order (the key's first biome is the picture's left end).
- `pairs/<a>-<b>/s{1,2,3}-panorama.webp`: pairs-v4's base desktop panoramas (3277 x 640, WebP q80), byte for byte.
- `pairs/<a>-<b>/s<k>+<C><L|R>-panorama.webp`: the 120 painted-in desktop pictures (60 at stage 2, 60 at stage 3),
  3277 x 640, WebP q80.

Not in this tag, named by absolute URL so they cost it nothing: the 120 element **phone** pictures at `@pairs-v5-phone`
(the whole set is ~50.1 MB, over jsDelivr's 50 MB per ref, so the phones have a tag of their own), the base phone
panoramas at `@pairs-v4`, and pairs-v2's halves and frames at `@pairs-v2`. A reader that does not know `elements` reads
pairs-v5 as pairs-v4.

Bytes: 150 pictures and the manifest, **28,158,470** -- base desktop 6,473,776 (30), stage-2 elements 14,484,576 (60),
stage-3 elements 7,062,654 (60), `pairs.json` 137,464 -- plus this README, PROVENANCE.txt and LICENSE.

**Flagged weak** (kept as the best of their tries; a re-pick replaces the file and its phone): island+mountain s2 GR
(bright moss on the cooled lava), mountain+swamp s3 GR (moss, subtle at board size), plains+swamp s2 GR and s3 GR
(gnarled moss-draped trees), island+swamp s3 GR (a dark tree whose crown is lost in the vault), island+plains s3 GR
(topiary-like crowns on the snow), forest+island s3 RR (the crag reads only by its smoke), forest+swamp s3 UR (a blue pool,
not a river). See PROVENANCE.txt.

The dual and shock names in the manifest are for the caption only; the pictures are painted from our own words.

## How they were made

On the owner's GTX 1080, 2026-10-24, by `~/scenery-packs/panoramas-v1/tools/pin.py` (its `SUMMARY.md`, sections
"Painted-in elements (10-24)" and the stage 2, stage 3 and phones results). DreamShaper XL 1.0 fp16 with the
sdxl-vae-fp16-fix VAE, no LoRA, DPM++ 2M Karras.

1. **Base**: the cleaned painting each pairs-v4 file was cut from (4588 x 896). The element zone is the stretch of the
   picture the board shows at every split where that side is heavier (u 0.19-0.47 left, 0.53-0.81 right).
2. **Guide in code**: the feature roughed into the base at the scene's light (shapes multiplied by the base's blurred
   ambient colour; lava, embers and a light shaft emissive; water filled with the sky reflected above it; a contact
   shadow under anything standing; grain inside the shapes).
3. **MultiDiffusion inpainting** over a 1728 x 896 crop only (two 1152 windows), element words first, then the side's
   ground, the stage's hour and light key; strength 0.85 over 32 scheduled steps, 1 over the feature, 0.4 over a ring for
   its shadow, glow and reflection, 0 beyond.
4. **Finish**: composited back through a feathered alpha, grain matched to the base, 3277 x 640 Lanczos, WebP q80. Outside
   the element's crop every pixel is the base's own (max |diff| 0.0 before encoding).
5. Candidates judged by eye on sheets at board size, up to three or four a slot; 8 of 120 desktop picks flagged weak.
