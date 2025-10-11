local wezterm = require 'wezterm'

local config = {}


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

return config
