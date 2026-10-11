#!/bin/bash
bash_dir=$(dirname $(readlink -f "$BASH_SOURCE"))

source $bash_dir/install.sh

source $bash_dir/links.sh

echo "Enabling hyprland autostart..."
systemctl --user enable $bash_dir/hyprland.service

echo "Done!"
