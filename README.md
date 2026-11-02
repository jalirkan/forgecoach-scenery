# ForgeCoach scenery: pair pictures (`pairs-v1-work` branch)

This branch holds ONLY the pair pack. **pairs-v7-phone** (2026-11-02) holds the **phone pictures** of the seam grid
that pairs-v7's `pairs.json` names by absolute URL on every cell's `phone`:
`seams/<left>-<right>/s<i>x<j>-panorama-phone.webp`, 160 pictures, 1638 x 1280 (1.28:1), WebP. There is no manifest
here: load the pair pack as `https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pairs-v7/`.

Why a tag of its own: the grid's desktop pictures and manifest fill 39.7 MB of jsDelivr's 50 MB per ref, so the phone
cells live here and the painted-in cells at pairs-v7-pin.

Each phone cell is the desktop cell's band (u 0.30-0.70 of the picture, identical to the desktop pick) between one
phone extension per colour and stage -- the mono half as its band, its sky and foreground painted over that stage's own
mono phone picture -- placed exactly as the desktop placed the mono halves, with only the seam above and below the band
painted per cell. Adding a land changes one half's picture on the phone as on the desktop.

This tag: 160 pictures, **13,553,860 bytes**, plus this README, PROVENANCE.txt and LICENSE.
