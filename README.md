# Dotfiles

This repository contains some configuration files to set up
my dev environment the way I like it. 

## Bootstrap

The following line checks out the repository into `~/.dotfiles` and installs the essential tools for arch or ubuntu:

```
 $  bash <(curl -s https://gitlab.com/langurmonkey/dotfiles/raw/master/bootstrap.sh)
```

## Create environment

Deploy the environment using the `deploy` script:

```
 $  ~/.dotfiles/deploy
```

