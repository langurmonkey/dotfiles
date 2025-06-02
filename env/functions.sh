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
# Move to CWD when exiting yazi, and use y for yazi.
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
