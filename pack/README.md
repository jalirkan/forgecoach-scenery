
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

## pack v7.1 (2026-10-14): the transition frames repainted, held 200 ms

The owner watched pack v7 at real timing: technically clean, nothing pops, but at 120 ms holds and with frames that
stay close to the blend, each step read as a quick dissolve rather than the stepped growth of limited animation. So:
two frames for every step (t = 1/3 and 2/3; the 3-frame steps dropped), `holdMs` 200 (`fadeMs` 180 as before), and
every in-between repainted at img2img strength 0.45 (was 0.30), the same per-biome seeds, prompt interpolation,
colour matching to the blend, sizes and quality. 0.45 was picked over 0.55 on island s1→s2 and forest s3→s4: at 0.45
each frame is its own picture (no double exposure) and arriving things are drawn part-grown; at 0.55 the first frame
erased what was arriving (island's reeds) and the swamp grew mountain spires that are in neither stage.
Two steps got their own treatment: swamp s2→s3 (t = 0.4 / 0.7, with the blend biased toward stage 3 where its dark
roots arrive -- 0.75 / 0.95 -- and on the phone a locally centred mask at strength 0.40) so the roots arrive in two
steps instead of one cut; forest s5→s6 (t = 0.5 / 0.8), whose stage 6 is a different composition (the canopy from
above at night): its frames now sink the trees into the canopy in two steps, a replacement rather than growth, which
only a re-drawn stage 6 would change. Files: `BIOME/sNtoM-fK-{half,phone}-v2.webp` (new names, so no cache mixes v7
and v7.1); pack v7's frames are not in this tag (they stay at `pack-v7`). Stage pictures unchanged.

## pack v7.2 (2026-10-15): three frames on the seven big steps, every cut even

Measured cut by cut (mean |grey difference| at 512x160 between consecutive pictures, stage → frames → next stage), v7.1's
cuts were even except swamp s2→s3 (30.8 / 9.2 / 5.6: the roots arrived as one pop), and the seven steps that change the most
(island s1→s2, mountain s2→s3, swamp s2→s3, swamp s3→s4, plains s4→s5, plains s5→s6, forest s2→s3: 30–42 over the whole
step) cut 12–15 at a time where the rest cut 7–10. Those seven now have three frames (t = ¼, ½, ¾), repainted as v7.1's
(strength 0.45, the same seeds, colour matching, sizes, quality, 200 ms holds, 180 ms fade); the other eighteen steps keep
v7.1's two frames byte for byte. Swamp s2→s3's root bias is now a mask centred on the frame's own darkening (in v7.1 the
desktop mask covered 79% of the picture, so it pushed the whole frame toward stage 3) and spread over the three frames (desktop
t 0.2 / 0.45 / 0.72 with the roots at 0.35 / 0.7 / 0.93; phone t ¼ / ½ / ¾, roots 0.45 / 0.75 / 0.95): its cuts are now
11.7 / 11.4 / 11.4 / 10.6. Files: `BIOME/sNtoM-fK-{half,phone}-v3.webp`; 57 frames, 4.7 MB. v7 and v7.1 stay at their tags.

## pack v7.3 (2026-10-15): forest stage 6 redrawn over stage 5's view, so the last step grows

Forest s6 (v5.1's s4, kept since) was a different composition from s5 -- the canopy seen from above at night -- so the s5→s6
frames could only replace one picture with the other (largest cut 12.4, max/mean 1.35). The new s6 is s5's own picture at night:
img2img over s5's master (and phone picture) after a coded night guide (s5's sky regraded to indigo with stars, its sunlit mist
dimmed to moonlit teal, lantern clusters on s5's own crowns, fireflies, the old s6's lit top garland), one new prompt, strength
0.45, then the ladder's tiled detail pass with the pick's own lights screened back, and the usual cuts; `front-s6` is the same
layout relit to the new picture, the sky layer keeps s5's band, and the fireflies video is unchanged. Forest s5→s6 now has three
frames (t = ¼, ½, ¾) made as v7.2's from s5 and the new s6: cuts 7.5 / 5.4 / 5.7 / 7.7 desktop (max/mean 1.17), 6.9 / 4.5 / 4.8 /
7.0 phone. Only `forest/s6-{sky,half,phone}*`, `forest/front-s6*` and the frames changed; every other stage file is pack v6.1's
byte for byte, and the other 55 steps' frames are v7.2's byte for byte under `-v4` names (`BIOME/sNtoM-fK-{half,phone}-v4.webp`).
58 frames, 4.7 MB; pack/ is 45,676,265 bytes. The old s6 stays at tag `pack-v7.2`. Made on the owner's GTX 1080 on 2026-10-15
(`~/scenery-packs/pack-v7-transitions/tools/s6redraw.py`, `SUMMARY-v4.md`). No web images, card art or private files were used as
inputs. Licence as before.

