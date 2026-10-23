# ForgeCoach scenery: pair pictures (`pairs-v1-work` branch)

This branch holds ONLY the pair pack: `pairs.json` at the root (ForgeCoach scenery spec 1.15) and its pictures under
`pairs/<a>-<b>/`, so a CDN serves a tag of it in full apart from the main pack. Load it as
`https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pairs-v4/` (the manifest is `pairs.json`).

**pairs-v4** (2026-10-23) is the **whole-half panoramas**. Justin, 2026-10-22: "when two lands are on the board, the
space of BOTH lands is the space we have to communicate (1) the type of land and (2) the transition between them". So a
pair is no longer a band or a road at the seam: when a half of ForgeCoach's board holds two colours, one picture of one
place fills the whole half, and the land share pans it (spec 1.15, behind `?pairfull=1`). He judged the first two batches
"really, really awesome" and, on 2026-10-23, said to publish them ("go with your recommendations on the scenery").

Every pair stage carries a **`panorama`** beside pairs-v2's `half`: one picture 1.6 x the half's 16:5 (3277 x 640, WebP
q80), the key's **first** biome the ground at the **left** end with the second behind it, the second the ground at the
right end with the first behind it, and the transition (a shore, a waterline, the grass's end) crossing the middle third
at `focal.x`; and a **phone** picture at 1.28:1 (1638 x 1280, q80: 1.6 x a 4:5 phone picture, so the same pan works on a
phone). Each stage also carries its measured `horizon` (and the phone's), its painted `hour` and light `key`, and a
`skyline`. The 1.9 `half` pictures and the 1.7 `transitions` the manifest still names are **pairs-v2's**, referenced by
absolute URL at `@pairs-v2`, so they cost this tag nothing; a reader that does not know `panorama` reads pairs-v4 as
pairs-v2. pairs-v3.1 (the meeting road), pairs-v3, pairs-v2, pairs-v1 and the draft pairs-v0 stay at their tags.

| Pair | Colours | Dual | Shock | The panorama (left end -> right end) |
| --- | --- | --- | --- | --- |
| `forest+island` | UG | Tropical Island | Breeding Pool | a jungle shore of mounds and ferns into a turquoise lagoon |
| `forest+mountain` | RG | Taiga | Stomping Ground | a spruce floor under red peaks, then red scree above a spruce valley |
| `forest+plains` | GW | Savannah | Temple Garden | a broad-leaved forest floor opening onto golden savannah |
| `forest+swamp` | BG | Bayou | Overgrown Tomb | a mossy forest floor with fallen logs, then a duckweed bayou of cypress and hanging moss |
| `island+mountain` | UR | Volcanic Island | Steam Vents | turquoise surf and black rocks under a smoking cone, a lava-veined shore steaming, a black lava field |
| `island+plains` | WU | Tundra | Hallowed Fountain | an ice-cliff shore with floes, a frozen stream across the snow plain |
| `island+swamp` | UB | Underground Sea | Watery Grave | a glowing cavern sea under a rock vault, then a black bog |
| `mountain+plains` | RW | Plateau | Sacred Foundry | red rock and a cliff foot, then a grass plain with mesas |
| `mountain+swamp` | BR | Badlands | Blood Crypt | ember-cracked rock, then a smoking fen among buttes |
| `plains+swamp` | WB | Scrubland | Godless Shrine | pale tussock grass with a pale four-column marble shrine, then a dark peat moor |

The names are for the caption only; the pictures are painted from our own words.

## Spec 1.15: `pairs.json`

Top level: `schema` 1, `spec` "1.15", `name`, `author`, `license`, `note`, and `pairs`, keyed by the two biomes in
alphabetical order joined by `+`; the art has the key's first biome on its left (ForgeCoach mirrors it for the other
order). Per pair, pairs-v2's fields unchanged (`dual`, `shock`, `place`, `band`, `stageMap` `[[1, 2], [3, 4], [5, 6]]`,
`transitions`), and three `stages`, each:

