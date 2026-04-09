#!/bin/bash

# =============================================================================
# Homebrew Packages Setup for macOS
# https://formulae.brew.sh/
# =============================================================================

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to PATH
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update

brew install nmap rsync rclone

# ============ Terminal / CLI ============

brew install zsh tmux curl wget rclone ffmpeg git git-lfs jq yt-dlp z htop gh direnv bat fx helix
brew install node go nmap fzf ripgrep fastfetch imagemagick rename tree ShellCheck broot pipx
brew install coreutils yarn automake libtool cmake readline rlwrap libyaml watch docker-compose rust exiftool aria2 mas
brew install uv python@3.14 python@3.13 python@3.12 python@3.11
brew install neovim trash

# macOS only
brew install dockutil


# ============ GUI Apps ============

# --- Productivity ---
brew install notion notion-calendar obsidian capacities simplenote anki

# --- Collaboration & Messaging ---
brew install slack zoom discord telegram miro figma

# --- Browsers ---
brew install google-chrome google-chrome@beta google-chrome@dev google-chrome@canary
brew install firefox
brew install google-drive

# --- Editors & IDEs ---
brew install iterm2 ghostty warp
brew install visual-studio-code visual-studio-code@insiders sublime-text textmate
brew install cursor windsurf opencode antigravity

# --- AI Tools ---
brew install gemini chatgpt claude
brew install gemini-cli chatgpt-atlas claude-code claudebar copilot-cli github-copilot-for-xcode

# --- Developer Tools ---
brew install postman postman-cli postman-agent
brew install android-commandlinetools
brew install github              # GitHub Desktop  https://github.com/desktop/desktop
brew install hammerspoon         # Automation bridge  https://www.hammerspoon.org

# --- Window Management ---
brew install alt-tab             # Windows-like alt-tab  https://alt-tab-macos.netlify.app
brew install dockdoor            # Window peeking  https://dockdoor.net
brew install rectangle           # Window snapping  https://github.com/rxhanson/Rectangle
# Alternatives: AeroSpace, Moom, Divvy, Amethyst, Swish, Veeer

# --- Input & Menu Bar ---
brew install karabiner-elements scroll-reverser mos
brew install espanso             # Cross-platform text expander (Rust)
brew install stats               # System monitor in menu bar  https://github.com/exelban/stats
brew install hiddenbar logi-options+
brew install jordanbaird-ice     # Powerful menu bar manager  https://github.com/jordanbaird/Ice

brew install --cask postman postman-agent postman-cli
# --- Utilities ---
brew install tailscale
brew install keka                # Archive manager
brew install daisydisk appcleaner coconutbattery
brew install hex-fiend
brew install hopper-disassembler
brew install dropbox send-anywhere
brew install sf-symbols

# --- File Managers ---
brew install marta               # File Manager  https://marta.sh

# --- Media & Images ---
brew install iina                # Modern video player  https://github.com/iina/iina
brew install qview               # Minimal image viewer  https://interversehq.com/qview/
brew install obs gimp blender
brew install calibre             # Ebook manager  https://calibre-ebook.com
brew install fujitsu-scansnap-home
brew install plex plexamp plex-media-server

# --- Downloads ---
brew install motrix              # Download manager  https://motrix.app
brew install free-download-manager

# --- Virtualization & Containers ---
brew install qemu
brew install utm
brew install docker
brew install kubernetes-cli k9s helm

# --- Open Source Picks ---
brew install lihaoyun6/tap/quickrecorder   # Lightweight screen recorder  https://github.com/lihaoyun6/QuickRecorder
brew install --cask reminders-menubar      # Menu bar reminders  https://github.com/DamascenoRafael/reminders-menubar
brew install NetNewsWire                   # RSS reader  https://netnewswire.com

# --- Excalidraw ---
brew install excalidraw-converter excalidrawz

# --- Misc ---
brew install --cask whisky       # Wine wrapper  https://getwhisky.app
brew install --cask PlayCover/playcover/playcover-community  # Run iOS apps on Apple Silicon

