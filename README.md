# Dotfiles

This repository contains some configuration files to set up
my dev environment the way I like it. It contains config files for
vim, ranger, tmux, i3 and some other programs.

## Bootstrap

The following line checks out the repository into `~/.dotfiles` and installs the essential tools for arch or ubuntu:

```
 $  bash <(curl -s https://gitlab.com/langurmonkey/dotfiles/raw/master/bootstrap.sh)
```

## Create environment

Deploy the environment anytime using the `deploy` script:

```
 $  ~/.dotfiles/deploy
```

