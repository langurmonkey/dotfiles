hl.config({
    animations = {
        enabled = true,
        bezier = {
            { name = "wind",   0.05, 0.9, 0.1, 1.05 },
            { name = "winIn",  0.1, 1.1, 0.1, 1.1 },
            { name = "winOut", 0.3, -0.3, 0, 1 },
            { name = "liner",  1, 1, 1, 1 }
        },
        animation = {
            { name = "windows",     enabled = 1, speed = 6, curve = "wind",   style = "slide" },
            { name = "windowsIn",   enabled = 1, speed = 6, curve = "winIn",  style = "slide" },
            { name = "windowsOut",  enabled = 1, speed = 5, curve = "winOut", style = "slide" },
            { name = "windowsMove", enabled = 1, speed = 5, curve = "wind",   style = "slide" },
            { name = "border",      enabled = 1, speed = 1, curve = "liner" },
            { name = "borderangle", enabled = 1, speed = 30,curve = "liner",  style = "loop" },
            { name = "fade",        enabled = 1, speed = 10,curve = "default" },
            { name = "workspaces",  enabled = 1, speed = 5, curve = "wind" }
        }
    }
})
