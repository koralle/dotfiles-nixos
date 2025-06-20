local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_workspace = "koralle"

config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- Color Scheme
config.color_scheme = 'Catppuccin Frappe'

-- Font
config.font = wezterm.font_with_fallback({
  'Moralerspace Neon',
  'JetBrains Mono'
})

-- Key mappings
config.keys = require("key-mappings")

return config
