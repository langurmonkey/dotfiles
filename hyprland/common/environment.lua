-- Environment Variables
local envs = {
    HYPRCURSOR_THEME = "McMojave",
    XCURSOR_THEME = "McMojave",
    HYPRCURSOR_SIZE = "24",
    XCURSOR_SIZE = "24",
    XDG_SESSION_TYPE = "wayland",
    GDK_BACKEND = "wayland",
    QT_QPA_PLATFORM = "wayland",
    _JAVA_AWT_WM_NONREPARENTING = "1"
}

for k, v in pairs(envs) do
    hl.env(k, v)
end
