# winget
# Boxstarter
# Chocolatey
# scoop

Disable-UAC

# https://winstall.app/
# https://winget.run/

# Scoop
# https://scoop.sh/
# https://github.com/ScoopInstaller/Scoop
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression


# winget install -e 의 -e는 --exact. 대/소문자 구분 검사를 포함하여 쿼리에서 정확한 문자열을 사용합니다. 하위 문자열의 기본 동작을 사용하지 않습니다.

# --accept-package-agreements parameter for package level agreements.
# --accept-source-agreements parameter for source level agreements.
# winget install -e --silent --accept-source-agreements --accept-package-agreements --id 9PGZKJC81Q7J

winget install -e --silent --accept-source-agreements --accept-package-agreements Automattic.Simplenote Microsoft.VisualStudioCode Microsoft.VisualStudioCode.Insiders Git.Git Python.Python.3.13 Python.Python.3.12 Python.Python.3.11 Anaconda.Anaconda3 Microsoft.Edge.Canary Microsoft.Edge.Dev
winget install -e --silent --accept-source-agreements --accept-package-agreements Postman.Postman Postman.Postman.Canary Telegram.TelegramDesktop Anki.Anki GitHub.cli Google.GoogleDrive CodecGuide.K-LiteCodecPack.Full cURL.cURL Opera.Opera Microsoft.PowerToys Dropbox.Dropbox OpenJS.NodeJS.LTS Yarn.Yarn Docker.DockerDesktop Microsoft.DevHome LocalSend.LocalSend SlackTechnologies.Slack Microsoft.EdgeDriver Microsoft.VisualStudioCode.CLI Oracle.JDK.21 Obsidian.Obsidian ImageMagick.ImageMagick tailscale.tailscale

# Microsoft Visual C++ Redistributable
winget install -e --silent --accept-source-agreements --accept-package-agreements Microsoft.VCRedist.2005.x64 Microsoft.VCRedist.2005.x86 Microsoft.VCRedist.2008.x64 Microsoft.VCRedist.2008.x86 Microsoft.VCRedist.2010.x64 Microsoft.VCRedist.2010.x86 Microsoft.VCRedist.2012.x64 Microsoft.VCRedist.2012.x86 Microsoft.VCRedist.2013.x64 Microsoft.VCRedist.2013.x86 Microsoft.VCRedist.2015+.x64 Microsoft.VCRedist.2015+.x86
# winget install -e --silent --accept-source-agreements --accept-package-agreements Microsoft.DotNet.Framework.DeveloperPack_4 Microsoft.DotNet.SDK.Preview Microsoft.DotNet.SDK.7 Microsoft.DotNet.SDK.6 Microsoft.DotNet.SDK.5 Microsoft.DotNet.SDK.3_1 
# winget install -e --silent --accept-source-agreements --accept-package-agreements Microsoft.DotNet.Runtime.Preview Microsoft.DotNet.Runtime.7 Microsoft.DotNet.Runtime.6 Microsoft.DotNet.Runtime.5 Microsoft.DotNet.Runtime.3_1 
# winget install -e --silent --accept-source-agreements --accept-package-agreements Microsoft.DotNet.DesktopRuntime.7 Microsoft.DotNet.DesktopRuntime.6 Microsoft.DotNet.DesktopRuntime.5 Microsoft.DotNet.DesktopRuntime.3_1 

winget install -e --silent --accept-source-agreements --accept-package-agreements OBSProject.OBSStudio Dropbox.Dropbox Discord.Discord OpenJS.NodeJS Kakao.KakaoTalk Daum.PotPlayer voidtools.Everything Logitech.UnifyingSoftware Logitech.Options Nexon.NexonPlug Postman.Postman Postman.Postman.Canary Estmob.SendAnywhere SublimeHQ.SublimeText.4 Bandisoft.Bandizip ZhornSoftware.Stickies AdoptOpenJDK.OpenJDK.15 NGWIN.PicPick Apple.Bonjour Apple.BonjourPrintServices Apple.AppleApplicationSupport.x64 Apple.iTunes Chocolatey.ChocolateyGUI Chocolatey.Chocolatey MartiCliment.UniGetUI Anysphere.Cursor NAVER.Whale 

# https://winstall.app/
# https://winget.run/

# 패키지 검색하기
# winget search


# 설치된 패키지 목록 보기
# winget list 
winget install GitHub.GitHubDesktop
winget install SublimeHQ.SublimeText.4


winget install -e RandyRants.SharpKeys # Key Remap # https://github.com/randyrants/sharpkeys


winget install Rclone.Rclone

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
winget install -e --id agalwood.Motrix

# DevToys - Swiss Army knife for developers
# https://devtoys.app
# https://github.com/veler/DevToys
winget install DevToys


winget install -e --id=QL-Win.QuickLook
winget install -e --id=Bandisoft.Honeyview
winget install -e --id=IrfanSkiljan.IrfanView
winget install -e --id=XnSoft.XnView.Classic
winget install -e --id=nomacs.nomacs
winget install -e --id=DuongDieuPhap.ImageGlass
winget install -e --id=GIMP.GIMP
winget install -e --id=FastStone.Viewer


# https://docs.chocolatey.org/en-us/choco/setup/#install-using-winget
winget install --id chocolatey.chocolatey --source winget
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
