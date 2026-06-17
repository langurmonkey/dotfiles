-- Main Configuration Table
hl.config({
    xwayland = {
        force_zero_scaling = true
    },

    -- General group
    -- Input is in bindings.lua
    general = {
        gaps_in = 3,
        gaps_out = 6,
        border_size = 2,
        col = {
            active_border   = { colors = {"rgba(2944ffff)", "rgba(128599ff)"}, angle = 90 },
            inactive_border = "rgba(666666aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "scrolling"
    },

    decoration = {
        rounding = 12,
        rounding_power = 2,
        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },
    },

    -- Dwindle layout
    dwindle = {
        preserve_split = true,
        force_split = 2
    },
    -- Master layout
    master = {
        new_status = "master",
    },
    -- Scrolling layout
    scrolling = {
        fullscreen_on_one_column = true,
        column_width = 0.5,
        follow_min_visible = 0.01,
    },

    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_splash_rendering = true,
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})

