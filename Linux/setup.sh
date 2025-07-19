#!/bin/bash
echo "Installing packages..."
packages=("fastfetch" "nvim" "hyprland" "wofi" "waybar" "kitty" "wikiman" "arch-wiki-docs")
for package in ${packages[@]}; do
	sudo pacman -S --noconfirm  $package
done

echo "Enabling hyprland autostart..."
systemctl --user enable ~/config-git/Linux/hyprland.service

echo "Linking config files..."
for dir in $("dirname $0")/configs; do
	ln -s $("dirname $0")/$dir ~/.config/$dir
done

echo "Done"
