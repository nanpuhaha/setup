# Winget Installation Script

# IMPORTANT: Run this script as Administrator

# 1. Setup & Dependencies
# ---------------------------------------------------
# Copy Winget Settings
Copy-Item ".\winget-settings.json" "$env:LOCALAPPDATA\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json" -Force

# Upgrade all existing packages
winget upgrade --all

# 2. Package Managers
# ---------------------------------------------------
# Scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

winget install `
    Chocolatey.Chocolatey `
    Chocolatey.ChocolateyGUI `
    Microsoft.VisualStudioCode `
    Microsoft.VisualStudioCode.Insiders `
    Microsoft.VisualStudioCode.CLI `
    Microsoft.VisualStudioCode.Insiders.CLI `
    JetBrains.IntelliJIDEA.Ultimate `
    Google.Antigravity `
    ZedIndustries.Zed `
    Codeium.Windsurf `
    Anthropic.Claude `
    Anthropic.ClaudeCode `
    SST.opencode `
    SST.OpenCodeDesktop `
    DifferentAI.OpenWork `
    farion1231.CC-Switch `
    Anysphere.Cursor `
    zyedidia.micro `
    SublimeHQ.SublimeText.4 `
    Notepad++.Notepad++ `
    OpenJS.NodeJS.LTS `
    OpenJS.NodeJS `
    Yarn.Yarn `
    pnpm.pnpm `
    astral-sh.uv `
    astral-sh.ruff `
    astral-sh.ty `
    Python.Python.3.14 `
    Python.Python.3.13 `
    Python.Python.3.12 `
    Python.Python.3.11 `
    Anaconda.Anaconda3 `
    Anaconda.Miniconda3 `
    Oracle.JDK.21 `
    AdoptOpenJDK.OpenJDK.15 `
    GoLang.Go `
    Git.Git `
    GitHub.GitHubDesktop `
    GitHub.GitHubDesktop.Beta `
    GitHub.cli `
    GitHub.GitLFS `
    GitHub.Copilot `
    GitHub.Copilot.Prerelease `
    Warp.Warp `
    junegunn.fzf `
    jqlang.jq `
    StefansTools.grepWin `
    cURL.cURL `
    JernejSimoncic.Wget `
    Google.WorkspaceCLI `
    Microsoft.PowerShell `
    Microsoft.DevHome `
    Docker.DockerDesktop `
    Postman.Postman `
    Postman.Postman.Canary `
    Postman.Postman.DesktopAgent `
    MongoDB.Compass.Full `
    SmartSoft.SmartFTP `
    Iterate.Cyberduck `
    Iterate.MountainDuck `
    1MHz.Knotes `
    Front.scrcpy+ `
    JLC.EasyEDA.Pro `
    KiCad.KiCad `
    BinanceTech.Binance `
    Google.Chrome `
    Google.Chrome.Beta `
    Google.Chrome.Dev `
    Google.Chrome.Canary `
    Microsoft.Edge `
    Microsoft.Edge.Beta `
    Microsoft.Edge.Dev `
    Microsoft.Edge.Canary `
    NAVER.Whale `
    Opera.Opera `
    Brave.Brave `
    SlackTechnologies.Slack `
    Telegram.TelegramDesktop `
    Kakao.KakaoTalk `
    Discord.Discord `
    Zoom.Zoom `
    Notion.Notion `
    Obsidian.Obsidian `
    Figma.Figma `
    Microsoft.PowerToys `
    AutoHotkey.AutoHotkey `
    Bandisoft.Bandizip `
    7zip.7zip `
    voidtools.Everything `
    voidtools.Everything.Alpha `
    voidtools.Everything.Cli `
    MartiCliment.UniGetUI `
    Rclone.Rclone `
    Syncthing.Syncthing `
    LocalSend.LocalSend `
    Estmob.SendAnywhere `
    Dropbox.Dropbox `
    Bitwarden.Bitwarden `
    Bitwarden.CLI `
    Google.GoogleDrive `
    TeamViewer.TeamViewer.Host `
    AnyDeskSoftwareGmbH.AnyDesk `
    Google.ChromeRemoteDesktop `
    Rufus.Rufus `
    WinMerge.WinMerge `
    ScooterSoftware.BeyondCompare4 `
    StartIsBack.StartAllBack `
    alexx2000.DoubleCommander `
    Automattic.Simplenote `
    appmakes.Typora `
    agalwood.Motrix `
    RandyRants.SharpKeys `
    PhraseExpress.PhraseExpress `
    ZhornSoftware.Stickies `
    Anki.Anki `
    calibre.calibre `
    Sigil-Ebook.Sigil `
    Daum.PotPlayer `
    CodecGuide.K-LiteCodecPack.Full `
    OBSProject.OBSStudio `
    HandBrake.HandBrake `
    HandBrake.HandBrake.CLI `
    Gyan.FFmpeg `
    yt-dlp.yt-dlp `
    Streamlink.Streamlink `
    BlenderFoundation.Blender `
    BinaryFortress.WindowInspector `
    Apple.iTunes `
    Apple.iCloud `
    Apple.Bonjour `
    Apple.BonjourPrintServices `
    Apple.AppleApplicationSupport.x64 `
    Apple.AppleMobileDeviceSupport `
    ImageMagick.ImageMagick `
    XnSoft.XnView.Classic `
    XnSoft.XnViewMP `
    IrfanSkiljan.IrfanView `
    IrfanSkiljan.IrfanView.PlugIns `
    Bandisoft.Honeyview `
    DuongDieuPhap.ImageGlass `
    nomacs.nomacs `
    FastStone.Viewer `
    QL-Win.QuickLook `
    NGWIN.PicPick `
    Microsoft.VCRedist.2015+.x64 `
    Microsoft.VCRedist.2015+.x86 `
    Logitech.OptionsPlus `
    Logitech.Options `
    Logitech.SetPoint `
    Logitech.UnifyingSoftware `
    AntibodySoftware.WizTree `
    CrystalDewWorld.CrystalDiskInfo `
    CrystalDewWorld.CrystalDiskMark `
    Canonical.Ubuntu `
    Nexon.NexonPlug `
    tailscale.tailscale

# ---------------------------------------------------

winget install --exact --silent --accept-source-agreements --accept-package-agreements --source msstore 9PLM9XGG6VKS

winget install --id Casey.Just --exact
# Note: Some packages might be duplicates or conflicts.
# Please double check existing installations.
