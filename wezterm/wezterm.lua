local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- コンフィグ結合用の関数
function merge_config(config, new_config)
	for k, v in pairs(new_config) do
		config[k] = v
	end
end

----------------------------------------------------
-- 分割したコンフィグファイル読み込み
----------------------------------------------------

-- Keybind
merge_config(config, require("config/keybind"))

-- style
merge_config(config, require("config/style"))

-- transparent
merge_config(config, require("config/transparent"))

-- os
merge_config(config, require("config/os/os"))


return config
