# AI Agent Setup Script for Windows (PowerShell)
# Installs: Claude Code, Gemini CLI, GitHub Copilot CLI, Codex CLI
# Extensions: superpowers, bmad, bkit (claude-code/gemini/codex),
#             oh-my-claudecode, oh-my-codex, claude-hud, GSD v1 & v2

#Requires -Version 5.1
Set-StrictMode -Version Latest
$ErrorActionPreference = "Continue"   # Don't abort on non-fatal errors

function Write-Step   { Write-Host "`n━━━ $args ━━━" -ForegroundColor Cyan }
function Write-Info   { Write-Host "[INFO] $args" -ForegroundColor White }
function Write-Ok     { Write-Host "[OK]   $args" -ForegroundColor Green }
function Write-Warn   { Write-Host "[WARN] $args" -ForegroundColor Yellow }
function Write-Err    { Write-Host "[ERR]  $args" -ForegroundColor Red }

# ─────────────────────────────────────────────
# 0. Prerequisites
# ─────────────────────────────────────────────
Write-Step "Checking prerequisites"

if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Err "Node.js not found. Please install Node.js 20+ first."
    Write-Host "  winget install OpenJS.NodeJS.LTS"
    exit 1
}

if (-not (Get-Command npm -ErrorAction SilentlyContinue)) {
    Write-Err "npm not found. Please install npm first."
    exit 1
}

$nodeVersion = (node --version) -replace 'v', ''
$nodeMajor = [int]($nodeVersion.Split('.')[0])
if ($nodeMajor -lt 20) {
    Write-Warn "Node.js v$nodeVersion found. Version 20+ is recommended."
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Err "Git not found. Please install Git first."
    Write-Host "  winget install Git.Git"
    exit 1
}

Write-Ok "Node.js $(node --version) and Git found"

# ─────────────────────────────────────────────
# 1. Centralized .agents home and tool links
# ─────────────────────────────────────────────
Write-Step "Preparing centralized .agents home"

$AgentsHome      = "$env:USERPROFILE\.agents"
$AgentsSkillsDir = "$AgentsHome\skills"
$AgentsMd        = "$AgentsHome\AGENTS.md"

if (-not (Test-Path $AgentsSkillsDir)) {
    New-Item -ItemType Directory -Force -Path $AgentsSkillsDir | Out-Null
}

if (-not (Test-Path $AgentsMd)) {
@'
# AGENTS

이 파일과 `skills/` 폴더를 기준으로 AI 에이전트 설정을 중앙 관리합니다.

- 공용 스킬: `~/.agents/skills`
- 도구별 홈: `~/.agents/{codex,gemini,claude,copilot,antigravity}`
'@ | Set-Content -Path $AgentsMd -Encoding UTF8
    Write-Ok "Created $AgentsMd"
} else {
    Write-Ok "AGENTS.md already exists ($AgentsMd)"
}

function Ensure-ToolLink {
    param(
        [Parameter(Mandatory=$true)][string]$Tool
    )

    $linkPath = Join-Path $env:USERPROFILE ".$Tool"
    $targetPath = Join-Path $AgentsHome $Tool

    if (Test-Path $linkPath) {
        $item = Get-Item -LiteralPath $linkPath -Force
        if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
            try {
                if ($item.Target -eq $targetPath) {
                    if (-not (Test-Path $targetPath)) {
                        New-Item -ItemType Directory -Force -Path $targetPath | Out-Null
                    }
                    Write-Ok "$linkPath already links to $targetPath"
                    return
                }
            } catch {}
            Remove-Item -LiteralPath $linkPath -Force
        } else {
            if (-not (Test-Path $targetPath)) {
                Move-Item -LiteralPath $linkPath -Destination $targetPath -Force
                Write-Ok "Migrated $linkPath to $targetPath"
            } else {
                $backupPath = "$linkPath.backup-$(Get-Date -Format 'yyyyMMddHHmmss')"
                Move-Item -LiteralPath $linkPath -Destination $backupPath -Force
                Write-Warn "Moved existing $linkPath to $backupPath (target already exists)"
            }
        }
    }

    if (-not (Test-Path $targetPath)) {
        New-Item -ItemType Directory -Force -Path $targetPath | Out-Null
    }

    try {
        New-Item -ItemType SymbolicLink -Path $linkPath -Target $targetPath -Force | Out-Null
        Write-Ok "Linked $linkPath -> $targetPath (symbolic link)"
    } catch {
        cmd /c mklink /J "$linkPath" "$targetPath" | Out-Null
        Write-Ok "Linked $linkPath -> $targetPath (junction)"
    }
}