## pack v8 (2026-10-16): bridges across the seam (spec 1.8)

When one side of the board has two colours, the half board shows the two biomes' pictures side by side, meeting in a soft
seam. Pack v8 adds, for each of the ten biome pairs, a **bridge**: a transparent ground object painted across that seam, true to
both colours, so the two pictures read as one ground. `scenery.json` (spec 1.8) lists them under a top-level `bridges`, keyed
by the pair in alphabetical order (the art has the key's first biome on the left; ForgeCoach mirrors it for the reverse order):

| Pair | The bridge |
| --- | --- |
| `forest+island` (GU) | a turquoise river leaving the lagoon and winding into the forest floor |
| `forest+mountain` (RG) | a scree of red sandstone boulders, moss and ferns spilling from the mountains onto the forest floor |
| `forest+plains` (GW) | a sunlit dirt path edged with grass and white wildflowers, from the meadow into the wood |
| `forest+swamp` (BG) | a great mossy root crawling out of the forest floor into the fen water |
| `island+mountain` (UR) | a river of molten lava running down from the mountains into the lagoon |
| `island+plains` (WU) | a clear turquoise stream from the lagoon through the wheat, reeds on its banks |
| `island+swamp` (UB) | a tangle of dark mangrove roots creeping out of the fen into the glowing lagoon |
| `mountain+plains` (RW) | a pale road climbing out of the meadow up into the mountains |
| `mountain+swamp` (BR) | a cracked obsidian lava flow, ember veins glowing, running into the fen |
| `plains+swamp` (WB) | a pale stone causeway from the meadow out across the dark swamp water |

Each entry has a desktop piece (`bridges/<a>-<b>.webp`, 1024×440, centred on the seam at `anchor` `{ y: 0.725, width: 0.4 }`
of the half) and a phone piece (`bridges/<a>-<b>-phone.webp`, 768×704, `{ y: 0.725, width: 0.6 }`), and `dualsWiden` 0.02 /
`maxSeamRatio` 0.18: each two-colour land of the pair widens their seam by 2% of the half's width, up to 18% (the cross-biome
study's §4), the bridge scaled with it. One piece per pair serves every stage. 20 files, 556,936 bytes; pack/ is 46,242,211
bytes. Every other file is pack v7.3's, byte for byte; a ForgeCoach older than 1.8 ignores `bridges` and draws today's seam.

How they were made (`~/scenery-packs/cross-biome-bridges/`, its `SUMMARY.md` and contact sheet): each pair's stage-3 pictures
composited as ForgeCoach's half board does (equal shares, the 10% overlap, its gradient and mist) at a 2560×800 desktop half and
a 1280×1280 phone half; the object's shape painted in across the seam on the ground, at 60–80%; img2img at strength 0.68–0.76
(DreamShaper XL 1.0, the sdxl-vae-fp16-fix VAE, DPM++ 2M Karras, 34 steps, cfg 7) over a 1536×768 / 1024×1024 crop centred on the
seam, two seeds, the better picked by eye; then kept only inside the shape's dilated, blurred mask and faded toward the piece's
sides and top (the soft alpha falloff), WebP quality 86 with lossless alpha. Seven pieces of four pairs were redrawn after review (see the
summary). Made on the owner's GTX 1080 on 2026-10-16. No web images, card art or private files were used as inputs. Licence as
before.

## pack v9 (2026-10-19): the bridges repainted across the seam; two accent artefacts painted out

Justin played pack v8 with pairs-v2 on 2026-10-17 and called the seams janky (`~/scenery-packs/seams-v1/diag/DIAGNOSIS.md`).
Most of it was ForgeCoach's layout (scenery spec 1.10: a seam with a pair band now draws the band and no bridge, so a bridge
shows only where there is no band). Two things were in the pack:

