-- ~/.dotfiles/hyprland/hosts/hidalgo.lua
local dots = os.getenv("HOME") .. "/.dotfiles/hyprland/"

-- Monitors
hl.monitor({
    output = "DVI-D-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = 1
})
hl.monitor({
    output = "DP-2",
    mode = "3860x2560@60",
    position = "1920x0",
    scale = 1.25
})

-- Host-specific Overwrites
hl.env("HYPRCURSOR_SIZE", "30")
hl.env("XCURSOR_SIZE", "30")

-- Device-specific (Wacom)
hl.config({
    device = {
        {
            name = "wacom-intuos-bt-s-pen",
            output = "DP-2"
        }
    }
})

-- Load Nvidia logic
local nvidiacfg = require("hosts.nvidia")
nvidiacfg.apply()
