local wezterm = require("wezterm")
local act = wezterm.action

local mappings = {}

table.insert(mappings, {
  key = ".",
  mods = "ALT",
  action = act.ToggleFullScreen
})

-- Increase font size
table.insert(mappings, {
  key = "=",
  mods = "CTRL",
  action = act.IncreaseFontSize
})

-- Decrease font size
table.insert(mappings, {
  key = "-",
  mods = "CTRL",
  action = act.DecreaseFontSize
})

return mappings
