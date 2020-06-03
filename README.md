# Dotfiles

**This** is my Linux configuration. 
It contains utilities to bootstrap and deploy my environment and dotfiles for
i3wm, polybar, vim, ranger, and some other programs.

## Bootstrap

The following line checks out the repository into `~/.dotfiles` and installs the essential tools for arch or ubuntu:

```
 $  bash <(curl -s https://gitlab.com/langurmonkey/dotfiles/raw/master/bootstrap[-arch|-ubuntu].sh)
```

## Create environment

Deploy the environment anytime using the `deploy` script:

```
 $  ~/.dotfiles/deploy
```

## More info

- [Background story](docs/bg.md)
- [Deploying](docs/deploy.md)
- [i3wm](docs/i3wm.md)
- [qutebrowser](docs/qutebrowser.md)
- [polybar](docs/polybar.md)
- [dmenu](docs/dmenu.md)
- [ranger](docs/ranger.md)
- [vim](docs/vim.md)
- [pass](docs/pass.md)

