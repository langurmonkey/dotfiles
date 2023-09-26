# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, extension, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

import os, subprocess

mod = "mod4"
terminal = "kitty"
browser = "qutebrowser"
home = os.path.expanduser('~')

colors = [
          ["000000", "000000"], # 0 background
          ["ffffff", "ffffff"], # 1 white
          ["ff5555", "ff5555"], # 2 white alt
          ["797FD4", "797FD4"], # 3 violet
          ["89aaff", "89aaff"], # 4 blue
          ["89ddff", "89ddff"], # 5 ice
          ["E05F27", "E05F27"], # 6 orange
          ["218933", "218933"], # 7 green
          ["ffab6b", "ffab6b"], # 8 orange
          ["883212", "883212"], # 9 red
          ["a8a212", "a8a212"], # 10 yellow
          ["3254dd", "3254dd"], # 11 electric blue
          ["333333", "333333"], # 12 dark gray
          ["191919", "191919"], # 13 darker gray
          ]

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Fullscreen
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Full screen current window"),

    # Lock
    Key([mod, "shift"], "z", lazy.spawn(terminal + " -e slock")),
    Key([mod, "shift"], "x", lazy.spawn("i3lock-fancy")),

    # Rofi
    Key([mod], "d", lazy.spawn("rofi -show run")),
    Key([mod], "z", lazy.spawn("rofi -show drun")),
    Key([mod], "g", lazy.spawn("rofi -show window")),
    Key([mod], "equal", lazy.spawn("rofi -show calc -no-show-math -no-sort")),
    Key([mod], "Escape", lazy.spawn("rofi -show p -modi 'p:rofi-power-menu --choices=reboot/shutdown/logout/suspend/hibernate --confirm=reboot/shutdown/logout' -font 'Hack Nerd Font 15'")),
    Key([mod], "i", lazy.spawn("rofi-pass")),

    # Applications
    Key([mod, "shift"], "w", lazy.spawn(browser)),
    Key([mod, "control"], "w", lazy.spawn("firefox")),
    Key([mod, "shift"], "t", lazy.spawn("thunderbird")),

    # Media player controls
    Key([], "XF86AudioPlay", lazy.spawn("/usr/bin/playerctl play")),
    Key([], "XF86AudioPause", lazy.spawn("/usr/bin/playerctl pause")),
    Key([], "XF86AudioNext", lazy.spawn("/usr/bin/playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("/usr/bin/playerctl previous")),
    Key([mod], "comma", lazy.spawn("mpc prev"), desc="Previous song"),
    Key([mod], "period", lazy.spawn("mpc next"), desc="Next song"),

    # Audio controls
    Key([], 'XF86AudioLowerVolume', lazy.spawn('amixer -q set Master 5%-')),
    Key([], 'XF86AudioRaiseVolume', lazy.spawn('amixer -q set Master 5%+')),
    Key([], 'XF86AudioMute', lazy.spawn('amixer -q set Master toggle')),

    # Screenshots
    Key([], "Print", lazy.spawn("/usr/bin/scrot " + home + "/Pictures/Screenshots/screenshot_%Y_%m_%d_%H_%M_%S.png")),
    Key([mod], "Print", lazy.spawn("scrot -e 'mv $f /tmp/ && gimp /tmp/$f'")),
    #Key([mod], "Print", lazy.spawn("scrot -s -e 'mv $f /tmp/ && gimp /tmp/$f'")),

    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightness+"), desc="Increase brightness"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightness-"), desc="Decrease brightness"),


    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q",lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "shift"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),

]

groups = [
    Group("1", label="1 "),
    Group("2", label="2 "),
    Group("3", label="3 﫯"),
    Group("4", label="4 "),
    Group("5", label="5 "),
    Group("6", label="6 "),
    Group("7", label="7 "),
    Group("8", label="8 "),
    Group("9", label="9 "),
    Group("0", label="0 卵"),
        ]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layout_theme = {
                "font": "Hack Nerd Font",
                "border_width": 5,
                "margin": 6,
                "border_focus": colors[7][0]
                }

