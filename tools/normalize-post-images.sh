#!/usr/bin/env bash
#
# Normalize markdown image links for Jekyll posts authored in Obsidian.
# Usage:
#   bash tools/normalize-post-images.sh --post <path-to-post.md> [--dry-run]

set -euo pipefail

usage() {
  cat <<'EOF'
Normalize image links in a markdown post.

Usage:
  bash tools/normalize-post-images.sh --post <path-to-post.md> [--dry-run] [--no-rename]

Options:
  --post <path>   Target post markdown file.
  --dry-run       Show planned changes without editing files.
  --no-rename     Keep existing image filenames; only rewrite link syntax/paths.
  -h, --help      Print this help.
EOF
}

log() {
  printf '%s\n' "$1"
}

add_map() {
  local old_path="$1"
  local new_path="$2"

  if [[ "$old_path" != "$new_path" ]]; then
    printf '%s\t%s\n' "$old_path" "$new_path" >>"$map_file"
  fi
}

next_available_name() {
  local ext="$1"
  local seq=1
  local candidate=""

  while :; do
    candidate=$(printf '%s-%02d' "$name_prefix" "$seq")
    if [[ -n "$ext" ]]; then
      candidate="${candidate}.${ext}"
    fi

    if [[ ! -e "$repo_root/img/$candidate" ]] && ! grep -Fqx "img/$candidate" "$planned_dests"; then
      printf '%s' "$candidate"
      return 0
    fi

    seq=$((seq + 1))
  done
}

dry_run=0
rename_files=1
post_path=""

while (($#)); do
  case "$1" in
  --post)
    post_path="${2:-}"
    shift 2
    ;;
  --dry-run)
    dry_run=1
    shift
    ;;
  --no-rename)
    rename_files=0
    shift
    ;;
  -h | --help)
    usage
    exit 0
    ;;
  *)
    printf 'Unknown option: %s\n\n' "$1" >&2
    usage >&2
    exit 1
    ;;
  esac
done

if [[ -z "$post_path" ]]; then
  printf 'Error: --post is required.\n\n' >&2
  usage >&2
  exit 1
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"

