#!/bin/bash

command_exists () {
    type "$1" &> /dev/null ;
}
# Let's hear the cow say...
if command_exists fortune && command_exists cowsay && command_exists lolcat; then
    fortune | cowsay -f $(\ls /usr/share/cowsay/cows/*.cow|shuf -n 1) | lolcat
elif command_exists fortune && command_exists cowsay && ! command_exists lolcat; then
    fortune | cowsay -f $(\ls /usr/share/cowsay/cows/*.cow|shuf -n 1)
elif command_exists fortune && ! command_exists cowsay && command_exists lolcat; then
    fortune | lolcat
elif command_exists fortune; then
    fortune
fi
