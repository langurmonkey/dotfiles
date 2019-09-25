#!/usr/bin/env bash

# Arch updates includes ruby gem updates as well (little did you know, huh?)
arch_updates=$(checkupdates 2>&1)
aur_updates=$(yay --aur -Qu 2>/dev/null | wc -l)
arch_updates=$(echo "$arch_updates" | wc -l)
updates=$((arch_updates + aur_updates))
echo "$updates"
