# Deploying the configuration

Two scripts help bootstrap the repository and deploy the configuration.

The [`bootstrap.sh`](../bootstrap.sh) script installs the needed programs and checks out the repository. It can be run with this one-liner:

```
$   bash <(curl -s https://gitlab.com/langurmonkey/dotfiles/raw/master/bootstrap.sh)
```

The script works with arch-based (pacman) and debian-based (apt) distributions. The required programs are, amongst others, `vim`, `zsh`, `ranger`, `slock`, `qutebrowser`, `rofi`, `keychain`, `udiskie`. It is assumed that `i3-gaps` is already installed, as the installation process is kind of tricky in Ubuntu.
It also installs, if it is not already there, `oh-my-zsh`.

The [`deploy`](../deploy) script is much more complex and sets up the whole environment by cloning and updating repositories, creating symlinks and moving config files around. It is organised into sections (VIM, RANGER, ENVIRONMENT, I3, POLYBAR, etc.) which use a bunch of functions defined at the top. These functions help create symlinks, source files or pull and update repositories.

Once the deploy script has been run, the environment should be ready to use (save for a few utilities which need manual intervention).
