#!/bin/bash
echo "Installing packages..."
packages=("fastfetch" "nvim" "hyprland" "wofi" "waybar")
for package in $packages; do
	pacman -S $package
done
echo "Enabling hyprland autostart..."
systemctl --user enable ~/config-git/Linux/hyprland.service
echo "Linking config files..."
for dir in ~/config-git/Linux/configs/*/; do
	ln -s ~/config-git/Linux/configs/$dir ~/.config/$dir
done
echo "Done"
