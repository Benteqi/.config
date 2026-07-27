#!/bin/bash

echo "Installing packages..."
packages=(
# Essentials
	"git"
	"less"
	"upower"
# Desktop environment
	"fastfetch"
	"nvim"
	"hyprland"
	"wofi"
	"waybar"
	"foot"
	"librewolf"
	"npm"

	"wikiman"
	"arch-wiki-docs"
	"ttf-jetbrains-mono-nerd"
# nvim language servers
	"vscode-css-languageserver"
	"vscode-html-languageserver"
	"vscode-json-languageserver"
	"lua-language-server"
	"csharp-language-server"
	"roslyn-ls"
)
for package in ${packages[@]}; do
	sudo pacman -S --noconfirm --needed  $package
done
