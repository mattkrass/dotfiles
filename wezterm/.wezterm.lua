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

config.send_composed_key_when_right_alt_is_pressed = false

return config
