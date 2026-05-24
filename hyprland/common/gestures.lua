-- Super+DOWN: close
hl.gesture({
  fingers = 3,
  direction = "down",
  mods = "SUPER",
  action = "close" })

-- Super+UP: fullscreen
hl.gesture({
  fingers = 3,
  direction = "up",
  mods = "SUPER",
  scale = 1.5,
  action = "fullscreen" })

-- Horizontal swipe changes workspace
hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})
