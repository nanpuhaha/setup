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

### 확장 (Extensions / Plugins)

| 도구 | 설명 | 대상 |
|------|------|------|
| [Superpowers](https://github.com/obra/superpowers) | TDD·계획·리뷰·디버깅 등 핵심 개발 워크플로우 스킬 모음 | Claude Code, Gemini, Codex |
| [BMAD Method](https://github.com/bmad-code-org/BMAD-METHOD) | AI 기반 애자일 개발 프레임워크 (12+ 전문 에이전트) | Claude Code (프로젝트별) |
| [bkit](https://github.com/popup-studio-ai/bkit-claude-code) | PDCA 방법론 기반 Context Engineering 프레임워크 | Claude Code, Gemini |
| [oh-my-claudecode](https://github.com/Yeachan-Heo/oh-my-claudecode) | Claude Code용 멀티 에이전트 오케스트레이션 | Claude Code |
| [oh-my-codex](https://github.com/Yeachan-Heo/oh-my-codex) | Codex용 워크플로우 레이어 | Codex |
| [claude-hud](https://github.com/jarrodwatts/claude-hud) | Claude Code 세션 상태 표시 HUD | Claude Code |
| [GSD v1](https://github.com/gsd-build/get-shit-done) | 경량 컨텍스트 엔지니어링 + 스펙 기반 개발 시스템 (원본) | Claude Code, Gemini, Codex, Copilot 등 |
| [GSD v2 (Pro)](https://github.com/itsjwill/gsd-pro) | GSD 원본 포크 — 롤백·복구·멀티모델 라우팅 추가 | Claude Code, Gemini, Codex, Copilot 등 |

> **GSD v1과 v2 모두** 동일한 npm 패키지(`get-shit-done-cc`)를 사용하는 인스톨러로 설치됩니다.

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

---

## 설치 단계별 설명

### 자동 설치 항목 (스크립트로 자동 처리)

1. **CLI 도구** — npm 글로벌 패키지로 설치
2. **oh-my-claudecode / oh-my-codex** — npm 글로벌 패키지로 설치
3. **GSD** — `npx get-shit-done-cc@latest --all --global` 실행 (모든 런타임에 설치)
4. **Superpowers (Codex용)** — `~/.codex/superpowers`에 클론 후 `~/.agents/skills/` 심볼릭 링크를 생성
5. **Superpowers (Gemini용)** — `gemini extensions install` 실행
6. **bkit (Gemini용)** — `gemini extensions install` 실행

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

# GSD 업데이트
npx get-shit-done-cc@latest --all --global

# Superpowers 업데이트 (Codex용)
git -C ~/.codex/superpowers pull

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
