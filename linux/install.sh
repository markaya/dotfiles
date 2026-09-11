#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$1"
  local dest="$2"

  mkdir -p "$(dirname "$dest")"

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "ok:      $dest -> $src"
    return
  fi

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    local backup="${dest}.bak.$(date +%s)"
    mv "$dest" "$backup"
    echo "backed up existing $dest -> $backup"
  fi

  ln -s "$src" "$dest"
  echo "linked:  $dest -> $src"
}

link "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
link "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
link "$DOTFILES_DIR/bashrc" "$HOME/.bashrc"
link "$DOTFILES_DIR/herdr/config.toml" "$HOME/.config/herdr/config.toml"
link "$DOTFILES_DIR/herdr/confirm-close-pane.sh" "$HOME/.config/herdr/confirm-close-pane.sh"
link "$DOTFILES_DIR/herdr/confirm-close-tab.sh" "$HOME/.config/herdr/confirm-close-tab.sh"
link "$DOTFILES_DIR/git/config" "$HOME/.config/git/config"

echo "done."
