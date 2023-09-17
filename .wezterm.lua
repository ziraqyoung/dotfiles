local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- General config
local config = {
  color_scheme = "kanagawabones",
  font = wezterm.font("InconsolataLGC Nerd Font"),
  font_size = 11,
  line_height = 1.2,
  cell_width = 0.9,
  use_fancy_tab_bar = false,
  force_reverse_video_cursor = true,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = true,
  max_fps = 120,
  tab_max_width = 32,
  window_padding = { left = 0, right = 0, top = 0, bottom = 0, },
  window_decorations = "RESIZE",
  colors = {
    tab_bar = {
      background = "black",
      active_tab = {
        bg_color = "#1f1f28",
        fg_color = "#dcd7ba",
      },
      inactive_tab = {
        bg_color = "black",
        fg_color = "79797c",
      },
      new_tab = {
        bg_color = "black",
        fg_color = "79797c",
      },
    },
  },
}


local a = wezterm.action

local function map(things)
  local t = {}
  for key in string.gmatch(things, '([^,]+)') do
    table.insert(t, a.SendKey { key = key })
  end
  return t
end

config.keys = {
  {
    key = "k",
    mods = "CMD",
    action = a.ClearScrollback 'ScrollbackAndViewport',
  }, {
  key = "Enter",
  mods = "CMD",
  action = a.SplitVertical,
}, {
  key = "Enter",
  mods = "CMD|SHIFT",
  action = a.SplitHorizontal,
}, {
  key = "UpArrow",
  mods = "CMD",
  action = a.ActivatePaneDirection 'Up',
}, {
  key = "DownArrow",
  mods = "CMD",
  action = a.ActivatePaneDirection 'Down',
}, {
  key = "LeftArrow",
  mods = "CMD",
  action = a.ActivatePaneDirection 'Left',
}, {
  key = "RightArrow",
  mods = "CMD",
  action = a.ActivatePaneDirection 'Right',
}, {
  key = "UpArrow",
  mods = "CMD|SHIFT",
  action = a.AdjustPaneSize { 'Up', 1 },
}, {
  key = "DownArrow",
  mods = "CMD|SHIFT",
  action = a.AdjustPaneSize { 'Down', 1 },
}, {
  key = "LeftArrow",
  mods = "CMD|SHIFT",
  action = a.AdjustPaneSize { 'Left', 1 },
}, {
  key = "RightArrow",
  mods = "CMD|SHIFT",
  action = a.AdjustPaneSize { 'Right', 1 },
}, {
  key = "c",
  mods = "CMD",
  action = a.Multiple(map('",+,y')),
}, {
  key = "s",
  mods = "CMD",
  action = a.Multiple(map("Escape,:,w,Enter")),
}, {
  key = "a",
  mods = "CMD",
  action = a.Multiple(map("Escape,g,g,V,G")),
}, {
  key = "f",
  mods = "CMD|SHIFT",
  action = a.Multiple(map("Escape,:,T,e,l,e,s,c,o,p,e, ,l,i,v,e,_,g,r,e,p,Enter")),
}, {
  key = "^",
  mods = "CTRL|SHIFT",
  action = a.DisableDefaultAssignment,
},
}


return config
