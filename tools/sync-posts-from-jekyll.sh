#!/usr/bin/env bash
#
# Sync Jekyll-style sources in _posts/ to Quarto-style pages in posts/<slug>/index.*
# This lets authors keep writing single-file posts while preserving current URLs.

set -euo pipefail

SOURCE_DIR="_posts"
TARGET_DIR="posts"

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Skip sync: '$SOURCE_DIR' not found."
  exit 0
fi

shopt -s nullglob

synced=0

for src in "$SOURCE_DIR"/*.md "$SOURCE_DIR"/*.qmd; do
  base_name="$(basename "$src")"
  ext="${base_name##*.}"
  stem="${base_name%.*}"

  # Date should come from front matter, not filename.
  if ! awk '
    BEGIN { in_fm = 0; has_date = 0 }
    NR == 1 && $0 == "---" { in_fm = 1; next }
    in_fm == 1 && $0 == "---" { exit(has_date ? 0 : 1) }
    in_fm == 1 && $0 ~ /^[[:space:]]*date:[[:space:]]*/ { has_date = 1 }
    END { exit(has_date ? 0 : 1) }
  ' "$src"; then
    echo "Skip '$base_name': missing front matter 'date:'." >&2
    continue
  fi

  raw_slug="$stem"
  # Backward-compatible: still accept existing YYYY-MM-DD-<slug> filenames.
  if [[ "$raw_slug" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}-(.+)$ ]]; then
    raw_slug="${BASH_REMATCH[1]}"
  fi
  if [[ -z "$raw_slug" ]]; then
    echo "Skip '$base_name': empty slug." >&2
    continue
  fi

  raw_slug="${raw_slug//&/and}"
  slug="${raw_slug// /-}"

  out_dir="$TARGET_DIR/$slug"
  out_file="$out_dir/index.$ext"
  alt_ext="md"
  if [[ "$ext" == "md" ]]; then
    alt_ext="qmd"
  fi
  alt_file="$out_dir/index.$alt_ext"

  mkdir -p "$out_dir"

  tmp_file="$(mktemp)"
  cp "$src" "$tmp_file"

  # Jekyll front matter key; not needed for Quarto and can suppress MathJax injection.
  perl -0pi -e 's/^\s*math:\s*true\s*\n//mg' "$tmp_file"

  # Normalize author metadata to Quarto linkable format.
  perl -0pi -e 's/^author:\s*<\s*Tea Tasting Gentleman\s*>\s*$/author:\n  - name: Tea Tasting Gentleman\n    url: https:\/\/www.linkedin.com\/in\/shstat1729\//m' "$tmp_file"
  perl -0pi -e 's/^author:\s*Tea Tasting Gentleman\s*$/author:\n  - name: Tea Tasting Gentleman\n    url: https:\/\/www.linkedin.com\/in\/shstat1729\//m' "$tmp_file"
  perl -0pi -e 's/^author:\s*<\s*Tea Tasting Lady\s*>\s*$/author:\n  - name: Tea Tasting Lady\n    url: https:\/\/www.linkedin.com\/in\/systat\//m' "$tmp_file"
  perl -0pi -e 's/^author:\s*Tea Tasting Lady\s*$/author:\n  - name: Tea Tasting Lady\n    url: https:\/\/www.linkedin.com\/in\/systat\//m' "$tmp_file"

  # Keep only one index source extension per slug.
  if [[ -f "$alt_file" && "$alt_file" != "$out_file" ]]; then
    rm -f "$alt_file"
  fi

  if [[ ! -f "$out_file" ]] || ! cmp -s "$tmp_file" "$out_file"; then
    mv "$tmp_file" "$out_file"
    synced=$((synced + 1))
  else
    rm -f "$tmp_file"
  fi
done

echo "Synced $synced post(s) from $SOURCE_DIR to $TARGET_DIR."
