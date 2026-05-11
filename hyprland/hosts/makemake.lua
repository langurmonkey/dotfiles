-- ~/.dotfiles/hyprland/hosts/makemake.lua
local dots = os.getenv("HOME") .. "/.dotfiles/hyprland/"

-- Monitors
hl.monitor({
  output = "eDP-1",
  mode = "1920x1080@60",
  position = "0x0",
  scale = 1
})

-- HiDPI forcing for the internal display
hl.env("GDK_SCALE", "1")
hl.env("QT_SCALE_FACTOR", "1")
hl.env("QT_ENABLE_HIDPI_SCALING", "1")

-- Host-specific Cursor Overwrites
hl.env("HYPRCURSOR_SIZE", "20")
hl.env("XCURSOR_SIZE", "20")

-- Load the Shared Nvidia logic (which also loads Common)
local nvidiacfg = require("hosts.nvidia")
nvidiacfg.apply()
