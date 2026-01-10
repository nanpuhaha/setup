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
# Chocolatey
winget install Chocolatey.Chocolatey Chocolatey.ChocolateyGUI

# Scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# 3. Development Tools
# ---------------------------------------------------
# IDEs & Editors & Runtimes & Terminal
winget install `
    Microsoft.VisualStudioCode `
    Microsoft.VisualStudioCode.Insiders `
    Microsoft.VisualStudioCode.CLI `
    Microsoft.VisualStudioCode.Insiders.CLI `
    JetBrains.IntelliJIDEA.Ultimate `
    Google.Antigravity `
    ZedIndustries.Zed `
    Codeium.Windsurf `
    Anysphere.Cursor `
    zyedidia.micro `
    SublimeHQ.SublimeText.4 `
    Notepad++.Notepad++ `
    OpenJS.NodeJS.LTS `
    OpenJS.NodeJS `
    Yarn.Yarn `
    pnpm.pnpm `
    Python.Python.3.13 `
    Python.Python.3.12 `
    Python.Python.3.11 `
    Anaconda.Anaconda3 `
    Anaconda.Miniconda3 `
    Oracle.JDK.21 `
    GoLang.Go `
    Git.Git `
    GitHub.GitHubDesktop `
    GitHub.cli `
    Warp.Warp `
    junegunn.fzf `
    jqlang.jq `
    StefansTools.grepWin `
    cURL.cURL `
    JernejSimoncic.Wget `
    Microsoft.PowerShell `
    Microsoft.DevHome `
    Docker.DockerDesktop `
    Postman.Postman `
    Postman.Postman.DesktopAgent `
    MongoDB.Compass.Full `
    SmartSoft.SmartFTP `
    Iterate.Cyberduck `
    Iterate.MountainDuck `
    1MHz.Knotes `
    Front.scrcpy+ `
    JLC.EasyEDA.Pro `
    KiCad.KiCad `
    BinanceTech.Binance

# 4. Web Browsers
# ---------------------------------------------------
winget install `
    Google.Chrome `
    Google.Chrome.Beta `
    Google.Chrome.Dev `
    Google.Chrome.Canary `
    Microsoft.Edge `
    Microsoft.Edge.Beta `
    Microsoft.Edge.Dev `
    Microsoft.Edge.Canary `
    NAVER.Whale `
    Opera.Opera
    # Mozilla.Firefox

# 5. Communication & Collaboration
# ---------------------------------------------------
winget install `
    SlackTechnologies.Slack `
    Telegram.TelegramDesktop `
    Kakao.KakaoTalk `
    Discord.Discord `
    Zoom.Zoom `
    Notion.Notion `
    Obsidian.Obsidian `
    Figma.Figma

# 6. Utilities & Productivity
# ---------------------------------------------------
winget install `
    Microsoft.PowerToys `
    Bandisoft.Bandizip `
    voidtools.Everything `
    MartiCliment.UniGetUI `
    Rclone.Rclone `
    Syncthing.Syncthing `
    LocalSend.LocalSend `
    Estmob.SendAnywhere `
    Dropbox.Dropbox `
    Google.GoogleDrive `
    TeamViewer.TeamViewer.Host `
    AnyDeskSoftwareGmbH.AnyDesk `
    Google.ChromeRemoteDesktop `
    Rufus.Rufus `
    WinMerge.WinMerge `
    ScooterSoftware.BeyondCompare4 `
    StartIsBack.StartAllBack `
    Automattic.Simplenote `
    RandyRants.SharpKeys `
    PhraseExpress.PhraseExpress `
    Anki.Anki `
    calibre.calibre `
    Sigil-Ebook.Sigil

# 7. Media (Video, Audio, Images)
# ---------------------------------------------------
winget install `
    Daum.PotPlayer `
    CodecGuide.K-LiteCodecPack.Full `
    OBSProject.OBSStudio `
    HandBrake.HandBrake `
    HandBrake.HandBrake.CLI `
    Gyan.FFmpeg `
    yt-dlp.yt-dlp `
    Streamlink.Streamlink `
    BlenderFoundation.Blender `
    Apple.iTunes `
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
    NGWIN.PicPick

# 8. System & Drivers
# ---------------------------------------------------
winget install `
    Microsoft.VCRedist.2015+.x64 `
    Microsoft.VCRedist.2015+.x86 `
    Logitech.OptionsPlus `
    Logitech.UnifyingSoftware `
    AntibodySoftware.WizTree `
    CrystalDewWorld.CrystalDiskInfo `
    CrystalDewWorld.CrystalDiskMark `
    Canonical.Ubuntu `
    tailscale.tailscale

# ---------------------------------------------------
# Note: Some packages might be duplicates or conflicts.
# Please double check existing installations.
