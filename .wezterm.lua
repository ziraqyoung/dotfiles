-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {
}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)


-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Batman'
config.font_size = 11.0
config.line_height = 1.1
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0, }
config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config
