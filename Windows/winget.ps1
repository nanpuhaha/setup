# winget Chocolatey Boxstarter scoop

Copy-Item ".\winget-settings.json" "$env:LOCALAPPDATA\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json" -Force
winget upgrade --all

# Scoop : A command-line installer for Windows https://scoop.sh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# chocolatey : A package manager for Windows https://chocolatey.org/install
# https://docs.chocolatey.org/en-us/choco/setup/#install-using-winget
winget install Chocolatey.Chocolatey 
winget install MartiCliment.UniGetUI # formerly WingetUI

# Boxstarter : Windows 설치 자동화 도구 https://boxstarter.org
# 관리자 권한 필요!
choco install boxstarter --yes
 # --acceptlicense, --accept-license
 #     AcceptLicense - Accept license dialogs automatically. Reserved for future use.
 # -y, --yes, --confirm
 #     Confirm all prompts - Chooses affirmative answer instead of prompting.
 #       Implies --accept-license


# Disable-UAC

# https://winstall.app/
# https://winget.run/

# Scoop
# https://scoop.sh/
# https://github.com/ScoopInstaller/Scoop
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression


# winget install -e 의 -e는 --exact. 대/소문자 구분 검사를 포함하여 쿼리에서 정확한 문자열을 사용합니다. 하위 문자열의 기본 동작을 사용하지 않습니다.
# --accept-package-agreements : parameter for package level agreements.
# --accept-source-agreements  : parameter for source level agreements.

winget install Automattic.Simplenote Microsoft.VisualStudioCode Microsoft.VisualStudioCode.Insiders Git.Git Python.Python.3.13 Python.Python.3.12 Python.Python.3.11 Anaconda.Anaconda3 Microsoft.Edge.Canary Microsoft.Edge.Dev
winget install Postman.Postman Postman.Postman.Canary Telegram.TelegramDesktop Anki.Anki GitHub.cli Google.GoogleDrive CodecGuide.K-LiteCodecPack.Full cURL.cURL Opera.Opera Microsoft.PowerToys Dropbox.Dropbox OpenJS.NodeJS.LTS Yarn.Yarn Docker.DockerDesktop Microsoft.DevHome LocalSend.LocalSend SlackTechnologies.Slack Microsoft.EdgeDriver Microsoft.VisualStudioCode.CLI Oracle.JDK.21 Obsidian.Obsidian ImageMagick.ImageMagick tailscale.tailscale

# Microsoft Visual C++ Redistributable
winget install Microsoft.VCRedist.2005.x64 Microsoft.VCRedist.2005.x86 Microsoft.VCRedist.2008.x64 Microsoft.VCRedist.2008.x86 Microsoft.VCRedist.2010.x64 Microsoft.VCRedist.2010.x86 Microsoft.VCRedist.2012.x64 Microsoft.VCRedist.2012.x86 Microsoft.VCRedist.2013.x64 Microsoft.VCRedist.2013.x86 Microsoft.VCRedist.2015+.x64 Microsoft.VCRedist.2015+.x86
# winget install Microsoft.DotNet.Framework.DeveloperPack_4 Microsoft.DotNet.SDK.Preview Microsoft.DotNet.SDK.7 Microsoft.DotNet.SDK.6 Microsoft.DotNet.SDK.5 Microsoft.DotNet.SDK.3_1 
# winget install Microsoft.DotNet.Runtime.Preview Microsoft.DotNet.Runtime.7 Microsoft.DotNet.Runtime.6 Microsoft.DotNet.Runtime.5 Microsoft.DotNet.Runtime.3_1 
# winget install Microsoft.DotNet.DesktopRuntime.7 Microsoft.DotNet.DesktopRuntime.6 Microsoft.DotNet.DesktopRuntime.5 Microsoft.DotNet.DesktopRuntime.3_1 

