# Architecture

## 구성 요소
- `setup.sh`
  - 실행 옵션 파싱
  - 실행 모드 결정(인터랙티브 / silent / non-tty)
  - 카테고리 선택 결과를 기반으로 설치 수행
- `manifests/categories.tsv`
  - 카테고리 식별자, 표시명, Brewfile fragment 경로, 설명 정의
- `manifests/categories/*.Brewfile`
  - 카테고리별 Homebrew 설치 정의
- `manifests/profiles/*.txt`
  - 프로필별 기본 카테고리 조합
- `legacy/`
  - 기존 대규모 목록 파일 보존
- `brew_packages.sh`
  - 기존 진입점 호환 래퍼

## 실행 흐름
1. 카테고리/프로필 메타데이터 로드
2. 옵션에 따라 선택 카테고리 결정
   - `--categories` 우선
   - 그 외 `--profile` 또는 기본 `standard`
   - tty + non-silent + `--categories` 미지정 시 TUI 선택
3. 선택 카테고리의 Brewfile fragment 병합
4. 순서 보존 dedupe 결과로 임시 Brewfile 생성
5. `--dry-run`이면 계획 출력 후 종료
6. 실제 실행:
   - Homebrew 보장
   - `brew update` / `brew upgrade`
   - `brew bundle --file <temp>`
   - GNU sha256 링크, Homebrew Bash 기본 쉘 설정
   - `brew cleanup`

## 데이터 경계
- 설치 대상 데이터는 매니페스트로만 관리한다.
- 실행 로직은 매니페스트를 읽어 동작하며, 패키지 목록을 하드코딩하지 않는다.
- 기존 데이터는 `legacy`로 이동하여 보존한다.
