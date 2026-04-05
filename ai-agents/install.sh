#!/usr/bin/env bash
# AI Agent Setup Script for macOS and Ubuntu
# Installs: Claude Code, Gemini CLI, GitHub Copilot CLI, Codex CLI
# Extensions: superpowers, bmad, bkit (claude-code/gemini/codex),
#             oh-my-claudecode, oh-my-codex, claude-hud, GSD v1 & v2

set -euo pipefail

BOLD="\033[1m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
CYAN="\033[0;36m"
RESET="\033[0m"

info()    { echo -e "${CYAN}${BOLD}[INFO]${RESET} $*"; }
success() { echo -e "${GREEN}${BOLD}[OK]${RESET}   $*"; }
warn()    { echo -e "${YELLOW}${BOLD}[WARN]${RESET} $*"; }
error()   { echo -e "${RED}${BOLD}[ERR]${RESET}  $*"; }
step()    { echo -e "\n${BOLD}━━━ $* ━━━${RESET}"; }

# ─────────────────────────────────────────────
# 0. Prerequisites
# ─────────────────────────────────────────────
step "Checking prerequisites"

if ! command -v node &>/dev/null; then
    error "Node.js not found. Please install Node.js 20+ first."
    echo "  macOS:  brew install node"
    echo "  Ubuntu: curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt-get install -y nodejs"
    exit 1
fi

if ! command -v npm &>/dev/null; then
    error "npm not found. Please install npm first."
    exit 1
fi

NODE_MAJOR=$(node --version | sed 's/v//' | cut -d. -f1)
if [ "$NODE_MAJOR" -lt 20 ]; then
    warn "Node.js v$(node --version) found. Version 20+ is recommended."
fi

if ! command -v git &>/dev/null; then
    error "Git not found. Please install Git first."
    exit 1
fi

success "Node.js $(node --version) and Git $(git --version | awk '{print $3}') found"

# ─────────────────────────────────────────────
# 1. Centralized .agents home and tool links
# ─────────────────────────────────────────────
step "Preparing centralized .agents home"

AGENTS_HOME="${HOME}/.agents"
AGENTS_SKILLS_DIR="${AGENTS_HOME}/skills"
AGENTS_MD="${AGENTS_HOME}/AGENTS.md"
mkdir -p "${AGENTS_SKILLS_DIR}"

if [ ! -f "${AGENTS_MD}" ]; then
    cat > "${AGENTS_MD}" <<'EOF'
# AGENTS

이 파일과 `skills/` 폴더를 기준으로 AI 에이전트 설정을 중앙 관리합니다.

- 공용 스킬: `~/.agents/skills`
- 도구별 홈: `~/.agents/{codex,gemini,claude,copilot,antigravity}`
EOF
    success "Created ${AGENTS_MD}"
else
    success "AGENTS.md already exists (${AGENTS_MD})"
fi

ensure_tool_link() {
    local tool="$1"
    local link_path="${HOME}/.${tool}"
    local target_path="${AGENTS_HOME}/${tool}"
    local target_parent
    target_parent="$(dirname "${target_path}")"
    mkdir -p "${target_parent}"

    if [ -L "${link_path}" ]; then
        local current_target
        current_target="$(readlink "${link_path}")"
        if [ "${current_target}" = "${target_path}" ]; then
            success "${link_path} already links to ${target_path}"
            mkdir -p "${target_path}"
            return
        fi
        rm -f "${link_path}"
    elif [ -e "${link_path}" ]; then
        if [ ! -e "${target_path}" ]; then
            mv "${link_path}" "${target_path}"
            success "Migrated ${link_path} to ${target_path}"
        else
            local backup_path="${link_path}.backup-$(date +%Y%m%d%H%M%S)"
            mv "${link_path}" "${backup_path}"
            warn "Moved existing ${link_path} to ${backup_path} (target already exists)"
        fi
    fi

    mkdir -p "${target_path}"
    ln -s "${target_path}" "${link_path}"
    success "Linked ${link_path} → ${target_path}"
}

ensure_tool_link "codex"
ensure_tool_link "gemini"
ensure_tool_link "claude"
ensure_tool_link "copilot"
ensure_tool_link "antigravity"

