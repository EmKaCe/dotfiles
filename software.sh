#!/bin/bash

packages=(
  "7-zip-full"
  "arduino-ide-bin"
  "bat"
  "bat-extras"
  "btop"
  "chromium"
  "clang"
  "clinfo"
  "clion"
  "clion-cmake"
  "clion-gdb"
  "clion-lldb"
  "cmake"
  "diff-so-fancy"
  "diffutils"
  "doxygen"
  "duf"
  "easyroam-desktop-bin"
  "etcher-bin"
  "eza"
  "fd"
  "findutils"
  "firefox"
  "firefox-developer-edition"
  "firewalld"
  "flatpak"
  "fzf"
  "gc"
  "gcc"
  "gcc-libs"
  "ghostscript"
  "go"
  "goland"
  "hplip"
  "imhex-bin"
  "insomnium-bin"
  "jetbrains-fleet"
  "jq"
  "json-c"
  "json-glib"
  "jsoncpp"
  "just"
  "kitty"
  "kitty-shell-integration"
  "kitty-terminfo"
  "lazygit"
  "mockoon-bin"
  "neofetch"
  "neovim"
  "obsidian"
  "okular"
  "openssl"
  "openvpn"
  "p11-kit"
  "platformio-core"
  "platformio-core-udev"
  "pnpm"
  "pnpm-shell-completion"
  "powertop"
  "powertop-auto-tune"
  "protonvpn"
  "protonvpn-cli"
  "protonvpn-gui"
  "pv"
  "pyenv"
  "pyenv-virtualenv"
  "python"
  "python-pip"
  "python-pynvim"
  "rclone"
  "ruby"
  "rust"
  "rustrover"
  "sddm"
  "speedtest-go"
  "superproductivity-bin"
  "thefuck"
  "tldr++"
  "tk"
  "tre-command"
  "tree-sitter"
  "tree-sitter-cli"
  "ttf-bitstream-vera"
  "ttf-dejavu"
  "ttf-hack"
  "ttf-jetbrains-mono"
  "ttf-jetbrains-mono-nerd"
  "ttf-liberation"
  "ttf-meslo-nerd-font-powerlevel10k"
  "ttf-opensans"
  "undollar"
  "unibilium"
  "universal-android-debloater-opengl-bin"
  "unrar"
  "unzip"
  "ventoy"
  "vesktop-bin"
  "visual-studio-code-bin"
  "vlc"
  "wireshark-cli"
  "wireshark-qt"
  "xz"
  "yay"
  "yetris"
  "yq"
  "zsh"
  "zsh-theme-powerlevel10k-git"
)

yay -S ${packages[@]} --sudoloop
