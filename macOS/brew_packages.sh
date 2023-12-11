# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Run these two commands in your terminal to add Homebrew to your PATH:
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"



# GUI `brew search`
# https://formulae.brew.sh/

brew update


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

