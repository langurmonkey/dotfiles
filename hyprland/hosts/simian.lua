-- ~/.dotfiles/hyprland/hosts/simian.lua
local dots = os.getenv("HOME") .. "/.dotfiles/hyprland/"

-- Configure laptop screen
hl.monitor("eDP-1", "1920x1080@60", "0x0", 1)

-- Load the common configuration
dofile(dots .. "hyprland-common.lua")
