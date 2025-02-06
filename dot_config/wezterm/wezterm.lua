local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Kanagawa (Gogh)'
config.window_background_gradient = {
  colors = { 'black', "#02263d" },
  orientation = {
    Radial = {
      -- Specifies the x coordinate of the center of the circle,
      -- in the range 0.0 through 1.0.  The default is 0.5 which
      -- is centered in the X dimension.
      cx = 0.75,

      -- Specifies the y coordinate of the center of the circle,
      -- in the range 0.0 through 1.0.  The default is 0.5 which
      -- is centered in the Y dimension.
      cy = 0.75,

      -- Specifies the radius of the notional circle.
      -- The default is 0.5, which combined with the default cx
      -- and cy values places the circle in the center of the
      -- window, with the edges touching the window edges.
      -- Values larger than 1 are possible.
      radius = 1.25,
    },
  },
}
config.window_background_opacity = 0.90
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.show_tabs_in_tab_bar = true

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#5c6d74"
  local foreground = "#FFFFFF"

  if tab.is_active then
    background = "#005a94"
    foreground = "#FFFFFF"
  end

  local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

  return {
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
  }
end)

------------------------
-- font
------------------------
local font = wezterm.font_with_fallback {
  {
    family = 'Monaspace Krypton',
    -- family = 'JetBrains Mono',
    harfbuzz_features = { "calt=1", "clig=1", "liga=1", 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09'
    }
  },
  "HackGenNerd Console",
}

config.font = font
config.font_size = 12

config.use_fancy_tab_bar = true
config.enable_scroll_bar = true
config.automatically_reload_config = true

config.window_frame = {
  font = font,
  font_size = 12
}

config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  { key = "|", mods = "LEADER|SHIFT", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
  { key = '-', mods = "LEADER",       action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
  { key = "h", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Left" } },
  { key = "j", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Down" } },
  { key = "k", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Up" } },
  { key = "l", mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Right" } },
  { key = "c", mods = "LEADER",       action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
  { key = "n", mods = "LEADER",       action = wezterm.action { ActivateTabRelative = 1 } },
  { key = "p", mods = "LEADER",       action = wezterm.action { ActivateTabRelative = -1 } },

  { key = 'H', mods = 'LEADER',       action = wezterm.action.AdjustPaneSize { 'Left', 5 }, },
  { key = 'J', mods = 'LEADER',       action = wezterm.action.AdjustPaneSize { 'Down', 5 }, },
  { key = 'K', mods = 'LEADER',       action = wezterm.action.AdjustPaneSize { 'Up', 5 } },
  { key = 'L', mods = 'LEADER',       action = wezterm.action.AdjustPaneSize { 'Right', 5 }, },
}

return config
