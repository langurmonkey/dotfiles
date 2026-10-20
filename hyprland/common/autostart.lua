-- Exec-once (Autostart)
local home = os.getenv("HOME")
hl.on("hyprland.start", function()
  local autostart = {
    home .. "/.dotfiles/bin/run-portals",
    -- "uwsm app -- histuid",
    "uwsm app -- udiskie -f " .. home .. "/.dotfiles/bin/ranger-term --tray",
    "uwsm app -- hypridle",
    "uwsm app -- gnome-keyring-daemon --start --components=secrets",
    "uwsm app -- noctalia",
  }

  for _, cmd in ipairs(autostart) do
    hl.exec_cmd(cmd)
  end
end)
