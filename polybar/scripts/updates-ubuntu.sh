#!/usr/bin/env bash

warning_color='#f44336'
normal_color='#fabd2f'
no_connection_color='#373737'

aur_updates=$(yay --aur -Qu 2>/dev/null | wc -l)
arch_updates=$(echo "$arch_updates" | wc -l)

updates=$((arch_updates + aur_updates))

if [ "$updates" -lt 40 ]; then
	echo ""
elif [ "$updates" -lt 80 ]; then
	echo "%{F${normal_color}}%{F-}"
else
	echo "%{F${warning_color}}%{F-}"
fi
