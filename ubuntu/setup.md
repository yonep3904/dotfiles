# Ubuntu Setup

## 1. Basic setup

Install essential tools and configure the base environment.

- Terminal emulator: `Ghostty` 👻 (Fonts: `HackGen Nerd Font`)
- Shell: `zsh` (with `oh-my-zsh` and plugins)
- Package managers: `Flatpak`, `Cargo`, `uv`

### Update package lists

```sh
sudo apt update
sudo apt upgrade -y
```

### Install and Configure Git

```sh
sudo apt install git

git config --global user.name "<name>"
git config --global user.email "<email>"
```

### Install Additional Package Managers

```sh
# Flatpak
sudo apt install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

exit # Log out and log back in to apply Flatpak settings

# Rustup/Cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# uv
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### Install Terminal Emulator and Nerd Fonts

```sh
# Fonts (Nerd Font)
mkdir -p ~/.local/share/fonts

cd /tmp
curl -LO https://github.com/yuru7/HackGen/releases/latest/download/HackGen_NF_v2.10.0.zip
unzip HackGen_NF_v2.10.0.zip

mv HackGen_NF_v2.10.0/*.ttf ~/.local/share/fonts
fc-cache -fv

fc-list | grep HackGen # Verify installation

# Ghostty
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"

mkdir -p ~/.config/ghostty
ln -s [Path to this directory]/ ~/.config/ghostty/config.ghostty
```

### Install and Configure Shell

```sh
# zsh
sudo apt install zsh
chsh -s $(which zsh)

exit # Log out and log back in to apply zsh
echo $SHELL # Verify that the default shell is zsh

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Add the following lines to `~/.zshrc`:

```sh
# Set Powerlevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
```

## 2. Install packages

### Browsers

```sh
# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] \
  https://brave-browser-apt-release.s3.brave.com/ stable main" | \
  sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update
sudo apt install brave-browser
```

### Shell Utilities

| Utility | Description | Replacement |
| --- | --- | --- |
| zoxide | A smarter replacement for `cd` that learns frequently used directories. | `cd` |
| eza | A modern replacement for `ls` with more features and better performance. | `ls` |
| bat | A cat clone with syntax highlighting and Git integration. | `cat` |
| ripgrep | A line-oriented search tool that recursively searches the current directory for a regex pattern while respecting your gitignore rules. | `grep` |
| fd | A simple, fast and user-friendly alternative to `find`. | `find` |
| fzf | A general-purpose command-line fuzzy finder. | - |
| wl-clipboard | A command-line utility that provides an interface to the Wayland clipboard. | - |
| jq | A lightweight and flexible command-line JSON processor. | - |
| 7zip | A file archiver with a high compression ratio. | `zip`, `tar` |
| ffmpeg | A complete, cross-platform solution to record, convert and stream audio and video. | - |
| imagemagick | A software suite to create, edit, compose, or convert bitmap images. | - |
| poppler-utils | A collection of tools built on the Poppler PDF rendering library. | - |
| resvg | A fast and lightweight SVG rendering library and command-line tool. | - |
| yazi | A terminal-based file manager | - |

Yazi can be optionally extended with `zoxide` ~ `resvg` to enable additional features.

```sh
sudo apt install zoxide
sudo apt install eza
sudo apt install bat
sudo apt install ripgrep
sudo apt install fd-find
sudo apt install fzf
sudo apt install wl-clipboard # or `sudo apt install xclip` if using X11

sudo apt install jq
sudo apt install 7zip
sudo apt install ffmpeg
sudo apt install imagemagick
sudo apt install poppler-utils
cargo install --force resvg

cargo install --force yazi-build
```

Add the following lines to `~/.zshrc`:

```sh
# zoxide
eval "$(zoxide init zsh --cmd cd)"

# eza
alias ls='eza --icons --group-directories-first'
alias ll='eza -l --git --icons --group-directories-first'
alias l='eza -la --git --icons --group-directories-first'

# bat
alias bat='batcat'

# ripgrep
alias rg='rg --hidden --glob "!.git/*"'

# fd
alias fd='fdfind'

# fzf
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && \
  source /usr/share/doc/fzf/examples/key-bindings.zsh

[ -f /usr/share/doc/fzf/examples/completion.zsh ] && \
  source /usr/share/doc/fzf/examples/completion.zsh
```

### GUI Apps

```sh
# VSCode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | \
  sudo tee /etc/apt/sources.list.d/vscode.list

sudo apt update
sudo apt install code

# Wireshark
sudo apt update
sudo apt install wireshark

# GIMP, Inkscape, VLC
sudo apt update
sudo apt install gimp
sudo apt install inkscape
sudo apt install vlc

# Other apps (Flatpak)
flatpak install --system flathub com.spotify.Client
flatpak install --system flathub com.discordapp.Discord
flatpak install --system flathub com.slack.Slack
flatpak install --system flathub com.jgraph.drawio.desktop
```

### CUI Tools

```sh
# btop: Resource monitor
sudo apt install btop

# neofetch: System information tool
sudo apt install neofetch

# Optional (for fun)
sudo apt install cowsay
sudo apt install cmatrix

# nmap: Network scanning tool
sudo apt install nmap

# yt-dlp: YouTube video downloader
sudo apt install yt-dlp

# tailscale: VPN tool by Tailscale Inc.
curl -fsSL https://tailscale.com/install.sh | sh

# ngrok: Local tunnel tool
curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
  && echo "deb https://ngrok-agent.s3.amazonaws.com bookworm main" \
  | sudo tee /etc/apt/sources.list.d/ngrok.list \
  && sudo apt update \
  && sudo apt install ngrok

ngrok config add-authtoken "<YOUR_AUTHTOKEN>"
```

### Development Tools

```sh
# gh: GitHub CLI tool
sudo apt install gh

# git-filter-repo: Git history rewriting tool
sudo apt install git-filter-repo

# onefetch: Git information tool
cargo install onefetch

# tokei: Code statistics tool
cargo install tokei

# docker
sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc | cut -f1) # Remove old versions of Docker if they exist

sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update

sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl status docker # Verify that Docker is running
# If Docker is not running, start it manually:
# sudo systemctl start docker

sudo usermod -aG docker $USER
exit # Log out and log back in to apply Docker group changes
```

### Programming Languages and Runtimes

```sh
# C/C++
sudo apt install build-essential

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Go
sudo apt install golang
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc

# Python (uv)
curl -LsSf https://astral.sh/uv/install.sh | sh
echo '. "$HOME/.local/bin/env"' >> ~/.zshrc
uv tool install ipython
uv tool install ruff

# Node.js (nvm)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
source ~/.zshrc
nvm install --lts
nvm use --lts

npm install -g yarn
npm install -g pnpm

# Julia
curl -fsSL https://install.julialang.org | sh

# Typst
sudo snap install typst
cargo install typstyle

# LaTeX
sudo apt update
sudo apt install texlive-full
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

### Ghostty

Refer to [Ghostty configuration](../common/ghostty/ghostty-config.md)

Run [set-sl.sh](../common/ghostty/set-sl.sh) to set up the symbolic link for Ghostty configuration.

### VSCode(settings, extensions)

Refer to [VSCode configuration](../common/vscode/settings.json) for VSCode settings configuration.

Run [set-sl.sh](../common/vscode/set-sl.sh) to set up the symbolic link for VSCode settings.
