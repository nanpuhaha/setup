# PRD

## 목적
- macOS 초기 셋업 스크립트를 유지보수 가능한 구조로 재구성한다.
- 설치 대상 정보를 보존하면서도, 컴퓨터별 선택 설치를 지원한다.

## 문제 정의
- 기존 스크립트는 설치 항목이 스크립트 내부에 혼재되어 있어 변경 영향 범위가 크다.
- 설치 동작이 일괄 실행 중심이라 장비별 커스터마이징이 어렵다.
- 무인 실행(기본값 설치)과 인터랙티브 실행(선택 설치) 요구를 동시에 충족하지 못한다.

## 목표
- 카테고리 매니페스트를 단일 소스로 사용한다.
- `space` 토글 + `enter` 제출 방식의 무의존 Bash TUI를 제공한다.
- `--silent` 모드에서 `standard` 프로필을 기본 적용한다.
- 기존 대규모 목록은 삭제하지 않고 `legacy` 경로에 보존한다.

## 비목표
- 패키지 개별 단위 선택 UI 제공
- Homebrew 이외 패키지 매니저 통합
- 기존 자동화 워크플로우(automator) 기능 변경

## 기능 요구사항
- 메인 실행기: `macOS/setup.sh`
- 옵션 지원:
  - `--silent`
  - `--profile minimal|standard|full`
  - `--categories a,b,c`
  - `--list-categories`
  - `--dry-run`
  - `--help`
- 인터랙티브 모드:
  - 방향키 이동
  - `space` 토글
  - `enter` 제출
  - `a` 전체 토글
  - `q` 종료
- 설치 시 선택 카테고리 순서대로 Brewfile fragment를 병합하고, 순서 보존 dedupe를 적용한다.
- 시스템 변경(`/etc/shells`, `chsh`)은 기본 활성화 상태를 유지한다.

## 성공 기준
- `--list-categories`에서 카테고리/프로필 확인 가능
- `--dry-run`으로 설치 계획 검증 가능
- `--silent` 기본 프로필이 `standard`로 동작
- `brew_packages.sh` 호출 시 새 실행기로 위임
- 기존 대규모 목록 파일이 `legacy`에 보존
