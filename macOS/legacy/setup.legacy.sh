#!/usr/bin/env bash

echo "맥 셋팅 스크립트를 시작합니다..."

# 1. Homebrew 설치 여부 확인 및 설치
if ! command -v brew &> /dev/null; then
    echo "Homebrew를 설치합니다..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Apple Silicon PATH 설정
    if [[ $(uname -m) == "arm64" ]]; then
        (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

# 2. 최신 상태 업데이트
brew update
brew upgrade

# 3. Brewfile 실행 (같은 디렉토리에 Brewfile이 있어야 함)
if [ -f "Brewfile" ]; then
    echo "Brewfile을 통해 패키지 및 앱 설치를 시작합니다..."
    brew bundle
else
    echo "오류: Brewfile을 찾을 수 없습니다."
fi

# 4. GNU 도구 심볼릭 링크 설정 (brew.sh 내용 반영)
BREW_PREFIX=$(brew --prefix)
if [ -d "${BREW_PREFIX}/bin" ]; then
    ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum" 2>/dev/null
fi

# 5. 기본 쉘을 Homebrew Bash로 변경 (필요시 선택적 사용)
BREW_BASH="${BREW_PREFIX}/bin/bash"
if [ -f "$BREW_BASH" ]; then
    if ! grep -q "$BREW_BASH" /etc/shells; then
        echo "Bash를 Homebrew 버전으로 변경합니다..."
        echo "$BREW_BASH" | sudo tee -a /etc/shells
        chsh -s "$BREW_BASH"
    fi
fi

# 6. 정리
brew cleanup

echo "셋팅이 완료되었습니다! 시스템을 재시작하거나 터미널을 다시 열어주세요."