# skhd - Simple hotkey daemon  https://github.com/koekeishiya/skhd
brew install koekeishiya/formulae/skhd
# skhd --start-service

# LaunchOS (requires macOS 26 Tahoe or higher)
if [[ $(sw_vers -productVersion | cut -d. -f1) -ge 26 ]]; then
  brew install --cask launchos
fi


# ============ oh-my-zsh ============

# ----- Shift alternatives -----
# https://lonare.medium.com/9-top-tryshift-alternative-free-paid-f81e3c0f7a10
# Rambox https://rambox.app
# Freeter - The Organizer for  https://freeter.io
# Biscuit https://eatbiscuit.com
# Stack Browser https://stackbrowser.com
# Komz https://komz.app
# Wavebox
# Front
# Sidekick https://www.meetsidekick.com
# Hamsket https://github.com/TheGoddessInari/hamsket

# Ferdium : All your services in one place, built by the community
# https://github.com/ferdium/ferdium-app

# Franz is a free messaging app for services like WhatsApp, Slack, Messenger and many more.
# https://github.com/meetfranz/franz
brew install --cask franz

# Station : One app to rule them all!
# https://github.com/getstation/desktop-app

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# ============ Quick Look Plugins ============

# Markdown preview  https://github.com/sbarex/QLMarkdown
brew install --cask qlmarkdown

# All-in-one Quick Look plugin  https://github.com/chamburr/glance
brew install --no-quarantine glance-chamburr


# ============ Keyboard / Mouse Sharing ============

# Warp - modern terminal with AI
# https://www.warp.dev/
brew install --cask warp


# GitHub Desktop
# https://github.com/desktop/desktop
brew install --cask github

# IINA - The modern video player for macOS.
# https://github.com/iina/iina
brew tap iina/homebrew-mpv-iina
brew install mpv-iina

# Jump Desktop Connect
brew install jump-desktop-connect

# A full-featured download manager
# https://github.com/agalwood/Motrix
# https://motrix.app/
brew install motrix

# Free Download Manager
# https://www.freedownloadmanager.org/
brew install --cask free-download-manager


# ChatGPT Desktop Application (Unofficial)
# https://github.com/lencx/ChatGPT
brew tap lencx/chatgpt https://github.com/lencx/ChatGPT.git
brew install --cask chatgpt --no-quarantine

# Calibre - Ebook Manager
# https://calibre-ebook.com/
# https://github.com/kovidgoyal/calibre
brew install calibre


# NetNewsWire - RSS reader for macOS and iOS.
# https://netnewswire.com/
# https://github.com/Ranchero-Software/NetNewsWire
brew install NetNewsWire



brew install --cask kicad


# References
# https://github.com/jaywcjlove/awesome-mac
# https://github.com/serhii-londar/open-source-mac-os-apps
# https://github.com/mathiasbynens/dotfiles





brew install neovim  # Text Editor
brew install git  # Version Control
brew install tmux  # Terminal Multiplexer
brew install htop  # Process Manager
brew install python3  # Scripting Language

brew install trash # Trash helper
brew install tree # Recursive directory lister
brew install rename # Batch rename tool
brew install fzf # Fuzzy finder
brew install jq # JSON processor
brew install rlwrap  # Readline wrapper


# PlayCover - Run iOS apps and games on Apple Silicon Macs with mouse, keyboard and controller support.
# https://github.com/PlayCover/PlayCover
# https://www.applegamingwiki.com/wiki/PlayCover
brew install --cask PlayCover/playcover/playcover-community

# Sideloadly - The new & best way to sideload your favorite games and apps to your iOS device, Apple Silicon Mac or Apple TV!
# https://sideloadly.io/


brew install openjdk # (Java)

brew install node # (Node.js)
brew install yarn
brew install coreutils # GNU File, Shell, and Text utilities
brew install pkg-config # Manage compile and link flags for libraries
brew install automake #  Tool for generating GNU Standards-compliant Makefiles


