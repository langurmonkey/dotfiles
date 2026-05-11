local mod = "SUPER"
local mod2 = "ALT"
local term = "kitty"
local home = os.getenv("HOME")

-- Basic Dispatchers
hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(term .. " --working-directory $(" .. home .. "/.dotfiles/bin/hyprcwd)"))
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + escape", hl.dsp.exec_cmd("rofi -show power-menu -modi power-menu:" .. home .. "/.dotfiles/bin/rofi-power-menu"))

-- Apps
hl.bind(mod .. " + CONTROL + W", hl.dsp.exec_cmd("uwsm app -- firefox"))
hl.bind(mod .. " + SHIFT + W", hl.dsp.exec_cmd("uwsm app -- env QT_SCALE_FACTOR=1 qutebrowser"))
hl.bind(mod .. " + Z", hl.dsp.exec_cmd("rofi -show drun"))

-- Focus & Windows - use raw dispatch
local dirs = { h = "l", l = "r", k = "u", j = "d" }
for key, dir in pairs(dirs) do
    hl.bind(mod .. " + " .. key, function() hl.dispatch(hl.dsp.exec_raw("movefocus " .. dir)) end)
    hl.bind(mod .. " + SHIFT + " .. key, function() hl.dispatch(hl.dsp.exec_raw("movewindow " .. dir)) end)
end

hl.bind(mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mod .. " + W", hl.dsp.group.toggle())
hl.bind(mod .. " + T", hl.dsp.window.float({ action = "toggle" }))

-- Workspaces - use raw dispatch
for i = 1, 9 do
    local ws_num = tostring(i)
    hl.bind(mod .. " + " .. ws_num, function() hl.dispatch(hl.dsp.exec_raw("workspace " .. ws_num)) end)
    hl.bind(mod .. " + SHIFT + " .. ws_num, function() hl.dispatch(hl.dsp.exec_raw("movetoworkspace " .. ws_num)) end)
end
hl.bind(mod .. " + 0", function() hl.dispatch(hl.dsp.exec_raw("workspace 10")) end)

-- Resizing
-- local resize_keys = { h = "-30 0", l = "30 0", k = "0 -30", j = "0 30" }
-- for key, val in pairs(resize_keys) do
--     hl.bind(mod .. " + CONTROL + " .. key, hl.dsp.resizeactive(val), { repeating = true })
-- end

-- Mouse Binds
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

