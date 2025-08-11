#!/usr/bin/env bash
set -euo pipefail
DEST="assets/dictionaries"
[ -d "$DEST" ] && { echo "[dict] found: $DEST"; exit 0; }

echo "[dict] downloading..."
mkdir -p assets
curl -L -o assets/dictionaries.tar.gz "<<<https://github.com/Kazu0525/hyp_JP/archive/refs/tags/app_v0.0.1.tar.gz>>>"

echo "[dict] extracting..."
tar -xzf assets/dictionaries.tar.gz -C assets

[ -d "$DEST" ] || { echo "[dict] ERROR: extract failed"; exit 1; }
echo "[dict] ready at $DEST"
