#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# fix delay in opening GTK apps
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# User autostart script
#if [ -f $HOME/.dotfiles/X/autostart.sh ]; then
#    $HOME/.dotfiles/X/autostart.sh
#fi

# Keyboard configuration (layout and repeat rate)
# setxkbmap -model pc104 -layout us,es -option 'grp:alt_space_toggle,caps:swapescape,eurosign:e'
# xset r rate 200 45
# numlockx

# Start i3wm
exec i3
