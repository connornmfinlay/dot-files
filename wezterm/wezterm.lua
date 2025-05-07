local wezterm = require "wezterm"
local config = wezterm.config_builder()
local action = wezterm.action

config.color_scheme = '3024 (dark) (terminal.sexy)'
config.font = wezterm.font {
  family = 'JetBrains Mono',
  weight = 'Medium',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, -- disable ligatures
}
config.font_size = 14.0
config.line_height = 1.0
config.window_padding = { left = '0.5cell', right = '0.5cell', top = '0.5cell', bottom = '0.5cell' }

config.default_cursor_style = 'BlinkingBar'

config.window_decorations = 'TITLE|RESIZE'
config.window_background_opacity = 0.96
config.macos_window_background_blur = 20

config.inactive_pane_hsb = {
  saturation = 0.1,
  brightness = 0.8,
}

config.keys = {
  { key = 'd', mods = 'CMD|SHIFT', action = action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'd', mods = 'CMD', action = action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'k', mods = 'CMD', action = action.ClearScrollback 'ScrollbackAndViewport' },
  { key = 'w', mods = 'CMD', action = action.CloseCurrentPane { confirm = false } },
  { key = 'w', mods = 'CMD|SHIFT', action = action.CloseCurrentTab { confirm = false } },
  { key = 'p', mods = 'CMD|SHIFT', action = action.ActivateCommandPalette },
  { key = 'LeftArrow', mods = 'CMD', action = action.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'CMD', action = action.ActivatePaneDirection 'Right' },
  { key = 'LeftArrow', mods = 'CMD|OPT', action = action.ActivateTabRelative(-1) },
  { key = 'RightArrow', mods = 'CMD|OPT', action = action.ActivateTabRelative(1) },
  { key = 'LeftArrow',  mods = 'CMD|CTRL', action = action.AdjustPaneSize { 'Left',  5 } },
  { key = 'RightArrow', mods = 'CMD|CTRL', action = action.AdjustPaneSize { 'Right', 5 } },
  { key = 'UpArrow',    mods = 'CMD|CTRL', action = action.AdjustPaneSize { 'Up',    5 } },
  { key = 'DownArrow',  mods = 'CMD|CTRL', action = action.AdjustPaneSize { 'Down',  5 } },
}
return config
