#!/usr/bin/env bash

# Deploys the environment in arch and derivatives
sudo pacman --needed --noconfirm -S git zsh vim tmux ranger slock qutebrowser dmenu keychain udiskie compton playerctl rxvt-unicode pasystray blueman i3status feh
sudo yay --noconfirm -S mons i3-gaps pa-applet-git terminus-font-ttf
