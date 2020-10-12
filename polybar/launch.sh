#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
sleep 1

# Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# We will run a configuration depending on the host name
HOSTNAME=$(cat /etc/hostname)


# ARI hidalgo - 2 bars - ubuntu+hidpi
if [[ $HOSTNAME == "hidalgo" ]]; then
    echo "HIDALGO"
    MONITOR=DP-2 polybar bar-hidpi-ubuntu &
    MONITOR=DVI-D-0 polybar bar-hidpi-slave &

# IWR herschel - 2 bars - arch+hidpi
elif [[ $HOSTNAME == "herschel" ]]; then
    echo "HERSCHEL"
    MONITOR=DP-0 polybar bar-hidpi &
    MONITOR=DP-4 polybar bar-hidpi-slave &

# Others - same bar in all monitors
else
    echo "NOTHING"
    #for m in $(polybar --list-monitors | cut -d":" -f1); do
    #    MONITOR=$m polybar bar-fhd &
    #done
    polybar -r bar-fhd &
fi


echo "Bar launched!"
