local mod = "SUPER"
local mod2 = "ALT"
local term = "kitty"
local home = os.getenv("HOME")

-- Basic Dispatchers
hl.bind(mod, "RETURN", hl.dsp.exec(term .. " --working-directory $(" .. home .. "/.dotfiles/bin/hyprcwd)"))
hl.bind(mod, "Q", hl.dsp.killactive())
hl.bind(mod, "escape", hl.dsp.exec("rofi -show power-menu -modi power-menu:" .. home .. "/.dotfiles/bin/rofi-power-menu"))

-- Apps
hl.bind(mod .. " CONTROL", "W", hl.dsp.exec("uwsm app -- firefox"))
hl.bind(mod .. " SHIFT", "W", hl.dsp.exec("uwsm app -- env QT_SCALE_FACTOR=1 qutebrowser"))
hl.bind(mod, "Z", hl.dsp.exec("rofi -show drun"))

-- Focus & Windows
local dirs = { h = "l", l = "r", k = "u", j = "d", left = "l", right = "r", up = "u", down = "d" }
for key, dir in pairs(dirs) do
    hl.bind(mod, key, hl.dsp.movefocus(dir))
    hl.bind(mod .. " SHIFT", key, hl.dsp.movewindow(dir))
end

hl.bind(mod, "F", hl.dsp.fullscreen())
hl.bind(mod, "W", hl.dsp.togglegroup())
hl.bind(mod, "T", hl.dsp.togglefloating())

-- Workspaces
for i = 1, 9 do
    hl.bind(mod, tostring(i), hl.dsp.workspace(i))
    hl.bind(mod .. " SHIFT", tostring(i), hl.dsp.movetoworkspace(i))
end
hl.bind(mod, "0", hl.dsp.workspace(10))

-- Resizing (Using 'binde' for repeat)
local resize_keys = { h = "-30 0", l = "30 0", k = "0 -30", j = "0 30" }
for key, val in pairs(resize_keys) do
    hl.bind(mod .. " CONTROL", key, hl.dsp.resizeactive(val), { repeat = true })
end

-- Mouse Binds
hl.bind(mod, "mouse:272", hl.dsp.movewindow(), { mouse = true })
hl.bind(mod, "mouse:273", hl.dsp.resizewindow(), { mouse = true })

-- Media keys (Empty string for no modifier)
hl.bind("", "XF86AudioPlay", hl.dsp.exec("playerctl play-pause"))
hl.bind("", "XF86AudioRaiseVolume", hl.dsp.exec("pactl set-sink-volume @DEFAULT_SINK@ +1%"), { repeat = true })
