# dotfiles

Personal machine configs: neovim, tmux, zsh, git (with delta).

## Layout

- `nvim/` — full neovim config (lazy.nvim, ~34 plugins, custom + friendly-snippets)
- `tmux/tmux.conf`
- `zshrc` — oh-my-zsh based, plus the `zsh-vi-mode` custom plugin
- `gitconfig` — includes `delta` as pager/diff-filter
- `gitignore_global`
- `hammerspoon/` — window-switching hotkeys (`.luarc.json` in here pins it as its own
  lua_ls root, so editing it doesn't drag the whole repo into one giant Lua workspace)

## Setup on a new machine

```sh
git clone <this repo> ~/open-source/dotfiles
cd ~/open-source/dotfiles
./install.sh
```

`install.sh` symlinks each config into place (`~/.config/nvim`, `~/.config/tmux/tmux.conf`,
`~/.zshrc`, `~/.gitconfig`, `~/.gitignore`), backing up any existing real file/directory at that
path first (`<path>.bak.<timestamp>`). It also installs `git-delta` via Homebrew if missing, and
clones the `zsh-vi-mode` oh-my-zsh plugin if missing. Safe to re-run.

Since everything is symlinked, editing a config anywhere (e.g. `nvim` from inside `~/.config/nvim`)
edits the file in this repo directly — commit from here as usual.
