#!/usr/bin/env bash
# Warm jsDelivr's cache for a pack tag: fetch every file the manifest names, so a
# player's first game after a new tag does not hit cold first-fetches (measured
# 2026-10-15 on pack-v7.2: up to 67 s per file against ForgeCoach's 15 s preload
# timeout, which made the board fall back to the built-in scenery for two biomes).
# Usage: tools/warm-cdn.sh <tag> [parallel] [manifest]
#   manifest: the manifest's path inside the tag (default pack/scenery.json); every file it names is
#   fetched relative to the manifest's folder. The pair bands (scenery spec 1.9) keep theirs at the root:
#   e.g. tools/warm-cdn.sh pack-v7.2 6        tools/warm-cdn.sh pairs-v0 6 pairs.json
set -euo pipefail
tag=${1:?tag}; par=${2:-6}; manifest=${3:-pack/scenery.json}
dir=$(dirname "$manifest"); [ "$dir" = . ] && dir="" || dir="$dir/"
base="https://cdn.jsdelivr.net/gh/jalirkan/forgecoach-scenery@${tag}/${dir}"
tmp=$(mktemp -d); trap 'rm -rf "$tmp"' EXIT
curl -fsS --retry 3 "${base}$(basename "$manifest")" -o "$tmp/manifest.json"
python3 - "$tmp/manifest.json" > "$tmp/urls" <<'PY'
import json,sys
s=json.load(open(sys.argv[1])); out=set()
def walk(o):
    if isinstance(o,dict):
        for k,v in o.items():
            if k in ('src','src2x','phone','poster','fallback') and isinstance(v,str): out.add(v)
            else: walk(v)
    elif isinstance(o,list):
        for x in o: walk(x)
walk(s); print('\n'.join(sorted(out)))
PY
n=$(wc -l < "$tmp/urls"); echo "warming $n files of $tag with $par in parallel"
fetch() { local u=$1 code; for a in 1 2 3; do code=$(curl -s -o /dev/null -w '%{http_code} %{time_total}' --max-time 120 "$base$u"); [[ $code == 200* ]] && { echo "$code $u"; return; }; done; echo "FAIL $code $u"; }
export -f fetch; export base
xargs -P "$par" -I{} bash -c 'fetch "$@"' _ {} < "$tmp/urls" > "$tmp/log"
fails=$(grep -c '^FAIL' "$tmp/log" || true); slow=$(awk '$1=="200" && $2>10' "$tmp/log" | wc -l)
echo "done: $n files, $fails failed, $slow took over 10 s"; grep '^FAIL' "$tmp/log" || true
[ "$fails" -eq 0 ]
