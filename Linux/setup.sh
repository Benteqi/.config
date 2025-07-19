#!/bin/bash
echo "Installing packages..."
<<<<<<< Updated upstream
packages=("fastfetch" "nvim" "hyprland" "wofi" "waybar")
for package in $packages; do
	pacman -S $package
=======
packages = ("fastfetch" "nvim" "hyprland" "wofi" "waybar" "kitty" "wikiman" "arch-wiki-docs")
for package in ${packages[@]}; do
	sudo pacman -S --noconfirm  $package
>>>>>>> Stashed changes
done

echo "Enabling hyprland autostart..."
systemctl --user enable ~/config-git/Linux/hyprland.service

echo "Linking config files..."
for dir in ~/config-git/Linux/configs/*/; do
	ln -s ~/config-git/Linux/configs/$dir ~/.config/$dir
done

echo "Done"
