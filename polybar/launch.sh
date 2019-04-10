#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# We will run a configuration depending on the host name
HOSTNAME=$(hostname)


# ARI hidalgo - 2 bars - ubuntu+hidpi
if [[ $HOSTNAME == "hidalgo" ]]; then
    MONITOR=DP-0 polybar bar-hidpi-ubuntu &
    MONITOR=DVI-D-0 polybar bar-hidpi-slave &

# IWR herschel - 2 bars - arch+hidpi
elif [[ $HOSTNAME == "herschel" ]]; then
    MONITOR=DP-0 polybar bar-hidpi &
    MONITOR=DP-4 polybar bar-hidpi-slave &

# Others - same bar in all monitors
else
    for m in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$m polybar --reload bar-fhd &
    done
fi


echo "Bar launched..."
