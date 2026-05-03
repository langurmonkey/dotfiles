hl.config({
    animations = {
        enabled = true,
        bezier = {
            { name = "myBezier", 0.05, 0.9, 0.1, 1.05 }
        },
        animation = {
            { name = "windows",    enabled = 1, speed = 4, curve = "myBezier" },
            { name = "windowsOut", enabled = 1, speed = 4, curve = "default", style = "popin 80%" },
            { name = "border",     enabled = 1, speed = 4, curve = "default" },
            { name = "borderangle",enabled = 1, speed = 4, curve = "default" },
            { name = "fade",        enabled = 1, speed = 4, curve = "default" },
            { name = "workspaces",  enabled = 1, speed = 4, curve = "default" }
        }
    }
})
