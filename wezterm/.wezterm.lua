local wezterm = require('wezterm')
local act = wezterm.action

local config = wezterm.config_builder()

config.scrollback_lines = 10000
-- config.default_prog = { '/opt/homebrew/bin/fish'}
config.default_prog = { '/usr/local/bin/fish'}
config.enable_scroll_bar = true


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
  {
    key = '[',
    mods = 'SUPER',
    action = act.ActivatePaneDirection 'Prev',
  },
  {
    key = ']',
    mods = 'SUPER',
    action = act.ActivatePaneDirection 'Next',
  },
  -- Match word skipping behavior in Terminal
    -- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = act.SendKey {
      key = 'b',
      mods = 'ALT',
    },
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = act.SendKey { key = 'f', mods = 'ALT' },
  },
}

config.mouse_bindings = {
    -- Disable the default click behavior
    {
      event = { Up = { streak = 1, button = "Left"} },
      mods = "NONE",
      action = wezterm.action.DisableDefaultAssignment, -- You may want a different option here. See /u/Brian's comment below
    },
    -- Ctrl-click will open the link under the mouse cursor
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
    -- Disable the Ctrl-click down event to stop programs from seeing it when a URL is clicked
    {
        event = { Down = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = wezterm.action.Nop,
    },
}

search_mode = wezterm.gui.default_key_tables().search_mode
table.insert(
  search_mode,
  { key = 'Enter', mods = 'SHIFT', action = act.CopyMode 'NextMatch' }
 )

config.key_tables = {
  search_mode = search_mode
}

return config

