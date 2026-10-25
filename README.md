# ForgeCoach scenery: pair pictures (`pairs-v1-work` branch)

This branch holds ONLY the pair pack. **pairs-v5-phone** (2026-10-24) holds the **phone pictures** that pairs-v5's
`pairs.json` names by absolute URL: the 120 painted-in element pictures for phones,
`pairs/<a>-<b>/s<k>+<C><L|R>-panorama-phone.webp`, 1638 x 1280 (1.28:1), WebP q80. There is no manifest here: load the
pair pack as `https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pairs-v5/` (the manifest is `pairs.json`), and its
`elements.<C>.<left|right>.phone.src` fields point at
`https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@pairs-v5-phone/pairs/...`.

Why a tag of its own: the painted-in set is ~50.1 MB (desktop 21.5 MB, phone 28.6 MB), over jsDelivr's 50 MB per ref,
so the desktop pictures and the manifest are at pairs-v5 and the phones here. The base phone panoramas stay at pairs-v4.

Each phone picture is the element's desktop pick carried into the phone panorama's band through its alpha (placement,
scale and motif by construction), with what leaves the band extended -- rivers, channels and paths down to the viewer's
feet, smoke and light shafts up into the taller sky -- repainted over a 1024-wide crop with the desktop job's own words
(tools/pin.py pprep / pfinish), composited back, grain and palette matched. Seven slots whose extension failed twice are
**band only** (the desktop pick in the band, lightly repainted, nothing extended).

This tag: 120 pictures, **28,586,838 bytes**, plus this README, PROVENANCE.txt and LICENSE.

**Flagged** (15): every phone whose desktop pick is flagged (island+mountain s2 GR, mountain+swamp s3 GR, plains+swamp s2
GR and s3 GR, island+swamp s3 GR, island+plains s3 GR, forest+island s3 RR, forest+swamp s3 UR), the green slots that
are tiny at phone scale (island+mountain s3 GR, mountain+swamp s2 GL, s2 GR, s3 GL), island+mountain s3 BR (tiny), and
forest+mountain s2 BL and s3 BL (band only, quiet). See pairs-v5's README and PROVENANCE.txt for the method and the
desktop picks.
