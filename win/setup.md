# Windows Setup

## 1. Basic setup

Install essential tools and configure the base environment.

- Terminal emulator: `Windows Terminal`  (Fonts: `HackGen Nerd Font`)
- Shell: `PowerShell v7+` (with `starship`)
- Package managers: `Winget`, `Scoop`

### Install and Configure Git

```powershell
winget install -e --id Git.Git

git config --global user.name "<name>"
git config --global user.email "<email>"
```

### Install Additional Package Manager

```powershell
# Install Scoop
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

# Add Scoop buckets
scoop bucket add versions
scoop bucket add extras
scoop bucket add java
```

### Install Nerd Fonts

```powershell
# Fonts (Nerd Font)
New-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\Fonts" -ItemType Directory -ErrorAction Ignore
curl -LO https://github.com/yuru7/HackGen/releases/latest/download/HackGen_NF_v2.10.0.zip

unzip HackGen_NF_v2.10.0.zip
Move-Item -Path "HackGen_NF_v2.10.0\*.ttf" -Destination "$env:LOCALAPPDATA\Microsoft\Windows\Fonts"
```

### Install and Configure Shell

```powershell
# PowerShell (v7+)
winget install -e --id Microsoft.PowerShell

# PowerShell Modules
Install-Module -Name Terminal-Icons -Scope CurrentUser -Force
Install-Module -Name posh-git -Scope CurrentUser -Force

# Starship
scoop install main/starship

# CUI Editor
scoop install vim
scoop install neovim

# PowerShell Profile
New-Item -Path $PROFILE -Type File -Force
```

Add the following lines to `$PROFILE`:

```powershell
# Initialize PowerShell Modules
Import-Module Terminal-Icons
Import-Module posh-git

# Initialize Starship (must be last)
Invoke-Expression (&starship init powershell)
```

## 2. Install packages

### Shell Utilities

```powershell
scoop install zoxide
scoop install fzf
```

Add the following lines to `$PROFILE`:


```powershell
# zoxide
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})
```

### GUI Apps

```powershell
# Browsers
winget install -e --id Google.Chrome
winget install -e --id Brave.Brave
winget install -e --id Mozilla.Firefox

# Utilities
winget install -e --id Microsoft.PowerToys --source winget
winget install -e --id voidtools.Everything
winget install -e --id Docker.DockerDesktop
winget install -e --id WiresharkFoundation.Wireshark

# Development tools
winget install -e --id Microsoft.VisualStudioCode

# Media
winget install -e --id VideoLAN.VLC
winget install -e --id Audacity.Audacity
winget install -e --id GIMP.GIMP
winget install -e --id Inkscape.Inkscape
winget install -e --id JGraph.Draw

# Communication and Entertainment
winget install -e --id Spotify.Spotify
winget install -e --id Zoom.Zoom
winget install -e --id Discord.Discord

```

### CUI Tools

```powershell
# btop: Resource monitor

TODO

# ???fetch: System information tool
scoop install neofetch
scoop install fastfetch

# nmap: Network scanning tool
scoop install nmap

# yt-dlp: YouTube video downloader
scoop install yt-dlp

# tailscale: VPN tool by Tailscale Inc.
winget install -e --id tailscale.tailscale

# ngrok: Local tunnel tool
scoop install ngrok

# ffmpeg: A complete, cross-platform solution to record, convert and stream audio and video.
scoop install ffmpeg
```

### Development Tools

```powershell
# gh: GitHub CLI tool
scoop install main/gh

# git-filter-repo: Git history rewriting tool
scoop install git-filter-repo

# onefetch: Git information tool
scoop install extras/onefetch

# tokei: Code statistics tool
scoop install main/tokei
```

### Languages and Runtimes

```powershell
# C/C++
scoop install gcc

# Rust
scoop install rustup

# Go
scoop install go

# Python
scoop install python314

# Node.js (nvm)
scoop install nvm
nvm install --lts
nvm use --lts

# Julia
scoop install julia

# Typst
scoop install main/typst
scoop install main/typstyle

# LaTeX
# Download from official installer
```

### AI Tools

```sh
npm install -g codex

npm install -g gemini-cli
```

## 3. Configure dotfiles

### Git/GitHub

Refer to [github-ssh-configuration.md](../common/git/github-ssh-configuration.md) to set up SSH configuration for GitHub.

Run [set-sl.sh](../common/git/set-sl.sh) to set up the symbolic link for git configuration.

### neovim

Refer to [neovim-setup.md](../common/nvim/neovim-setup.md)

Run [set-sl.sh](../common/nvim/set-sl.sh) to set up the symbolic link for neovim configuration after installing dependencies.

### PowerShell Profile

Refer to [profile.ps1](profile.ps1) for PowerShell profile configuration.

### VSCode(settings, extensions)

Refer to [VSCode configuration](../common/vscode/settings.json) for VSCode settings configuration.

Run [set-sl.sh](../common/vscode/set-sl.sh) to set up the symbolic link for VSCode settings.

## 4. Set up WSL

```powershell
wsl --install -d ubuntu
```

Refer to [ubuntu/setup.md](../ubuntu/setup.md) for the setup of WSL Ubuntu distribution.
