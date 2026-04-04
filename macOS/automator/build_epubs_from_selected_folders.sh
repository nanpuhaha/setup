#!/usr/bin/env bash
set -euo pipefail

if ! command -v zip >/dev/null 2>&1; then
  echo "Error: 'zip' command is required but not installed." >&2
  exit 1
fi

if [[ "$#" -eq 0 ]]; then
  echo "Usage: $0 <book-folder> [book-folder ...]" >&2
  echo "Each folder must contain META-INF/container.xml and OEBPS/." >&2
  exit 1
fi

tmp_dir="$(mktemp -d)"
cleanup() {
  rm -rf "$tmp_dir"
}
trap cleanup EXIT

printf "application/epub+zip" > "$tmp_dir/mimetype"

built_count=0
skipped_count=0
failed_count=0

build_one() {
  local book_dir="$1"
  local out_path="$2"

  rm -f "$out_path"
  zip -X0qj "$out_path" "$tmp_dir/mimetype"

  (
    cd "$book_dir"
    shopt -s nullglob
    entries=(*)
    payload=()
    for entry in "${entries[@]}"; do
      if [[ "$entry" == "mimetype" ]]; then
        continue
      fi
      payload+=("$entry")
    done

    if [[ ${#payload[@]} -gt 0 ]]; then
      zip -Xrq "$out_path" "${payload[@]}" \
        -x "*.DS_Store" "*/.DS_Store" "__MACOSX/*" "*/__MACOSX/*" "._*" "*/._*"
    fi
  )
}

for input_dir in "$@"; do
  if [[ ! -d "$input_dir" ]]; then
    skipped_count=$((skipped_count + 1))
    echo "Skipped (not a folder): $input_dir"
    continue
  fi

  book_dir="$(cd "$input_dir" && pwd)"
  if [[ ! -f "$book_dir/META-INF/container.xml" || ! -d "$book_dir/OEBPS" ]]; then
    skipped_count=$((skipped_count + 1))
    echo "Skipped (not EPUB structure): $book_dir"
    continue
  fi

  out_path="$(dirname "$book_dir")/$(basename "$book_dir").epub"
  if build_one "$book_dir" "$out_path"; then
    built_count=$((built_count + 1))
    echo "Built: $out_path"
  else
    failed_count=$((failed_count + 1))
    echo "Failed: $book_dir" >&2
  fi
done

echo "Done. built=${built_count}, failed=${failed_count}, skipped=${skipped_count}"
