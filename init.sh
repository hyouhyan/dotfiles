#!/bin/bash

# env
source "${HOME}/dotfiles/.envrc"

# initialize wezterm
${SCRIPTPATH}/wezterm/init.sh

# initialize hammerspoon
${SCRIPTPATH}/hammerspoon/init.sh
