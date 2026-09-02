#!/usr/bin/env bash
# Symlinks patches on top of omarchy's stock LazyVim config
# (~/.config/nvim), so a fresh omarchy install reaches the same
# tweaked state as this machine without switching to linux/nvim
# (the full hand-rolled config port).
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$DOTFILES_DIR/nvim-omarchy-overrides"
NVIM_DIR="$HOME/.config/nvim"

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

link "$SRC_DIR/lua/plugins/grug-far-disable.lua" "$NVIM_DIR/lua/plugins/grug-far-disable.lua"
link "$SRC_DIR/lua/plugins/flash-char-current-line-only.lua" "$NVIM_DIR/lua/plugins/flash-char-current-line-only.lua"
link "$SRC_DIR/lua/config/keymaps.lua" "$NVIM_DIR/lua/config/keymaps.lua"
link "$SRC_DIR/lua/config/autocmds.lua" "$NVIM_DIR/lua/config/autocmds.lua"
link "$SRC_DIR/docs/keymap-cheatsheet.md" "$NVIM_DIR/docs/keymap-cheatsheet.md"

echo "done."
