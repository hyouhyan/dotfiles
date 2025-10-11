#!/bin/bash

# env
source "${HOME}/dotfiles/.envrc"

mkdir -p ~/.config

ln -sfv ${DOTFILESPATH}/wezterm ~/.config/wezterm
