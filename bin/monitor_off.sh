#!/bin/bash

###################################################
# Check if X is running or not, turn off monitor, #
# wait for a key press and turn it on again.      #
###################################################

grep_result_file=$PWD'/x_running'

# Check if X is running.
ps -e | grep -e "\bX\b" > $grep_result_file
ps -e | grep -e "\bxorg\b" >> $grep_result_file
ps -e | grep -e "\bxserver\b" >> $grep_result_file

## If you want to check result file, uncomment following lines.
#echo "===== $grep_result_file - begin ====="
#cat $grep_result_file
#echo "===== $grep_result_file -  end  ====="

if [ ! -s $grep_result_file ] || [[ $(tty) =~ tty ]] || [[ $(tty) =~ vc ]]; then
    echo 'Detected X not runnig or you are at console...'
    if [ $UID -ne 0 ]; then
        echo 'You need super user privileges to run this script at console.'
        echo 'Rerun as super user or start X and run from a terminal.'
        exit 0
    fi
    turn_off='vbetool dpms off'
    turn_on='vbetool dpms on'
else
    echo 'Detected X running...'
    turn_off='xset dpms force off'
fi

echo 'Turning off monitor...'
$turn_off

echo 'Waiting for a key press...'
read -n1 -s

echo 'Turning on monitor...'
$turn_on

rm $grep_result_file

echo 'Finished: monitor_off'

