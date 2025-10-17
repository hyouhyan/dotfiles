local wezterm = require 'wezterm'

local config = {}

config.launch_menu = {
  {
    label = 'PowerShell',
    args = { 'powershell.exe' },
  },
  {
    label = 'WSL2',
    args = { 'wsl.exe', '--cd', '~' },
  },
}

return config
