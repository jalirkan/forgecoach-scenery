
## pack v6 (2026-10-13): the six-picture ladder

Six stages per biome, thresholds [1, 2, 3, 4, 5, 6] — one look per land. Stages 1, 2, 4 and 6 are pack v5.1's
pictures unchanged (its s1, s2, s3, s4; s6 keeps the loop). Stages 3 and 5 are new: for each biome, the master and
the phone picture were painted from the 50/50 blend of their two neighbours, img2img at strength 0.45 on
DreamShaper XL 1.0 (fp16, the sdxl-vae-fp16-fix VAE, DPM++ 2M Karras) with the two neighbours' prompt embeddings
averaged, three seeds, the pipeline's 2× tiled detail pass on the pick, then the usual cuts (sky, half, phone,
each with @2x) and a half-way front layer. Made on the owner's GTX 1080 overnight 2026-10-12/13 by
`~/scenery-packs/tools/ladder_chain.sh` (see `pack-v6-ladder/SUMMARY.md` there). Spec 1.6 (`growth` defaults).
No web images, card art or private files were used as inputs. Licence as before.

## pack v6.1 (2026-10-13): forest stages 3 and 5 re-painted

Pack v6's two new forest pictures came out too soft — the trees dissolved into haze (edge contrast 0.28 and 0.29,
measured as the mean |horizontal luma gradient| on the half@2x centre 1024×512 crop, against 0.32–0.64 for their
neighbours). Only `forest/s3-*`, `forest/s5-*`, `forest/front-s3*`, `forest/front-s5*` and their byte counts in
`scenery.json` changed; the other four biomes and every anchor picture are byte-for-byte pack v6.

The forest candidates were re-run with the same averaged prompt embeddings at img2img strength 0.58 and 0.68 (three
seeds each, from the anchors' 50/50 blend), plus a variant at 0.50 starting from the sharper anchor (v5's s3).
Picked by that edge contrast (within ±25% of the two neighbours' mean) and by eye:
s3 = master 0.68 (seed 8425), phone 0.68 (seed 11523), shipped edge contrast 0.446 (neighbours 0.318 / 0.637);
s5 = master 0.58 (seed 8436), phone 0.68 (seed 9530), shipped edge contrast 0.486 (neighbours 0.637 / 0.616).
Then the pipeline's own detail pass, cuts and front layers, unchanged.

## pack v7 (2026-10-14): transition frames between stages (spec 1.7)

Every stage picture is pack v6.1's, byte for byte. New: for each biome and each stage step (s1→s2 … s5→s6), two
in-between pictures, three where the step changes a lot (island s1→s2, s2→s3, s3→s4; mountain s2→s3; plains s1→s2,
s4→s5, s5→s6), each at the desktop half shape and the phone shape: `BIOME/sNtoM-fK-half.webp` (2048×640) and
`BIOME/sNtoM-fK-phone.webp` (1024×1280), 1x only, WebP quality 86. `scenery.json` (spec 1.7) lists them per biome
under `transitions`: `holdMs` 120 (each frame held, limited-animation style), `fadeMs` 180 (the one fade into the new
stage), and `steps`, each `{ from, frames: [{ src, phone }], bytes }`. A ForgeCoach that reads 1.7 plays a step's
frames with hard cuts when a land arrives; an older one ignores the field and cross-fades as with v6.1.

How they were made: frame k of K at t = k/(K+1) is img2img at strength 0.30 (DreamShaper XL 1.0, the
sdxl-vae-fp16-fix VAE, DPM++ 2M Karras, 34 steps, cfg 7) over the linear blend (1−t)·sN + t·sN+1 of the two shipped
stage pictures, one seed per biome for every frame and both shapes, the two stages' prompt embeddings interpolated at
the frame's place on the ladder, then each frame's colour statistics matched to its blend so none flashes. Made on the
owner's GTX 1080 on 2026-10-14 by `~/scenery-packs/pack-v7-transitions/tools/tween_chain.sh` (see its `SUMMARY.md` and
the contact sheets there). No web images, card art or private files were used as inputs. Licence as before.
