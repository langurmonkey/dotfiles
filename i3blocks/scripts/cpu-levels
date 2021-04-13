#!/bin/sh

# Define array
ramp_arr=(▁ ▂ ▃ ▄ ▅ ▆ ▇ █)

sar -P ALL 1 1 | grep -E 'Average:\s+[0-9]+' | while read -r line ; do
    val=$(echo $line | awk '{cpu_usage=$3} END {printf "%0.2f", cpu_usage}')
    idx=`echo "scale=4; $val/14.3" | bc`
    intidx=$( printf "%.0f" $idx )
    printf "${ramp_arr[$intidx]}"
done
echo