# libtool: Generic library support script
# cmake: Cross-platform make
# readline: Library for command-line editing
# libyaml: YAML Parser
# autoconf: Automatic configure script builder
# redis: Persistent key-value database, with built-in net interface
# nmap: Port scanning utility for large networks
# pyenv: Python version management
# ansible: Automate deployment, configuration, and upgrading
# sqlite: Command-line interface for SQLite
# watch: Executes a program periodically, showing output fullscreen

# httpie: User-friendly cURL replacement (command-line HTTP client)
# docker-compose: Isolated development environments using Docker
# rust: Safe, concurrent, practical language
# exiftool: Perl lib for reading and writing EXIF metadata
# aria2: Download with resuming and segmented downloading


brew install ghidra # (Reverse engineering tools)
brew install gh # (GitHub CLI)
brew install --cask blackhole-2ch # Virtual Audio Driver, useful for routing desktop audio
brew install ffmpeg # (Audio/video converter)
brew install --cask blender # (3D modeling)
brew install --cask obs # (Broadcasting and screencasting)


brew install --cask prusaslicer # (3D slicer)
brew install --cask openscad # (Programmable CAD modeler)

brew install wget

brew install mas imagemagick zsh speedtest-cli cask


brew install --cask android-commandlinetools
# https://dev.to/mochafreddo/setting-up-and-managing-android-emulators-on-macos-with-homebrew-3fg0

# Anki - Powerful, intelligent flash cards.
# https://apps.ankiweb.net
# https://docs.ankiweb.net/platform/mac/installing.html
brew install --cask anki


# qView - An image viewer for viewing
# No toolbars or distractions—pure space efficiency
# https://interversehq.com/qview/
brew install qview

# Picturama
# Digital image organizer powered by the web
# https://picturama.github.io/

# Xee - Image viewer for macOS
# https://theunarchiver.com/xee

# Lyn for macOS
# Organize, view, edit and share your photos.
# https://www.lynapp.com/

# Viso (Paid)
# Beautiful minimal image viewer for macOS
# https://getviso.app/

# LilyView (Paid)
# LilyView is an easy to use lightweight image viewer for Mac.
# https://lilyviewapp.com/

# Phiewer - macOS Image Viewer
# https://phiewer.com/

# XnView MP: Image management
# The enhanced Image Viewer for (Windows/MacOS/Linux)
# https://www.xnview.com/en/xnviewmp/#downloads

# EdgeView
# https://www.edgeview.co.kr/?lang=ko


# Whisky
# https://getwhisky.app
# https://github.com/Whisky-App/Whisky
# A modern Wine wrapper for macOS built with SwiftUI
brew install --cask whisky



# Deskflow (Synergy alternative)
# https://github.com/deskflow/deskflow
# Share a single keyboard and mouse between multiple computers.
# Deskflow (open source Synergy alternative)  https://github.com/deskflow/deskflow
brew tap deskflow/homebrew-tap
brew install deskflow

# Synergy (commercial)
# brew install synergy


# postgresql (Database)

# qemu (Emulator)
# utm (Cask) (Virtual machines UI on top of QEMU)



# docker (Cask) (Docker Desktop, container builder and runner)
# kubernetes-cli (Kubernetes API client)
# k9s (Kubernetes TUI)
# helm (Kubernetes package manager)

# barrier (Cask) (KVM)
# discord (Cask) (Voice and Text Chat)
# slack (Cask) (Text Chat)
# zoom (Cask) (Video Conferencing)


# ============ App Store ============
# mas install 1669959741  # Code Piper - Copy verification code
# LocalSend


# ============ Web Apps (no install needed) ============
# Perplexity  https://perplexity.ai


# ============ References ============
# https://github.com/jaywcjlove/awesome-mac
# https://github.com/serhii-londar/open-source-mac-os-apps
# https://formulae.brew.sh/
# https://github.com/fwcd/brew-pkgs
# https://gist.github.com/pmkay/e09034971b6f23214fd9f95a3e6d1c44
