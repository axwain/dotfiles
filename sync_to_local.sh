#!/bin/bash

SCRIPT_ROOT=$(dirname "$0")
CONFIG_DIR=$SCRIPT_ROOT/.config

echo "Copying from $SCRIPT_ROOT"

echo "Copying .zshrc"
rsync -a $SCRIPT_ROOT/.zshrc $HOME/

echo "Copying config"
rsync -a $CONFIG_DIR $HOME/

echo "Finished copying dotfiles"

