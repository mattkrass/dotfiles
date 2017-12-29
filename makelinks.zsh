#!/usr/bin/env zsh

function backupTargetAndLink() {
    echo "Installing $2"
    if [[ ( -f $1 || -d $1 ) ]]; then
        mv $1 $1.bak
    fi
    ln -s $2 $1
}

# get the base directory so the symlinks are full paths
BASEDIR="$( cd "$( dirname "$0" )" && pwd )"

# bash config files
backupTargetAndLink $HOME/.bashrc $BASEDIR/bashrc

# emacs config files
backupTargetAndLink $HOME/.emacs $BASEDIR/emacs

# tmux config files
backupTargetAndLink $HOME/.tmux.conf $BASEDIR/tmux.conf
backupTargetAndLink $HOME/.launch_tmux.sh $BASEDIR/launch_tmux.sh

# vim config files
backupTargetAndLink $HOME/.vimrc $BASEDIR/vimrc

# Xdefaults file
backupTargetAndLink $HOME/.Xdefaults $BASEDIR/Xdefaults

# Xresources file
backupTargetAndLink $HOME/.Xresources $BASEDIR/Xresources

# zsh config files
backupTargetAndLink $HOME/.zshrc $BASEDIR/zshrc
backupTargetAndLink $HOME/.zshenv $BASEDIR/zshenv

echo "Done!"
