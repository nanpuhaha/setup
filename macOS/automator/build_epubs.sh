#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="${1:-.}"
OUT_DIR="${2:-$ROOT_DIR}"

if ! command -v zip >/dev/null 2>&1; then
  echo "Error: 'zip' command is required but not installed." >&2
  exit 1
fi

ROOT_DIR="$(cd "$ROOT_DIR" && pwd)"
mkdir -p "$OUT_DIR"
OUT_DIR="$(cd "$OUT_DIR" && pwd)"

tmp_dir="$(mktemp -d)"
cleanup() {
  rm -rf "$tmp_dir"
}
trap cleanup EXIT

printf "application/epub+zip" > "$tmp_dir/mimetype"

built_count=0
skipped_count=0

for book_dir in "$ROOT_DIR"/*; do
  if [[ ! -d "$book_dir" ]]; then
    continue
  fi

  if [[ ! -f "$book_dir/META-INF/container.xml" || ! -d "$book_dir/OEBPS" ]]; then
    skipped_count=$((skipped_count + 1))
    continue
  fi

  base_name="$(basename "$book_dir")"
  out_path="$OUT_DIR/${base_name}.epub"

  rm -f "$out_path"

  # EPUB spec: mimetype must be the first entry and stored without compression.
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

  built_count=$((built_count + 1))
  echo "Built: $out_path"
done

echo "Done. built=${built_count}, skipped=${skipped_count}"
