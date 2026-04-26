#!/bin/bash
bash_dir=$(dirname $(readlink -f "$BASH_SOURCE"))

$bash_dir/install.sh

echo "Enabling hyprland autostart..."
systemctl --user enable $bash_dir/hyprland.service

$bash_dir/links.sh

echo "Done!"
