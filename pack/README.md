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
`https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pack-v2/pack/` as the pack URL (or add
`?scenery=https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pack-v2/pack/` to any ForgeCoach URL), then press
**Use on the board**; Settings → Board scenery holds the choice. To try changes locally, serve this folder with CORS
(for example `npx http-server . --cors -p 8650 -c-1`) and load `http://127.0.0.1:8650/` instead.

## v2 (2026-10-06)

Adds **board accents** (spec 1.3) for every land type — pieces that grow from the scenery onto the
player's area from stage 2 (vines, surf and crystal shards, cracked rock and embers, grass and
petals, moss and reeds), at the bolder "B" scale — and **effects** (spec 1.2): a bespoke stage-up,
landfall and creature-enter animation per land type, with the game's built-in presets in each
land's colour for attacks and damage. 23 MB in all.

## v3 (2026-10-06): art for the whole half

Adds, for every stage of every land type, a picture for the **whole half** of the board
(ART-DIRECTION §5), alongside the strip art above, which stays so the pack still loads on today's
client:

- **Desktop half** (`<biome>/sN-half.webp`, 2048x640, and `@2x` 4096x1280): a 16:5 cut of the
  full painting, its subject in the band between the card rows (about 35-60% down).
- **Phone half** (`<biome>/sN-phone.webp`, 1024x1280, and `@2x` 1536x1920): a 4:5 version made
  by extending the painting upward (more sky) and downward (calm ground or water) around its own
  centre; the painting itself stays sharp in the middle band.
- **Loop** for stage 4 (`<biome>/s4-<loop>-half.webm` + `.mp4` + poster, 1280x400), re-cut to
  the 16:5 desktop half. The phone half has no loop: a still is lighter on a phone and the loop's
  wide band would only show its middle there.

### The `half` block (proposed for spec 1.5)

The spec does not define these fields yet, so they sit in one clearly named block per stage,
which today's client ignores; the spec owner may adopt or rename them:

```json
"stages": [ { "layers": [ ... ], "overlay": [ ... ],
  "half": {
    "src": "island/s4-half.webp", "src2x": "island/s4-half@2x.webp", "aspect": 3.2,
    "phone": { "src": "island/s4-phone.webp", "src2x": "island/s4-phone@2x.webp", "aspect": 0.8 },
    "subjectBand": [0.35, 0.60],
    "video": { "src": "island/s4-motes-half.webm", "fallback": "island/s4-motes-half.mp4",
               "poster": "island/s4-motes-half-poster.webp", "blend": "screen" },
    "bytes": 2410000
  } } ]
```

| Field | Meaning |
| --- | --- |
| `src`, `src2x`, `aspect` | The desktop half (16:5 = 3.2), sky at the top and ground at the bottom. **Both halves are drawn upright and are never flipped vertically**; the opponent's half may at most be mirrored left-right, and a mist seam runs along the centre line. |
| `phone` | The tall 4:5 picture for narrow screens, same orientation. |
| `subjectBand` | The vertical band (fractions from the top) where each picture's subject sits; the client keeps the card rows' scrim off it where it can. |
| `video` | Stage 4 only: the loop, sized to the desktop half, screen-blended over it. |
| `bytes` | All of that stage's half files, for the budget. |
