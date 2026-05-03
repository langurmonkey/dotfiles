-- Global/Floating Rules
hl.windowrule({ "float", "center" }, { class = "wm-floating" })
hl.windowrule({ "float", "center", "size 1680 920" }, { class = "wm-floating-big" })

-- Simple App-to-Workspace mapping
local app_workspaces = {
    ["2 silent"] = { ".*qutebrowser.*", "firefox" },
    ["3 silent"] = { ".*Mail.*", "org.mozilla.Thunderbird" },
    ["4 silent"] = { ".*jetbrains-idea.*" },
    ["5 silent"] = { ".*steam.*", ".*steamwebhelper.*", ".*Terraria.*" },
    ["6 silent"] = { ".*freetube.*" },
    ["7 silent"] = { ".*resolve.*", ".*anythingllm-desktop.*", "LM-Studio" },
    ["8 silent"] = { ".*Godot.*" },
    ["9 silent"] = { ".*zoom.*", ".*telegram-desktop.*", ".*discord.*", ".*Signal.*" }
}

for ws, patterns in pairs(app_workspaces) do
    for _, pattern in ipairs(patterns) do
        hl.windowrule("workspace " .. ws, { class = pattern })
    end
end

-- Floating Apps & Special Titles
hl.windowrule("float", { title = "About .*" })
hl.windowrule("float", { class = "xdg-desktop-portal-gtk" })
hl.windowrule("float", { class = "nemo" })
hl.windowrule("float", { class = "mpv", center = true })
hl.windowrule("float", { class = "org.speedcrunch.speedcrunch", center = true })

-- Thunderbird Specifics
hl.windowrule("float", { class = "org.mozilla.Thunderbird", title = ".*Reminder[s]?" })
hl.windowrule("float", { class = "org.mozilla.Thunderbird", title = "Write: .*" })

-- Picture-in-picture (using Lua math for screen calculations)
hl.windowrule({
    "float", "pin",
    "move 67% 72%", -- You can use percentages in Lua now!
    "size 33% 28%"
}, { title = "^(Picture in picture|Picture-in-picture|Picture-in-Picture)$" })

-- Jetbrains/IntelliJ Fixes
hl.windowrule("maximize", { class = "^(jetbrains-.*)$", initial_title = "^\\s$" })
hl.windowrule({ "border_size 0", "no_focus" }, { class = "^(jetbrains-.*)$", title = "^(win.*)$", float = 1 })
