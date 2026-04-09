# macOS Setup

Development environment setup for macOS.

## Setup Instructions

Main entrypoint:

```bash
./setup.sh
```

### Interactive Mode
- tty 환경에서 `./setup.sh` 실행 시 카테고리 선택 TUI가 열립니다.
- 키 조작:
  - `↑/↓`: 이동
  - `space`: 토글
  - `enter`: 제출
  - `a`: 전체 토글
  - `q`: 종료

### Silent / Non-interactive Mode

```bash
./setup.sh --silent
```

Default profile is `standard`.

### Useful Options

```bash
./setup.sh --list-categories
./setup.sh --profile minimal --silent
./setup.sh --categories cli,browsers --dry-run
```

## Single Source of Truth

- `manifests/categories.tsv`
- `manifests/categories/*.Brewfile`
- `manifests/profiles/{minimal,standard,full}.txt`

`brew_packages.sh` is a compatibility wrapper and delegates to `setup.sh`.

## Legacy Data Preservation

Previous large package/app lists are preserved in:

- `legacy/Brewfile.legacy`
- `legacy/Brewfile2.legacy`
- `legacy/apps_list.legacy.txt`
- `legacy/brew_packages.legacy.sh`
- `legacy/setup.legacy.sh`

## Other Scripts

- `zsh.sh`: Install Oh My Zsh
- `theos.sh`: Install Theos
- `espanso-packages.sh`: Install Espanso packages

### References

- [Setting up Mac for development — notes from a Windows user](https://medium.com/@borekb/setting-up-mac-for-development-notes-from-a-windows-user-d4028535dc49)
- [Ask GN: 매일 사용하는 추천 macOS앱을 알려주세요](https://news.hada.io/topic?id=15295)
- [Ask HN: What macOS apps/programs do you use daily and recommend?](https://news.ycombinator.com/item?id=40627395)
- [sourabhbajaj/mac-setup](https://sourabhbajaj.com/mac-setup/)
- [nicolashery/mac-dev-setup](https://github.com/nicolashery/mac-dev-setup)
- [CodingGarden/mac-setup](https://github.com/CodingGarden/mac-setup)
- [bkuhlmann/mac_os-config](https://github.com/bkuhlmann/mac_os-config)
- [donnemartin/dev-setup](https://github.com/donnemartin/dev-setup)
- [bkuhlmann/mac_os](https://github.com/bkuhlmann/mac_os)
- [wilsonmar/mac-setup](https://github.com/wilsonmar/mac-setup)

## Without Brew

- [Choosy](https://choosy.app): Open links in the right browser
- [Disk-O](https://www.widgetworx.com/apps/disko.html): Menu bar disk free space
- [Manila](https://github.com/neilsardesai/Manila): Finder extension for folder colors
- [FancyFolders](https://github.com/kfreitag1/FancyFolders): Custom folder icons
- [Icons](https://github.com/SAP/macOS-icon-generator): Customized app icons
- [github-folder-icon-macOS](https://github.com/othyn/github-folder-icon-macOS)
- [fileicon](https://github.com/mklement0/fileicon)
- [folderart](https://github.com/christianvmm/folderart)
- [iconsur](https://github.com/rikumi/iconsur)
- [chromafolder](https://github.com/berkaayildiz/chromafolder)
