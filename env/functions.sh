#
# FUNCTIONS
#

# cd+ls
cl () {
    cd $1
    ls
}
# cheat.sh
cht() {
  curl cht.sh/$1
}
# Weather
weather(){
    curl https://wttr.in/$1\?1Fn
}
wfull(){ curl https://wttr.in/$1
}
wimg(){
    kitty icat https://v3.wttr.in/$1.png
}
