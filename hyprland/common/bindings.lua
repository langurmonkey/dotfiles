--------------------------------
----        BINDS           ----
--------------------------------

local mod  = "SUPER"
local home = os.getenv("HOME")

-- Default programs
local term = "kitty"
local menu = "rofi"

--------------------------------
---- INPUT CONFIGURATION    ----
--------------------------------

hl.config({
    input = {
        kb_layout           = "us,es",
        kb_variant          = "altgr-intl",
        kb_model            = "pc104",
        kb_options          = "grp:alt_space_toggle,caps:swapescape,eurosign:5",
        numlock_by_default  = true,
        repeat_delay        = 200,
        repeat_rate         = 45,
        follow_mouse        = 1,
        touchpad = {
            natural_scroll  = false,
        },
        sensitivity         = 0,
    },
    cursor = {
        -- This is likely the "centering" culprit. 
        -- It prevents the cursor from teleporting to a window's center on focus change.
        no_warps = true,
        
        -- Prevents the mouse from being moved to the window center 
        -- when changing focus via keyboard.
        enable_hyprcursor = true, 
    },
})
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

--------------------------------
---- BASIC DISPATCHERS      ----
--------------------------------

hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(term .. " --working-directory $(" .. home .. "/.dotfiles/bin/hyprcwd)"))
hl.bind(mod .. " + Q",      hl.dsp.window.kill())
hl.bind(mod .. " + escape", hl.dsp.exec_cmd(menu .. " -show power-menu -modi power-menu:" .. home .. "/.dotfiles/bin/rofi-power-menu"))

--------------------------------
---- APPLICATIONS           ----
--------------------------------

hl.bind(mod .. " + CONTROL + W", hl.dsp.exec_cmd("uwsm app -- firefox"))
hl.bind(mod .. " + SHIFT + W", hl.dsp.exec_cmd("uwsm app -- env QT_SCALE_FACTOR=1 qutebrowser --qt-flag enable-gpu-rasterization"))
hl.bind(mod .. " + SHIFT + T", hl.dsp.exec_cmd("uwsm app -- thunderbird"))
hl.bind(mod .. " + SHIFT + A", hl.dsp.exec_cmd("fnottctl actions"))
hl.bind(mod .. " + SHIFT + Z", hl.dsp.exec_cmd("uwsm app -- hyprlock"))
hl.bind(mod .. " + Z",     hl.dsp.exec_cmd(menu .. " -show drun"))
hl.bind(mod .. " + X",     hl.dsp.exec_cmd(menu .. " -show window"))
hl.bind(mod .. " + equal", hl.dsp.exec_cmd(menu .. " -show calc"))
hl.bind(mod .. " + C",     hl.dsp.exec_cmd("speedcrunch"))
hl.bind(mod .. " + E",     hl.dsp.exec_cmd("rofimoji"))
hl.bind(mod .. " + SHIFT + E", hl.dsp.exec_cmd("uwsm app -- neovide"))

--------------------------------
---- WINDOW LAYOUT          ----
--------------------------------

hl.bind(mod .. " + W", hl.dsp.group.toggle())
hl.bind(mod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen())

--------------------------------
---- FOCUS                  ----
--------------------------------

local dirs = { h = "left", l = "right", k = "up", j = "down" }
for key, dir in pairs(dirs) do
    hl.bind(mod .. " + " .. key,          hl.dsp.focus({ direction = dir }))
end

--------------------------------
---- MOVE WINDOWS           ----
--------------------------------

for key, dir in pairs(dirs) do
    hl.bind(mod .. " + SHIFT + " .. key,         hl.dsp.window.move({ direction = dir }))
    hl.bind(mod .. " + SHIFT + " .. key:upper(), hl.dsp.window.move({ direction = dir }))
end

--------------------------------
---- WORKSPACES             ----
--------------------------------

for i = 1, 9 do
    local ws = tostring(i)
    hl.bind(mod .. " + " .. ws,                hl.dsp.focus({ workspace = ws }))
    hl.bind(mod .. " + SHIFT + " .. ws, hl.dsp.window.move({ workspace = ws }))
end

-- Workspace 10
hl.bind(mod .. " + 0",                       hl.dsp.focus({ workspace = 10 }))
hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Relative Workspace Moves
hl.bind(mod .. " + SHIFT + P", hl.dsp.window.move({ workspace = 1, relative = true }))
hl.bind(mod .. " + SHIFT + O", hl.dsp.window.move({ workspace = -1, relative = true }))

