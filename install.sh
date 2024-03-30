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
sudo pacman -Syu just zip --noconfirm

## Build & Install themes
cd "$(dirname $0)/sddm/catppuccin"
sudo just install

## Change theme to mocha
sudo cp "$(dirname $0)/sddm/sddm.conf" /etc/sddm.conf
echo "\n\n\n\n\n"

# Install Cursors
yay -S catppuccin-cursors-mocha --noconfirm

# Hyprland



# Waybar



# Rofi

# etc
