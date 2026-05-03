-- ~/.dotfiles/hyprland/hosts/bonobo.lua
local dots = os.getenv("HOME") .. "/.dotfiles/hyprland/"

-- Monitors
hl.monitor("DVI-I-1", "1920x1080@60", "0x0", 1)

-- HiDPI forcing
hl.env("GDK_SCALE", "1")
hl.env("QT_SCALE_FACTOR", "1")
hl.env("QT_ENABLE_HIDPI_SCALING", "1")

-- Host-specific Overwrites
hl.env("HYPRCURSOR_SIZE", "20")
hl.env("XCURSOR_SIZE", "20")

-- Load Nvidia logic
local nvidia = require("hosts.nvidia")
nvidia.apply()
