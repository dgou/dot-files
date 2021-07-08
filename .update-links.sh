#!/bin/bash
############################
# .add-links.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

dir=~/.dotfiles

echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

for file in *; do
    if [ ! -e ~/."$file" ] ; then
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    fi
done