winget install OBSProject.OBSStudio Dropbox.Dropbox Discord.Discord OpenJS.NodeJS Kakao.KakaoTalk Daum.PotPlayer voidtools.Everything Nexon.NexonPlug Postman.Postman Postman.Postman.Canary Estmob.SendAnywhere SublimeHQ.SublimeText.4 Bandisoft.Bandizip ZhornSoftware.Stickies AdoptOpenJDK.OpenJDK.15 NGWIN.PicPick Apple.Bonjour Apple.BonjourPrintServices Apple.AppleApplicationSupport.x64 Apple.iTunes Chocolatey.ChocolateyGUI Chocolatey.Chocolatey MartiCliment.UniGetUI Anysphere.Cursor NAVER.Whale 

# https://winstall.app/
# https://winget.run/

# 패키지 검색하기
# winget search

# 터미널 도구
winget install cURL.cURL JernejSimoncic.Wget StefansTools.grepWin Git.Git jqlang.jq OpenJS.NodeJS.LTS OpenJS.NodeJS Yarn.Yarn pnpm.pnpm
winget install Rclone.Rclone yt-dlp.yt-dlp Streamlink.Streamlink ImageMagick.ImageMagick Gyan.FFmpeg
winget install Python.Python.3.14 Python.Python.3.13 Python.Python.3.12 astral-sh.uv Anaconda.Anaconda3 Anaconda.Miniconda3
winget install Oracle.JDK.21

# 텍스트 에디터
winget install SublimeHQ.SublimeText.4 SublimeHQ.SublimeText.3 Microsoft.VisualStudioCode Microsoft.VisualStudioCode.Insiders Microsoft.VisualStudioCode.CLI Microsoft.VisualStudioCode.Insiders.CLI

# 브라우저
winget install Microsoft.Edge Microsoft.Edge.Beta Microsoft.Edge.Dev Microsoft.Edge.Canary 
winget install Google.Chrome Google.Chrome.Beta Google.Chrome.Dev Google.Chrome.Canary

# 설치된 패키지 목록 보기
# winget list 
winget install GitHub.GitHubDesktop GitHub.cli


winget install RandyRants.SharpKeys # Key Remap # https://github.com/randyrants/sharpkeys



winget install NGWIN.PicPick  # PicPick은 버전이 좀 뒤쳐짐
winget install Notion.Notion
winget install 9P2W3W81SPPB # Bandisoft.Bandizip
winget install 9PH84MZPJ931 # Send Anywhere - Make file transfers faster
winget install voidtools.Everything
winget install Apple.iTunes
winget install Automattic.Simplenote
winget install WinMerge.WinMerge
winget install 9nt1r1c2hh7j # OpenAI ChatGPT
winget install Ollama.Ollama

# WSL
winget install Canonical.Ubuntu

# Claude Code
# Error: Claude Code is not supported on Windows.
# https://docs.anthropic.com/ko/docs/agents-and-tools/claude-code/overview
# npm install -g @anthropic-ai/claude-code

# 터미널 껐다 켜야 함
# poetry
# (Invoke-WebRequest -Uri https://install.python-poetry.org -UseBasicParsing).Content | py -

# PATH에 추가 C:\Users\jwseo\AppData\Roaming\Python\Scripts


winget install ImageGlass qView qimgv nomacs PicView IrfanSkiljan.IrfanView IrfanSkiljan.IrfanView.PlugIns XnSoft.XnView.Classic JPEGView
winget install nomacs # nomacs : 이미지가 담긴 폴더를 열어서 한 눈에 보기에 좋음
winget install 9N1X3Z50BLM8 # Visum Photo Viewer
# A fast and simple image viewer / editor for many operating systems
# https://github.com/woelper/oculante
scoop install extras/oculante

# A modern, electron and nodejs based image viewer for Mac, Windows and Linux.
# https://github.com/sachinchoolur/lightgallery-desktop

# Minimalist image viewer based on Leaflet.js and Electron.
# https://github.com/sprout2000/leafview
winget install sprout2000.LeafView



