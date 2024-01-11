# winget
# Boxstarter
# Chocolatey

Disable-UAC

# winget install -e 의 -e는 --exact. 대/소문자 구분 검사를 포함하여 쿼리에서 정확한 문자열을 사용합니다. 하위 문자열의 기본 동작을 사용하지 않습니다.

# --accept-package-agreements parameter for package level agreements.
# --accept-source-agreements parameter for source level agreements.
# winget install -e --silent --accept-source-agreements --accept-package-agreements --id 9PGZKJC81Q7J

# https://winstall.app/
# https://winget.run/

# 패키지 검색하기
# winget search


# 설치된 패키지 목록 보기
# winget list 
winget install GitHub.GitHubDesktop
winget install SublimeHQ.SublimeText.4


winget install -e RandyRants.SharpKeys # Key Remap # https://github.com/randyrants/sharpkeys


winget install NGWIN.PicPick  # PicPick은 버전이 좀 뒤쳐짐
winget install Notion.Notion
winget install 9P2W3W81SPPB # Bandisoft.Bandizip
winget install 9PH84MZPJ931 # Send Anywhere - Make file transfers faster
winget install voidtools.Everything
winget install Apple.iTunes
winget install Automattic.Simplenote
winget install WinMerge.WinMerge
winget install Microsoft.VisualStudioCode
winget install Microsoft.VisualStudioCode.Insiders
winget install Git.Git
winget install Python.Python.3.12
winget install Anaconda.Anaconda3
winget install lencx.ChatGPT

