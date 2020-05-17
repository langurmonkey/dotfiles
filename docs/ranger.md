# Ranger

My ranger configuration is not very special. I like to use ranger to quickly naviagte around and edit files. Also, I have defined a couple of bindings that allow me to move directly to the wallpapers folder, change the current wallpaper with `feh` and change the current wallpaper and generate a new theme with `pywal`. For example, the following moves me directly to the wallpapers folder when I press `gw`:

```
map gw cd ~/.dotfiles/assets/wallpaper
```

Then, I can select a wallpaper and I can either use `bg` to set as background or `bw` to set as background, generate a new palette and apply the theme.

```
map bg shell cp %f ~/Pictures/wallpaper.jpg && feh --bg-fil ~/Pictures/wallpaper.jpg
map bw shell cp %f ~/Pictures/wallpaper.jpg && ~/.local/bin/wal -c && ~/.local/bin/wal -a 85 -i ~/Pictures/wallpaper.jpg
```

Additionally, I use a script to launch a new instance of `ranger` inside a `termite` terminal with a specific working directory:

```
#!/bin/bash
# ranger-term
EDITOR=nvim && termite -e ranger "$1"
```

Whenever I need a new instance of `ranger`, I use the script. For example, I bind `$sup+f` to a new ranger-in-termite starting at the working directory of the currently focused window in my `i3` configuration:

```
bindsym $sup+f exec ~/.dotfiles/bin/ranger-term "`$HOME/.dotfiles/bin/xcwd`"
```

Or I use `ranger` for displaying the mounted volumes from the `udiskie` tray icon, starting `udiskie` in this manner:

```
exec --no-startup-id udiskie -f "/home/tsagrista/.dotfiles/bin/ranger-term" --tray
```