winget install Google.ChromeRemoteDesktop

winget install Google.GoogleDrive
# winget install Mozilla.Firefox
# winget install Mozilla.Firefox.Beta
# winget install Mozilla.Firefox.DeveloperEdition
# winget install Mozilla.Firefox.ESR
# winget install Mozilla.Firefox.Nightly

winget install Zoom.Zoom
winget install zhaopengme.gitnote
# winget install zokugun.MrCode

winget install zyedidia.micro
winget install yetone.OpenAITranslator
winget install YmSoft.Nalgaeset
winget install XnSoft.XnView.Classic
winget install XnSoft.XnConvert
winget install XnSoft.XnViewMP
winget install Front.scrcpy+
winget install blacktop.ipsw
winget install Postman.Postman
winget install Postman.Postman.DesktopAgent
winget install SmartSoft.SmartFTP
winget install StartIsBack.StartAllBack
winget install Telegram.TelegramDesktop
winget install Iterate.Cyberduck
winget install Iterate.MountainDuck
winget install AnyDeskSoftwareGmbH.AnyDesk
winget install Microsoft.PowerBI
winget install Anki.Anki
winget install Olivia.VIA
winget install calibre.calibre
winget install ShiningLight.OpenSSL
winget install Frontesque.scrcpy+
winget install ScooterSoftware.BeyondCompare4
winget install PhraseExpress.PhraseExpress
winget install DigiDNA.iMazing
winget install eTeks.SweetHome3D
winget install CodecGuide.K-LiteCodecPack.Full
winget install Opera.Opera
winget install Microsoft.PowerToys
winget install Dropbox.Dropbox
winget install JLC.EasyEDA
winget install JLC.EasyEDA.Pro
winget install CrystalDewWorld.CrystalDiskInfo
winget install CrystalDewWorld.CrystalDiskMark
winget install WinMerge.WinMerge
winget install TeamViewer.TeamViewer.Host
winget install Docker.DockerDesktop


winget install Sigil-Ebook.Sigil
winget install LocalSend.LocalSend
winget install Figma.Figma
winget install Notion.Notion
winget install SlackTechnologies.Slack
winget install Microsoft.EdgeDriver
winget install Apple.iTunes
winget install Microsoft.VisualStudioCode.CLI
winget install UB-Mannheim.TesseractOCR
winget install Chocolatey.Chocolatey
winget install Notepad++.Notepad++
winget install Tonec.InternetDownloadManager
winget install Rufus.Rufus
winget install BlenderFoundation.Blender
winget install MongoDB.Compass.Full
winget install JGraph.Draw
winget install GoLang.Go
winget install MediaArea.MediaInfo.GUI
winget install junegunn.fzf
winget install 1MHz.Knotes
winget install Obsidian.Obsidian
winget install BinanceTech.Binance
winget install HandBrake.HandBrake
winget install HandBrake.HandBrake.CLI
winget install Syncthing.Syncthing
winget install Anaconda.Anaconda3
winget install tailscale.tailscale
winget install KiCad.KiCad
winget install agalwood.Motrix

# DevToys - Swiss Army knife for developers
# https://devtoys.app
# https://github.com/veler/DevToys
winget install DevToys


winget install QL-Win.QuickLook Bandisoft.Honeyview IrfanSkiljan.IrfanView XnSoft.XnView.Classic nomacs.nomacs DuongDieuPhap.ImageGlass FastStone.Viewer


# Windows Extension
winget install "AV1 Video Extension" "WebP Image Extension" "MPEG-2 Video Extension"

# Logitech
# Unifying 리시버 인식 못할 때, SetPoint 필요
winget install Logitech.UnifyingSoftware Logitech.SetPoint Logitech.OptionsPlus  # Logitech.Options

# Disk Space 
winget install AntibodySoftware.WizTree # UderzoSoftware.SpaceSniffer WinDirStat.WinDirStat JAMSoftware.TreeSize

# Terminal
winget install Warp.Warp
