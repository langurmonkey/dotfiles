hl.config({
    animations = {
        enabled = true
    }
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
-- Bezier curves
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("overshoot",      { type = "bezier", points = { {0.5, 0.9},   {0.1, 1.1}   } })

-- Springs
hl.curve("bouncy",         { type = "spring", mass = 3,   stiffness = 80, dampening = 10 })
hl.curve("easy",           { type = "spring", mass = 2,   stiffness = 50, dampening = 10 })
hl.curve("spring_ws",      { type = "spring", mass = 1.2, stiffness = 30, dampening = 8  })
hl.curve("spring_win",     { type = "spring", mass = 1,   stiffness = 30, dampening = 8 })


hl.animation({ leaf = "global",      enabled = true, speed = 5,   bezier = "quick" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 7,   spring = "spring_ws",  style="slide" })
hl.animation({ leaf = "windows",     enabled = true, speed = 10,  spring = "spring_win", style = "slide" })
