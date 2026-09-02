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
link "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
link "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"
link "$DOTFILES_DIR/gitignore_global" "$HOME/.gitignore"
link "$DOTFILES_DIR/hammerspoon" "$HOME/.hammerspoon"

if command -v delta >/dev/null 2>&1; then
  echo "ok:      delta already installed ($(command -v delta))"
elif command -v brew >/dev/null 2>&1; then
  echo "installing git-delta via brew..."
  brew install git-delta
else
  echo "warning: delta not found and brew not available; install git-delta manually" >&2
fi

ZSH_VI_MODE_DIR="$HOME/.oh-my-zsh/custom/plugins/zsh-vi-mode"
if [ -d "$ZSH_VI_MODE_DIR" ]; then
  echo "ok:      zsh-vi-mode already present at $ZSH_VI_MODE_DIR"
elif [ -d "$HOME/.oh-my-zsh" ]; then
  echo "cloning jeffreytse/zsh-vi-mode..."
  git clone https://github.com/jeffreytse/zsh-vi-mode "$ZSH_VI_MODE_DIR"
else
  echo "warning: oh-my-zsh not found; skipping zsh-vi-mode plugin install" >&2
fi

echo "done."
