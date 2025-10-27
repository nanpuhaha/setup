@echo off
REM ---------------------------------------
REM Custom CMD Aliases
REM        Jangwon Seo  2025-10-27
REM ---------------------------------------

REM 디렉터리 관련
doskey ls=dir /b $*
doskey ll=dir /a $*
doskey la=dir /a /o:n $*
doskey ..=cd ..
doskey ...=cd ..\..
doskey ....=cd ..\..\..

REM 파일 조작
doskey rm=del /q $*
doskey mv=move $*
doskey cp=copy $*
doskey mkdir=mkdir $*
doskey rmdir=rmdir /s /q $*

REM 텍스트 처리
doskey cat=type $*
doskey grep=findstr /i $*
doskey head=more $*
doskey tail=more +10 $*

REM 시스템 명령
doskey clear=cls
doskey pwd=cd
doskey which=where $*
doskey whoami=echo %USERNAME%
doskey open=explorer $*
doskey touch=type nul >$*
doskey ps=tasklist
doskey kill=taskkill /im $1 /f

REM Winget shortcuts
doskey wgs=winget search $*
doskey wgi=winget install $*
doskey wgu=winget upgrade $*
