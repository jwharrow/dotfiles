#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$DOTFILES/$1"
  local dest="$2"

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "ok      $dest"
    return
  fi

  if [ -e "$dest" ]; then
    mv "$dest" "$dest.pre-dotfiles.bak"
    echo "backed up existing $dest -> $dest.pre-dotfiles.bak"
  fi

  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "linked  $dest -> $src"
}

link zshrc              "$HOME/.zshrc"
link gitconfig           "$HOME/.gitconfig"
link gitignore_global    "$HOME/.gitignore_global"
link tool-versions       "$HOME/.tool-versions"
link iex.exs             "$HOME/.iex.exs"

link zed/settings.json   "$HOME/.config/zed/settings.json"
link zed/keymap.json     "$HOME/.config/zed/keymap.json"

# Agent skills live in a separate repo — see github.com/jwharrow/agent_skills
