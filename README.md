# My configuration files

This repository contains some configuration files to set up
my dev environment the way I like it. It also contains a 
script, `dotfiles-setup`, which will symlink the dotfiles
to the necessary locations and install some vim and tmux
plugins. It needs vim and tmux to be preinstalled.

All in all, to setup the environment in arch, do:

```bash
$  sudo pacman -S vim tmux
$  dotfiles-setup
```
