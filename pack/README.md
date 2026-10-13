
## pack v6 (2026-10-13): the six-picture ladder

Six stages per biome, thresholds [1, 2, 3, 4, 5, 6] — one look per land. Stages 1, 2, 4 and 6 are pack v5.1's
pictures unchanged (its s1, s2, s3, s4; s6 keeps the loop). Stages 3 and 5 are new: for each biome, the master and
the phone picture were painted from the 50/50 blend of their two neighbours, img2img at strength 0.45 on
DreamShaper XL 1.0 (fp16, the sdxl-vae-fp16-fix VAE, DPM++ 2M Karras) with the two neighbours' prompt embeddings
averaged, three seeds, the pipeline's 2× tiled detail pass on the pick, then the usual cuts (sky, half, phone,
each with @2x) and a half-way front layer. Made on the owner's GTX 1080 overnight 2026-10-12/13 by
`~/scenery-packs/tools/ladder_chain.sh` (see `pack-v6-ladder/SUMMARY.md` there). Spec 1.6 (`growth` defaults).
No web images, card art or private files were used as inputs. Licence as before.
