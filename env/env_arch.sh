
# Arch-specific environment variables
export JAVA_HOME=/usr/lib/jvm/default

# Updates and so on
alias update='sudo pacman -Syu'
alias updateaur='paru -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -R'

export PATH=$PATH:/usr/local/cuda/bin/
export MNT=/run/media/