Ensure-ToolLink -Tool "codex"
Ensure-ToolLink -Tool "gemini"
Ensure-ToolLink -Tool "claude"
Ensure-ToolLink -Tool "copilot"
Ensure-ToolLink -Tool "antigravity"

# ─────────────────────────────────────────────
# 2. AI CLI Tools
# ─────────────────────────────────────────────
Write-Step "Installing AI Agent CLI Tools"

Write-Info "Installing Claude Code..."
npm install -g @anthropic-ai/claude-code
Write-Ok "Claude Code installed"

Write-Info "Installing Gemini CLI..."
npm install -g @google/gemini-cli
Write-Ok "Gemini CLI installed"

Write-Info "Installing OpenAI Codex CLI..."
npm install -g @openai/codex
Write-Ok "OpenAI Codex CLI installed"

if (Get-Command gh -ErrorAction SilentlyContinue) {
    Write-Info "Installing GitHub Copilot CLI extension..."
    try {
        gh extension install github/gh-copilot 2>$null
        Write-Ok "GitHub Copilot CLI installed"
    } catch {
        try {
            gh extension upgrade gh-copilot 2>$null
            Write-Ok "GitHub Copilot CLI upgraded"
        } catch {
            Write-Warn "Copilot CLI install skipped (may already be installed)"
        }
    }
} else {
    Write-Warn "GitHub CLI (gh) not found — skipping Copilot CLI"
    Write-Warn "Install gh: winget install GitHub.cli"
}

# ─────────────────────────────────────────────
# 3. oh-my-claudecode & oh-my-codex (npm)
# ─────────────────────────────────────────────
Write-Step "Installing oh-my-claudecode and oh-my-codex"

Write-Info "Installing oh-my-claudecode (npm)..."
npm install -g oh-my-claude-sisyphus@latest
Write-Ok "oh-my-claudecode installed"

Write-Info "Installing oh-my-codex (npm)..."
npm install -g oh-my-codex@latest
Write-Ok "oh-my-codex installed"

# ─────────────────────────────────────────────
# 4. GSD — Get Shit Done
#    v1 (get-shit-done): prompt framework for Claude Code, Gemini, Codex, etc.
#      --all --global  installs for all runtimes non-interactively
#    v2 (gsd-2): standalone TypeScript CLI agent built on Pi SDK
#      npm install -g gsd-pi@latest  (no interactive prompts)
# ─────────────────────────────────────────────
Write-Step "Installing GSD v1 (get-shit-done) for all runtimes"

Write-Info "Running GSD v1 installer for all runtimes..."
npx get-shit-done-cc@latest --all --global
Write-Ok "GSD v1 installed for all runtimes"

Write-Step "Installing GSD v2 (gsd-pi) globally"

Write-Info "Installing GSD v2 CLI..."
npm install -g gsd-pi@latest
Write-Ok "GSD v2 installed"

# ─────────────────────────────────────────────
# 5. Superpowers — Codex (git clone + junction)
#    Claude Code & Gemini require in-session commands (see below)
# ─────────────────────────────────────────────
Write-Step "Installing Superpowers for Codex"

$SuperpowersDir = "$AgentsHome\codex\superpowers"
$SkillsDir      = $AgentsSkillsDir

if (Test-Path $SuperpowersDir) {
    Write-Info "Updating existing Superpowers installation..."
    git -C $SuperpowersDir pull --rebase --quiet
    Write-Ok "Superpowers updated ($SuperpowersDir)"
} else {
    Write-Info "Cloning Superpowers into $SuperpowersDir..."
    git clone --quiet https://github.com/obra/superpowers.git $SuperpowersDir
    Write-Ok "Superpowers cloned"
}

if (-not (Test-Path $SkillsDir)) {
    New-Item -ItemType Directory -Force -Path $SkillsDir | Out-Null
}

$SkillsLink = "$SkillsDir\superpowers"
if (-not (Test-Path $SkillsLink)) {
    # Use junction (works without Developer Mode on Windows)
    cmd /c mklink /J "$SkillsLink" "$SuperpowersDir\skills" | Out-Null
    Write-Ok "Junction created: $SkillsLink -> $SuperpowersDir\skills"
} else {
    Write-Ok "Superpowers junction already exists"
}

# ─────────────────────────────────────────────
# 6. Superpowers — Gemini extension
# ─────────────────────────────────────────────
Write-Step "Installing Superpowers for Gemini CLI"

if (Get-Command gemini -ErrorAction SilentlyContinue) {
    Write-Info "Installing Superpowers Gemini extension..."
    try {
        gemini extensions install https://github.com/obra/superpowers
        Write-Ok "Superpowers Gemini extension installed"
    } catch {
        Write-Warn "Could not install Superpowers for Gemini (authenticate first with 'gemini')"
    }
} else {
    Write-Warn "gemini command not found — skipping Gemini Superpowers extension"
    Write-Warn "(The Gemini CLI may need to be authenticated first: run 'gemini' once)"
}

