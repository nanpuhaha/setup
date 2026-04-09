# Prompt History

## 2026-04-07 20:05:00 macOS 셋팅 스크립트 점검/개선 요청

### User Request

macos 셋팅 스크립트를 점검하고 수정해줘. 깔끔하되 정보를 너무 날려버리지는 말도록 해줘. 관리의 용이성을 위한 거니까, 셋팅을 할 때 컴퓨터에 따라 선택해서 설치할 수 있도록 하는 것도 좋을 것 같아. space로 toggle하고 enter로 submit하는 그런 tui 기반 인터렉티브한 것도 만들어주고. silent 모드처럼 그냥 기본값으로 알아서 설치하는 모드도 가능하도록

### Analysis & Actions

- macOS 스크립트 구조(`setup.sh`, `brew_packages.sh`, `Brewfile*`)와 현재 Git 상태를 점검함.
- 중복/혼재된 설치 소스와 단일 진입점 부재를 확인하고, 카테고리 매니페스트 기반 구조 개편 필요성을 도출함.
- 구현 전 의사결정 항목(기본 프로필, 단일 소스, TUI 방식, 정보 보존 방식, 선택 단위)을 정리해 계획안을 확정함.
- 생성/수정/삭제 파일: 없음 (분석/계획 단계)
- 실패: 없음

### Outputs

- 생성된 파일 목록: 없음
- 수정된 파일 목록: 없음

## 2026-04-07 20:53:24 계획안 구현 요청

### User Request

PLEASE IMPLEMENT THIS PLAN:
## macOS 셋업 스크립트 정비 + 인터랙티브/사일런트 모드 설계안

### 요약
- 목표는 “깔끔하지만 정보 손실 없는” 구조로 macOS 설치 스크립트를 재구성하는 것입니다.
- 단일 소스는 **카테고리 매니페스트**로 두고, 설치 시점에 컴퓨터별로 카테고리를 선택할 수 있는 **무의존 Bash TUI(스페이스 토글, 엔터 확정)**를 제공합니다.
- `--silent` 모드에서는 **기본 프로필=개발 표준**으로 프롬프트 없이 설치합니다.
- 기존 대규모 목록은 삭제하지 않고 **legacy 아카이브로 보존**합니다.

### 구현 변경
- 문서 우선 순서대로 `macOS` 하위 문서를 먼저 작성/갱신합니다.
- 문서 작성 순서: `PRD.md → architecture.md → implementation.md → plan.md → todo.md` 후 구현, 테스트, `progress.md`, 필요 시 `decision.md/findings.md`, 마지막 `prompt_history.md` append.
- `prompt_history.md`에는 이번 사용자 요청 원문을 그대로 기록하고, 실패/성공 여부 포함해 append-only로 관리합니다.
- 메인 실행기는 [macOS/setup.sh](/Users/jwseo/GitHub/setup/macOS/setup.sh)로 통합하고, 기존 [brew_packages.sh](/Users/jwseo/GitHub/setup/macOS/brew_packages.sh)는 호환 래퍼(또는 deprecate 안내 후 위임)로 정리합니다.
- 카테고리 매니페스트 구조를 추가합니다.
- 카테고리 정의(표시명/파일 경로): `macOS/manifests/categories.tsv`
- 카테고리별 Brewfile fragment: `macOS/manifests/categories/*.Brewfile`
- 프로필 정의: `macOS/manifests/profiles/{minimal,standard,full}.txt`
- 설치 시 임시 Brewfile을 조합하고(선택 카테고리 순서대로), 중복 라인은 순서 보존 dedupe 후 `brew bundle --file <temp>`로 실행합니다.
- 기존 정보 보존을 위해 `Brewfile2`, `apps_list.txt`, 대규모 과거 목록은 `macOS/legacy/`로 이동/정리하고 참조 문서를 둡니다.

### 공개 인터페이스/동작
- [macOS/setup.sh](/Users/jwseo/GitHub/setup/macOS/setup.sh) 옵션:
- `--silent`: 프롬프트 없이 설치
- `--profile minimal|standard|full`: 설치 프로필 지정 (기본 `standard`)
- `--categories a,b,c`: 프로필 대신 카테고리 직접 지정
- `--list-categories`: 사용 가능한 카테고리/프로필 출력
- `--dry-run`: 실제 설치 없이 계획만 출력
- `--help`: 사용법 출력
- 인터랙티브 모드(tty + `--silent` 아님):
- 방향키 이동, `space` 토글, `enter` 제출
- `a` 전체 토글
- `q` 취소
- silent/non-tty:
- 기본은 `standard` 프로필 자동 적용
- 시스템 변경 작업(현재 스크립트의 `/etc/shells` 업데이트 + `chsh`)은 **기본 활성화**로 유지

