# Progress

## Current State
- DOCUMENTING

## Snapshot
- 문서 선행 단계(`PRD.md` ~ `todo.md`) 완료
- `setup.sh` 메인 실행기 구현 완료 (TUI, silent, profile/category, dry-run, list)
- 매니페스트 단일 소스(`manifests/`) 구성 완료
- `brew_packages.sh` 호환 래퍼 전환 완료
- 기존 대규모 목록 `legacy/` 보존 완료
- 검증 완료:
  - `shellcheck macOS/setup.sh macOS/brew_packages.sh macOS/zsh.sh macOS/theos.sh macOS/espanso-packages.sh`
  - `bash -n macOS/setup.sh macOS/brew_packages.sh macOS/zsh.sh macOS/theos.sh macOS/espanso-packages.sh`
  - `./macOS/setup.sh --list-categories`
  - `./macOS/setup.sh --silent --dry-run`
  - `./macOS/setup.sh --profile minimal --silent --dry-run`
  - `./macOS/setup.sh --categories cli,browsers --dry-run`
  - `./macOS/brew_packages.sh --profile minimal --silent --dry-run`
  - TUI 수동 검증(`space` 토글 + `enter` 제출)
