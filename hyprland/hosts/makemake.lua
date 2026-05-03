-- ~/.dotfiles/hyprland/hosts/makemake.lua
local dots = os.getenv("HOME") .. "/.dotfiles/hyprland/"

-- Monitors
hl.monitor("eDP-1", "1920x1080@60", "0x0", 1)

-- HiDPI forcing for the internal display
hl.env("GDK_SCALE", "1")
hl.env("QT_SCALE_FACTOR", "1")
hl.env("QT_ENABLE_HIDPI_SCALING", "1")

-- Host-specific Cursor Overwrites
hl.env("HYPRCURSOR_SIZE", "20")
hl.env("XCURSOR_SIZE", "20")

-- Load the Shared Nvidia logic (which also loads Common)
local nvidia = require("hosts.nvidia")
nvidia.apply()
