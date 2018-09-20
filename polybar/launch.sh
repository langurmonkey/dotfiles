#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# We will run a configuration depending on the host name
HOSTNAME=$(hostname)

# XPS13 laptop - 1 bar
DISPLAY1="$(xrandr -q | grep 'eDP-1' | cut -d ' ' -f1)"
[[ ! -z "$DISPLAY1" ]] && MONITOR="$DISPLAY1" polybar bar-fhd &

# ARI hidalgo - 2 bars - hidpi
if [[ $HOSTNAME == "hidalgo" ]]; then
    MONITOR=DP-0 polybar bar-hidpi-ubuntu &
    MONITOR=DVI-D-0 polybar bar-hidpi-slave &
fi

# IWR herschel - 2 bars - hidpi
if [[ $HOSTNAME == "herschel" ]]; then
    MONITOR=DP-0 polybar bar-hidpi &
    MONITOR=DP-4 polybar bar-hidpi-slave &
fi


echo "Bar launched..."
