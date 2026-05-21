-- Exec-once (Autostart)
local home = os.getenv("HOME")
hl.on("hyprland.start", function () 
    local autostart = {
        home .. "/.dotfiles/bin/run-portals",
        "uwsm app -- fnott",
        "uwsm app -- playerctld",
        "uwsm app -- blueman-tray",
        "uwsm app -- nm-applet --indicator",
        "uwsm app -- udiskie -f " .. home .. "/.dotfiles/bin/ranger-term --tray",
        "uwsm app -- hypridle",
        "uwsm app -- mpDris2",
        "uwsm app -- gnome-keyring-daemon --start --components=secrets",
        "uwsm app -- waybar",
        "uwsm app -- env QT_SCALE_FACTOR=1 vicinae server",
    }

    for _, cmd in ipairs(autostart) do
        hl.exec_cmd(cmd)
    end
end)

