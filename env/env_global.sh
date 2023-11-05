#!/bin/bash
#
# USEFUL FUNCTIONS
#

# source files, if they exist
function do-source {
    if [ -f $1 ]; then
        #echo "Sourcing $1"
        source $1 2>/dev/null
    fi
}

# does the command exist?
function cmd-exists {
   type "$1" &> /dev/null;
}


# Add GPD
export GPD_TTY=$(tty)

#
# ENVIRONMENT VARIABLES
#

# XDG defaults
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# GPG Key
export GPGKEY=448C2B189756743013D5F7C22FD2A59C1D734C1F

# My variables
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi
export PAGER="less"
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#export MANPAGER="nvim -c 'set ft=man' -"
export MANPAGER=$PAGER
export PROGRAMS=$HOME/Programs
export GAMES=$PROGRAMS/Games
export DOTFILES=$HOME/.dotfiles
export DOT=$DOTFILES
export PROJ=$HOME/Projects
export GIT=$PROJ
export PROJECTS=$PROJ
export TA=$PROJ/time-analysis/src
export TAR=$PROJ/time-analysis-res/results
export GS=$PROJ/gaiasky
export GSC=$PROJ/gaiasky-catgen
export GSD=$PROJ/gaiasky-docs
export RTS=$PROJ/rts-engine-private
export WEB=$PROJ/website-source
export PHD=$PROJ/phd_thesis

# JVM
export JAVA_HOME=/usr/lib/jvm/default
export JDK_HOME=/usr/lib/jvm/default-runtime

# Programs
export TOPCAT=$PROGRAMS/Topcat

# Path
export PATH=$PATH:$HOME/.local/bin:$HOME/.dotfiles/bin:$HOME/.cargo/bin:.

# Android SDK
export ANDROID_SDK_ROOT=/opt/android-sdk

# NNN config
do-source "$DOTFILES"/nnn/conf.sh

# LF config
export OPENER="run-mailcap"
do-source "$DOTFILES"/lf/lf_icons.sh
do-source "$DOTFILES/lf/lfcd.sh"

# Less
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Other utils
export RANGER_RELOAD_RC=FALSE
export TERMINAL=kitty
export BROWSER=qutebrowser
GPG_TTY=$(tty)
export GPG_TTY

# npm is commented out, it takes a loooong time!
# if cmd-exists npm; then
#     export NODE_PATH=$NODE_PATH:$(npm root --location=global)
# fi

# QT
export QT_QPA_PLATFORMTHEME=qt5ct

# Calibre
export CALIBRE_USE_DARK_PALETTE=1

#
# ALIASES
# 
do-source $DOTFILES/env/aliases.sh

#
# FUNCTIONS
# 
do-source $DOTFILES/env/functions.sh

#
# ZSH-specific shit
#
if [ ! -z "$ZSH_VERSION" ]; then
    do-source $DOTFILES/zsh/env_zsh.sh
fi

#
# ENVIRONMENT INIT
#
[ -f ~/.cache/wal/sequences ] &&  (cat ~/.cache/wal/sequences &)
[ -f ~/.cache/wal/colors-tty.sh ] && source ~/.cache/wal/colors-tty.sh

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="~/.gnupg/S.gpg-agent.ssh"
fi

# Uncomment to unlock ssh key by default (asks for password)
if command -v keychain &> /dev/null
then
    eval $(keychain --quiet --eval $HOME/.ssh/id_rsa $HOME/.ssh/id_ed25519)
fi
