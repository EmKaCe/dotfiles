#!/bin/bash

# Packages
echo "Installing packages via yay"
/bin/bash "$(dirname $0)/yay.sh"
echo "\n\n\n\n\n"

# Flatpak
echo "Installing Flatpaks"
/bin/bash "$(dirname $0)/flatpak.sh"
echo "\n\n\n\n\n"

# SDDM
echo "Installing SDDM Theme"

## Install dependencies
sudo pacman -Syu sddm just zip --noconfirm

## Build & Install themes
cd "$(dirname $0)/sddm/catppuccin"
sudo just install

## Change theme to mocha
sudo cp "$(dirname $0)/sddm/sddm.conf" /etc/sddm.conf
echo "\n\n\n\n\n"

# Hyprland
echo "Installing Hyprland and dependencies"
yay -S hyprcursor-git hypridle-git hyprlock-git hyprpaper-git xdg-desktop-portal-hyprland-git hyprland-git grimblast-git cliphist wl-clipboard rofi-lbonn-wayland-git dunst polkit-kde-agent qt5-wayland qt6-wayland --no-confirm


# Install cursor



# Waybar



# Rofi

# etc
