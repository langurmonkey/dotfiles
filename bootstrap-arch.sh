#!/usr/bin/env bash

# Create XDG directories
sudo pacman --needed --noconfirm -S xdg-user-dirs
xdg-user-dirs-update

# Deploy environment
sudo pacman --needed --noconfirm -S git zsh neovim ranger slock qutebrowser dmenu keychain udiskie compton playerctl rxvt-unicode pasystray blueman i3status feh the_silver_searcher entr mupdf mupdf-tools dunst fzf fd mpd ncmpcpp w3m libcaca sxiv
yay --noconfirm -S mons i3-gaps pa-applet-git terminus-font-ttf cava polybar ttf-font-awesome-4 python-pywal

# wal
ln -s $(which wal) ~/.local/bin/wal
