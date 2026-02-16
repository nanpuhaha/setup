#!/usr/bin/env bash
set -euo pipefail

BOOK_DIR="${1:-.}"
OUT_DIR="${2:-$BOOK_DIR}"

if ! command -v zip >/dev/null 2>&1; then
  echo "Error: 'zip' command is required but not installed." >&2
  exit 1
fi

BOOK_DIR="$(cd "$BOOK_DIR" && pwd)"
mkdir -p "$OUT_DIR"
OUT_DIR="$(cd "$OUT_DIR" && pwd)"

if [[ ! -f "$BOOK_DIR/META-INF/container.xml" || ! -d "$BOOK_DIR/OEBPS" ]]; then
  echo "Error: Not a valid EPUB folder: $BOOK_DIR" >&2
  echo "Expected: META-INF/container.xml and OEBPS/" >&2
  exit 1
fi

tmp_dir="$(mktemp -d)"
cleanup() {
  rm -rf "$tmp_dir"
}
trap cleanup EXIT

printf "application/epub+zip" > "$tmp_dir/mimetype"

base_name="$(basename "$BOOK_DIR")"
out_path="$OUT_DIR/${base_name}.epub"

rm -f "$out_path"

# EPUB spec: mimetype must be the first entry and stored without compression.
zip -X0qj "$out_path" "$tmp_dir/mimetype"

(
  cd "$BOOK_DIR"
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

echo "Built: $out_path"
