# Hidden on by default
export FFF_HIDDEN=1
# File opener
export FFF_OPENER="xdg-open"
# Cd on exit
export FFF_CD_ON_EXIT=1

# Favourites (Bookmarks) (keys 1-9) (dir or file)
export FFF_FAV1=~/Projects
export FFF_FAV2=/Programs
export FFF_FAV3=~/.zshrc
export FFF_FAV4=~/Pictures
export FFF_FAV5=/
export FFF_FAV6=
export FFF_FAV7=
export FFF_FAV8=
export FFF_FAV9=

f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}
