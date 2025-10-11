local wezterm = require 'wezterm'

local config = {}

-- デフォルトをWSLにする
config.default_prog = { 'wsl.exe', '--cd', '~' }

return config
