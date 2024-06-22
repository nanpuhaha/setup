# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Run these two commands in your terminal to add Homebrew to your PATH:
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"



# GUI `brew search`
# https://formulae.brew.sh/

brew update


# Open Source (start)
brew install --cask marta   # File Manager  https://marta.sh
brew install lihaoyun6/tap/quickrecorder  # A lightweight screen recorder  https://github.com/lihaoyun6/QuickRecorder
brew install jordanbaird-ice  # Powerful menu bar manager  https://github.com/jordanbaird/Ice
# Git interface   https://github.com/git-up/GitUp
brew install --cask reminders-menubar  # Simple macOS menu bar app to view and interact with reminders.  https://github.com/DamascenoRafael/reminders-menubar
# Open Source (end)


# App Store (start)
# LocalSend
# Code Piper : Copy verification code now  https://apps.apple.com/us/app/code-piper/id1669959741?mt=12
# App Store (end)

brew install --cask simplenote
brew install --cask notion
brew install --cask capacities  # App to write and organize your ideas

brew install --cask sublime-text
brew install --cask visual-studio-code
brew install --cask visual-studio-code-insiders  # Not checked

brew install --cask microsoft-edge

brew install --cask postman
brew install --cask postman-agent
brew install --cask postman-cli

brew install --cask zoom

# AltTab https://alt-tab-macos.netlify.app
# brings the power of Windows’s “alt-tab” window switcher to macOS.
brew install --cask alt-tab

# Hammerspoon https://www.hammerspoon.org
# https://www.hammerspoon.org
# https://github.com/Hammerspoon/hammerspoon
# Powerful Automation. Bridge between the OS and a Lua scripting engine.
brew install --cask hammerspoon

# ------ Window Manager ------
# Rectangle - a window management app based on Spectacle, written in Swift.
# https://github.com/rxhanson/Rectangle
brew install --cask rectangle
# Swish https://highlyopinionated.co/swish/
# Moom https://manytricks.com/moom/
# Divvy https://mizage.com/divvy/ $13.99
# AeroSpace https://github.com/nikitabobko/AeroSpace
# brew install --cask nikitabobko/tap/aerospace
# Veeer https://veeer.io/
# Amethyst Tiling window manager for macOS along the lines of xmonad.
# brew install --cask amethyst



# skhd : Simple hotkey daemon for macOS
# https://github.com/koekeishiya/skhd
brew install koekeishiya/formulae/skhd
# skhd --start-service



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


brew install openjdk (Java)

brew install node (Node.js)
brew install yarn
brew install coreutils # GNU File, Shell, and Text utilities
brew install pkg-config # Manage compile and link flags for libraries
brew install automake #  Tool for generating GNU Standards-compliant Makefiles


libtool: Generic library support script
cmake: Cross-platform make
readline: Library for command-line editing
libyaml: YAML Parser
autoconf: Automatic configure script builder
redis: Persistent key-value database, with built-in net interface
nmap: Port scanning utility for large networks
pyenv: Python version management
ansible: Automate deployment, configuration, and upgrading
sqlite: Command-line interface for SQLite
watch: Executes a program periodically, showing output fullscreen

httpie: User-friendly cURL replacement (command-line HTTP client)
docker-compose: Isolated development environments using Docker
rust: Safe, concurrent, practical language
exiftool: Perl lib for reading and writing EXIF metadata
aria2: Download with resuming and segmented downloading


brew install ghidra (Reverse engineering tools)
brew install gh (GitHub CLI)
brew install 
brew install blackhole-2ch (Cask) (Virtual Audio Driver, useful for routing desktop audio)
brew install ffmpeg (Audio/video converter)
brew install blender (Cask) (3D modeling)
brew install obs (Cask) (Broadcasting and screencasting)


brew install prusaslicer (Cask) (3D slicer)
brew install openscad (Cask) (Programmable CAD modeler)

brew install wget

brew install mas
brew install imagemagick
brew install zsh
brew install speedtest-cli
brew install cask




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



postgresql (Database)

qemu (Emulator)
utm (Cask) (Virtual machines UI on top of QEMU)



docker (Cask) (Docker Desktop, container builder and runner)
kubernetes-cli (Kubernetes API client)
k9s (Kubernetes TUI)
helm (Kubernetes package manager)

barrier (Cask) (KVM)
discord (Cask) (Voice and Text Chat)
slack (Cask) (Text Chat)
zoom (Cask) (Video Conferencing)


https://github.com/fwcd/brew-pkgs
https://gist.github.com/pmkay/e09034971b6f23214fd9f95a3e6d1c44
