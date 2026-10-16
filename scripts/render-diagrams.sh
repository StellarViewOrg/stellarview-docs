#!/usr/bin/env bash
# Render every D2 source in diagrams/ to a light and a dark SVG in images/diagrams/.
# Pages show the right one for the active theme. Requires d2 (https://d2lang.com).
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
D2_DIR="$SCRIPT_DIR/../diagrams"
OUT_DIR="$SCRIPT_DIR/../images/diagrams"

mkdir -p "$OUT_DIR"

for file in "$D2_DIR"/*.d2; do
  [ -f "$file" ] || continue
  name="$(basename "$file" .d2)"
  echo "Rendering $name"
  d2 --layout=elk --theme=1 --pad=32 --center "$file" "$OUT_DIR/$name-light.svg"
  d2 --layout=elk --theme=201 --pad=32 --center "$file" "$OUT_DIR/$name-dark.svg"
done

echo "SVGs written to $OUT_DIR"
