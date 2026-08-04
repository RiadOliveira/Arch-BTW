local btop = "kitty-open btop"
local qalc = "kitty-open qalc true"
local launcher = "kitty-open launcher true"

local anki = "fish -c 'app anki'"
local thunar = "fish -c 'app thunar'"
local terminal = "fish -c 'app kitty'"
local discord = "fish -c 'app discord'"
local zen_browser = "fish -c 'app zen-browser'"

local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + S", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("toggle-focus-floating"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(btop))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(qalc))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(launcher))

hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(anki))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(thunar))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(discord))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(zen_browser))

hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("switch-monitor-mode"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("toggle-workspace-monitor"))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })

hl.bind(mainMod .. " + ALT + H", hl.dsp.window.move({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.move({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.move({ x = 0, y = 20, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.move({ x = 0, y = -20, relative = true }), { repeating = true })

for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + V", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("workspace-next"))
hl.bind(mainMod .. " + tab", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("workspace-prev"))
hl.bind(mainMod .. " + SHIFT + tab", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("increase-volume"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("decrease-volume"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("toggle-mute-audio"), { locked = true, repeating = true })

hl.bind("SHIFT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("increase-mic-volume"), { locked = true, repeating = true })
hl.bind("SHIFT + XF86AudioLowerVolume", hl.dsp.exec_cmd("decrease-mic-volume"), { locked = true, repeating = true })
hl.bind("SHIFT + XF86AudioMute", hl.dsp.exec_cmd("toggle-mute-mic"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("toggle-mute-mic"), { locked = true, repeating = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("increase-brightness"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("decrease-brightness"), { locked = true, repeating = true })

hl.bind("XF86Calculator", hl.dsp.exec_cmd(qalc))

hl.bind("F10", hl.dsp.exec_cmd("screenshot-screen-copy"))
hl.bind("SHIFT + F10", hl.dsp.exec_cmd("screenshot-screen-save"))

hl.bind(mainMod .. " + F10", hl.dsp.exec_cmd("screenshot-window-copy"))
hl.bind(mainMod .. " + SHIFT + F10", hl.dsp.exec_cmd("screenshot-window-save"))

hl.bind("CTRL + F10", hl.dsp.exec_cmd("screenshot-area-copy"))
hl.bind("CTRL + SHIFT + F10", hl.dsp.exec_cmd("screenshot-area-save"))

hl.bind("Print", hl.dsp.exec_cmd("video-record screen"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("video-record window"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("video-record area"))

hl.bind("mouse:276", hl.dsp.pass({ window = "class:^(discord)$" }))
