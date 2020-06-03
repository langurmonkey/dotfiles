#!/usr/bin/env bash

# Create XDG directories
sudo pacman --needed --noconfirm -S xdg-user-dirs
xdg-user-dirs-update

# Deploy environment
sudo pacman --needed --noconfirm -S git zsh neovim ranger slock qutebrowser dmenu keychain udiskie compton playerctl pasystray blueman i3status feh the_silver_searcher entr mupdf mupdf-tools dunst fzf fd mpd ncmpcpp w3m libcaca sxiv nnn vlock python-pywal numlockx ttf-nerd-fonts-symbols xdotool yad termite tor terminus-font-ttf lxappearance mpv udiskie xorg-xinput ncdu thunderbird adapta-gtk-theme arc-gtk-theme
yay --noconfirm -S mons i3-gaps pa-applet-git terminus-font-ttf cava polybar-git ttf-font-awesome-4 advcp wmfocus fzf polybar-git ly-git

# Enable services
sudo systemctl enable tor.service

# Link vim to nvim
[ ! -f /usr/bin/vim ] && sudo ln -s /usr/bin/nvim /usr/bin/vim
