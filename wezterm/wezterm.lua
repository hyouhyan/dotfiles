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

-- Launch Menu
local launch_menu = require("config/launch_menu")
merge_config(config, launch_menu)

-- Keybind
local keybind = require("config/keybind")
merge_config(config, keybind)

-- style
local style = require("config/style")
merge_config(config, style)

-- transparent
local transparent = require("config/transparent")
merge_config(config, transparent)

-- os
local os = require("config/os/os")
merge_config(config, os)

----------------------------------------------------
-- 雑多なコンフィグたち
----------------------------------------------------




return config
