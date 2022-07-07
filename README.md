# Dotfiles

**This** is my Linux configuration. 
It contains utilities to bootstrap and deploy my environment and dotfiles for
i3wm, polybar, vim, ranger, and some other programs.

## Bootstrap

The following line checks out the repository into `~/.dotfiles` and installs the essential tools:

```console
bash <(curl -s https://codeberg.org/langurmonkey/dotfiles/raw/master/bootstrap.sh)
```

## Create environment

Deploy the environment anytime using the `deploy` script:

```console
~/.dotfiles/deploy
```

## More info

- [Background story](docs/bg.md)
- [Deploying](docs/deploy.md)
- [i3wm](docs/i3wm.md)
- [qutebrowser](docs/qutebrowser.md)
- [dmenu](docs/dmenu.md)
- [ranger](docs/ranger.md)
- [neovim](docs/neovim.md)
- [pass](docs/pass.md)
- [HOWTO HiDPI](docs/hidpi.md)
