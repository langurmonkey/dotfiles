
# Repeat interval and delay
xset r rate 200 35 # initial delay 300 ms, repeat 35 ms

# Keyboard layout definition. Switch escape and caps lock key
setxkbmap -model pc104 -layout us,es -option 'grp:alt_space_toggle,caps:swapescape,eurosign:e'

#
# TRACKPAD  - Dell XPS13 
#
# trackpad speed
xinput set-prop 'DELL07E6:00 06CB:76AF Touchpad' 'libinput Accel Speed' 0.6
# tapping enabled
xinput set-prop 'DELL07E6:00 06CB:76AF Touchpad' 'libinput Tapping Enabled' 1


#
# SYSTEM TRAY
#
# network manager
nm-applet
# bluetooth
blueman-applet
# volume
pasystray

#
# MONITORS AND XRANDR - autodetect plug-in monitors
#
mons -a > /dev/null 2>&1

#
# UDISKIE - automount
#
udiskie -f "$HOME/.dotfiles/bin/ranger-term" --tray

# NO SCREENSAVER
$HOME/.dotfiles/bin/no-screenoff.sh

# PYWAL
wal -a 80 --theme "$HOME/.dotfiles/pywal/themes/dark/base16-brewer.json"

# 
# COMPOSITOR - window compositor
#
$HOME/.dotfiles/bin/togglepicom

#
# RANDR - monitor setup
#
$HOME/.local/bin/current-randr.sh

#
# WALLPAPER - after screens have been setup
#
exec_always --no-startup-id $HOME/.dotfiles/bin/wallpaper-apply
