#!/bin/bash
bash_dir=$(dirname $(readlink -f "$BASH_SOURCE"))

echo "Linking config files..."
for dir in $bash_dir/configs/*/; do
	dir=${dir%*/}
	dir="${dir##*/}"
	ln -fvs $bash_dir/configs/$dir ~/.config/$dir 
done
ln -fs $bash_dir/bashrc ~/.bashrc
