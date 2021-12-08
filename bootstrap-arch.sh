#!/usr/bin/env bash

# Create XDG directories
sudo pacman --needed --noconfirm -S xdg-user-dirs
xdg-user-dirs-update

# Deploy environment
paru --noconfirm -S git zsh neovim code-minimap ranger slock qutebrowser python-adblock dmenu rofi rofi-calc rofi-pass rofi-power-menu keychain udiskie picom-ibhagwan-git playerctl pasystray blueman feh ripgrep entr mupdf mupdf-tools dunst fzf fd mpd mpdris2 mpc ncmpcpp w3m libcaca sxiv nnn lf vlock numlockx xdotool yad kitty tor lxappearance udiskie xorg-xinput ncdu thunderbird adapta-gtk-theme arc-gtk-theme net-tools mpv mpv-mpris xorg-xrdb neofetch rsync openvpn networkmanager-openvpn man xdo mons i3-gaps pa-applet-git cli-visualizer advcp wmfocus ly i3lock-fancy scrot xorg-xdpyinfo btop bat xorg-xrandr arandr pywal keychain gucharmap pipewire pipewire-pulse pipewire-alsa pavucontrol pulsemixer pamixer youtube-dl gst-plugins-{base,good,bad,ugly} gst-libav figlet thefuck exa tokei procs zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search i3blocks i3blocks-contrib kbdd sysstat xorg-xbacklight brightnessctl hsetroot cowsay lolcat fortune-mod rpg-cli

# Enable services
# sudo systemctl enable tor.service

# Install starship
curl -fsSL https://starship.rs/install.sh | bash

# Link vim to nvim
[ ! -f /usr/bin/vim ] && sudo ln -s /usr/bin/nvim /usr/bin/vim
