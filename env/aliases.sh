#
# ALIASES
# 

# AUR
alias yay="paru"
alias pru="paru"
alias yeet="paru -Rcs"

# Installed packages with descriptions
alias pkglist='paru -Qs --color=always | less -R'

# Format for listings and directory usages
alias ll="eza -alh --color=auto --icons --group-directories-first"
alias la="eza -alhS --color=auto --icons --group-directories-first"
alias l="eza -lhrS --color=auto --icons --group-directories-first"
alias ls="eza -a --color=auto --icons --group-directories-first"
alias lsd="eza -D --color=auto --icons"
alias df="df -Th"
alias du="du -h"
alias cp="cp -fv"
alias rsync="rsync --progress"

# Display journalctl errors
alias error='journalctl -b -p err'

# Wireguard connect and disconnect
alias wgc="sudo wg-quick up"
alias wgd="sudo wg-quick down"

# Regular utils
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias wifi="nmtui"
alias ag="rg"
alias ps="procs"
alias v="nvim"
alias youtube-dl="yt-dlp"
alias ytdl="yt-dlp"
if [[ "$OSTYPE" != "darwin"* ]]; then
    alias hx="helix"
fi

# VPN
alias vpnhduni="sudo openconnect --user=st0@ix.urz.uni-heidelberg.de --os=win --useragent='AnyConnect' vpn-ac.urz.uni-heidelberg.de"
alias vpnstatus="curl https://am.i.mullvad.net/connected"
# Docker with sudo by default
alias docker="sudo docker"
# ARI machines
alias hidalgo="ssh -tX tsagrista@hidalgo"
alias centaurus="ssh -tX tsagrista@centaurus.ari.uni-heidelberg.de"
alias cmi="ssh -tX sagrista@cmi"
alias cma="ssh -tX sagrista@cma"
alias umi="ssh -tX sagrista@umi.ari.uni-heidelberg.de"
alias uma="ssh -tX sagrista@uma.ari.uni-heidelberg.de"
alias mintaka="ssh -tX tsagrista@mintaka.ari.uni-heidelberg.de"
alias andromeda="ssh -tX tsagrista@andromeda.ari.uni-heidelberg.de"
alias welcome="ssh -tX toni.sag@welcome.ari.uni-heidelberg.de"
# Raspberry
alias rpi="ssh -tX pi@raspberrypi"
# Mounts
alias mountqnap="sudo mkdir -p /run/media/QNAP/Multimedia && sudo mount /run/media/QNAP/Multimedia"
alias umountqnap="sudo umount /run/media/QNAP/Multimedia"
# Usual syncs
alias syncvegetaqnap="rsync -avh /run/media/tsagrista/VegetaDisk/backupQNAP/Multimedia/Photos/tsagrista /run/media/QNAP/Multimedia/Photos/"
alias syncqnapvegeta="rsync -avh /run/media/QNAP/Multimedia/Photos/tsagrista /run/media/tsagrista/VegetaDisk/backupQNAP/Multimedia/Photos/"
alias syncvegetaaridisk="rsync -avh /run/media/tsagrista/VegetaDisk/backupQNAP/Multimedia/Photos/tsagrista/ pi@rpi5:/media/pi/aridisk/Media/Photos/"

# Git aliases
alias pull="git pull"
alias push="git pa"

# Dotfiles
alias dotfiles="git -C $HOME/.dotfiles"
alias dot="git -C $HOME/.dotfiles"
alias dotp="git -C $HOME/.dotfiles add . && git -C $HOME/.dotfiles commit -m 'feat: update' && git -C $HOME/.dotfiles pull && git -C $HOME/.dotfiles pa"

# Gamesaves
alias gamesaves="git -C $HOME/.gamesaves"
alias gsv="git -C $HOME/.gamesaves"
alias gsvp="git -C $HOME/.gamesaves add . && git -C $HOME/.gamesaves commit -m 'feat: update' && git -C $HOME/.gamesaves pull && git -C $HOME/.gamesaves pa"

# Mus invokes ncmpcpp
alias mus="ncmpcpp"

# Random movement
alias up="cd .."
alias back="cd -"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ..2="cd ../.."
alias ..3="cd ../../.."

# Best calculator
alias bc="bc -l"

# Systemd
alias sstatus="systemctl status"
alias sstart="sudo systemctl start"
alias srestart="sudo systemctl restart"
alias sstop="sudo systemctl stop"
alias senable="sudo systemctl enable"
alias sdisable="sudo systemctl disable"

# Radio, etc.
alias catradio="mpv https://directes-radio-int.3catdirectes.cat/live-content/catalunya-radio-hls/bitrate_1.m3u8"
alias rac1="mpv https://25633.live.streamtheworld.com/RAC_1.mp3"

# Crypto
alias crypto="curl rate.sx"
alias btc="curl rate.sx/btc@30d"
alias eth="curl rate.sx/eth@30d"

# Alias gimp to flatpak if gimp is not in the system
if ! command -v gimp &> /dev/null
then
    alias gimp='flatpak run org.gimp.GIMP'
fi