# 터미널 껐다 켜야 함
# poetry
(Invoke-WebRequest -Uri https://install.python-poetry.org -UseBasicParsing).Content | py -

# PATH에 추가 C:\Users\jwseo\AppData\Roaming\Python\Scripts



winget install ImageGlass
winget install qView
winget install qimgv
winget install nomacs
winget install PicView 
winget install -e --id=IrfanSkiljan.IrfanView 
winget install -e --id=IrfanSkiljan.IrfanView.PlugIns
winget install Visum Photo Viewer

winget install -e --id=Microsoft.Edge
winget install -e --id=Microsoft.Edge.Canary
winget install -e --id=Microsoft.Edge.Dev

winget install -e --id Google.Chrome
winget install -e --id Google.Chrome.Beta
winget install -e --id Google.Chrome.Dev
winget install -e --id Google.Chrome.Canary

winget install -e --id Google.ChromeRemoteDesktop

# winget install -e --id Mozilla.Firefox
# winget install -e --id Mozilla.Firefox.Beta
# winget install -e --id Mozilla.Firefox.DeveloperEdition
# winget install -e --id Mozilla.Firefox.ESR
# winget install -e --id Mozilla.Firefox.Nightly

winget install -e --id Zoom.Zoom
winget install -e --id zhaopengme.gitnote
# winget install -e --id zokugun.MrCode


winget install -e --id zyedidia.micro
winget install -e --id yt-dlp.yt-dlp
winget install -e --id yt-dlg.yt-dlg
winget install -e --id youtube-dl.youtube-dl
winget install -e --id yetone.OpenAITranslator
winget install -e --id YmSoft.Nalgaeset
winget install -e --id Yarn.Yarn
winget install -e --id XnSoft.XnView.Classic
winget install -e --id XnSoft.XnConvert
winget install -e --id XnSoft.XnViewMP
winget install -e --id=Google.Chrome
winget install -e --id=Google.Chrome.Dev
winget install -e --id=Front.scrcpy+
winget install -e --id=blacktop.ipsw
winget install -e --id=Postman.Postman.Canary
winget install -e --id=Postman.Postman.DesktopAgent
winget install -e --id=SmartSoft.SmartFTP
winget install -e --id=StartIsBack.StartAllBack
winget install -e --id=Postman.Postman
winget install -e --id=Telegram.TelegramDesktop
winget install -e --id=Iterate.Cyberduck
winget install -e --id=Iterate.MountainDuck
winget install -e --id=AnyDeskSoftwareGmbH.AnyDesk
winget install -e --id=Microsoft.PowerBI
winget install -e --id=Anki.Anki
winget install -e --id=Olivia.VIA
winget install -e --id=calibre.calibre
winget install -e --id=ShiningLight.OpenSSL
winget install -e --id=GitHub.cli
winget install -e --id=Google.GoogleDrive
winget install -e --id=GitHub.GitHubDesktop
winget install -e --id=GitHub.GitHubDesktop.Beta
winget install -e --id=Frontesque.scrcpy+
winget install -e --id=ScooterSoftware.BeyondCompare4
winget install -e --id=PhraseExpress.PhraseExpress
winget install -e --id=DigiDNA.iMazing
winget install -e --id=eTeks.SweetHome3D
winget install -e --id=CodecGuide.K-LiteCodecPack.Full
winget install -e --id=Streamlink.Streamlink.TwitchGui
winget install -e --id=Streamlink.Streamlink
winget install -e --id=Opera.Opera
winget install -e --id=cURL.cURL
winget install -e --id=StefansTools.grepWin
winget install -e --id=Anaconda.Miniconda3
winget install -e --id=Microsoft.PowerToys
winget install -e --id=Dropbox.Dropbox
winget install -e --id=JLC.EasyEDA
winget install -e --id=JLC.EasyEDA.Pro
winget install -e --id=CrystalDewWorld.CrystalDiskInfo
winget install -e --id=CrystalDewWorld.CrystalDiskMark
winget install -e --id=OpenJS.NodeJS
winget install -e --id=OpenJS.NodeJS.LTS
winget install -e --id=WinMerge.WinMerge
winget install -e --id=TeamViewer.TeamViewer.Host
winget install -e --id=Docker.DockerDesktop
winget install -e --id=Logitech.OptionsPlus
winget install -e --id=Logitech.Options
winget install -e --id=Logitech.UnifyingSoftware
winget install -e --id=Sigil-Ebook.Sigil
winget install -e --id=Microsoft.DevHome
winget install -e --id=LocalSend.LocalSend
winget install -e --id=Figma.Figma
winget install -e --id=Notion.Notion
winget install -e --id=SlackTechnologies.Slack
winget install -e --id=Microsoft.EdgeDriver
winget install -e --id=Apple.iTunes
winget install -e --id=Microsoft.VisualStudioCode.CLI
winget install -e --id=UB-Mannheim.TesseractOCR
winget install -e --id=Oracle.JDK.21
winget install -e --id=Chocolatey.Chocolatey
winget install -e --id=Notepad++.Notepad++
winget install -e --id=Tonec.InternetDownloadManager
winget install -e --id=Rufus.Rufus
winget install -e --id=BlenderFoundation.Blender
winget install -e --id=Rclone.Rclone
winget install -e --id=MongoDB.Compass.Full
winget install -e --id=JGraph.Draw
winget install -e --id=GoLang.Go
winget install -e --id=Logitech.SetPoint
winget install -e --id=MediaArea.MediaInfo.GUI
winget install -e --id=junegunn.fzf
winget install -e --id=1MHz.Knotes
winget install -e --id=Obsidian.Obsidian
winget install -e --id=BinanceTech.Binance
winget install -e --id=ImageMagick.ImageMagick
winget install -e --id=HandBrake.HandBrake
winget install -e --id=HandBrake.HandBrake.CLI
winget install -e --id=Syncthing.Syncthing
winget install -e --id=Anaconda.Anaconda3
winget install -e --id=tailscale.tailscale
winget install -e --id=Python.Python.3.11
winget install -e --id=Python.Python.3.12
winget install -e --id=KiCad.KiCad

winget install DevToys


winget install Chocolatey.Chocolatey
winget install Chocolatey.ChocolateyGUI
# https://chocolatey.org/install#individual
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# 환경변수에 C:\ProgramData\chocolatey 추가하기

# 관리자 권한 필요!
choco install boxstarter
# 위 명령어는 -y를 줘도 Y/N 물어봄...
# -y, --yes, --confirm
#     Confirm all prompts - Chooses affirmative answer instead of prompting.
#       Implies --accept-license