# ─────────────────────────────────────────────
# 2. AI CLI Tools
# ─────────────────────────────────────────────
step "Installing AI Agent CLI Tools"

info "Installing Claude Code..."
npm install -g @anthropic-ai/claude-code
success "Claude Code installed"

info "Installing Gemini CLI..."
npm install -g @google/gemini-cli
success "Gemini CLI installed"

info "Installing OpenAI Codex CLI..."
npm install -g @openai/codex
success "OpenAI Codex CLI installed"

if command -v gh &>/dev/null; then
    info "Installing GitHub Copilot CLI extension..."
    gh extension install github/gh-copilot 2>/dev/null \
        || gh extension upgrade gh-copilot 2>/dev/null \
        || true
    success "GitHub Copilot CLI installed"
else
    warn "GitHub CLI (gh) not found — skipping Copilot CLI"
    warn "Install gh from https://cli.github.com/ and re-run this script"
fi

# ─────────────────────────────────────────────
# 3. oh-my-claudecode & oh-my-codex (npm)
# ─────────────────────────────────────────────
step "Installing oh-my-claudecode and oh-my-codex"

info "Installing oh-my-claudecode (npm)..."
npm install -g oh-my-claude-sisyphus@latest
success "oh-my-claudecode installed"

info "Installing oh-my-codex (npm)..."
npm install -g oh-my-codex@latest
success "oh-my-codex installed"

# ─────────────────────────────────────────────
# 4. GSD — Get Shit Done
#    v1 (get-shit-done): prompt framework for Claude Code, Gemini, Codex, etc.
#      --all --global  installs for all runtimes non-interactively
#    v2 (gsd-2): standalone TypeScript CLI agent built on Pi SDK
#      npm install -g gsd-pi@latest  (no interactive prompts)
# ─────────────────────────────────────────────
step "Installing GSD v1 (get-shit-done) for all runtimes"

info "Running GSD v1 installer for all runtimes..."
npx get-shit-done-cc@latest --all --global
success "GSD v1 installed for all runtimes"

step "Installing GSD v2 (gsd-pi) globally"

info "Installing GSD v2 CLI..."
npm install -g gsd-pi@latest
success "GSD v2 installed"

# ─────────────────────────────────────────────
# 5. Superpowers — Codex (git clone + symlink)
#    Claude Code & Gemini require in-session commands (see below)
# ─────────────────────────────────────────────
step "Installing Superpowers for Codex"

SUPERPOWERS_DIR="${AGENTS_HOME}/codex/superpowers"
SKILLS_DIR="${AGENTS_SKILLS_DIR}"

if [ -d "${SUPERPOWERS_DIR}" ]; then
    info "Updating existing Superpowers installation..."
    git -C "${SUPERPOWERS_DIR}" pull --rebase --quiet
    success "Superpowers updated (${SUPERPOWERS_DIR})"
else
    info "Cloning Superpowers into ${SUPERPOWERS_DIR}..."
    git clone --quiet https://github.com/obra/superpowers.git "${SUPERPOWERS_DIR}"
    success "Superpowers cloned"
fi

mkdir -p "${SKILLS_DIR}"
if [ ! -L "${SKILLS_DIR}/superpowers" ]; then
    ln -s "${SUPERPOWERS_DIR}/skills" "${SKILLS_DIR}/superpowers"
    success "Symlink created: ${SKILLS_DIR}/superpowers → ${SUPERPOWERS_DIR}/skills"
else
    success "Superpowers symlink already exists"
fi

# ─────────────────────────────────────────────
# 6. Superpowers — Gemini extension
# ─────────────────────────────────────────────
step "Installing Superpowers for Gemini CLI"

if command -v gemini &>/dev/null; then
    info "Installing Superpowers Gemini extension..."
    gemini extensions install https://github.com/obra/superpowers || true
    success "Superpowers Gemini extension installed"
else
    warn "gemini command not found — skipping Gemini Superpowers extension"
    warn "(The Gemini CLI may need to be authenticated first: run 'gemini' once)"
fi

# ─────────────────────────────────────────────
# 7. bkit — platform-specific extensions
#    bkit-gemini  : gemini extensions install
#    bkit-codex   : curl | bash --global (installs to ~/.bkit-codex + ~/.agents/skills/)
#    bkit-claude-code: requires in-session commands (see below)
# ─────────────────────────────────────────────
step "Installing bkit for Gemini CLI"

