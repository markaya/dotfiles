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

## nvim-omarchy-overrides (small patches on top of Omarchy's stock LazyVim)

Separate from `linux/nvim` above — this isn't the full hand-rolled config,
it's a handful of tweaks layered onto Omarchy's *own* LazyVim install
(`~/.config/nvim`), for while it's still in use as-is:

- `lua/plugins/grug-far-disable.lua` — disables grug-far.nvim (unused), which
  frees up `<leader>sr`.
- `lua/plugins/flash-char-current-line-only.lua` — flash.nvim's default
  `char.multi_line = true` makes `f`/`F`/`t`/`T` highlight matches on every
  visible line, not just the current one; this turns that off so `f`/`t`
  behave like vanilla vim again (flash's `s`/`S` jump motions are untouched).
- `lua/config/keymaps.lua` — rebinds `<leader>sr` to `Snacks.picker.resume()`
  (stock default is `<leader>sR`) to match old Telescope muscle memory, and
  adds `<F1>` to open `docs/keymap-cheatsheet.md`.
- `lua/config/autocmds.lua` — disables diagnostics on markdown buffers.
- `docs/keymap-cheatsheet.md` — an Action | Command reference for the
  `<leader>s` (search/picker) group, since Snacks renamed/moved a lot of it
  relative to Telescope. Opened with `<F1>`.

`install-omarchy-overrides.sh` symlinks each of these onto the live
`~/.config/nvim` (backing up anything already there). Re-run it after
`omarchy-nvim-refresh`, since that reinstalls `~/.config/nvim` from scratch
and would otherwise drop the symlinks.

## tmux

`tmux/tmux.conf` is seeded from Omarchy's shipped default
(`/usr/share/omarchy/config/tmux/tmux.conf`) so its prefix, status bar, theme
hooks, and keybinding popup (`omarchy-menu-tmux-keybindings`) all still work.
Only addition: `|`/`-` pane splits (matching the macOS config's convention),
alongside Omarchy's own `v`/`h` bindings.

## Setup

Not yet wired into an install script — symlink manually for now:

```sh
ln -sf ~/open-source/dotfiles/linux/nvim ~/.config/nvim
ln -sf ~/open-source/dotfiles/linux/tmux/tmux.conf ~/.config/tmux/tmux.conf
```

The overrides on top of Omarchy's *stock* nvim (the state actually in use
right now, before any switch to the custom config above) do have a script:

```sh
~/open-source/dotfiles/linux/install-omarchy-overrides.sh
```
