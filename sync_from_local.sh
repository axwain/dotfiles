#!/bin/bash

HOME_CONFIG=$HOME/.config
REPO_CONFIG=./.config

rsync -a $HOME/.zshrc ./
rsync -a $HOME_CONFIG/alacritty $REPO_CONFIG
rsync -a $HOME_CONFIG/i3 $REPO_CONFIG
rsync -a $HOME_CONFIG/nvim $REPO_CONFIG
rsync -a $HOME_CONFIG/polybar $REPO_CONFIG
rsync -a $HOME_CONFIG/rofi $REPO_CONFIG
rsync -a $HOME_CONFIG/picom.conf $REPO_CONFIG

