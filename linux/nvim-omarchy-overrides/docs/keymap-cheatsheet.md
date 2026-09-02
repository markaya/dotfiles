# Search (`<leader>s`) cheatsheet

Press `<F1>` in nvim to reopen this file. Source: LazyVim's `editor.snacks_picker` extra,
verified against `~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/extras/editor/snacks_picker.lua`.

## Changes made on this machine (not stock LazyVim)

| Action | Command |
|---|---|
| Search & replace (grug-far) | **disabled** — see `lua/plugins/grug-far-disable.lua` |
| Resume last picker | `<leader>sr` (rebound here; stock default is `<leader>sR`, still works too) |
| Open this cheatsheet | `<F1>` |
| Find a file in nvim config | `<leader>fc` (not `<leader>sn` — that's the noice/notifications group) |
| Toggle inlay hints (off by default) | `<leader>uh` (stock LazyVim binding; disabled via `lua/plugins/disable-inlay-hints.lua`) |
| Toggle diagnostics virtual text (off by default) | `<leader>uv` (custom; see `lua/plugins/toggle-diagnostics-virtual-text.lua`) |

## Multigrep — filter live-grep results by file type/glob

Type your search term, then `--`, then raw ripgrep flags, e.g.:

```
foo -- -g '*.lua'      " only .lua files (glob, matches filename/path)
foo -- -t lua           " only .lua files (ripgrep's built-in type list)
foo -- -g '!vendor/*'   " exclude a path
```

Everything before `--` is the search pattern; everything after is passed straight to `rg`.

## Full `<leader>s` group

| Action | Command |
|---|---|
| Find files | `<leader><space>` or `<leader>ff` |
| Recent files | `<leader>fr` |
| Buffers | `<leader>fb` / `<leader>,` |
| Grep (root dir) | `<leader>sg` |
| Grep (cwd) | `<leader>sG` |
| Grep word/selection under cursor (root) | `<leader>sw` |
| Grep word/selection under cursor (cwd) | `<leader>sW` |
| Buffer lines (fuzzy find in buffer) | `<leader>sb` |
| Grep open buffers | `<leader>sB` |
| Resume last picker | `<leader>sr` |
| Search history | `<leader>s/` |
| Command history | `<leader>sc` |
| Commands | `<leader>sC` |
| Diagnostics (workspace) | `<leader>sd` |
| Diagnostics (buffer) | `<leader>sD` |
| Help pages | `<leader>sh` |
| Highlights | `<leader>sH` |
| Icons | `<leader>si` |
| Jumps | `<leader>sj` |
| Keymaps | `<leader>sk` |
| Location list | `<leader>sl` |
| Marks | `<leader>sm` |
| Man pages | `<leader>sM` |
| Quickfix list | `<leader>sq` |
| Undo history (Undotree equivalent) | `<leader>su` |
| Autocmds | `<leader>sa` |
| Registers | `<leader>s"` |
| Plugin spec search | `<leader>sp` |
| Todo comments | `<leader>st` |
| Todo/Fix/Fixme only | `<leader>sT` |
| LSP document symbols | `<leader>ss` |
| LSP workspace symbols | `<leader>sS` |
| Find config file | `<leader>fc` |
| Colorschemes | `<leader>uC` |
