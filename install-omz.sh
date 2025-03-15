#!/usr/bin/env bash

# make sure we're in the dotfile directory and that $HOME is our parent
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [[ $PWD != $SCRIPTPATH ]]; then
    echo "Please only run this from the dotfile repo directly!"
    exit 1
fi

if [[ $(cd ..; pwd -P) != $HOME ]]; then
    echo "To work correctly, the dotfile repo needs to be at the root of \$HOME"
    exit 2
fi

# curl and stow must be available for this to work
if ! command -v curl >/dev/null; then
    echo "To work correctly, the curl utility must be available."
    exit 3
fi

if ! command -v stow >/dev/null; then
    echo "To work correctly, the stow utility must be available."
    exit 4
fi

# install oh my zsh if it's missing
if [[ $ZSH == *".oh-my-zsh"* ]]; then
    echo "OMZ already installed!"
else
    echo "Executing OMZ installer."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# use stow to deploy configurations
stow zsh

