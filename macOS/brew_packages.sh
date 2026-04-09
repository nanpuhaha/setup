#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[brew_packages.sh] Deprecated entrypoint. Delegating to setup.sh..."
exec "${SCRIPT_DIR}/setup.sh" "$@"
