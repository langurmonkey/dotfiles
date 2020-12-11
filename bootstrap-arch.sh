#!/usr/bin/env bash

# Create XDG directories
sudo pacman --needed --noconfirm -S xdg-user-dirs
xdg-user-dirs-update

# Deploy environment
yay --noconfirm -S git zsh neovim ranger slock qutebrowser dmenu rofi rofi-calc rofi-pass keychain udiskie picom-ibhagwan-git playerctl pasystray blueman i3status feh the_silver_searcher entr mupdf mupdf-tools dunst fzf fd mpd ncmpcpp w3m libcaca sxiv nnn vlock numlockx xdotool yad termite tor lxappearance mpv udiskie xorg-xinput ncdu thunderbird adapta-gtk-theme arc-gtk-theme net-tools mpv xorg-xrdb neofetch rsync openvpn networkmanager-openvpn man xdo mons i3-gaps pa-applet-git cava advcp wmfocus polybar-git ly-git i3lock-fancy scrot xorg-xdpyinfo ytop bat xorg-xrandr arandr ncmpcpp pywal-git keychain gucharmap pulseaudio pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-alsa pavucontrol youtube-dl gst-plugins-{base,good,bad,ugly} gst-libav figlet thefuck

# Enable services
sudo systemctl enable tor.service

# Install starship
curl -fsSL https://starship.rs/install.sh | bash

# Link vim to nvim
[ ! -f /usr/bin/vim ] && sudo ln -s /usr/bin/nvim /usr/bin/vim