if [[ "$post_path" != /* ]]; then
  post_path="$(cd "$PWD" && pwd)/$post_path"
fi

if [[ ! -f "$post_path" ]]; then
  printf 'Error: post file not found: %s\n' "$post_path" >&2
  exit 1
fi

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

orig_post="$tmp_dir/original.md"
work_post="$tmp_dir/work.md"
paths_file="$tmp_dir/paths.txt"
final_paths_file="$tmp_dir/final_paths.txt"
seen_paths="$tmp_dir/seen-paths.txt"
seen_missing="$tmp_dir/seen-missing.txt"
map_file="$tmp_dir/path-map.tsv"
planned_dests="$tmp_dir/planned-dests.txt"

touch "$seen_paths" "$seen_missing" "$map_file" "$planned_dests"

cp "$post_path" "$orig_post"
cp "$post_path" "$work_post"

post_basename="$(basename "$post_path")"
if [[ "$post_basename" =~ ^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.+)\.md$ ]]; then
  post_date="${BASH_REMATCH[1]}"
  post_slug_raw="${BASH_REMATCH[2]}"
else
  post_date="$(date +%F)"
  post_slug_raw="${post_basename%.md}"
fi

post_slug="$(printf '%s' "$post_slug_raw" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//; s/-+/-/g')"
if [[ -z "$post_slug" ]]; then
  post_slug="post"
fi
name_prefix="${post_date}-${post_slug}"

rewrite_count=0
rename_count=0
missing_count=0

# 1) Convert Obsidian image embeds to markdown image links.
perl -0777 -i -pe '
  s{!\[\[([^\]|]+\.(?:png|jpe?g|gif|webp|svg|bmp|tiff?|avif))(?:\|([^\]]+))?\]\]}{
    my $src = $1;
    my $alt = defined($2) ? $2 : q{};
    "![${alt}]($src)"
  }gei;
  s{(!\[[^\]]*\]\()\.\./img/}{$1/img/}g;
  s{(!\[[^\]]*\]\()\.\/img/}{$1/img/}g;
  s{(!\[[^\]]*\]\()img/}{$1/img/}g;
' "$work_post"

# Collect image paths currently in the post.
perl -nle '
  while (/!\[[^\]]*\]\(([^)]+)\)/g) {
    my $p = $1;
    $p =~ s/^\s+|\s+$//g;
    $p =~ s/^<|>$//g;
    print $p;
  }
' "$work_post" >"$paths_file"

while IFS= read -r original_path; do
  if [[ -z "$original_path" ]]; then
    continue
  fi

  if grep -Fqx "$original_path" "$seen_paths"; then
    continue
  fi
  printf '%s\n' "$original_path" >>"$seen_paths"

  # Skip remote/data links.
  if [[ "$original_path" =~ ^https?:// ]] || [[ "$original_path" =~ ^data: ]]; then
    continue
  fi

  normalized_path="$original_path"

  # Convert bare filename to /img/<filename> when image exists under img/.
  if [[ "$normalized_path" != */* ]]; then
    bare_decoded="${normalized_path//%20/ }"
    if [[ -f "$repo_root/img/$bare_decoded" ]]; then
      normalized_path="/img/$normalized_path"
    fi
  fi

  # Keep /img links rooted.
  if [[ "$normalized_path" == ../img/* ]]; then
    normalized_path="/img/${normalized_path#../img/}"
  elif [[ "$normalized_path" == ./img/* ]]; then
    normalized_path="/img/${normalized_path#./img/}"
  elif [[ "$normalized_path" == img/* ]]; then
    normalized_path="/img/${normalized_path#img/}"
  fi

  if [[ "$original_path" != "$normalized_path" ]]; then
    add_map "$original_path" "$normalized_path"
    rewrite_count=$((rewrite_count + 1))
  fi

  # Rename files in img/ if they follow pasted naming or contain spaces.
  if [[ "$normalized_path" == /img/* ]]; then
    fs_rel="img/${normalized_path#/img/}"
    fs_rel_decoded="${fs_rel//%20/ }"
    source_file="$repo_root/$fs_rel_decoded"
    base_name="$(basename "$fs_rel_decoded")"

    if ((rename_files == 1)) && { [[ "$base_name" == Pasted\ image* ]] || [[ "$base_name" == *" "* ]]; }; then
      if [[ "$base_name" == *.* ]]; then
        ext="$(printf '%s' "${base_name##*.}" | tr '[:upper:]' '[:lower:]')"
      else
        ext=""
      fi

      new_name="$(next_available_name "$ext")"
      new_rel="img/$new_name"
      new_display="/img/$new_name"
      dest_file="$repo_root/$new_rel"

      if [[ -f "$source_file" ]]; then
        if ((dry_run == 1)); then
          log "[DRY-RUN] rename: $fs_rel_decoded -> $new_rel"
          printf '%s\n' "$new_rel" >>"$planned_dests"
        else
          mv -- "$source_file" "$dest_file"
          log "renamed: $fs_rel_decoded -> $new_rel"
        fi
        rename_count=$((rename_count + 1))
      fi

      add_map "$original_path" "$new_display"
      add_map "$normalized_path" "$new_display"
    fi
  fi
done <"$paths_file"

# Apply path map to markdown image links.
MAP_FILE="$map_file" perl -0777 -i -pe '
  my %map;
  BEGIN {
    open my $fh, "<", $ENV{MAP_FILE} or die "cannot open map file: $!";
    local $/ = "\n";
    while (my $line = <$fh>) {
      chomp $line;
      next if $line eq q{};
      my ($old, $new) = split(/\t/, $line, 2);
      $map{$old} = $new;
    }
  }

  s{!\[([^\]]*)\]\(([^)]+)\)}{
    my ($alt, $raw) = ($1, $2);
    my $trim = $raw;
    $trim =~ s/^\s+|\s+$//g;
    my $dst = exists $map{$trim} ? $map{$trim} : $trim;
    "![${alt}]($dst)"
  }ge;
' "$work_post"

# Missing image checks (non-remote links).
perl -nle '
  while (/!\[[^\]]*\]\(([^)]+)\)/g) {
    my $p = $1;
    $p =~ s/^\s+|\s+$//g;
    $p =~ s/^<|>$//g;
    print $p;
  }
' "$work_post" >"$final_paths_file"

post_dir="$(cd "$(dirname "$post_path")" && pwd)"

while IFS= read -r path; do
  if [[ -z "$path" ]]; then
    continue
  fi

  # Skip duplicates.
  if grep -Fqx "$path" "$seen_missing"; then
    continue
  fi
  printf '%s\n' "$path" >>"$seen_missing"

  if [[ "$path" =~ ^https?:// ]] || [[ "$path" =~ ^data: ]]; then
    continue
  fi

  path_without_query="${path%%\?*}"
  path_without_query="${path_without_query%%\#*}"
  path_decoded="${path_without_query//%20/ }"

  if [[ "$path_decoded" == /* ]]; then
    fs_check="$repo_root/${path_decoded#/}"
  else
    fs_check="$post_dir/$path_decoded"
  fi

  if [[ -f "$fs_check" ]]; then
    continue
  fi

  if ((dry_run == 1)) && [[ "$path_without_query" == /img/* ]]; then
    planned_rel="${path_without_query#/}"
    if grep -Fqx "$planned_rel" "$planned_dests"; then
      continue
    fi
  fi

  printf 'Warning: missing image reference: %s\n' "$path" >&2
  missing_count=$((missing_count + 1))
done <"$final_paths_file"

if ! cmp -s "$orig_post" "$work_post"; then
  if ((dry_run == 1)); then
    log "[DRY-RUN] would update: $post_path"
  else
    cp "$work_post" "$post_path"
    log "updated: $post_path"
  fi
else
  log "no content changes: $post_path"
fi

log "summary: rewrites=$rewrite_count, renames=$rename_count, missing=$missing_count"

if ((missing_count > 0)); then
  exit 1
fi
