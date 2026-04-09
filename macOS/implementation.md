# Implementation

## CLI 인터페이스
- `--silent`: 프롬프트 없이 실행
- `--profile <name>`: `minimal|standard|full`
- `--categories <csv>`: 카테고리 직접 지정(프로필보다 우선)
- `--list-categories`: 카테고리/프로필 목록 출력
- `--dry-run`: 설치 미실행, 계획만 출력
- `--help`: 사용법 출력

## 내부 처리 규칙
- 기본 프로필은 `standard`
- tty + non-silent + `--categories` 미지정 + `--profile` 미지정 시 TUI 실행
- non-tty 또는 `--silent`는 비대화형 실행
- 시스템 변경(`chsh`)은 기본 활성화

## 파일 포맷
- `manifests/categories.tsv`
  - 탭 구분 4컬럼: `id`, `display_name`, `fragment_path`, `description`
- `manifests/profiles/*.txt`
  - 한 줄당 카테고리 id
  - 빈 줄 / `#` 주석 무시
- `manifests/categories/*.Brewfile`
  - Homebrew Bundle 문법 사용

## 핵심 함수 설계 (`setup.sh`)
- `load_categories`: `categories.tsv` 파싱
- `load_profile_categories`: 프로필 파일 로드
- `validate_categories`: 지정 카테고리 유효성 검증
- `run_tui_selector`: 키 입력 기반 체크리스트 UI
- `build_combined_brewfile`: fragment 병합 + dedupe
- `ensure_homebrew`: Homebrew 설치/경로 설정
- `apply_post_install_tweaks`: sha256 링크 + shell 설정
- `run_install`: update/upgrade/bundle/cleanup 실행

## 호환성
- `brew_packages.sh`는 새 `setup.sh`로 위임
- 기존 설치 목록 파일은 `legacy`로 이동하고 문서로 위치 안내
