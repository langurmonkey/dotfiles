#!/usr/bin/env bash

# dotfiles bootstrapper
#
# Installs zsh & git, then clones this repo to ~/.dotfiles. This script is
# intended to be run remotely, via curl:
#
# bash <(curl -s https://gitlab.com/langurmonkey/dotfiles/raw/master/bootstrap.sh)

export DOTFILES=~/.dotfiles
set -e

_msg() { printf "\r\033[2K\033[0;32m[ .. ] %s\033[0m\n" "$*"; }
_uncallable() { ! command -v "$1" >/dev/null; }

if _uncallable zsh || _uncallable git; then
    _msg "Installing git, zsh, vim and tmux"
    if [[ -f /etc/arch-release ]]; then
        sudo pacman --needed --noconfirm -S git zsh vim tmux
    elif [[ -f /etc/debian_version ]]; then
        sudo apt-get update && sudo apt-get install -y git zsh vim tmux
    fi
fi

if [[ ! -d ~/.dotfiles ]]; then
    _msg "Deploying dotfiles repository..."
    if [[ $USER == tsagrista ]]; then
        dfrepo=git@gitlab.com:jumpinglangur/dotfiles.git
    else
        dfrepo=https://gitlab.com/langurmonkey/dotfiles.git
    fi
    git clone --recursive "$dfrepo" "$DOTFILES"
fi

#
_msg
_msg "And done!"
_msg
_msg "Use $DOTFILES/deploy to install your dotfiles, I suggest you begin"
_msg "with 'base/arch' or 'base/ubuntu'."
