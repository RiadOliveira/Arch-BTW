hl.window_rule({
  name = "suppress-maximize-events",
  match = { class = ".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },

  no_focus = true,
})

hl.window_rule({
  match = { class = "^(anki|launcher|localsend|qalc|swayimg|thunar|xdg-desktop-portal-gtk)$" },
  float = true,
  center = true,
  size = { 700, 600 },
})

hl.window_rule({
  match = { class = "^btop$" },
  float = true,
  move = { 10, 62 },
  size = { 1900, 1008 },
})

hl.layer_rule({
  match = { namespace = "waybar" },
  blur = true,
})