layouts = [
    layout.Spiral(ratio=0.5, margin=10, new_client_position='after_current'),
    layout.Columns(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Matrix(**layout_theme),
    layout.RatioTile(**layout_theme),
    layout.Tile(**layout_theme),
    layout.TreeTab(**layout_theme),
    layout.Floating(**layout_theme),
    #layout.Stack(num_stacks=2),
    #layout.MonadWide(**layout_theme),
    #layout.Bsp(**layout_theme),
    #layout.VerticalTile(**layout_theme),
    #layout.Zoomy(**layout_theme),
]

widget_defaults = dict(
    font='Hack Nerd Font',
    fontsize=22,
    margin=0,
    padding=10
)

extension_defaults = widget_defaults.copy()
sep_padding=8


screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(**widget_defaults),

                widget.GroupBox(
                    highlight_color=colors[12],
                    this_current_screen_border=colors[6],
                    highlight_method="line",
                    **widget_defaults
                ),

                widget.WindowName(**widget_defaults),

                widget.KeyboardLayout(
                    fmt=' {}',
                    layout_groups=['us','es'],
                    **widget_defaults
                ),

                widget.Sep(padding=sep_padding),

                widget.CheckUpdates(
                    fmt=' {}',
                    display_format='{updates}',
                    colour_have_updates=colors[7],
                    colour_no_updates=colors[1],
                    distro='Arch',
                    **widget_defaults
                ),

                widget.Sep(padding=sep_padding),

                widget.Mpd2(
                    foreground=colors[5],
                    **widget_defaults
                ),

                widget.Sep(padding=sep_padding),

                widget.CPU(
                    **widget_defaults
                ),

                widget.Sep(padding=sep_padding),

                widget.Memory(
                    foreground=colors[8],
                    measure_mem='G',
                    **widget_defaults
                ),

                widget.Sep(padding=sep_padding),

                widget.BatteryIcon(
                    **widget_defaults
                ),

                widget.Sep(padding=sep_padding),

                widget.PulseVolume(
                    foreground=colors[10],
                    fmt='墳 {}',
                    **widget_defaults
                ),

                widget.Sep(padding=sep_padding),

                widget.Clock(
                    format='%Y/%m/%d %H:%M',
                    **widget_defaults
                ),

                widget.Sep(padding=sep_padding),

                widget.Systray(
                    **widget_defaults
                ),

                widget.QuickExit(
                    default_text='',
                    countdown_format='{}',
                    **widget_defaults
                ),
            ],
            48,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(**widget_defaults),

                widget.GroupBox(
                    highlight_color=colors[12],
                    this_current_screen_border=colors[6],
                    highlight_method="line",
                    margin_x=0,
                    **widget_defaults
                ),

                widget.WindowName(**widget_defaults),

                widget.KeyboardLayout(
                    fmt=' {}',
                    layout_groups=['us','es'],
                    **widget_defaults
                ),

                widget.Sep(padding=sep_padding),

                widget.CheckUpdates(
                    fmt=' {}',
                    display_format='{updates}',
                    colour_have_updates=colors[7],
                    colour_no_updates=colors[1],
                    distro='Arch',
                    **widget_defaults
                ),

                widget.Sep(padding=sep_padding),

                widget.Mpd2(
                    foreground=colors[5],
                    **widget_defaults
                ),

                widget.Sep(padding=sep_padding),

                widget.CPU(
                    **widget_defaults
                ),

                widget.Sep(padding=sep_padding),

                widget.Memory(
                    foreground=colors[8],
                    measure_mem='G',
                    **widget_defaults
                ),

                widget.Sep(padding=sep_padding),

                widget.BatteryIcon(
                    **widget_defaults
                ),

                widget.Sep(padding=sep_padding),

                widget.PulseVolume(
                    foreground=colors[10],
                    fmt='墳 {}',
                    **widget_defaults
                ),

                widget.Sep(padding=sep_padding),

                widget.Clock(
                    format='%Y/%m/%d %H:%M',
                    **widget_defaults
                ),

                widget.Sep(padding=sep_padding),

                widget.QuickExit(
                    default_text='',
                    countdown_format='{}',
                    **widget_defaults
                ),
            ],
            48,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='gimp'),
    Match(wm_class='Lxapperance'),
    Match(wm_class='maketag'),
    Match(wm_class='ssh-askpass'),
    Match(wm_class='qt5ct'),
    Match(wm_class='Qtconfig-qt4'),
    Match(wm_class='Blueman-manager'),
    Match(wm_class='GParted'),
    Match(wm_class='Skype'),
    Match(wm_class='zoom'),
    Match(wm_class='telegra-desktop'),
    Match(wm_class='Grub-customizer'),
    Match(wm_class='Gsimplecal'),
    Match(wm_class='arandr'),
    Match(wm_class='Nemo'),
    Match(wm_class='Gaia Sky'),
    Match(wm_class='RTS Engine'),
    Match(wm_class='obs'),
    Match(wm_class='.*starlink-topcat.*'),
    Match(wm_class='Audacity'),
    Match(wm_class='mpv'),
    Match(wm_class='FreeTube'),
    Match(wm_class='install4j-com-install4j-Install4JGUI'),
    Match(title='branchdialog'),
    Match(title='pinentry'),
    Match(title='Blender User Preferences'),
    Match(title='Blender Preferences'),
    Match(title='alsamixer'),
    Match(title='Volume Control'),
    Match(title='SteamVR Status'),
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# Automatic floating dialogs
@hook.subscribe.client_new
def floating_dialogs(window):
    dialog = window.window.get_wm_type() == 'dialog'
    transient = window.window.get_wm_transient_for()
    if dialog or transient:
        window.floating = True

# Autostart tray, applets, picom, etc.
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.dotfiles/X/autostart.sh'])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
