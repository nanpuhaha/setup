# Windows Development Environment Setup Script

# Install Scoop
# Scoop: A command-line installer for Windows
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Install Chocolatey and UniGetUI
# Chocolatey: A package manager for Windows
winget install --accept-package-agreements --accept-source-agreements --silent --source winget --exact Chocolatey.Chocolatey

# UniGetUI: A GUI for managing packages installed via winget, scoop, and chocolatey
# winget install --accept-package-agreements --accept-source-agreements --silent --exact Chocolatey.Chocolatey Chocolatey.ChocolateyGUI MartiCliment.UniGetUI

# Install Boxstarter
# Boxstarter: A tool for repeatable, reboot resilient Windows environment installations
choco install boxstarter --yes

# Install development tools and packages using winget
winget install -e --silent --accept-source-agreements --accept-package-agreements --source winget `
    Automattic.Simplenote `
    Microsoft.VisualStudioCode `
    Microsoft.VisualStudioCode.Insiders `
    Git.Git `
    Python.Python.3.14 `
    Python.Python.3.13 `
    Python.Python.3.12 `
    Python.Python.3.11 `
    Anaconda.Anaconda3 `
    Anaconda.Miniconda3 `
    Microsoft.Edge.Canary `
    Microsoft.Edge.Dev `
    Postman.Postman `
    Postman.Postman.Canary `
    Telegram.TelegramDesktop `
    Anki.Anki `
    GitHub.cli `
    GitHub.GitHubDesktop `
    GitHub.GitHubDesktop.Beta `
    GitHub.GitLFS `
    GitHub.Copilot `
    GitHub.Copilot.Prerelease `
    Google.GoogleDrive `
    CodecGuide.K-LiteCodecPack.Full `
    cURL.cURL `
    Opera.Opera `
    Microsoft.PowerToys `
    Dropbox.Dropbox `
    OpenJS.NodeJS.LTS `
    Yarn.Yarn `
    pnpm.pnpm `
    astral-sh.uv `
    astral-sh.ruff `
    astral-sh.ty `
    Docker.DockerDesktop `
    Microsoft.DevHome `
    LocalSend.LocalSend `
    SlackTechnologies.Slack `
    Microsoft.EdgeDriver `
    Microsoft.VisualStudioCode.CLI `
    Oracle.JDK.21 `
    GoLang.Go `
    Obsidian.Obsidian `
    Notion.Notion `
    ImageMagick.ImageMagick `
    Anthropic.Claude `
    Anthropic.ClaudeCode `
    Google.WorkspaceCLI `
    SST.opencode `
    SST.OpenCodeDesktop `
    DifferentAI.OpenWork `
    farion1231.CC-Switch `
    tailscale.tailscale

# Install Microsoft Visual C++ Redistributable
winget install -e --silent --accept-source-agreements --accept-package-agreements --source winget Microsoft.VCRedist.2005.x64 Microsoft.VCRedist.2005.x86 Microsoft.VCRedist.2008.x64 Microsoft.VCRedist.2008.x86 Microsoft.VCRedist.2010.x64 Microsoft.VCRedist.2010.x86 Microsoft.VCRedist.2012.x64 Microsoft.VCRedist.2012.x86 Microsoft.VCRedist.2013.x64 Microsoft.VCRedist.2013.x86 Microsoft.VCRedist.2015+.x64 Microsoft.VCRedist.2015+.x86

# Install additional tools and utilities
winget install -e --silent --accept-source-agreements --accept-package-agreements --source winget `
    OBSProject.OBSStudio `
    Dropbox.Dropbox `
    Discord.Discord `
    OpenJS.NodeJS `
    Kakao.KakaoTalk `
    Daum.PotPlayer `
    voidtools.Everything `
    voidtools.Everything.Alpha `
    voidtools.Everything.Cli `
    Logitech.UnifyingSoftware `
    Logitech.Options `
    Logitech.OptionsPlus `
    Logitech.SetPoint `
    Nexon.NexonPlug `
    Postman.Postman `
    Postman.Postman.Canary `
    Estmob.SendAnywhere `
    SublimeHQ.SublimeText.4 `
    Bandisoft.Bandizip `
    7zip.7zip `
    ZhornSoftware.Stickies `
    AdoptOpenJDK.OpenJDK.15 `
    NGWIN.PicPick `
    Apple.Bonjour `
    Apple.BonjourPrintServices `
    Apple.AppleApplicationSupport.x64 `
    Apple.AppleMobileDeviceSupport `
    Apple.iTunes `
    Apple.iCloud `
    Anysphere.Cursor `
    NAVER.Whale `
    AutoHotkey.AutoHotkey `
    Bitwarden.Bitwarden `
    Bitwarden.CLI `
    AntibodySoftware.WizTree `
    alexx2000.DoubleCommander `
    appmakes.Typora `
    agalwood.Motrix `
    BinaryFortress.WindowInspector `
    Brave.Brave

# Install Microsoft Store apps
winget install -e --silent --accept-source-agreements --accept-package-agreements --source msstore 9PLM9XGG6VKS
