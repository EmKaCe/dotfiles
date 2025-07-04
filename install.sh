#!/bin/bash

HERE=$(dirname $(realpath "$0"))

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

# Rust (dependency for some packages)
install_pkg rustup
/usr/bin/rustup default stable

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
install_pkg pyenv pyenv-virtualenv tk pnpm bat bat-extras eza go python-poetry thefuck wl-clipboard poetry deno
## ksshaskpass
install_pkg ksshaskpass
## Pacseek
install_pkg pacseek

# Misc
## Misc: Add ZSH files
ln -s "$HERE/p10k.zsh" "$HOME/.p10k.zsh"
ln -s "$HERE/zshrc" "$HOME/.zshrc"
ln -s "$HERE/zsh_plugins.txt" "$HOME/.zsh_plugins.txt"

## Misc: Add Vencord update script
sudo mkdir -p /opt/scripts
sudo ln -s "$HERE/opt/scripts/update_vencord.sh" "/opt/script/update_vencord.sh"
sudo chown $USER:$USER /opt/scripts/update_vencord.sh
sudo chmod 4755 /opt/script/update_vencord.sh

## Misc: Enable Bluetooth
sudo systemctl enable --now bluetooth.service

## Misc: Fix Realtek WiFi
## Misc: Flatpak auto update systemd timers
## Misc: Add Vencord update hook
sudo cp -r "$HERE/etc" /

## Misc: Add .config files
for file in $HERE/config/*; do
  ln -s "$file" "$HOME/.config/$(basename $file)";
done

## Misc: Add .local/share/ files
for file in $HERE/local/share/*; do
  ln -s "$file" "$HOME/.local/share/$(basename $file)";
done

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
install_vsc_ext myriad-dreamin.tinymist
install_vsc_ext njpwerner.autodocstring

## IntelliJ
install_pkg intellij-idea-ultimate-edition intellij-idea-ultimate-edition-jre
## PyCharm
install_pkg pycharm-professional
## CLion
install_pkg clion
## PlatformIO
install_pkg platformio-core platformio-core-udev
## Ventoy
install_pkg ventoy-bin
## Discord
install_pkg discord

# Neovim
## Neovim: Dependencies
install_pkg base-devel git make unzip gcc ripgrep tree-sitter tree-sitter-cli npm
/usr/bin/pnpm add -g typescript
## Neovim: Install
install_pkg neovim python-pynvim
## Neovim: Add config
ln -s "$HERE/nvim" "$HOME/.config/nvim"

# Git
## Git: Add gitconfig
ln -s "$HERE/gitconfig" "$HOME/.gitconfig"

## ZSH: Set default shell to ZSH
sudo chsh -s /usr/bin/zsh $USER
