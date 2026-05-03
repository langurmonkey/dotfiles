-- ~/.dotfiles/hyprland/common/init.lua
-- Contains the bulk of the Hyprland configuration for all hosts

print(">>> HYPRLAND LUA CONFIG LOADED SUCCESSFULLY <<<")

local home = os.getenv("HOME")

-- 1. Monitors & Ecosystem
hl.monitor("", "preferred", "auto", "auto")
hl.config({ ecosystem = { no_donation_nag = true } })

-- 2. Exec-once (Autostart)
-- Using a list for cleaner reading
local autostart = {
    "uwsm app -- fnott",
    "uwsm app -- playerctld",
    "uwsm app -- blueman-tray",
    "uwsm app -- nm-applet --indicator",
    "uwsm app -- udiskie -f " .. home .. "/.dotfiles/bin/ranger-term --tray",
    "uwsm app -- hypridle",
    "dbus-update-activation-environment DISPLAY XAUTHORITY WAYLAND_DISPLAY",
    "uwsm app -- gnome-keyring-daemon --start --components=secrets",
    "uwsm app -- " .. home .. "/.dotfiles/bin/launch-waybar",
    "uwsm app -- mpDris2",
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
    home .. "/.dotfiles/bin/run-portals"
}

for _, cmd in ipairs(autostart) do
    hl.exec_once(cmd)
end

-- 3. Environment Variables
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

-- 4. Main Configuration Table
hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true
    },

    xwayland = {
        force_zero_scaling = true
    },

    input = {
        kb_layout = "us,es",
        kb_variant = "altgr-intl",
        kb_model = "pc104",
        kb_options = "grp:alt_space_toggle,caps:swapescape,eurosign:5",
        numlock_by_default = true,
        repeat_delay = 200,
        repeat_rate = 45,
        follow_mouse = 1,
        touchpad = {
            natural_scroll = false
        },
        sensitivity = 0
    },

    general = {
        gaps_in = 3,
        gaps_out = 6,
        border_size = 2,
        ["col.active_border"] = "rgba(5984ffff)",
        ["col.inactive_border"] = "rgba(666666aa)",
        layout = "dwindle"
    },

    group = {
        ["col.border_active"] = "rgba(44aa29ff)",
        ["col.border_inactive"] = "rgba(666666aa)",
        groupbar = {
            ["col.active"] = "rgba(44aa29ff)",
            ["col.inactive"] = "rgba(666666aa)",
            render_titles = true
        }
    },

    decoration = {
        rounding = 12,
        blur = {
            enabled = true,
            size = 8,
            passes = 1
        },
        shadow = {
            enabled = true
        }
    },

    dwindle = {
        pseudotile = true,
        preserve_split = true,
        force_split = 2
    },

    master = {
        new_status = "master"
    }
})

-- 5. Sourcing Sub-configs
require("common.windowrules")
require("common.bindings")
require("common.animations-base")
--require("common.animations-fancy")
