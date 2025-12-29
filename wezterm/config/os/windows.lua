local wezterm = require 'wezterm'

local config = {}

-- コンフィグ結合用の関数
function merge_config(config, new_config)
	for k, v in pairs(new_config) do
		config[k] = v
	end
end

-- デフォルトをWSLのByobuにする
config.default_prog = { 'wsl.exe', '--cd', '~', "-e", "byobu" }

-- 最初からフルスクリーンで起動
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)

-- Launch Menu
merge_config(config, require("config/os/launch_menu/windows"))

return config
