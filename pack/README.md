
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
