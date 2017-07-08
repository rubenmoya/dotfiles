#!/usr/bin/env zsh
echo "Configuring Sublime Text 3"
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -s ~/.dotfiles/sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
