# i3wm

i3wm is a tiling window manager. This means that it positions windows on the screens by subdividing the space horizontally or vertically and draws the windows borders. There are several tiling window managers available for linux, such as Qtile or awesome, but I use i3wm becasue why not.

## Configuration

The configuration file of i3wm is [.i3/config](../i3/config), but you can read all about configuring i3 in the [official user guide](https://i3wm.org/docs/userguide.html). Here I will just add some quick notes on interesting points.

### i3-gaps

I use a fork of i3 called [i3-gaps](https://github.com/Airblader/i3). Basically, it is the same as vanilla i3 but it allows for a spacing to be defined between windows.

### Open in same working directory

I use a little program called [xcwd](https://github.com/schischi/xcwd) to open new terminals in the same directory as the working directory of the currently focused window. I include the compiled program in my dotfiles repo:

```
bindsym $mod+Return exec urxvt -cd "`$HOME/.dotfiles/bin/xcwd`"
```

I also use this program in my [ranger](ranger.md) launch script in order to open a ranger instance within a urxvt terminal with the right working directory.

### Media player and volume controls

I use `playerctl` to issue commands to my music players and **pactl** to control the pulse audio volume levels. Just bind the relevant `XF86...` key to the right command:

```
# media player controls
bindsym XF86AudioPrev exec playerctl previous
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPlay exec playerctl play-pause
# pulse audio controls
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5%
bindsym $mod+F12 exec --no-startup-id pactl set-sink-volume 0 +5%
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5%
bindsym $mod+F11 exec --no-startup-id pactl set-sink-volume 0 -5%
```

### Laptop backlight

Binding the screen backlight controls is a piece of cake. Bind the keys `X86MonBrightness[Up|Down]` to the `brightness+` and `brightness-` programs in the package [jappeace/brightnessctl](https://github.com/jappeace/brightnessctl).
For some reason, the traditional `xbacklight -[inc|dec] <value>` would not work in my XPS 13 9370.

```
bindsym XF86MonBrightnessUp exec brightness+
bindsym XF86MonBrightnessDown exec brightness-
```

### Application bindings

I use the Alt key as `$mod` and the Super key as application launcher (I call it `$sup`). I have very few direct application bindings.

```
bindsym $sup+b exec qutebrowser
bindsym $sup+t exec thunderbird
bindsym $sup+f exec ~/.dotfiles/bin/ranger-urxvt "`$HOME/.config/i3/xcwd`"
bindsym $sup+g exec urxvt -cd "$HOME/git/gaiasky"
```

Interesting note: when I press `Super+g` a new terminal opens in the Gaia Sky folder. This I use a lot.

### Float windows by default

You can define some windows to start in floating mode (i.e. not tiled) by default. To know what to put in `class=`, you can use `xprop` and just click on the window. Then look up the value of the key containing CLASS.

I use these:

```
for_window [title="alsamixer"] floating enable border pixel 1
for_window [class="Blueman-manager"] floating enable border pixel 1
for_window [class="GParted"] floating enable border normal
for_window [class="Lxappearance"] floating enable sticky enable border normal
for_window [class="qt5ct"] floating enable sticky enable border normal
for_window [class="Qtconfig-qt4"] floating enable sticky enable border normal
for_window [class="Skype"] floating enable border normal
for_window [class="Grub-customizer"] floating enable border normal
for_window [title="Volume Control"] floating enable border normal
for_window [class="Gsimplecal"] floating enable border normal
for_window [class="Arandr"] floating enable border normal
for_window [class="Nemo"] floating enable border normal
for_window [class="Gaia Sky - 2.1.0"] floating enable border normal
for_window [class="Gaia Sky"] floating enable border normal
```

### Power menu

I use a modified version of the i3exit script found everywhere on the internet. I have mine in the [bin](../bin) folder. My script contains an additional entry called `slock`, bound to the `k` key and which runs [slock](http://tools.suckless.org/slock/). I need this because my laptop does not have a physical key to switch off the screen, so slock is perfect for me. The regular lock entry is bound to `i3lock-fancy`, which takes a screenshot, blurs it and displays it.

### XPS 13 9370

I use `xinput` to set the touchpad speed and enable tapping at startup. This works well with the Dell XPS 13 9370.

```
#
# TRACKPAD  - Dell XPS13
#
# trackpad speed
exec_always "xinput set-prop 'DELL07E6:00 06CB:76AF Touchpad' 'libinput Accel Speed' 0.6"
# tapping enabled
exec_always "xinput set-prop 'DELL07E6:00 06CB:76AF Touchpad' 'libinput Tapping Enabled' 1"
```

### Keyboard repeat interval and delay

In Gnome Shell, I used to have a very short keyboard repeat interval and a reasonable delay. That was essential for me to use vim comfortably. To mimic this in i3wm, you can just use `xset`:

```
# Repeat interval and delay
exec_always --no-startup-id xset r rate 200 35 # initial delay 300 ms, repeat 35 ms
```

### Plug-and-play monitors

I found that [`mons`](https://github.com/Ventto/mons) is a very good option to manage screens and beamers. It is very simple to use and it just works, and instead of messing around with `xrandr`, most of the time I just use mons. It has a daemon mode which automatically resets the display when unplugging devices.

```
exec --no-startup-id mons -a > /dev/null 2>&1
```

### Compton

I like fancy transparencies and tearing-free videos, so I just use [`compton`](https://github.com/chjj/compton) as my screen compositor.

```
exec --no-startup-id compton
```

### Automount USB disks and drives

To manage and automount the plug-and-play USB drives, I use [`udiskie`](https://github.com/coldfix/udiskie). It just gets the job done.
Additionally, I like to use `ranger` as a file manager, so I want to use it as well when using the 'Browse disk...' option from udiskie. To do so, I start it like this:

```
exec --no-startup-id udiskie -f "/home/tsagrista/.dotfiles/bin/ranger-urxvt" --tray
```

The `ranger-urxvt` script starts a new `urxvt` terminal and launches ranger in it, accepting the working directory as an argument.

### Pywal

All my i3 theming needs are covered by [`pywal`](https://github.com/dylanaraps/pywal), which is an amazing utility to generate color palettes from wallpapers and apply themes to several programs in an integrated fashion. It is just outstanding. Try it.
At startup, I can restore the last configuration (including wallpaper plus color schemes for i3, ranger, polybar, vim, etc.) using:

```
exec --no-startup-id wal -R
```
