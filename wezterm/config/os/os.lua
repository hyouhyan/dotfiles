local wezterm = require 'wezterm'

local config = {}

if wezterm.target_triple:find("windows") ~= nil then
    config = require("config/os/windows")
elseif wezterm.target_triple:find("darwin") ~= nil then
    config = require("config/os/mac")
elseif wezterm.target_triple:find("linux") ~= nil then
    config = require("config/os/linux")
end

return config
