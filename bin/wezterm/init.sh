#!/bin/bash

# env
source "${HOME}/dotfiles/.envrc"

mkdir -p ~/.config

ln -sv ${DOTFILESPATH}/wezterm ~/.config/wezterm
