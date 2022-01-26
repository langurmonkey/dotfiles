#!/usr/bin/env bash

# Create XDG directories
sudo pacman --needed --noconfirm -S git base-devel xdg-user-dirs
xdg-user-dirs-update

# Install yay if it does not exist
if ! command -v yay &> /dev/null
then
    echo "yay not found, installing..."
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    rm -rf /tmp/yay
else
    echo "yay is already installed!"
fi

# Deploy environment
yay --noconfirm -S zsh neovim code-minimap ranger slock qutebrowser python-adblock dmenu rofi rofi-calc rofi-pass rofi-power-menu keychain udiskie picom-ibhagwan-git playerctl pasystray blueman feh ripgrep entr mupdf mupdf-tools dunst fzf fd mpd mpdris2 mpc ncmpcpp w3m libcaca sxiv nnn lf vlock numlockx xdotool yad kitty tor lxappearance udiskie xorg-xinput ncdu thunderbird adapta-gtk-theme arc-gtk-theme net-tools mpv mpv-mpris xorg-xrdb neofetch rsync openvpn networkmanager-openvpn man xdo mons i3-gaps pa-applet-git cli-visualizer advcp wmfocus ly i3lock-fancy maim flameshot xorg-xdpyinfo btop bat xorg-xrandr arandr python-pywal keychain gucharmap pipewire pipewire-pulse pipewire-alsa pavucontrol pulsemixer pamixer youtube-dl gst-plugins-{base,good,bad,ugly} gst-libav figlet thefuck exa tokei procs zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search i3blocks i3blocks-contrib kbdd sysstat xorg-xbacklight brightnessctl hsetroot cowsay lolcat fortune-mod rpg-cli git-delta

# Enable services
# sudo systemctl enable tor.service

# Install starship
curl -fsSL https://starship.rs/install.sh | bash

# Link vim to nvim
[ ! -f /usr/bin/vim ] && sudo ln -s /usr/bin/nvim /usr/bin/vim
