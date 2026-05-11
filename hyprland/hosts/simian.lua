-- ~/.dotfiles/hyprland/hosts/simian.lua
local dots = os.getenv("HOME") .. "/.dotfiles/hyprland/"

-- Configure laptop screen
hl.monitor({
  output = "eDP-1",
  mode = "1920x1080@60",
  position = "0x0",
  scale = 1
})

-- Load the common configuration
require("common")
