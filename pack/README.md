# ForgeCoach scenery, pack v1

A board scenery pack for [ForgeCoach](https://github.com/jalirkan/ForgeCoach), written to its scenery pack spec
(schema 1, spec 1.3): five land types (island, forest, mountain, plains, swamp), each painted in four stages that grow
with the player's lands, from a calm place at one land to a dreamlike vista at six or more. Each stage is one painted
backdrop (`<biome>/sN-sky.webp`, 2048x512, with a 4096x1024 `@2x`), and the fourth stage adds one short loop
(WebM with alpha, an MP4 fallback and a still poster): motes and aurora light over the cove, rising embers, fireflies,
drifting light and wisps. The whole pack is about 13.6 MB. The art is original, generated from the author's own prompts;
the rest of this repository has the full-size frames and their provenance. Licence: CC BY 4.0 ("ForgeCoach scenery by
jalirkan").

To use it, open ForgeCoach's `#ambience` page and load
`https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pack-v1/pack/` as the pack URL (or add
`?scenery=https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pack-v1/pack/` to any ForgeCoach URL), then press
**Use on the board**; Settings → Board scenery holds the choice. To try changes locally, serve this folder with CORS
(for example `npx http-server . --cors -p 8650 -c-1`) and load `http://127.0.0.1:8650/` instead.
