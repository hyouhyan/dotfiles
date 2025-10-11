local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- カラースキームの設定
color_scheme = "iceberg-dark"

-- 背景透過
config.window_background_opacity = 0.85

-- フォントの設定
config.font = wezterm.font("Cica", {weight="Regular", stretch="Normal", style="Normal"})

-- フォントサイズの設定
config.font_size = 14


config.default_prog = { 'wsl.exe', '--cd', '~' }

----------------------------------------------------
-- launch_menu
----------------------------------------------------
config.launch_menu = {
  {
    label = 'PowerShell',
    args = { 'powershell.exe' },
  },
  {
    label = 'WSL2',
    args = { 'wsl.exe', '--cd', '~' },
  },
  {
    label = 'Command Prompt',
    args = { 'cmd.exe' },
  },
}



-- 透明化切り替えのやつ
if wezterm.GLOBAL.is_transparent == nil then
  wezterm.GLOBAL.is_transparent = true
end
-- 'toggle-opacity' という名前のカスタムイベントをリッスンする
wezterm.on('toggle-opacity', function(window, pane)
  -- 現在の状態を反転させる
  wezterm.GLOBAL.is_transparent = not wezterm.GLOBAL.is_transparent

  local new_opacity
  if wezterm.GLOBAL.is_transparent then
    -- 半透明にする
    new_opacity = 0.85
  else
    -- 不透明にする
    new_opacity = 1.0
  end

  -- 現在のウィンドウの設定を上書きする
  window:set_config_overrides({
    window_background_opacity = new_opacity,
  })
end)

-- ショートカットキー設定
local act = wezterm.action
config.keys = {
  -- Alt(Opt)+Shift+Fでフルスクリーン切り替え
  {
    key = 'f',
    mods = 'SHIFT|META',
    action = wezterm.action.ToggleFullScreen,
  },
  -- ショートカットキーを Ctrl + Shift + U で透明化切り替え
  {
    key = 'U',
    mods = 'SHIFT|ALT',
    action = act.EmitEvent('toggle-opacity'),
  },
  -- Ctrl+Shift+tで新しいタブを作成
  {
    key = 't',
    mods = 'SHIFT|CTRL',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  -- Ctrl+Alt+tでLauncher
  {
    key = 't',
    mods = 'CTRL|ALT',
    action = wezterm.action.ShowLauncher,
  },
  -- 横画面分割
  {
    key = 'd',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- 縦画面分割
  {
    key = 'd',
    mods = 'SHIFT|CTRL|ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Ctrl+左矢印でカーソルを前の単語に移動
  {
    key = "LeftArrow",
    mods = "CTRL",
    action = act.SendKey {
      key = "b",
      mods = "META",
    },
  },
  -- Ctrl+右矢印でカーソルを次の単語に移動
  {
    key = "RightArrow",
    mods = "CTRL",
    action = act.SendKey {
      key = "f",
      mods = "META",
    },
  },
  -- Ctrl+Backspaceで前の単語を削除
  {
    key = "Backspace",
    mods = "CTRL",
    action = act.SendKey {
      key = "w",
      mods = "CTRL",
    },
  },
}

-- ウィンドウのタブバーを非表示
config.window_decorations = "RESIZE"

-- タブバーの透過
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}

-- タブバーを背景色に合わせる
config.window_background_gradient = {
  colors = { "#000000" },
}
-- タブ同士の境界線を非表示
config.colors = {
  tab_bar = {
    inactive_tab_edge = "none",
  },
}

-- タブの形をカスタマイズ
-- タブの左側の装飾
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
-- タブの右側の装飾
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#5c6d74"
  local foreground = "#FFFFFF"
  local edge_background = "none"
  if tab.is_active then
    background = "#ae8b2d"
    foreground = "#FFFFFF"
  end
  local edge_foreground = background
  local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "
  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

return config
