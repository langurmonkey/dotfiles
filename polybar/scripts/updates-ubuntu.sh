#!/usr/bin/env bash

warning_color='#f44336'
normal_color='#fabd2f'
no_connection_color='#373737'

updates=$(apt-get dist-upgrade -s --quiet=2 | grep ^Inst | wc -l)

if [[ $updates -eq 0 ]]; then
	echo "%{F${no_connection_color}}%{F-}"
	exit
fi

if [ "$updates" -lt 20 ]; then
	echo " $updates"
elif [ "$updates" -lt 80 ]; then
	echo "%{F${normal_color}} $updates%{F-}"
else
	echo "%{F${warning_color}} $updates%{F-}"
fi
