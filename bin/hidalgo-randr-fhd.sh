#!/bin/sh
#xrandr  --output DVI-D-0 --mode 1920x1080 --pos 0x0 --rotate left --scale 1.5x1.5 --output DP-2 --primary --mode 3840x2160 --pos 1920x0 --rotate normal

file=/tmp/xrandr-out.log

echo "------ XRANDR STATUS ------" >> $file
sleep 2
xrandr -q >> $file
echo "------ XRANDR COMMAND OUTPUT BELOW ------" >> $file
xrandr --verbose --dpi 96 \
    --output DVI-D-0 --scale 1x1 --mode 1920x1080 --pos 0x0 --rotate normal \
    --output DP-2 --primary --mode 1920x1080 --pos 1920x0 --rotate normal \
    >> $file 2>&1
echo "------ DONE ------" >> $file
echo ""
