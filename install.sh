#!/bin/bash

function install_pkg() {
  /usr/bin/paru -S "$@" --noconfirm --sudoloop
}

function install_flatpak() {
  /usr/bin/flatpak install "$@" --noninteractive
}

function install_vsc_ext() {
  /usr/bin/code --install-extension "$@"
}

# This script is used to install software for endeavourOS running on KDE.

# Update system
sudo pacman -Syu --noconfirm

# Remove yay and replace it with paru
sudo pacman -R yay --noconfirm
sudo pacman -S paru --noconfirm

# Change timeout to 0s
sudo sed -i 's/timeout 5/timeout 0/g' /efi/loader/loader.conf

# Docker
## Docker: Install
install_pkg docker docker-compose oxker
## Docker: Permissions
sudo groupadd docker
sudo usermod -aG docker $USER

# ZSH
## ZSH: P10K Font
install_pkg ttf-meslo-nerd-font-powerlevel10k
## ZSH: Antidote
install_pkg zsh-antidote
## ZSH: P10K
install_pkg zsh-theme-powerlevel10k-git
## ZSH: Install plugin dependencies
install_pkg pyenv pnpm bat eza go python-poetry thefuck wl-clipboard

# Misc
## Misc: Fix Realtek WiFi
## Misc: Flatpak auto update systemd timers
sudo cp -r etc /

## Misc: Add .config files
cp -r config/ $HOME/.config/

## Misc: Add .local files
cp -r local/ $HOME/.local/

# Flatpak
## Flatpak: install
install_pkg flatpak

## Flatpak: Enable auto updates
systemctl --user enable --now update-user-flatpaks.timer
sudo systemctl --system enable --now update-system-flatpaks.timer

## Flatpak: ProtonVPN
install_flatpak com.protonvpn.www
## Flatpak: qBittorrent
install_flatpak org.qbittorrent.qBittorrent
## Flatpak: Thunderbird
install_flatpak org.mozilla.Thunderbird
## Flatpak: Brave
install_flatpak com.brave.Browser
## Flatpak: Signal
install_flatpak org.signal.Signal
## Flatpak: Raspberry Pi Imager
install_flatpak org.raspberrypi.rpi-imager
## Flatpak: Galaxy Buds Manager
install_flatpak me.timschneeberger.GalaxyBudsClient

# Software
## Easyroam
install_pkg easyroam-desktop-bin
## Visual Studio Code
install_pkg visual-studio-code-bin
### Extensions for VSCode
install_vsc_ext GitHub.copilot
install_vsc_ext ms-python.python
install_vsc_ext ms-toolsai.jupyter
install_vsc_ext rust-lang.rust-analyzer
install_vsc_ext svelte.svelte-vscode
install_vsc_ext Gruntfuggly.todo-tree
install_vsc_ext mechatroner.rainbow-csv
install_vsc_ext GrapeCity.gc-excelviewer
install_vsc_ext tomoki1207.pdf
install_vsc_ext ms-vscode-remote.remote-containers
install_vsc_ext ms-azuretools.vscode-docker

## IntelliJ
install_pkg intellij-idea-ultimate-edition
## PyCharm
install_pkg pycharm-professional
## CLion
install_pkg clion
## PlatformIO
install_pkg platformio-core platformio-core-udev
## Ventoy
install_pkg ventoy-bin
## Rust
install_pkg rustup
/usr/bin/rustup default stable

# Neovim
## Neovim: Dependencies
install_pkg base-devel git make unzip gcc ripgrep tree-sitter tree-sitter-cli npm
/usr/bin/pnpm add -g typescript
## Neovim: Install
install_pkg neovim python-pynvim
## Neovim: Add config
ln -s config/nvim "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

# ZSH:
## ZSH: Add config files
cp zshrc $HOME/.zshrc
cp p10k.zsh $HOME/.p10k.zsh
cp zsh_plugins.txt $HOME/.zsh_plugins.txt

# Git
## Git: Add gitconfig
cp gitconfig $HOME/.gitconfig

## ZSH: Set default shell to ZSH
sudo chsh -s /usr/bin/zsh $USER
