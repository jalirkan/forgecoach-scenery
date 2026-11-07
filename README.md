# ForgeCoach scenery: scenes (this tree is branch `scenes-v1-work`)

This branch holds ONLY the scenes. **scenes-v1.3** (2026-11-07, 434 scenes in eight regions; scenes-v1 was the first eight, v1.1 the Nile delta; v1.2 was withdrawn, over jsDelivr's 50 MB a ref) is scenery spec 1.20's scenes: one
whole-half oil painting made for an exact set of lands, each with its phone picture. ForgeCoach reads
`scenes.json` at this ref's root (`FORGECOACH_SCENES_URL`); a board whose lands match a scene's key draws that painting
and nothing else, and every other board falls back to the pack's own pictures.

- A scene's key is its biomes in the fixed geography order Island -> Swamp -> Plains -> Forest -> Mountain, each with its
  stage (its land count, 6 at most), joined with `+`: `island2+forest3+mountain2`. Board order does not matter; a scene
  is drawn as painted, never mirrored.
- `scenes/<key>/half.webp` (2048 x 640) and `half@2x.webp` (4096 x 1280) are the desktop painting; `phone.webp`
  (1024 x 1280) and `phone@2x.webp` (1536 x 1920) the phone painting, painted upright, not cropped.
- A scene made as a board of a region (PLACES.md's map) carries `region` and, from v1.3, `ref`: the tag its pictures live at (`scenes-r-<region>-<n>`, each at most 40 MB, since jsDelivr serves no ref over 50 MB); its `src`s are absolute URLs there, and only region-less scenes keep files in this folder; its boards are one hero re-rendered per board, so the place stays as the lands grow.
- `scenes.json` carries each scene's `lands`, its `half` (src, src2x, size, bytes, subjectBand, horizon, hour, key, focal,
  safe) with its `phone` inside, and the candidate it was made from under `sources`.
- Every colour on the board is somewhere in the picture; the scenes are places (PLACES.md in the working folder names
  them), and the boards of one place are edits of one painting so the place stays the same as the lands grow.

PROVENANCE.txt has the inputs, the models and the licence (CC BY 4.0).
