Neovim plugin setup
===================

This is my vim-compatible neovim configuration. I use this for remote headless machines where neovim is not installed.

After setup, install/update the plugins by opening `neovim` and typing:

```
:PlugUpdate
```

Additionally, install programming language support packages with CoC (Conquer of Completion):

```
:CocInstall coc-json coc-html coc-rust-analyzer coc-yaml coc-python coc-java coc-explorer
```
