# ========================================#
# PowerShell Custom Aliases and Functions
#          Jangwon Seo  2025-10-27
# ========================================#

function cd {
    param (
        [string]$path
    )
    Set-Location $path
    Get-ChildItem
}

Set-Alias ls Get-ChildItem
Set-Alias ll Get-ChildItem
Set-Alias la "Get-ChildItem -Force"
Set-Alias cls Clear-Host
Set-Alias cat Get-Content
Set-Alias rm Remove-Item
Set-Alias mv Move-Item
Set-Alias cp Copy-Item
Set-Alias ni New-Item
Set-Alias md mkdir
Set-Alias rd Remove-Item
Set-Alias pwd Get-Location
Set-Alias echo Write-Output

# 기본 ls 계열 (컬러, 테이블뷰)
function ls  { Get-ChildItem @Args | Format-Table -AutoSize }
function ll  { Get-ChildItem -Force -File | Format-Table -AutoSize }
function la  { Get-ChildItem -Force | Format-Table -AutoSize }

# cd 단축
function ..  { Set-Location .. }
function ... { Set-Location ../.. }
function ....{ Set-Location ../../.. }

# cat, grep, find, less 등 텍스트 관련
Set-Alias cat Get-Content
Set-Alias grep Select-String
function less { Get-Content @Args | Out-Host }

# rm, mv, cp 등 파일 조작
Set-Alias rm Remove-Item
Set-Alias mv Move-Item
Set-Alias cp Copy-Item
Set-Alias mkdir New-Item
Set-Alias rmdir Remove-Item

# which 명령 대체
function which {
    param([string]$name)
    Get-Command $name | Select-Object -ExpandProperty Source
}

# clear, cls 통합
Set-Alias clear Clear-Host

# touch 명령 구현
function touch {
    param([string]$file)
    if (Test-Path $file) {
        (Get-Item $file).LastWriteTime = Get-Date
    } else {
        New-Item -ItemType File -Path $file | Out-Null
    }
}

# open (mac의 open / linux의 xdg-open)
function open {
    param([string]$path = ".")
    Start-Process $path
}

# bash style alias
Set-Alias pwd Get-Location
Set-Alias whoami $env:UserName
Set-Alias ps Get-Process
Set-Alias kill Stop-Process

# Winget shortcuts
function wgs { winget search @Args }
function wgi { winget install @Args }
function wgu { winget upgrade @Args }
