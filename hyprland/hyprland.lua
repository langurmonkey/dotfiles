-- ~/.dotfiles/hyprland/hyprland.lua

local home = os.getenv("HOME")
local config_root = home .. "/.dotfiles/hyprland/"

-- 1. Setup Package Path for subdirectories
package.path = package.path .. ";" .. config_root .. "?.lua"
package.path = package.path .. ";" .. config_root .. "?/init.lua"

-- 2. Detect Hostname
local hostname = os.getenv("HOSTNAME")
-- Fallback in case $HOSTNAME isn't exported in your environment
if not hostname or hostname == "" then
    -- Try reading /etc/hostname directly to avoid spawning a shell
    local f = io.open("/etc/hostname", "r")
    if f then
        hostname = f:read("*l"):gsub("%s+", "")
        f:close()
    else
        hostname = "unknown"
    end
end

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
