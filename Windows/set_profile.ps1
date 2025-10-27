# PowerShell 별칭 프로필 자동 복사
Copy-Item ".\profile.ps1" "$PROFILE" -Force

# CMD 별칭 스크립트 자동 복사
Copy-Item ".\cmd_aliases.bat" "$env:USERPROFILE\cmd_aliases.bat" -Force

# # PowerShell 프로필 세팅
# if (-not (Test-Path $PROFILE)) {
#     New-Item -ItemType File -Path $PROFILE -Force
# }
# Add-Content -Path $PROFILE -Value @'
# function ws { winget search @Args }
# function wi { winget install @Args }
# function wu { winget upgrade @Args }
# Set-Alias ll Get-ChildItem
# '@

# # CMD용 배치파일 설정
# $cmdAliasPath = "$env:USERPROFILE\cmd_aliases.bat"
# @"
# @echo off
# doskey ws=winget search $*
# doskey wi=winget install $*
# doskey wu=winget upgrade $*
# doskey ll=dir /a
# "@ | Out-File -Encoding ascii -FilePath $cmdAliasPath -Force