if command -v gemini &>/dev/null; then
    info "Installing bkit Gemini extension..."
    gemini extensions install https://github.com/popup-studio-ai/bkit-gemini.git || true
    success "bkit Gemini extension installed"
else
    warn "gemini command not found — skipping bkit Gemini extension"
fi

step "Installing bkit for Codex (global)"

info "Installing bkit-codex globally..."
curl -fsSL https://raw.githubusercontent.com/popup-studio-ai/bkit-codex/main/install.sh \
    | bash -s -- --global
success "bkit-codex installed globally"

# ─────────────────────────────────────────────
# 8. Print manual steps (Claude Code plugins)
# ─────────────────────────────────────────────
echo ""
echo -e "${BOLD}╔══════════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${BOLD}║          Claude Code Plugin Setup  (run inside Claude Code)      ║${RESET}"
echo -e "${BOLD}╠══════════════════════════════════════════════════════════════════╣${RESET}"
echo -e "${BOLD}║                                                                  ║${RESET}"
echo -e "${BOLD}║  # Superpowers                                                   ║${RESET}"
echo -e "${BOLD}║  /plugin marketplace add obra/superpowers-marketplace            ║${RESET}"
echo -e "${BOLD}║  /plugin install superpowers@superpowers-marketplace             ║${RESET}"
echo -e "${BOLD}║                                                                  ║${RESET}"
echo -e "${BOLD}║  # bkit                                                          ║${RESET}"
echo -e "${BOLD}║  /plugin marketplace add popup-studio-ai/bkit-claude-code        ║${RESET}"
echo -e "${BOLD}║  /plugin install bkit                                            ║${RESET}"
echo -e "${BOLD}║                                                                  ║${RESET}"
echo -e "${BOLD}║  # Claude HUD                                                    ║${RESET}"
echo -e "${BOLD}║  /plugin marketplace add jarrodwatts/claude-hud                  ║${RESET}"
echo -e "${BOLD}║  /plugin install claude-hud                                      ║${RESET}"
echo -e "${BOLD}║  /claude-hud:setup                                               ║${RESET}"
echo -e "${BOLD}║                                                                  ║${RESET}"
echo -e "${BOLD}║  # oh-my-claudecode (plugin mode)                               ║${RESET}"
echo -e "${BOLD}║  /plugin marketplace add https://github.com/Yeachan-Heo/oh-my-claudecode  ║${RESET}"
echo -e "${BOLD}║  /plugin install oh-my-claudecode                               ║${RESET}"
echo -e "${BOLD}║  /omc-setup                                                      ║${RESET}"
echo -e "${BOLD}║                                                                  ║${RESET}"
echo -e "${BOLD}╚══════════════════════════════════════════════════════════════════╝${RESET}"

echo ""
echo -e "${BOLD}╔══════════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${BOLD}║                  BMAD Method  (per project)                      ║${RESET}"
echo -e "${BOLD}╠══════════════════════════════════════════════════════════════════╣${RESET}"
echo -e "${BOLD}║  cd /your/project                                                ║${RESET}"
echo -e "${BOLD}║  npx bmad-method install --tools claude-code --yes               ║${RESET}"
echo -e "${BOLD}╚══════════════════════════════════════════════════════════════════╝${RESET}"

echo ""
echo -e "${BOLD}╔══════════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${BOLD}║                  Authentication (first-time setup)               ║${RESET}"
echo -e "${BOLD}╠══════════════════════════════════════════════════════════════════╣${RESET}"
echo -e "${BOLD}║  claude          → Anthropic API key or OAuth                    ║${RESET}"
echo -e "${BOLD}║  gemini          → Google account / Gemini API key               ║${RESET}"
echo -e "${BOLD}║  codex           → OpenAI API key (OPENAI_API_KEY env var)       ║${RESET}"
echo -e "${BOLD}║  gh auth login   → GitHub account (for Copilot CLI)              ║${RESET}"
echo -e "${BOLD}╚══════════════════════════════════════════════════════════════════╝${RESET}"

echo ""
success "AI Agent setup complete!"
