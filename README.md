# ForgeCoach scenery: pieces (`pieces-v1`)

This tag holds ONLY the spec 1.14 `pieces` pictures under `pieces/`, so a CDN serves them apart from the main pack: the
main pack's tag (pack-v9.1, 45.2 MB) has no room beside jsDelivr's 50 MB per ref. The manifest that names them is
**pack-v9.2**'s `scenery.json` (pack-v9.1's, plus a `pieces` block), and every piece's `src` there is an absolute URL at
`https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pieces-v1/pieces/<file>` -- so this tag carries no manifest of its own.

**pieces-v1** (2026-10-23) is SYSTEM.md's batch 3 (pc-results `scenery/SYSTEM.md`, the slots B5, B7, B8, B9): Justin
approved the sketches for finished art on 2026-10-23 ("Let's go with your recommendations on the scenery").

| Slot | Pieces | What |
| --- | --- | --- |
| B5 elements | `element-<W U B R G>.webp` + `-phone` | a third colour's element in the heaviest pair's picture, transparent, its foot on the ground: W a shaft of light on a lit stone path with pale stones; U a winding blue river and a low sea-fog band; B a black bog channel with thin dead trees; R a red volcanic crag veined with lava under a smoke column; G two great mossy trees |
| B7 fronts | `front-<U W B G>-<1-4>.webp` + `-phone` | a colour's weather crossing the half right to left, four transparent frames (holdMs 200, fadeMs 400): U sea fog, W a wall of light, B crawling ground fog, G drifting pollen. R's ash fall is held (not in this tag) |
| B9 veils | `veil-won.webp`, `veil-lost.webp` + `-phone` | transparent grades over the winner's half (warm dawn light, a glow on the horizon) and the loser's (cold ash-dark) |
| B8 the empty table | `empty-half.webp` 2048 x 640, `empty-phone.webp` 1024 x 1280 | a 1.5 half (opaque): grey standing stones in mist on bleached grass at first light, horizon 0.55 (phone 0.52), hour 6, key dawn |

ForgeCoach main (a10d304) draws the empty table, the veils and the fronts (`ScenePieces`); elements are planned and not
drawn yet (`pieces.ts`: today's half gives a third colour a panel of its own).

This tag: 48 pictures, **2,660,314 bytes** (elements 756,394, fronts 1,690,118, veils 101,982, the empty table 111,820),
plus this README, PROVENANCE.txt and LICENSE. 1.14's budget for a pack's pieces is 6 MB; pack-v9.2 declares `bytes` on
every piece and front, 2,660,314 in all, and ForgeCoach's validator gives it 0 errors.

## How they were made

On the owner's GTX 1080, 2026-10-23 (`~/scenery-packs/panoramas-v1/`: SUMMARY.md's "Batch 3 sketches" and "Batch 3
finished", tools/b3.py, b3f.py, b3fin.py, sheets/batch3-finished.jpg). DreamShaper XL 1.0 fp16 with the
sdxl-vae-fp16-fix VAE, no LoRA, DPM++ 2M Karras; MultiDiffusion img2img (`tools/pano_gen.py`) over a guide painted in
code, 30-34 scheduled steps at 0.55-0.85.

1. **Elements** are painted over a neutral ground -- a plain grey plain under a pale sky, no place -- at 1792 x 896
   (0.625 of a 16:5 half at 896 tall), two candidates a colour (R: three motifs and a second outcrop), and keyed: the
   opaque parts by their change from the painted ground (each row's median outside the element), the light, fog, smoke
   and glow pulled against their own colour; cropped to the alpha with the foot on the bottom (`place.sit` ground,
   `x` 0.5, `w` for a region 0.65 of the half). The phone piece is painted the same way at 960 x 1920 (0.625 of a 4:5
   half at 1.5x) and cropped at the same canvas fractions, so one `place.w` serves both.
2. **Fronts**: the weather painted crossing each colour's base half (2048 x 640 and 1024 x 1280, the bases' own pair
   pictures), pulled against the weather's colour and held to its region, with no shapes of the base kept.
3. **Veils**: the end grade painted over three stage-3 halves, pulled against its colour, averaged over the three and
   blurred, so no place rides in it.
4. **The empty table**: the approved sketch finished over itself (2872 x 896 and 1152 x 1440), written at the half's 1x
   shapes; a model signature painted out of the phone picture (Telea + grain).
No `src2x`: the 1x files are at or above what the board draws (pairs-v4's trim showed a 2x upscale adds nothing).
