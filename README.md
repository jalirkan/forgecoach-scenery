# ForgeCoach scenery — pair bands, draft (`pairs-draft` branch)

This branch holds ONLY the pair-band pack: a `pairs.json` manifest (ForgeCoach scenery spec 1.9) and its pictures
under `pairs/<biome>-<biome>/`, so a CDN serves a tag of it in full apart from the main pack (the live pack is 46 of
jsDelivr's 50 MB per ref).

When one side of ForgeCoach's board has two colours, the seam between their two pictures becomes a third painted
place, the colour pair's own (named for its dual land), which widens with every two-colour land played.

Tag `pairs-v0` is a **draft for development**: the ten approved stage-3 concepts of 2026-10-16
(`~/scenery-packs/pair-scenery-concepts/picks/<dual>.png`), one picture per pair reused for all three stages, a
desktop picture (2048 × 640, WebP q86) and a 4:5 phone slice about its centre (512 × 640 scaled to 1024 × 1280),
no 2x files and no transition frames. Load it as
`https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pairs-v0/` (the manifest is `pairs.json`).
`pairs-v1` (three stages per pair and their frames) replaces it when the art lands.

| Pair | Dual | Shock |
| --- | --- | --- |
| island+plains | Tundra | Hallowed Fountain |
| island+swamp | Underground Sea | Watery Grave |
| mountain+swamp | Badlands | Blood Crypt |
| forest+mountain | Taiga | Stomping Ground |
| forest+plains | Savannah | Temple Garden |
| plains+swamp | Scrubland | Godless Shrine |
| island+mountain | Volcanic Island | Steam Vents |
| forest+swamp | Bayou | Overgrown Tomb |
| mountain+plains | Plateau | Sacred Foundry |
| forest+island | Tropical Island | Breeding Pool |

The names are for the caption only; the pictures are places painted from the names in our own words.

Licence: CC BY 4.0 (see LICENSE). Provenance: `PROVENANCE.txt`.