- **The bridges** read as cut-outs: an object (a river, a lava flow) kept inside its own outline. Each is now **one picture
  across the seam**: the pair's stage-3 pictures composited as ForgeCoach draws a plain seam, repainted with a strength map that
  is high over the seam's ground and falls away to both sides and up to the horizon (img2img 0.62, 0.70 for `mountain+plains`;
  DreamShaper XL 1.0, sdxl-vae-fp16-fix, DPM++ 2M Karras, 34 steps, cfg 7), one prompt per pair naming where the two grounds
  meet (a black lava-rock shore with surf where the mountains reach the lagoon, a sandy beach where the wheat meets the sea, the
  forest floor sinking into the fen), and cut with that same soft shape as its alpha, so no piece has an outline or an edge. Same
  files, sizes and anchors as v8 (desktop 1024×440 at `{ y: 0.725, width: 0.4 }`, phone 768×704 at `{ y: 0.725, width: 0.6 }`);
  20 files, 397,436 bytes.
- **Two full-area accents** carried marks that, on a split half, landed on the other biome: `island/front-s4..s6` (and @2x) a
  lone shell in the sky, now gone; `plains/front-s2..s6` (and @2x) one or two golden diagonal streaks hanging from the top
  fringe, now gone (the fringe, its medallions, the feathers and the pebbles stay). Their `bytes` follow.

Every other file is pack v8's, byte for byte. pack/ is about 45.2 MB (v8: 46.2). Made on the owner's GTX 1080 on 2026-10-19
(`~/scenery-packs/seams-v1/`, its `SUMMARY.md`, `sheets/overview.jpg`). No web images, card art or private files were used as
inputs. Licence as before. pack v8 stays at its tag.

## pack v9.2 (2026-10-23): the `pieces` block (spec 1.14) pointing at the pieces-v1 tag

`scenery.json` is pack v9.1's (spec 1.13: each half picture's measured horizon and each stage's painted hour and key, no picture
changed) plus a top-level `pieces` block (spec 1.14), and every other file in pack/ is pack v9.1's, byte for byte. The pieces live
at a tag of their own, **`pieces-v1`** (48 WebP, 2,660,314 bytes), and every `src` in the block is an absolute URL
`https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pieces-v1/pieces/<file>`, so this tag stays at about 45.2 MB under
jsDelivr's 50 MB per ref. The block, each entry a desktop picture and a `phone` one, each with its `bytes`:

| Key | What |
| --- | --- |
| `elements` (W U B R G) | a third colour's element in the heaviest pair's picture, transparent, its foot on the ground (`place` `{ sit: ground, x: 0.5, w }`): W a shaft of light on a lit stone path; U a winding blue river and a low sea-fog band; B a black bog channel with thin dead trees; R a red volcanic crag veined with lava under a smoke column; G two great mossy trees |
| `fronts` (U W B G) | a colour's weather crossing the half right to left, four transparent frames at 2048×640 and 1024×1280, `holdMs` 200, `fadeMs` 400: U sea fog, W a wall of light, B crawling ground fog, G drifting pollen. R's ash fall is held |
| `veils` (won, lost) | transparent grades over the winner's half (warm dawn light) and the loser's (cold ash-dark), 2048×640 and 1024×1280 |
| `empty` | the empty table, a 1.5 half (opaque), 2048×640 and 1024×1280: grey standing stones in mist on bleached grass at first light, horizon 0.55 (phone 0.52), hour 6, key dawn |

A ForgeCoach older than 1.14 ignores `pieces`; main (a10d304) draws the empty table, the veils and the fronts, not yet the elements.

