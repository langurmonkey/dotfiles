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
    BAR_NAME=bar-fhd
    #BAR_NAME=bar-hidpi

# IWR herschel - 2 bars - arch+hidpi
elif [[ $HOSTNAME == "herschel" ]]; then
    BAR_NAME=bar-hidpi

# Others - same bar in all monitors
else
    BAR_NAME=bar-fhd
fi

# Launch bar in each monitor
for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar $BAR_NAME & done


echo "Bar launched!"
