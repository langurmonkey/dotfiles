#!/usr/bin/env bash

# Create XDG directories
sudo pacman --needed --noconfirm -S xdg-user-dirs
xdg-user-dirs-update

# Deploy environment
paru --noconfirm -S git zsh neovim code-minimap ranger slock qutebrowser python-adblock dmenu rofi rofi-calc rofi-pass rofi-power-menu keychain udiskie picom-ibhagwan-git playerctl pasystray blueman i3status feh ripgrep entr mupdf mupdf-tools dunst fzf fd mpd mpdris2 mpc ncmpcpp w3m libcaca sxiv nnn lf vlock numlockx xdotool yad kitty tor lxappearance udiskie xorg-xinput ncdu thunderbird adapta-gtk-theme arc-gtk-theme net-tools mpv mpv-mpris xorg-xrdb neofetch rsync openvpn networkmanager-openvpn man xdo mons i3-gaps pa-applet-git cli-visualizer advcp wmfocus polybar-git ly i3lock-fancy scrot xorg-xdpyinfo ytop bat xorg-xrandr arandr pywal keychain gucharmap pulseaudio pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-alsa pavucontrol youtube-dl gst-plugins-{base,good,bad,ugly} gst-libav figlet thefuck exa tokei procs pulsemixer zsh-syntax-highlighting zsh-autosuggestions i3blocks i3blocks-contrib

# Enable services
sudo systemctl enable tor.service

# Install starship
curl -fsSL https://starship.rs/install.sh | bash

# Link vim to nvim
[ ! -f /usr/bin/vim ] && sudo ln -s /usr/bin/nvim /usr/bin/vim
