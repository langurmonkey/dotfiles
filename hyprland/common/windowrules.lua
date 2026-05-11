--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/


--------------------------------
---- GLOBAL RULES           ----
--------------------------------

hl.window_rule({
    name  = "floating",
    match = { class = "wm-floating" },

    float  = true,
    center = true,
})

hl.window_rule({
    name  = "floating-big",
    match = { class = "wm-floating-big" },

    float  = true,
    size   = "1680 920",
    center = true,
})


--------------------------------
---- APPLICATIONS TO        ----
---- WORKSPACES             ----
--------------------------------

hl.window_rule({
    name  = "qutebrowser",
    match = { class = ".*qutebrowser.*" },

    workspace = "2 silent",
})

hl.window_rule({
    name  = "firefox",
    match = { class = "firefox" },

    workspace = "2 silent",
})

hl.window_rule({
    name  = "mail",
    match = { class = ".*Mail.*" },

    workspace = "3 silent",
})

hl.window_rule({
    name  = "intellij-idea",
    match = { class = ".*jetbrains-idea.*" },

    workspace = "4 silent",
})

hl.window_rule({
    name  = "steam",
    match = { class = ".*steam.*" },

    workspace = "5 silent",
})

hl.window_rule({
    name  = "steam-webhelper",
    match = { class = ".*steamwebhelper.*" },

    workspace = "5 silent",
})

hl.window_rule({
    name  = "topcat",
    match = { class = "uk-ac-starlink-topcat-Driver" },

    workspace = "8 silent",
    float     = true,
})

hl.window_rule({
    name  = "terraria",
    match = { class = ".*Terraria.*" },

    workspace = "5 silent",
    float     = true,
})

hl.window_rule({
    name  = "freetube",
    match = { class = ".*freetube.*" },

    workspace = "6 silent",
})

hl.window_rule({
    name  = "davinci-resolve",
    match = { class = ".*resolve.*" },

    workspace = "7 silent",
})

hl.window_rule({
    name  = "anythingllm",
    match = { class = ".*anythingllm-desktop.*" },

    workspace = "7 silent",
})

hl.window_rule({
    name  = "lm-studio",
    match = { class = "LM-Studio" },

    workspace = "7 silent",
})

hl.window_rule({
    name  = "godot",
    match = { class = ".*Godot.*" },

    workspace = "8 silent",
})

hl.window_rule({
    name  = "zoom",
    match = { class = ".*zoom.*" },

    workspace = "9 silent",
})

hl.window_rule({
    name  = "telegram",
    match = { class = ".*telegram-desktop.*" },

    workspace = "9 silent",
})

hl.window_rule({
    name  = "discord",
    match = { class = ".*discord.*" },

    workspace = "9 silent",
})

hl.window_rule({
    name  = "signal",
    match = { class = ".*Signal.*" },

    workspace = "9 silent",
})


--------------------------------
---- POSITIONS AND FLOATS   ----
--------------------------------

hl.window_rule({
    name  = "about-windows",
    match = { title = "About .*" },

    float = true,
})

hl.window_rule({
    name  = "gtk-file-picker",
    match = { class = "xdg-desktop-portal-gtk" },

    float = true,
})

hl.window_rule({
    name  = "obs",
    match = { class = "hyprland-share-picker|com.obsproject.Studio" },

    float = true,
})

hl.window_rule({
    name  = "sc2000",
    match = { title = "SimCity 2000.*" },

    float = true,
})

hl.window_rule({
    name  = "nemo",
    match = { class = "nemo" },

    float = true,
})

hl.window_rule({
    name  = "PlayKid",
    match = { title = "Play Kid" },

    float = true,
})

hl.window_rule({
    name  = "gaiasky",
    match = {
        class = "Gaia Sky.*",
        title = "Gaia Sky.*",
    },

    float = true,
})

hl.window_rule({
    name  = "bluemanmanager",
    match = { class = "blueman-manager" },

    float  = true,
    center = true,
})

hl.window_rule({
    name  = "networkmanager",
    match = { class = "nm-connection-editor" },

    float  = true,
    center = true,
})

hl.window_rule({
    name  = "mpv",
    match = { class = "mpv" },

    float  = true,
    center = true,
})

hl.window_rule({
    name  = "speedcrunch",
    match = { class = "org.speedcrunch.speedcrunch" },

    float  = true,
    center = true,
})


--------------------------------
---- THUNDERBIRD            ----
--------------------------------

hl.window_rule({
    name  = "thunderbird",
    match = { class = "org.mozilla.Thunderbird" },

    workspace = "3 silent",
})

hl.window_rule({
    name  = "thunderbird-reminder",
    match = {
        class = "org.mozilla.Thunderbird",
        title = ".*Reminders?",
    },

    float = true,
})

hl.window_rule({
    name  = "thunderbird-feed",
    match = {
        class = "org.mozilla.Thunderbird",
        title = "Feed Subscriptions",
    },

    float = true,
})

hl.window_rule({
    name  = "thunderbird-write",
    match = {
        class = "org.mozilla.Thunderbird",
        title = "Write: .*",
    },

    float = true,
})


--------------------------------
---- MISC FLOATS            ----
--------------------------------

hl.window_rule({
    name  = "zenity",
    match = { class = ".*zenity.*" },

    float = true,
})

hl.window_rule({
    name  = "export-image",
    match = { title = "Export Image as.*" },

    float = true,
})


--------------------------------
---- PICTURE-IN-PICTURE     ----
--------------------------------

hl.window_rule({
    name  = "picture-in-picture",
    match = { title = "^(Picture in picture|Picture-in-picture|Picture-in-Picture)$" },

    float = true,
    pin   = true,
    move  = "(monitor_w*0.67) (monitor_h*0.72)",
    size  = "(monitor_w*0.33) (monitor_h*0.28)",
})


--------------------------------
---- INTELLIJ               ----
--------------------------------

-- Start IntelliJ/PhpStorm correctly (maximize on splash/empty title)
hl.window_rule({
    name  = "intellij-php",
    match = {
        class         = "^jetbrains-.*$",
        initial_title = "^\\s$",
    },

    maximize = true,
})

-- No Hyprland border around popups
hl.window_rule({
    name  = "intellij-popups",
    match = {
        class = "^jetbrains-.*$",
        title = "^win.*$",
        float = true,
    },

    border_size = 0,
    no_focus    = true,
})
