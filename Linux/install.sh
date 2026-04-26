#!/bin/bash

echo "Installing packages..."
packages=(
	"fastfetch"
	"nvim"
	"hyprland"
	"wofi"
	"waybar"
	"foot"
	"wikiman"
	"arch-wiki-docs"
	"vscode-css-languageserver"
	"vscode-html-languageserver"
	"vscode-json-languageserver"
	"lua-language-server"
	"librewolf"
	"git"
	"less"
	"upower"
	"ttf-jetbrains-mono-nerd"
)
for package in ${packages[@]}; do
	sudo pacman -S --noconfirm --needed  $package
done
