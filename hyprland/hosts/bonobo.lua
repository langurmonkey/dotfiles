-- ~/.dotfiles/hyprland/hosts/bonobo.lua
local dots = os.getenv("HOME") .. "/.dotfiles/hyprland/"

-- Monitors
hl.monitor({
  output = "DVI-I-1",
  mode = "1920x1080@60",
  position = "0x0",
  scale = 1
})

-- HiDPI forcing
hl.env("GDK_SCALE", "1")
hl.env("QT_SCALE_FACTOR", "1")
hl.env("QT_ENABLE_HIDPI_SCALING", "1")

-- Host-specific Overwrites
hl.env("HYPRCURSOR_SIZE", "20")
hl.env("XCURSOR_SIZE", "20")

-- Load Nvidia logic
local nvidiacfg = require("hosts.nvidia")
nvidiacfg.apply()
