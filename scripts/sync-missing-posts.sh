#!/usr/bin/env bash

set -eu

shopt -s nullglob

slugify_post_name() {
  local value="$1"

  value="${value%.md}"
  value="${value//&/and}"
  value="${value// /-}"
  value="${value%.md}"

  printf '%s\n' "$value"
}

for source in _posts/*.md; do
  base="${source##*/}"
  slug="${base#????-??-??-}"
  slug="$(slugify_post_name "$slug")"

  target_dir="posts/${slug}"
  target_file="${target_dir}/index.md"

  if [ ! -f "${target_file}" ]; then
    mkdir -p "${target_dir}"
    cp "${source}" "${target_file}"
    echo "Created ${target_file} from ${source}"
  fi
done
