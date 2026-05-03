-- ~/.dotfiles/hyprland/hyprland.lua

local home = os.getenv("HOME")
local config_root = home .. "/.dotfiles/hyprland/"

-- 1. Setup Package Path for subdirectories
package.path = package.path .. ";" .. config_root .. "?.lua"
package.path = package.path .. ";" .. config_root .. "?/init.lua"

-- 2. Detect Hostname
local handle = io.popen("hostname")
local hostname = handle:read("*a"):gsub("%s+", "")
handle:close()

-- 3. Load Host-Specific Config
-- We try to load 'hosts.<hostname>'. 
-- Using pcall prevents a crash if the host file is missing.
local status, host = pcall(require, "hosts." .. hostname)

if not status then
    -- Fallback for unknown hosts
    hl.monitor("", "preferred", "auto", 1)
    print("No host config found for: " .. hostname .. ". Error: " .. host)
end

-- 4. Load Common Core
-- This looks for common/init.lua
require("common")