### 테스트 계획
- 정적 검사: `shellcheck`로 [macOS/setup.sh](/Users/jwseo/GitHub/setup/macOS/setup.sh), 래퍼/보조 스크립트 점검.
- 문법 검사: `bash -n` 전체 대상 실행.
- 기능 검증(무설치):
- `./macOS/setup.sh --list-categories`
- `./macOS/setup.sh --silent --dry-run`
- `./macOS/setup.sh --profile minimal --silent --dry-run`
- `./macOS/setup.sh --categories cli,browsers --dry-run`
- 인터랙티브 수동 검증:
- 카테고리 화면에서 `space` 토글/`enter` 제출 동작
- 선택 결과가 dry-run 출력과 일치하는지 확인
- 회귀 검증:
- 기존 진입점(`brew_packages.sh`) 호출 시 새 엔진 위임 동작 확인
- legacy 파일이 보존되었는지 확인

### 가정/기본값
- 문서 파일은 사용자 선택에 따라 `macOS` 폴더 내에서 관리합니다.
- 기본 silent 프로필은 `standard`입니다.
- 선택 단위는 패키지 개별이 아닌 카테고리 단위입니다.
- 기존 정보는 제거하지 않고 legacy로 보존합니다.

### Analysis & Actions

- 문서 선행 순서(`PRD.md → architecture.md → implementation.md → plan.md → todo.md`)를 먼저 작성한 뒤 코드 구현을 진행함.
- `manifests/` 기반 단일 소스 구조를 추가하고, 카테고리/프로필 정의를 분리함.
- `setup.sh`를 새 메인 실행기로 교체하여 옵션 파싱, TUI 선택, profile/categories 선택, dry-run, brewfile 병합/중복 제거를 구현함.
- `brew_packages.sh`를 새 `setup.sh` 위임 래퍼로 전환함.
- 기존 대규모 목록 파일을 `legacy/`로 이동 보존하고 아카이브 설명 문서를 추가함.
- `README.md`를 새 실행 모델 중심으로 갱신함.
- `shellcheck`, `bash -n`, `--dry-run` 시나리오, TUI 키입력 시나리오를 실행해 검증함.
- 삭제/이동 사항을 포함해 변경 파일을 문서화함.
- 실패: 없음

### Outputs

- 생성된 파일 목록:
  - `macOS/PRD.md`
  - `macOS/architecture.md`
  - `macOS/implementation.md`
  - `macOS/plan.md`
  - `macOS/todo.md`
  - `macOS/progress.md`
  - `macOS/prompt_history.md`
  - `macOS/manifests/categories.tsv`
  - `macOS/manifests/categories/00-core.Brewfile`
  - `macOS/manifests/categories/01-cli.Brewfile`
  - `macOS/manifests/categories/02-languages.Brewfile`
  - `macOS/manifests/categories/03-terminals-editors.Brewfile`
  - `macOS/manifests/categories/04-browsers.Brewfile`
  - `macOS/manifests/categories/05-productivity.Brewfile`
  - `macOS/manifests/categories/06-collaboration.Brewfile`
  - `macOS/manifests/categories/07-ai-tools.Brewfile`
  - `macOS/manifests/categories/08-dev-tools.Brewfile`
  - `macOS/manifests/categories/09-system-tweaks.Brewfile`
  - `macOS/manifests/categories/10-media.Brewfile`
  - `macOS/manifests/categories/11-virtualization.Brewfile`
  - `macOS/manifests/categories/12-mas-apps.Brewfile`
  - `macOS/manifests/categories/13-vscode-extensions.Brewfile`
  - `macOS/manifests/profiles/minimal.txt`
  - `macOS/manifests/profiles/standard.txt`
  - `macOS/manifests/profiles/full.txt`
  - `macOS/legacy/README.md`
  - `macOS/legacy/setup.legacy.sh`
- 수정된 파일 목록:
  - `macOS/setup.sh`
  - `macOS/brew_packages.sh`
  - `macOS/espanso-packages.sh`
  - `macOS/zsh.sh`
  - `macOS/theos.sh`
  - `macOS/README.md`
  - `macOS/todo.md`
  - `macOS/progress.md`
- 이동/삭제된 파일 목록:
  - `macOS/Brewfile` → `macOS/legacy/Brewfile.legacy`
  - `macOS/Brewfile2` → `macOS/legacy/Brewfile2.legacy`
  - `macOS/apps_list.txt` → `macOS/legacy/apps_list.legacy.txt`
  - 기존 `macOS/brew_packages.sh` 대규모 목록은 `macOS/legacy/brew_packages.legacy.sh`로 보존 후 래퍼로 교체
