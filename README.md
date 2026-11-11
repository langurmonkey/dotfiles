# Dotfiles

**This** is my Linux configuration. 
It contains utilities to bootstrap and deploy my environment.

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
## Environment

This is possibly outdated, but still.

- Hyprland
- kitty
- Noctalia
- yazi
- mitos

## Going from i3 to hyprland (dpi)

Change the following:

- **Topcat**: Start script. Use one of those:
    - i3: `javaArgs="-Xms2g -Xmx8g -Dsun.java2d.dpiaware=true -Dsun.java2d.uiScale=2.5"`
    - wayland: `javaArgs="-Xms1g -Xmx2g -Dsun.java2d.dpiaware=true -Dsun.java2d.uiScale=1.0"`
- **Qutebrowser**: GPU acceleration causes problems with Wayland and Nvidia. Make sure that `qt.args` in `:set` contains `["disable-gpu"]`.
- **~/.profile**: This may not be necessary, but there are a bunch of variables that need to change. Probably not read in wayland.
    - i3:
        ```
        export GDK_SCALE=2
        export GDK_DPI_SCALE=0.5
        export QT_AUTO_SCREEN_SET_FACTOR=0
        export QT_SCALE_FACTOR=2
        export QT_FONT_DPI=96
        ```
    - Hyprland:
        ```
        export GDK_SCALE=1
        export GDK_DPI_SCALE=1.0
        export GTK_SCALE=wayland
        export QT_AUTO_SCREEN_SET_FACTOR=0
        export QT_SCALE_FACTOR=1
        export QT_FONT_DPI=96
        ```
- **Thunderbird**: On i3, you need to set ``layout.css.devPixelsPerPixel`` to 2 in the config editor.
- **FreeTube**: On wayland, you need to edit the Exec line in the desktop file (`/usr/share/applications/freetube.desktop`) so that it reads `Exec=/opt/FreeTube/freetube --enable-features=UseOzonePlatform --ozone-platform=wayland %U`.
