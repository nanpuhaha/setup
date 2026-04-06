# AI Agents Setup

여러 대 컴퓨터에서 AI Agent 개발 환경을 동일하게 설정하기 위한 스크립트입니다.

## 설치 항목

### CLI 도구

| 도구 | 설명 | 설치 방법 |
|------|------|-----------|
| [Claude Code](https://docs.anthropic.com/en/docs/claude-code) | Anthropic의 AI 코딩 에이전트 | npm |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli) | Google의 AI 코딩 에이전트 | npm |
| [OpenAI Codex CLI](https://github.com/openai/codex) | OpenAI의 AI 코딩 에이전트 | npm |
| [GitHub Copilot CLI](https://docs.github.com/en/copilot/using-github-copilot/using-github-copilot-in-the-command-line) | GitHub Copilot 명령줄 확장 | gh extension |
| [skm](https://github.com/reorx/skm) | AI 에이전트 스킬 패키지 관리자 | uv tool |

### 확장 (Extensions / Plugins)

| 도구 | 설명 | 대상 |
|------|------|------|
| [Superpowers](https://github.com/obra/superpowers) | TDD·계획·리뷰·디버깅 등 핵심 개발 워크플로우 스킬 모음 | skm (Claude Code, Codex, standard) / gemini extensions (Gemini) |
| [BMAD Method](https://github.com/bmad-code-org/BMAD-METHOD) | AI 기반 애자일 개발 프레임워크 (12+ 전문 에이전트) | Claude Code (프로젝트별) |
| [bkit (Claude Code)](https://github.com/popup-studio-ai/bkit-claude-code) | PDCA 방법론 기반 Context Engineering 프레임워크 (Claude Code용) | Claude Code |
| [bkit (Gemini)](https://github.com/popup-studio-ai/bkit-gemini) | PDCA 방법론 기반 Context Engineering 프레임워크 (Gemini용) | Gemini |
| [bkit (Codex)](https://github.com/popup-studio-ai/bkit-codex) | PDCA 방법론 기반 Context Engineering 프레임워크 (Codex용) | Codex |
| [oh-my-claudecode](https://github.com/Yeachan-Heo/oh-my-claudecode) | Claude Code용 멀티 에이전트 오케스트레이션 | Claude Code |
| [oh-my-codex](https://github.com/Yeachan-Heo/oh-my-codex) | Codex용 워크플로우 레이어 | Codex |
| [claude-hud](https://github.com/jarrodwatts/claude-hud) | Claude Code 세션 상태 표시 HUD | Claude Code |
| [GSD v1 (get-shit-done)](https://github.com/gsd-build/get-shit-done) | 경량 컨텍스트 엔지니어링 + 스펙 기반 개발 시스템 — 프롬프트 프레임워크 | Claude Code, Gemini, Codex, Copilot 등 |
| [GSD v2 (gsd-2)](https://github.com/gsd-build/gsd-2) | 독립형 TypeScript CLI 에이전트 (Pi SDK 기반) — 컨텍스트 제어·자동 복구·비용 추적 | 독립 실행 (`gsd` 명령어) |

> **GSD v1과 v2는 완전히 다른 도구입니다.**
> - **v1** (`get-shit-done-cc`): Claude Code, Gemini, Codex 등 각 AI 도구에 설치되는 프롬프트/슬래시커맨드 프레임워크
> - **v2** (`gsd-pi`): Pi SDK 기반의 독립형 TypeScript CLI — 직접 에이전트 세션을 제어하는 별도의 프로그램

---

## 사용법

### macOS / Ubuntu

```bash
# 실행 권한 부여
chmod +x ai-agents/install.sh

# 스크립트 실행
./ai-agents/install.sh
```

### Windows (PowerShell)

```powershell
# 실행 정책 설정 (필요한 경우)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# 스크립트 실행
.\ai-agents\install.ps1
```

---

## 전제 조건

스크립트를 실행하기 전에 다음이 설치되어 있어야 합니다:

| 요구사항 | macOS | Ubuntu | Windows |
|---------|-------|--------|---------|
| Node.js 20+ | `brew install node` | `curl -fsSL https://deb.nodesource.com/setup_lts.x \| sudo -E bash - && sudo apt-get install -y nodejs` | `winget install OpenJS.NodeJS.LTS` |
| Git | `brew install git` | `apt-get install git` | `winget install Git.Git` |
| GitHub CLI (Copilot용) | `brew install gh` | `apt-get install gh` | `winget install GitHub.cli` |
| uv | `brew install uv` | `curl -LsSf https://astral.sh/uv/install.sh \| sh` | `powershell -c "irm https://astral.sh/uv/install.ps1 \| iex"` |

> **uv**는 스크립트 실행 시 자동으로 설치를 시도합니다.

---

## 설치 단계별 설명

### 중앙 관리 구조 (`~/.agents`)

설치 스크립트는 `~/.agents`를 기준으로 에이전트 설정을 통합 관리합니다.

- `~/.agents/AGENTS.md` 자동 생성
- `~/.agents/skills` 자동 생성
- 아래 경로를 `~/.agents/<tool>`로 링크/정션 처리:
  - `~/.codex` → `~/.agents/codex`
  - `~/.gemini` → `~/.agents/gemini`
  - `~/.claude` → `~/.agents/claude`
  - `~/.copilot` → `~/.agents/copilot`
  - `~/.antigravity` → `~/.agents/antigravity`

기존 폴더가 있으면 가능한 경우 `~/.agents/<tool>`로 이동(migrate) 후 링크를 생성합니다.

### skm (Skill Manager)

[skm](https://github.com/reorx/skm)은 GitHub 저장소나 로컬 디렉토리에서 AI 에이전트 스킬 패키지를 관리하는 CLI 도구입니다.

- **설정 파일**: `~/.config/skm/skills.yaml` (이 저장소의 `ai-agents/skills.yaml`에서 자동 배포)
- **스킬 설치 대상**: `standard` (`~/.agents/skills/`), `claude` (`~/.claude/skills/`), `codex` (`~/.codex/skills/`)
- skm으로 관리하는 패키지: **Superpowers** (`https://github.com/obra/superpowers`)

`skills.yaml`을 수정하여 추가 스킬 패키지를 관리할 수 있습니다:

```bash
skm edit           # 에디터로 skills.yaml 편집
skm install        # 스킬 설치 / 동기화
skm check-updates  # 업데이트 확인
skm list           # 설치된 스킬 목록
```

### 자동 설치 항목 (스크립트로 자동 처리)

1. **CLI 도구** — npm 글로벌 패키지로 설치
2. **oh-my-claudecode / oh-my-codex** — npm 글로벌 패키지로 설치
3. **GSD v1** — `npx get-shit-done-cc@latest --all --global` 실행 (모든 런타임에 설치, 비인터랙티브)
4. **GSD v2** — `npm install -g gsd-pi@latest` 실행 (독립형 CLI 에이전트)
5. **skm 및 Superpowers 스킬** — `uv tool install skm-cli` 설치 후 `~/.config/skm/skills.yaml` 배포, `skm install` 실행
   - Superpowers 스킬을 `standard` (`~/.agents/skills/`), `claude` (`~/.claude/skills/`), `codex` (`~/.codex/skills/`) 에이전트에 설치
6. **Superpowers (Gemini용)** — `gemini extensions install` 실행 (Gemini는 skm 미지원)
7. **bkit-gemini** — `gemini extensions install` 실행
8. **bkit-codex** — `install.sh --global` 실행 (`~/.bkit-codex` + `~/.agents/skills/` 에 설치)

### 링크로 통합 불가한 플러그인/확장 (별도 설치)

아래 항목은 구조상 `~/.agents` 링크만으로 설치/활성화가 완료되지 않으므로, 각 도구 내 명령으로 별도 설치가 필요합니다.

1. **Claude Code Plugin Marketplace 기반 플러그인**
   - Superpowers (Claude)
   - bkit (Claude)
   - claude-hud
   - oh-my-claudecode (plugin mode)
2. **Gemini Extensions 명령 기반 확장**
   - Superpowers (Gemini)
   - bkit-gemini
3. **프로젝트 단위 설치 도구**
   - BMAD Method (`npx bmad-method install ...`)

### 수동 설치 항목 (Claude Code 내에서 실행)

Claude Code를 열고 아래 명령어를 입력하세요:

#### Superpowers

```
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace
```

#### bkit

```
/plugin marketplace add popup-studio-ai/bkit-claude-code
/plugin install bkit
```

#### Claude HUD

```
/plugin marketplace add jarrodwatts/claude-hud
/plugin install claude-hud
/claude-hud:setup
```

> **Linux 사용자:** `/tmp`가 별도 파일시스템인 경우 아래와 같이 실행하세요:
> ```bash
> mkdir -p ~/.cache/tmp && TMPDIR=~/.cache/tmp claude
> ```
> 그 후 Claude Code 세션에서 설치 명령어를 실행하세요.

#### oh-my-claudecode (플러그인 모드)

```
/plugin marketplace add https://github.com/Yeachan-Heo/oh-my-claudecode
/plugin install oh-my-claudecode
/omc-setup
```

### BMAD Method (프로젝트별 설치)

BMAD는 프로젝트 디렉토리에 설치해야 합니다:

```bash
cd /path/to/your/project
npx bmad-method install --tools claude-code --yes
```

---

## 인증 설정

각 도구를 처음 사용할 때 인증이 필요합니다:

| 도구 | 인증 방법 |
|------|-----------|
| Claude Code | `claude` 실행 후 Anthropic API 키 또는 OAuth 인증 |
| Gemini CLI | `gemini` 실행 후 Google 계정 인증 |
| Codex | 환경 변수 `OPENAI_API_KEY` 설정 |
| GitHub Copilot CLI | `gh auth login` 실행 후 GitHub 계정 인증 |

---

## 업데이트

설치된 도구를 업데이트하려면 스크립트를 다시 실행하거나 아래 명령어를 사용하세요:

```bash
# CLI 도구 업데이트
npm update -g @anthropic-ai/claude-code @google/gemini-cli @openai/codex oh-my-claude-sisyphus oh-my-codex

# GSD v1 업데이트
npx get-shit-done-cc@latest --all --global

# GSD v2 업데이트
npm install -g gsd-pi@latest
# 또는 세션 내에서: /gsd update

# skm 업데이트
uv tool upgrade skm-cli

# Superpowers 스킬 업데이트 (skm으로 관리)
skm update superpowers
# 또는 전체 스킬 재동기화
skm install

# bkit-codex 업데이트
curl -fsSL https://raw.githubusercontent.com/popup-studio-ai/bkit-codex/main/install.sh | bash -s -- --global

# Claude Code 플러그인 업데이트 (Claude Code 내에서)
# /plugin update superpowers
# /plugin update bkit
# /plugin update claude-hud
# /plugin update oh-my-claudecode
```

---

## 참고 자료

- [Awesome Claude Code](https://github.com/hesreallyhim/awesome-claude-code) — Claude Code 도구 모음
- [bmad-method docs](https://docs.bmad-method.org) — BMAD Method 공식 문서
- [GSD User Guide](https://github.com/gsd-build/get-shit-done/blob/main/docs/USER-GUIDE.md) — GSD 사용자 가이드
