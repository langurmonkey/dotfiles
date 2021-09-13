# Start compositor
#~/.dotfiles/X/autostart.sh

# Apply .Xresources settings (dpi)
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Start i3wm
exec i3