How they were made: DreamShaper XL 1.0 (fp16, the sdxl-vae-fp16-fix VAE, DPM++ 2M Karras, no LoRA), MultiDiffusion img2img over
guides painted in code at the pieces' own shapes, 30–34 scheduled steps at strength 0.55–0.85. The elements were painted over a
neutral ground (a plain grey plain under a pale sky, no place) and keyed off it, so the alpha is the element alone, then cropped
to it with the foot on the bottom; the fronts were painted crossing each colour's own half picture and pulled against the
weather's colour, four frames a colour; each veil is its end grade painted over three stage-3 halves, pulled against its colour
and averaged over the three, so no place rides in it; the empty table is the approved sketch finished over itself. No `src2x`.
Made on the owner's GTX 1080 on 2026-10-23 (`~/scenery-packs/panoramas-v1/`, its `SUMMARY.md` "Batch 3 finished",
`sheets/batch3-finished.jpg`). No web images, card art or private files were used as inputs. Licence as before. pack v9.1 stays
at its tag.

## pack v10 (2026-11-06): every half and phone picture painted in oil (oil-v2); the old-style pictures around them dropped

**What changed.** The 120 half pictures -- 30 stages, each a desktop half (2048×640, `@2x` 4096×1280) and a phone picture
(1024×1280, `@2x` 1536×1920) -- are oil-v2's (`~/scenery-packs/oil-v2/pack/`), byte for byte, at pack v9.2's names. Each stage's
`half` block is oil-v2's: `subjectBand`, `horizon`, the phone's `subjectBand` and `horizon`, `hour` and `key` measured on the new
pictures, `bytes` measured from the files in this tag. Half pictures per biome: island 2.34 MB, mountain 1.35, plains 1.67,
forest 3.57, swamp 1.99 (budget 8 MB). The place is new as well as the hand, and four of the five lands were redesigned by the
owner on 2026-11-05: island a sea-metropolis of terraces and upswept halls over its bay, mountain a fortress at war on its lava
cliff, plains a domed steppe city among felt tents, swamp a stilt village of thatch and plank walks; the forest's tree houses in
two giant trees are oil-v1's, its 24 pictures byte for byte. Each land holds its landmark in the left third and its sun or moon
about four fifths across, grown stage by stage from dawn (s1) to night (s6).

