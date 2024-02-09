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
paru --noconfirm -S i3-wm zsh neovim neovide ranger slock qutebrowser xclip python-adblock dmenu rofi rofi-calc rofi-pass rofi-power-menu keychain udiskie picom playerctl pasystray blueman feh ripgrep entr mupdf mupdf-tools dunst fzf fd mpd mpdris2 mpc ncmpcpp w3m libcaca imv nnn lf vlock numlockx xdotool yad kitty tor lxappearance udiskie xorg-xinput ncdu thunderbird-beta-bin adapta-gtk-theme arc-gtk-theme net-tools mpv mpv-mpris xorg-xrdb neofetch rsync openvpn networkmanager-openvpn network-manager-applet man xdo mons pa-applet-git cli-visualizer advcp wmfocus ly i3lock-fancy maim flameshot xorg-xdpyinfo btop bat xorg-xrandr arandr python-pywal gucharmap pipewire pipewire-pulse pipewire-alsa pavucontrol pulsemixer pamixer youtube-dl gst-plugins-{base,good,bad,ugly} gst-libav figlet exa tokei procs zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search i3blocks i3blocks-contrib kbdd sysstat xorg-xbacklight brightnessctl hsetroot cowsay lolcat fortune-mod rpg-cli git-delta xob python-watchdog python-pulsectl nsxiv autotiling mailcap run-mailcap viu zathura chafa ueberzugpp noto-fonts-emoji starship stylua prettier z ctpv hyprland hyprpaper tschuss fuzzel

# Enable services
# sudo systemctl enable tor.service

# Link vim to nvim
[ ! -f /usr/bin/vim ] && sudo ln -s /usr/bin/nvim /usr/bin/vim
