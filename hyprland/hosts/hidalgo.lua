-- ~/.dotfiles/hyprland/hosts/hidalgo.lua
local dots = os.getenv("HOME") .. "/.dotfiles/hyprland/"

-- Monitors
hl.monitor("DVI-D-1", "1920x1080@60", "0x0", 1)
hl.monitor("DP-2", "3860x2560@60", "1920x0", 2)

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
local nvidia = require("hosts.nvidia")
nvidia.apply()
