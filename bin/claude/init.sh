#!/bin/bash

# env
source "${HOME}/dotfiles/.envrc"

# ~/.claude は認証情報やセッションも入るので、ディレクトリごとではなくファイル単位でリンクする
mkdir -p ~/.claude

for f in CLAUDE.md settings.json; do
  # 既存の実ファイルは退避してからリンクする
  if [ -e ~/.claude/${f} ] && [ ! -L ~/.claude/${f} ]; then
    mv -v ~/.claude/${f} ~/.claude/${f}.bak
  fi
  ln -sfv ${DOTFILESPATH}/claude/${f} ~/.claude/${f}
done
