-- ~/.dotfiles/hyprland/common/init.lua
-- Contains the bulk of the Hyprland configuration for all hosts
local home = os.getenv("HOME")

-- Monitors & Ecosystem
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})
hl.config({ ecosystem = { no_donation_nag = true } })


-- Exec-once (Autostart)
hl.on("hyprland.start", function () 
    local autostart = {
        home .. "/.dotfiles/bin/run-portals",
        "uwsm app -- fnott",
        "uwsm app -- playerctld",
        "uwsm app -- blueman-tray",
        "uwsm app -- nm-applet --indicator",
        "uwsm app -- udiskie -f " .. home .. "/.dotfiles/bin/ranger-term --tray",
        "uwsm app -- hypridle",
        "uwsm app -- mpDris2",
        "uwsm app -- gnome-keyring-daemon --start --components=secrets",
        "uwsm app -- waybar",
    }

    for _, cmd in ipairs(autostart) do
        hl.exec_cmd(cmd)
    end
end)

-- Environment Variables
local envs = {
    HYPRCURSOR_THEME = "McMojave",
    XCURSOR_THEME = "McMojave",
    HYPRCURSOR_SIZE = "24",
    XCURSOR_SIZE = "24",
    XDG_SESSION_TYPE = "wayland",
    GDK_BACKEND = "wayland",
    QT_QPA_PLATFORM = "wayland",
    _JAVA_AWT_WM_NONREPARENTING = "1"
}

for k, v in pairs(envs) do
    hl.env(k, v)
end

-- Main Configuration Table
hl.config({
    xwayland = {
        force_zero_scaling = true
    },

    -- General group
    -- Input is in bindings.lua
    general = {
        gaps_in = 3,
        gaps_out = 6,
        border_size = 2,
        col = {
            active_border   = { colors = {"rgba(2944ffff)", "rgba(128599ff)"}, angle = 90 },
            inactive_border = "rgba(666666aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle"
    },

    decoration = {
        rounding = 12,
        rounding_power = 2,
        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },
    },

    -- Dwindle layout
    dwindle = {
        preserve_split = true,
        force_split = 2
    },
    -- Master layout
    master = {
        new_status = "master",
    },
    -- Scrolling layout
    scrolling = {
        fullscreen_on_one_column = true,
    },

    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_splash_rendering = true,
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})

-- Sourcing Sub-configs
require("common.windowrules")
require("common.bindings")
require("common.animations-base")
