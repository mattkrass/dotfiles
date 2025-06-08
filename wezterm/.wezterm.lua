-- Pull in the wezterm API
local wezterm = require('wezterm')

--- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS NF")
config.font_size = 16

--- window configuration
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.color_scheme = 'Dracula (Official)'

return config
