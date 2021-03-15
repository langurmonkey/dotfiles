# HiDPI

This short document describes how to change the HiDPI setting so that everything works fine. The following sections describe how to make certain components use the desired DPI. The rest of components (dunst, kitty, etc.) should automatically pick up the new DPI defined by `xrandr` and `.Xresources`.

### Randr

Symlink `~/.local/bin/current-randr.sh` to either `~/.dotfiles/bin/hidalgo-randr-hidpi.sh` or `~/.dotfiles/hidalgo-randr-fhd.sh`.

### X

Symlink `~/.Xresources` to either `~/.dotfiles/X/.Xresources-hidpi` or `~/.dotfiles/X/.Xresources`.

### Polybar

Look up the file `~/.dotfiles/polybar/launch.sh` and change the code within the "if" block pertaining to "hidalgo". You can choose the bars `bar-hidpi` and `bar-hidpi-slave` for HiDPI setups, and `bar-fhd` and `bar-fhd-slave` for 1080p setups.

### Urxvt

Symlink `~/.Xdefaults` to either `~/.dotfiles/X/.Xdefaults-hidpi` or `~/.dotfiles/X/.Xdefaults`.

### Firefox and Thunderbird

Go to `about:config` and set `layout.css.devPixelsPerPx` to whatever value (`1.8`, `2.0`, etc).

### IntelliJ IDEA

1. Set the VM property `-Dsun.java2d.uiScale=2`
2. Set the gnome setting `$  gsettings org.gnome.desktop.interface scaling factor 2`

