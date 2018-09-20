#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1
DISPLAY1="$(xrandr -q | grep 'eDP-1' | cut -d ' ' -f1)"
[[ ! -z "$DISPLAY1" ]] && MONITOR="$DISPLAY1" polybar bar-fhd &

DISPLAY2="$(xrandr -q | grep 'DP-0' | cut -d ' ' -f1)"
if [[ ! -z $DISPLAY2 ]]; then
    MONITOR=$DISPLAY2 polybar bar-hidpi &
    polybar bar-hidpi-slave &
fi

echo "Bar launched..."