# ─────────────────────────────────────────────
# 7. bkit — platform-specific extensions
#    bkit-gemini  : gemini extensions install
#    bkit-codex   : download install.ps1 and run with --global
#    bkit-claude-code: requires in-session commands (see below)
# ─────────────────────────────────────────────
Write-Step "Installing bkit for Gemini CLI"

if (Get-Command gemini -ErrorAction SilentlyContinue) {
    Write-Info "Installing bkit Gemini extension..."
    try {
        gemini extensions install https://github.com/popup-studio-ai/bkit-gemini.git
        Write-Ok "bkit Gemini extension installed"
    } catch {
        Write-Warn "Could not install bkit for Gemini"
    }
} else {
    Write-Warn "gemini command not found — skipping bkit Gemini extension"
}

Write-Step "Installing bkit for Codex (global)"

Write-Info "Installing bkit-codex globally..."
$bkitCodexScript = "$env:TEMP\bkit-codex-install.ps1"
try {
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/popup-studio-ai/bkit-codex/main/install.ps1" `
        -OutFile $bkitCodexScript -UseBasicParsing
    & $bkitCodexScript --global
    Remove-Item $bkitCodexScript -ErrorAction SilentlyContinue
    Write-Ok "bkit-codex installed globally"
} catch {
    Write-Warn "Could not install bkit-codex: $_"
}

# ─────────────────────────────────────────────
# 8. Print manual steps (Claude Code plugins)
# ─────────────────────────────────────────────
$border = "=" * 70
Write-Host ""
Write-Host $border -ForegroundColor Cyan
Write-Host "  Claude Code Plugin Setup  (run inside Claude Code)" -ForegroundColor Cyan
Write-Host $border -ForegroundColor Cyan
Write-Host ""
Write-Host "  # Superpowers" -ForegroundColor White
Write-Host "  /plugin marketplace add obra/superpowers-marketplace" -ForegroundColor Yellow
Write-Host "  /plugin install superpowers@superpowers-marketplace" -ForegroundColor Yellow
Write-Host ""
Write-Host "  # bkit" -ForegroundColor White
Write-Host "  /plugin marketplace add popup-studio-ai/bkit-claude-code" -ForegroundColor Yellow
Write-Host "  /plugin install bkit" -ForegroundColor Yellow
Write-Host ""
Write-Host "  # Claude HUD" -ForegroundColor White
Write-Host "  winget install OpenJS.NodeJS.LTS  # if Node not found during setup" -ForegroundColor DarkGray
Write-Host "  /plugin marketplace add jarrodwatts/claude-hud" -ForegroundColor Yellow
Write-Host "  /plugin install claude-hud" -ForegroundColor Yellow
Write-Host "  /claude-hud:setup" -ForegroundColor Yellow
Write-Host ""
Write-Host "  # oh-my-claudecode (plugin mode)" -ForegroundColor White
Write-Host "  /plugin marketplace add https://github.com/Yeachan-Heo/oh-my-claudecode" -ForegroundColor Yellow
Write-Host "  /plugin install oh-my-claudecode" -ForegroundColor Yellow
Write-Host "  /omc-setup" -ForegroundColor Yellow
Write-Host ""
Write-Host $border -ForegroundColor Cyan

Write-Host ""
Write-Host $border -ForegroundColor Magenta
Write-Host "  BMAD Method  (per project)" -ForegroundColor Magenta
Write-Host $border -ForegroundColor Magenta
Write-Host ""
Write-Host "  cd C:\path\to\your\project" -ForegroundColor Yellow
Write-Host "  npx bmad-method install --tools claude-code --yes" -ForegroundColor Yellow
Write-Host ""
Write-Host $border -ForegroundColor Magenta

Write-Host ""
Write-Host $border -ForegroundColor Green
Write-Host "  Authentication (first-time setup)" -ForegroundColor Green
Write-Host $border -ForegroundColor Green
Write-Host ""
Write-Host "  claude          -> Anthropic API key or OAuth" -ForegroundColor White
Write-Host "  gemini          -> Google account / Gemini API key" -ForegroundColor White
Write-Host "  codex           -> OpenAI API key (OPENAI_API_KEY env var)" -ForegroundColor White
Write-Host "  gh auth login   -> GitHub account (for Copilot CLI)" -ForegroundColor White
Write-Host ""
Write-Host $border -ForegroundColor Green

Write-Host ""
Write-Ok "AI Agent setup complete!"
