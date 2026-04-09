# Plan

## Milestone 1: 문서 체계 정비
- PRD/architecture/implementation/plan/todo/progress/prompt_history 파일 구성

## Milestone 2: 설치 소스 단일화
- 카테고리 매니페스트(`categories.tsv`) 추가
- 카테고리별 Brewfile fragment 분리
- 프로필 매핑(`minimal|standard|full`) 구성

## Milestone 3: 실행기 개선
- `setup.sh` 옵션/모드/TUI 구현
- 임시 Brewfile 병합 및 dedupe 처리
- `--dry-run`, `--list-categories` 동작 구현

## Milestone 4: 호환/보존 정리
- `brew_packages.sh` 래퍼 전환
- 기존 대규모 목록을 `legacy/`로 이동 및 참조 문서화

## Milestone 5: 검증 및 기록
- shellcheck, bash -n, dry-run 시나리오 검증
- progress 및 prompt_history 업데이트
