# !/usr/bin/env bash

# Create XDG directories
sudo pacman --needed --noconfirm -S git base-devel xdg-user-dirs
xdg-user-dirs-update

# Install paru if it does not exist
if ! command -v paru &> /dev/null
then
    echo "paru not found, installing..."
    cd /tmp
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    rm -rf /tmp/paru
else
    echo "paru is already installed!"
fi

# Deploy environment
paru --noconfirm -S moreutils zsh jq neovim slock xclip python-uv calc keychain udiskie playerctl  feh ripgrep entr mupdf mupdf-tools fzf fd mpd mpdris2 mpc rmpc w3m libcaca imv nnn lf vlock numlockx xdotool yad kitty tor lxappearance udiskie xorg-xinput ncdu thunderbird adapta-gtk-theme arc-gtk-theme net-tools mpv mpv-mpris fastfetch rsync openvpn man xdo mons cava advcp wmfocus maim btop bat python-pywal gucharmap pipewire pipewire-pulse pipewire-alsa pavucontrol pulsemixer pamixer youtube-dl gst-plugins-{base,good,bad,ugly} gst-libav figlet exa tokei procs zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search kbdd sysstat brightnessctl hsetroot cowsay lolcat fortune-mod rpg-cli git-delta xob python-watchdog python-pulsectl nsxiv autotiling mailcap run-mailcap viu zathura chafa ueberzugpp noto-fonts-emoji starship stylua prettier z ctpv hyprland hyprpaper hyprtoolkit hyprwire hyprlock hypridle hyprpolkitagent hyprshot hyprland-protocols hyprpicker xdg-desktop-portal-hyprland ffmpeg ffmpegthumbnailer unarchiver poppler zoxide yazi noctalia inotify-tools uwsm gopass gopass-jsonapi marksman

# Enable services
# sudo systemctl enable tor.service
systemctl --user enable --now hyprpaper.service

# Link vim to nvim
[ ! -f /usr/bin/vim ] && sudo ln -s /usr/bin/nvim /usr/bin/vim
