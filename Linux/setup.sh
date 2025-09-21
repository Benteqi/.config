#!/bin/bash
bash_dir=$(dirname $(readlink -f "$BASH_SOURCE"))

echo "Installing packages..."
packages=("fastfetch" "nvim" "hyprland" "wofi" "waybar" "kitty" "wikiman" "arch-wiki-docs" "vscode-langservers-extracted" "qutebrowser" "git" "less")
for package in ${packages[@]}; do
	sudo pacman -S --noconfirm  $package
done

echo "Enabling hyprland autostart..."
systemctl --user enable ~/config-git/Linux/hyprland.service

echo "Linking config files..."
for dir in $bash_dir/configs/*/; do
	dir=${dir%*/}
	dir="${dir##*/}"
	ln -fs $bash_dir/configs/$dir ~/.config/$dir
done

echo "Done"
