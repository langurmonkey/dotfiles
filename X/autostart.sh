#!/bin/sh
# Repeat interval and delay
xset r rate 200 35 # initial delay 300 ms, repeat 35 ms

# Keyboard layout definition. Switch escape and caps lock key
setxkbmap -model pc104 -layout us,es -option 'grp:alt_space_toggle,caps:swapescape,eurosign:e'

# Activate numlock
numlockx &

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
nm-applet &
echo "NM DONE"
# bluetooth
blueman-applet &
echo "BLUEMAN DONE"
# volume
pasystray &
echo "SYSTRAY DONE"

#
# MONITORS AND XRANDR - autodetect plug-in monitors
#
mons -a > /dev/null 2>&1 &
echo "MONS DONE"

#
# UDISKIE - automount
#
udiskie -f "$HOME/.dotfiles/bin/ranger-term" --tray &
echo "UDISKIE DONE"

# NO SCREENSAVER
$HOME/.dotfiles/bin/no-screenoff.sh &
echo "SCREENOFF DONE"

# PYWAL
wal -a 80 --theme "$HOME/.dotfiles/pywal/themes/dark/base16-google.json"
echo "PYWAL DONE"

# 
# COMPOSITOR - window compositor
#
$HOME/.dotfiles/bin/togglepicom
echo "PICOM DONE"

#
# RANDR - monitor setup
#
$HOME/.local/bin/current-randr.sh
echo "RANDR DONE"

#
# mpDris2 - MPRIS2 support for mpd
# 
mpDris2 &

#
# playerctld
#
playerctld

#
# WALLPAPER - after screens have been setup
#
$HOME/.dotfiles/bin/wallpaper-apply
echo "WALLPAPER DONE"
