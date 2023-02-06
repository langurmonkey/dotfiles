#
# ALIASES
# 

# Format for listings and directory usages
alias ll="exa -alh --color=auto --icons --group-directories-first"
alias la="exa -alhS --color=auto --icons --group-directories-first"
alias l="exa -lhrS --color=auto --icons --group-directories-first"
alias ls="exa -a --color=auto --icons --group-directories-first"
alias lsd="exa -D --color=auto --icons"
alias df="df -Th"
alias du="du -h"
alias cp="cp -fv"
alias rsync="rsync --progress"

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
alias hx="helix"

# VPN
alias vpnheidelberguni="sudo openconnect -u st0@ix.urz.uni-heidelberg.de vpn-ac.urz.uni-heidelberg.de"
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

# Dotfiles git alias
alias dotfiles="git -C $HOME/.dotfiles"
alias dot="git -C $HOME/.dotfiles"
alias dotp="git -C $HOME/.dotfiles add . && git -C $HOME/.dotfiles commit -m 'feat: update' && git -C $HOME/.dotfiles pull && git -C $HOME/.dotfiles pa"

# Gamesaves git alias
alias gamesaves="git -C $HOME/.gamesaves"
alias gsv="git -C $HOME/.gamesaves"
alias gsvp="git -C $HOME/.gamesaves add . && git -C $HOME/.gamesaves commit -m 'feat: update' && git -C $HOME/.gamesaves pull && git -C $HOME/.gamesaves pa"

# Mus invokes ncmpcpp
alias mus="ncmpcpp"

# Movement random
alias up="cd .."
alias back="cd -"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ..2="cd ../.."
alias ..3="cd ../../.."

# Best calculator
alias bc="bc -l"

# Image viewer
alias img="sxiv"

# Screen off script using vbetool
alias off="~/.dotfiles/bin/monitor_off"

# Systemd
alias sstatus="sudo systemctl status"
alias sstart="sudo systemctl start"
alias srestart="sudo systemctl restart"
alias sstop="sudo systemctl stop"
alias senable="sudo systemctl enable"
alias sdisable="sudo systemctl disable"

# Archives
alias ltar="tar -ztvf"
alias untar="tar -zxvf"
alias ctar="tar -cvzf"

# Radio, etc.
alias catradio="mpv https://directes-radio-int.ccma.cat/live-content/catalunya-radio-hls/bitrate_1.m3u8"
alias rac1="mpv https://streaming.rac1.cat"

# Crypto
alias crypto="curl rate.sx"
alias btc="curl rate.sx/btc"
alias eth="curl rate.sx/eth"
alias ltc="curl rate.sx/ltc"

# ChatGPT ata
alias ata="ata --config=/home/tsagrista/.config/ata/ata.toml"