**How it was made.** FLUX.2 klein 4B composes and Z-Image-Turbo repaints, oil-v1's recipe: the four stage-4 heroes drafted, then
moved into the left third by geometry and painted once more (klein edit, Z-Image 0.30); every other stage a klein edit with the
hero as its reference, then a Z-Image pass at 0.30, with klein fix edits and a few CPU paint-outs where a pass planted
something; the phone pictures keep the desktop's u 0.05–0.55 as their band and paint the sky above and the ground below.
1,210 pictures and 20.1 GPU hours of generation on the owner's GTX 1080, 2026-11-05/06 (with the draft round, 1,314 and 21.9);
every recipe, pick and known fault is in `~/scenery-packs/oil-v2/NOTES.md`. The seam cells painted in the same round, and the
sky pass that gave each of them one sky, are the pair pack's (`pairs-v8`). No web images, card art or private files were used as
inputs. Licence as before. (An earlier build of this tag from oil-v1's lands was made on 2026-11-05 and never tagged.)

**Dropped from `scenery.json`**, because each drew a pack v9.2 picture -- a different place in a different hand -- over or beside
the oil one (their files are not in this tag; they stay at `pack-v9.2`):

| Entry | When ForgeCoach draws it | Without it |
| --- | --- | --- |
| every stage's strip `sky` layer (`sN-sky.webp`, 60 files) | only with Settings → Fill each side off (the 1.4 strip), or when a half picture fails to load | the reader makes the stage's half picture the strip layer (spec 1.5: a stage with a half and no image layer), so the strip shows the oil picture cover-cropped; between thresholds it cross-fades the two oil stages |
| every stage's full-area accent (`front-sN.webp`, 50 files) | on every board (Settings → Board accents, on by default), over the half at z −2: vines, shells and sand, lava and rocks pasted on the oil picture | no accent: a pack biome with its own art and no `overlay` draws none (overlay.ts `biomeOverlay`), never the built-in placeholders |
| every biome's `transitions` (1.7, `sNtoM-fK-*-v4.webp`, 58 frames × 2 shapes, 116 files) | at every stage step of a mono panel (thresholds 1–6: every land up to six), two or three frames at 200 ms and a 180 ms fade -- 580–780 ms of the old place between two oil stages | spec 1.6/1.10: the new stage's picture cross-fades in over `growth.seconds`, 1.2 s, at the threshold (at once with reduced motion) |
| the island's `motes` and the mountain's `embers` loops at stage 6 (6 files) | over the desktop stage-6 picture, screen-blended | the still picture. The island's loop carries an aurora and the old floating islands' lit outlines, the mountain's the ember plumes of the old volcano peaks: both read as ghosts of the old place in the oil night sky |
| the top-level `bridges` (1.8, 20 files) | only on a seam with no pair band or motif: with `?pairs=off`, or while a pairs pack fails to load (pairs-v3.1 and pairs-v8 have all ten pairs, and a motif seam counts, spec 1.10) | the plain 1.10 seam (its gradient and mist); a dual no longer widens it |

**Kept:** the forest's `fireflies`, the plains' `motes` and the swamp's `wisps` (sparks and a faint mist over the stage-6 night
picture, no shape of the old place in them); every biome's `effects` (one-shot glows and sparks in the strip-sized box, a second
or two, screen-blended); the `pieces` block at `@pieces-v1` (the five element cut-outs, which spec 1.19 a needs so that every
colour with lands is on screen, the four colour fronts, both veils and the empty table); `strip`, `stageThresholds`, `half`,
`growth` and each biome's `label`, `slot`, `bloom` and `idle`. `validateManifest` gives no error and no warning (pack v9.2's one
warning, swamp's 4.0 MB of full-area accents, went with the accents).

**Waits for the next round:** the transition frames in oil (58 frames at two shapes, 116 pictures) if the stepped growth is
wanted back; the five element cut-outs in oil (5 desktop + 5 phone, 10 pictures), which now stand on oil grounds wherever a
third, fourth or fifth colour is drawn;
and, optional, the island and mountain stage-6 loops, the empty table (2 pictures) and the fronts (4 colours × 4 frames × 2
shapes).

**This tag:** `pack/` is 161 files, 15,721,799 bytes (pack v9.2: 413 files, 45.2 MB): the 120 oil pictures, the three kept
loops (9 files), the effects (30 files), `scenery.json` (30,431 bytes) and this README.

**ForgeCoach, the day the tags exist** (with `pairs-v8`): `src/ambience/prefs.ts` `FORGECOACH_PACK_URL` →
`https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pack-v10/pack/` and `FORGECOACH_PAIRS_FULL_URL` →
`…@pairs-v8/` (and their comments); `src/ambience/testdata/pack-v10.scenery.json` and `pairs-v8.tag.pairs.json`, byte copies of
the two tagged manifests (30,431 bytes, sha256
`59a688c1a725f8685fe8e5d0f36fe8bf8a62b37518d19196cc43a1ab36e3d666`; 195,774 bytes, sha256
`bcbca31336311765c3dc9cc1e6c965a2ebaefbe2ec7f5d3a817e9d45ec53ac72`); a `pack-v10.test.ts` and a `pairs-v8.test.ts` pinning the URLs and
each file's sha256, as `pack-v9-2.test.ts` and `pairs-v7.1.test.ts` do (those two then say their tag stays up, and stop asserting
the default URL); `storyboard.test.ts`, `scenery-1.19.test.ts`, `preview-ties-captions.test.ts` and
`ui/ambience/sceneryDom.test.tsx` read the new testdata, and their seven tests' expectations of pairs-v7.1's painted-in cells
become the third colour's cut-out; `e2e/ambience.e2e.mjs`'s default (`@pairs-v7.1`, red painted into island+plains' cells, and the
phone check's demand for a painted cell); `CLAUDE.md`'s lines naming the pack and the pairs.
