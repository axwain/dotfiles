#!/bin/bash

HOME_CONFIG=$HOME/.config
REPO_CONFIG=./.config

echo "Syncing .zshrc"
rsync -a $HOME/.zshrc ./

echo "Syncing alacritty"
rsync -a $HOME_CONFIG/alacritty $REPO_CONFIG

echo "Syncing i3"
rsync -a $HOME_CONFIG/i3 $REPO_CONFIG

echo "Syncing nvim"
rsync -a $HOME_CONFIG/nvim $REPO_CONFIG

echo "Syncing polybar"
rsync -a $HOME_CONFIG/polybar $REPO_CONFIG

echo "Syncing rofi"
rsync -a $HOME_CONFIG/rofi $REPO_CONFIG

echo "Syncing picom"
rsync -a $HOME_CONFIG/picom.conf $REPO_CONFIG

echo "All operations complete"

