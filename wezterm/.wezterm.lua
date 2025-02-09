local wezterm = require('wezterm')
local act = wezterm.action

local config = wezterm.config_builder()

config.scrollback_lines = 10000

-- Add splits from iterm
config.keys = {
  {
    key = 'D',
    mods = 'SUPER',
    action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
  },
  {
    key = 'd',
    mods = 'SUPER',
    action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
  },
  -- Clears the scrollback and viewport, and then sends CTRL-L to ask the
  -- shell to redraw its prompt
  {
    key = 'k',
    mods = 'SUPER',
    action = act.Multiple {
      act.ClearScrollback 'ScrollbackAndViewport',
      act.SendKey { key = 'L', mods = 'CTRL' },
    },
  },
  -- Close current pane
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  -- Select pane using arrow keys and SUPER+ALT
  {
    key = 'LeftArrow',
    mods = 'SUPER|ALT',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'SUPER|ALT',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'SUPER|ALT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'SUPER|ALT',
    action = act.ActivatePaneDirection 'Down',
  },
}
return config
