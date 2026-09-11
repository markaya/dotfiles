# Linux (Omarchy) dotfiles

## nvim

Starting point: a copy of `macos/nvim` (lazy.nvim + hand-written plugin specs
under `lua/markaya/`, *not* the LazyVim distro Omarchy ships by default).
LazyVim is a full pre-built editor — opinionated defaults, LSP, statusline,
keymaps all wired up, extended via `lua/plugins/*.lua`. This config only uses
lazy.nvim as the plugin *manager* and configures everything itself, so none of
that comes along for free — but it also means none of it fights with keymaps
and plugins chosen here.

On top of the copied config, three pieces of Omarchy's own nvim integration
were ported in because they're useful and don't depend on LazyVim:

- `lua/markaya/plugins/all-themes.lua` — every Omarchy theme's colorscheme
  plugin, lazy-loaded so they're available without being applied.
- `plugin/after/transparency.lua` — strips background from highlight groups;
  auto-sourced at startup like any other file under `plugin/`.
- `lua/markaya/remote_clipboard.lua` — OSC52 clipboard for tmux/SSH sessions,
  set up from `settings.lua`.

`lua/markaya/omarchy_theme.lua` is new, not a copy. Omarchy writes the active
theme to `~/.local/state/omarchy/current/theme/neovim.lua` on every theme
change, and its own LazyVim-based nvim auto-imports that file as a plugin
spec — safe there because it already depends on the real `LazyVim/LazyVim`
plugin, so the file's `{"LazyVim/LazyVim", opts = {colorscheme = ...}}` entry
just merges extra options onto a plugin lazy.nvim was installing anyway. This
config doesn't declare that plugin, so importing the file the same way would
make lazy.nvim try to install the actual LazyVim framework from GitHub.
Instead `omarchy_theme.lua` reads the file directly with `dofile()` — never
through lazy's plugin importer — pulls out just the colorscheme name, and
applies it. Since Omarchy doesn't push theme changes into a running nvim
instance, it also polls the theme file's mtime on `FocusGained` and reapplies
when it moves (also available manually as `:OmarchyThemeReload`).

### Restoring Omarchy's own nvim config

Omarchy's nvim setup is a package (`omarchy-nvim`), not something this repo
touches — switching back is a single command:

```sh
omarchy-nvim-refresh
```

This backs up `~/.config/nvim` (and its data/state/cache dirs) with a
timestamp and reinstalls Omarchy's skel-seeded LazyVim config fresh.

## tmux

`tmux/tmux.conf` is seeded from Omarchy's shipped default
(`/usr/share/omarchy/config/tmux/tmux.conf`) so its prefix, status bar, theme
hooks, and keybinding popup (`omarchy-menu-tmux-keybindings`) all still work.
Only addition: `|`/`-` pane splits (matching the macOS config's convention),
alongside Omarchy's own `v`/`h` bindings.

## herdr

`herdr/config.toml` is the day-to-day multiplexer config (Omarchy's own
tmux-alternative) — prefix `ctrl+space`, `terminal` theme, and the split/tab
keybindings tweaked from Omarchy's default. `herdr/confirm-close-pane.sh` and
`herdr/confirm-close-tab.sh` back the `prefix+x`/`prefix+k` popup confirmations
(`confirm_close = true`) wired up in `config.toml`.

## bash

`bashrc` is `~/.bashrc` as actually in use — sources Omarchy's own bash
defaults, then personal aliases. Includes `alias clear='clear -x'`: plain
`clear` sends the "erase scrollback" sequence (`\e[3J`), which herdr (unlike
tmux) honors by wiping the pane's scrollback; `-x` skips that part.

## git

`git/config` is the global git config, at Omarchy's XDG path
(`~/.config/git/config`, not `~/.gitconfig`).

## Setup

```sh
~/Work/dotfiles/linux/install.sh
```

Symlinks `nvim`, `tmux/tmux.conf`, `bashrc`, `herdr/config.toml`, the two
`herdr` confirm scripts, and `git/config` onto their live locations, backing
up anything already there first.
