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
  {
    label = 'Command Prompt',
    args = { 'cmd.exe' },
  },
}

return config