- `half`: pairs-v2's 1.5 half picture (desktop and phone, 1x and 2x), by absolute URL at `@pairs-v2`.
- `panorama`: `{src, width 3277, height 640, subjectBand [0.38, 0.72], focal {x 0.5, y 0.52}, safe, horizon, hour, key,
  skyline, bytes, phone: {src, width 1638, height 1280, subjectBand, focal, safe, horizon}}`, relative to this tag. No
  `src2x`: the trim (below) showed a 2x file adds nothing at the board's size.

ForgeCoach reads the panorama only under `?pairfull=1` (`pairfull.ts`): the picture is drawn 1.6 x the half's width and
panned so its transition lands at the left colour's share of the two colours' lands (clamped 0.2-0.8), and the pair
stage comes from the two colours' total lands (1-2 lands stage 1, 3-4 stage 2, 5+ stage 3).

This tag: 60 pictures and the manifest; **14,602,096 bytes** for those (desktop 6,473,776, phone 8,056,886, `pairs.json`
71,434), plus this README, PROVENANCE.txt, LICENSE and `tools/warm-cdn.sh`. ForgeCoach's validator gives 0 errors and
one warning: mountain+swamp declares 4.1 MB of stage pictures against the 4 MB per pair (pairs-v2's halves counted).

## How they were made

On the owner's GTX 1080, 2026-10-22 (`~/scenery-packs/panoramas-v1/`: its `SUMMARY.md`, `picks.json` and
`picks-why.json`, sheets and tools). DreamShaper XL 1.0 fp16 with the sdxl-vae-fp16-fix VAE, no LoRA, DPM++ 2M Karras.

1. **A guide painted in code** (`tools/pano.py`) at 4608 x 896: texture plates cut from ForgeCoach's own pack-v9 stage-5
   and pairs-v2 stage-3 pictures, laid out to the land-art rules (A the ground at the left end with B behind, B the ground
   at the right with A behind, the edge running from the far left into the foreground across the middle third, the
   smaller colour through the larger as an element, one sky and one light), features as painted silhouettes.
2. **MultiDiffusion img2img** (`tools/pano_gen.py`): the whole canvas's latent denoised at once under seven overlapping
   1152 x 896 windows, each with its own prompt (the left end's words, the middle's, the right end's), the noise
   predictions averaged under a smooth weight before one scheduler step, so no window is pasted and there is no seam;
   strength ~0.70-0.80, the sky held at 0.65. Two or three candidates a pair, picked by eye (batch 1: four pairs; batch 2:
   the other six, and Godless Shrine redone with a pale marble shrine that reads at board size).
3. **Stages 1-2** (`tools/stage.py`): the stage-3 pick moved to the pair's own pairs-v2 stage palette (a Lab transfer, with
   grain), then img2img at 0.52 / 0.48 with morning and afternoon words and the pick's own seed, so each pair's three
   stages are one place.
4. **Phone** (`tools/stage.py`): 1.28:1, the desktop picture of the same stage as the band across the middle, the sky above
   and the ground below painted on a 2 x 2 window grid; stages 1-2 from the phone stage 3 with the desktop stage band.
5. **Finish**: centre-cropped to 4588 x 896 (5.12:1); two model signatures painted out (Telea + grain); the horizons, hours
   and keys measured off each picture (`~/scenery-packs/light.json`).
6. **The trim** (`tools/trim.py`, CPU): re-encoded from the cleaned pictures at the board's display size. Candidate
   **D-P1** -- desktop 3277 x 640 q80 with no 2x, phone 1638 x 1280 q80 with no 2x -- rendered headless at 1:1 device pixels
   against the 80 MB draft (2x files, q86) and judged indistinguishable at board size (mean |diff| 2.0-2.4 desktop, 1.3-1.5
   phone; the draft's 2x was a Lanczos upscale of the 4588-px painting and carried no extra detail): 80.2 MB -> 14.6 MB.
