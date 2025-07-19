#!/bin/bash
echo "Installing packages..."
packages=("fastfetch" "nvim" "hyprland" "wofi" "waybar" "kitty" "wikiman" "arch-wiki-docs")
for package in ${packages[@]}; do
	sudo pacman -S --noconfirm  $package
done

echo "Enabling hyprland autostart..."
systemctl --user enable ~/config-git/Linux/hyprland.service

echo "Linking config files..."
for dir in ./configs; do
	ln -s ./configs/$dir ~/.config/$dir
done

echo "Done"