-- Move current workspace to monitor
hl.bind(mod .. " + P", hl.dsp.workspace.move({ monitor = "r" }))
hl.bind(mod .. " + O", hl.dsp.workspace.move({ monitor = "l" }))

-- Scroll through workspaces
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "m-1" }))

--------------------------------
---- SCRATCHPAD             ----
--------------------------------

hl.bind(mod .. " + SHIFT + minus", hl.dsp.window.move({ workspace = "special", silent = true }))
hl.bind(mod .. " + minus",                  hl.dsp.workspace.toggle_special())

--------------------------------
---- RESIZE                 ----
--------------------------------


local resize_val = 30
hl.bind(mod .. " + CONTROL + right", hl.dsp.window.resize({ x =  resize_val, y =  0, relative = true }), { repeating = true })
hl.bind(mod .. " + CONTROL + l",     hl.dsp.window.resize({ x =  resize_val, y =  0, relative = true  }), { repeating = true })
hl.bind(mod .. " + CONTROL + left",  hl.dsp.window.resize({ x = -resize_val, y =  0, relative = true  }), { repeating = true })
hl.bind(mod .. " + CONTROL + h",     hl.dsp.window.resize({ x = -resize_val, y =  0 }), { repeating = true })
hl.bind(mod .. " + CONTROL + up",    hl.dsp.window.resize({ x =  0, y = -resize_val, relative = true  }), { repeating = true })
hl.bind(mod .. " + CONTROL + k",     hl.dsp.window.resize({ x =  0, y = -resize_val, relative = true  }), { repeating = true })
hl.bind(mod .. " + CONTROL + down",  hl.dsp.window.resize({ x =  0, y =  resize_val, relative = true  }), { repeating = true })
hl.bind(mod .. " + CONTROL + j",     hl.dsp.window.resize({ x =  0, y =  resize_val, relative = true  }), { repeating = true })

--------------------------------
---- MOUSE                  ----
--------------------------------

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--------------------------------
---- SCREENSHOTS            ----
--------------------------------

local screenshot_dir  = home .. "/Pictures/Screenshots"
local screenshot_name = "Screenshot_$(date -u +%Y-%m-%dT%H:%M:%S).jpg"

hl.bind("Print",                       hl.dsp.exec_cmd("hyprshot -o " .. screenshot_dir .. " -f " .. screenshot_name .. " -m output"))
hl.bind(mod .. " + Print",             hl.dsp.exec_cmd("hyprshot -o " .. screenshot_dir .. " -f " .. screenshot_name .. " -m region"))
hl.bind(mod .. " + CONTROL + Print", hl.dsp.exec_cmd("hyprshot -o " .. screenshot_dir .. " -f " .. screenshot_name .. " -m window"))
hl.bind(mod .. " + ALT + P", hl.dsp.exec_cmd("hyprpicker -a"))

--------------------------------
---- MEDIA / AUDIO          ----
--------------------------------

hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),  { locked = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),      { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioMute",  hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +1%"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -1%"), { locked = true, repeating = true })

hl.bind(mod .. " + CONTROL + 0", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +1%"), { repeating = true })
hl.bind(mod .. " + CONTROL + 9", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -1%"), { repeating = true })
hl.bind(mod .. " + CONTROL + P",      hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind(mod .. " + CONTROL + S",      hl.dsp.exec_cmd("playerctl stop"))
hl.bind(mod .. " + CONTROL + Z",      hl.dsp.exec_cmd("mpc random"))
hl.bind(mod .. " + CONTROL + period", hl.dsp.exec_cmd("playerctl next"))
hl.bind(mod .. " + CONTROL + comma",  hl.dsp.exec_cmd("playerctl previous"))
hl.bind(mod .. " + CONTROL + M", hl.dsp.exec_cmd(term .. " --class=wm-floating-big ncmpcpp"))

--------------------------------
---- BRIGHTNESS             ----
--------------------------------

hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })
hl.bind("CONTROL + XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s 2%+"),  { locked = true, repeating = true })
hl.bind("CONTROL + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 2%-"),  { locked = true, repeating = true })

--------------------------------
---- MONITOR OFF            ----
--------------------------------

hl.bind(mod .. " + F8", function()
    hl.timer(function()
        hl.dispatch(hl.dsp.dpms({ action = "disable" }))
    end, { timeout = 500, type = "oneshot" })
end)
