hl.config({
    windowrule = {
        -- Global/floating rules
        "float, center, class:wm-floating",
        "float, center, size 1680 920, class:wm-floating-big",

        -- App-to-workspace
        "workspace 2 silent, class:(qutebrowser|firefox)",
        "workspace 3 silent, class:(Mail|org.mozilla.Thunderbird)",
        "workspace 4 silent, class:jetbrains-idea",
        "workspace 5 silent, class:(steam|steamwebhelper|Terraria)",
        "workspace 6 silent, class:freetube",
        "workspace 7 silent, class:(resolve|anythingllm-desktop|LM-Studio)",
        "workspace 8 silent, class:Godot",
        "workspace 9 silent, class:(zoom|telegram-desktop|discord|Signal)",
        
        -- Floating Apps
        "float, title:About .*",
        "float, class:xdg-desktop-portal-gtk",
        "float, class:nemo",
        "float, center, class:mpv",
        "float, center, class:org.speedcrunch.speedcrunch",
        
        -- Thunderbird
        "float, class:org.mozilla.Thunderbird, title:.*Reminder[s]?",
        "float, class:org.mozilla.Thunderbird, title:Write: .*",
        
        -- Picture-in-picture
        "float, pin, move 67% 72%, size 33% 28%, title:^(Picture in picture|Picture-in-picture|Picture-in-Picture)$",
        
        -- Jetbrains
        "maximize, class:^(jetbrains-.*)$, initialTitle:^\\s$",
        "border_size 0, no_focus, class:^(jetbrains-.*)$, title:^(win.*)$, float:1",
    }
})
