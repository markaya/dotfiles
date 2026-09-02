# nvim keymap migration: macOS config → Omarchy (Linux)

Comparison of every remap in `macos/nvim` against the LazyVim install omarchy
ships (`~/.local/share/nvim/lazy/LazyVim`), pulled from `lazyvim.json`'s
enabled extras (neo-tree, prettier, go, json — **not** telescope, so
omarchy's default picker is `snacks.nvim`, not Telescope).

Fill in **Resolution** per row: e.g. `keep mine`, `use omarchy's`, `remap to
<key>`, `drop`, `needs testing`. Add comments inline or in a new section —
whatever's easiest.

⚠️ = the key is already bound to something else on omarchy — needs an actual
decision, not just muscle-memory relearning.

## Search / files (your Telescope → their Snacks Picker)

| Your cmd | Omarchy equivalent | What it does on omarchy | Resolution |
|---|---|---|---|
| `<leader>sf` find_files | `<leader><space>` / `<leader>ff` | Find files (project root) via Snacks | use sf too |
|  |  | picker |  |
| `<leader>s.` oldfiles | `<leader>fr` | Recent files | use omarchy |
| `<leader><leader>` buffers | `<leader>fb` / `<leader>,` | Open-buffer list | use omarc |
| `<C-p>` git_files | `<leader>fg` | Git-tracked files | use omarchy |
| `<leader>sh` help_tags | `<leader>sh` | Same key, same purpose — no change needed | |
| `<leader>sk` keymaps | `<leader>sk` | Same key, same purpose — no change needed | |
| `<leader>sd` diagnostics | `<leader>sd` | Same key, same purpose — no change needed | |
| `<leader>ss` list-all-pickers | *none* | No "list all pickers" meta-command by default | i do not know what pickers are |
| `<leader>sr` resume | ⚠️ `<leader>sr` taken | Omarchy's `<leader>sr` is **grug-far Search & Replace** (project | i do not use grug-far. how to disable it? |
|  |  | find/replace), not resume — resume moved to `<leader>sR` |  |
| `<leader>pws`/`<leader>pWs` grep word/WORD | `<leader>sw`/`<leader>sW` | Grep word under cursor, root/cwd | omarchy |
| `<leader>/` fuzzy-find in buffer | `<leader>sb` | "Buffer Lines" search |  omarchy |
| `<leader>s/` live-grep open buffers | `<leader>sB` | "Grep Open Buffers" | omarchy|
| `<leader>sn` find in nvim config | `<leader>fc` | "Find Config File" | use mine, |
|  |  | an extension |  |

- but right now <leader>sn  does some search noice?? What is eaven leader s
- i would like to still have multigrep, is it viable on snacsks?

## Git (gitsigns + fugitive)

| Your cmd | Omarchy equivalent | What it does on omarchy | Resolution |
|---|---|---|---|
| `<leader>hs`/`hr`/`hS`/`hu`/`hR`/`hp`/`hb`/`hd` | `<leader>ghs`/`ghr`/`ghS`/`ghu`/`ghR`/`ghp`/`ghb`/`ghd` | Same |  |
|  |  | gitsigns actions, one extra `g` in the prefix (`<leader>gh…` group, not `<leader>h…`) |  |
| `<leader>hD` diff vs last commit | `<leader>ghD` | Same, `gh` prefix | |
| `]c`/`[c` hunk nav | `]h`/`[h` | Next/prev hunk (they added nav keys you don't currently have) | |
| `<leader>tb` toggle blame line | `<leader>uG`-ish toggle group | No identical key; blame/signcolumn toggles live |  |
|  |  | under the `<leader>u` toggle namespace instead |  |
| `<leader>gs` (fugitive `:Git` status buffer) | ⚠️ `<leader>gs` taken | Omarchy's `<leader>gs` is **Snacks Git |  |
|  |  | Status picker**, a different UI for the same idea (no vim-fugitive by default — `<leader>gg` opens |  |
|  |  | **lazygit** instead) |  |


1. use omarchy
2. use omarchy
3. use ]c/[c
4. use my git blame, you can leave omarchy too
4. use gs for snacks git


## LSP

| Your cmd | Omarchy equivalent | What it does on omarchy | Resolution |
|---|---|---|---|
| `gd`/`gr`/`gi`(→`gI`)/`gD`/`K` | `gd`/`gr`/`gI`/`gD`/`K` | Identical keys, identical actions (`gi` is `gI` on |  |
|  |  | theirs) |  |
| `<leader>D` type definition | `gy` | Same action, different key (`gy`, not under leader) | |
| `<leader>ds`/`<leader>ws` doc/workspace symbols | `<leader>ss`/`<leader>sS` | Same actions via Snacks picker | |
| `<leader>rn` rename | `<leader>cr` | Same action, `c` (code) prefix instead of leaf key | |
| `<leader>ca` code action | `<leader>ca` | Same key, same action — no change needed | |
| `<C-g>` (insert) signature help | `<C-k>` (insertide) / `gK` (normal) | Same feature, different key | |
| `<leader>th` toggle inlay hints | `<leader>uh` | Same action, `u` (toggle) prefix instead | |


1. identical so it is not improtant
2. use mine
3. ue mine
4.use my rename
5. code action same
6. use my signature help
7. use mine toggle inlay hints


## Diagnostics, quickfix, formatting

| Your cmd | Omarchy equivalent | What it does on omarchy | Resolution |
|---|---|---|---|
| `<leader>e` open diagnostic float | ⚠️ `<leader>e` taken | Omarchy's `<leader>e` **toggles the Neo-tree file |  |
|  |  | explorer** — real conflict. Diagnostic float is `<leader>cd` instead |  |
| `<leader>q` diagnostics→loclist | `<leader>xl`/`<leader>xq` (close) | Different mechanism: toggles the |  |
|  |  | loc/quickfix window rather than populating it from diagnostics |  |
| `<M-j>`/`<M-k>` quickfix next/prev | `]q`/`[q` | Same actions, different keys | |
| `<leader>f` conform format | ⚠️ `<leader>f` taken | Omarchy reserves `<leader>f` as the whole **file/find group |  |
|  |  | prefix** (`ff`, `fb`, `fr`…) — a leaf binding there would break that group. Formatting is `<leader>cf` |  |
|  |  | instead. Good news: **conform.nvim is already omarchy's default formatter**, so it's the same plugin, just |  |
|  |  | a different key |  |


1. use their <leader>e
2. use xq
3. use M-j M-k
4. use omarchy leader f



## File explorer / undo

| Your cmd | Omarchy equivalent | What it does on omarchy | Resolution |
|---|---|---|---|
| `-` open Oil (parent dir) | `<leader>e` | Toggles **Neo-tree** (a persistent sidebar tree, not Oil's |  |
|  |  | buffer-as-directory model) — different UX for the same job, and Oil isn't part of omarchy's plugin set at |  |
|  |  | all |  |
| `<leader>u` UndotreeToggle | ⚠️ `<leader>u` taken | Omarchy uses the whole `<leader>u…` namespace for **toggles** |  |
|  |  | (spell, wrap, diagnostics, etc.) — a bare `<leader>u` leaf would shadow that group. Closest built-in |  |
|  |  | equivalent: `<leader>su` (Snacks undo picker) |  |


1. use mine
2. can i set leader ut to undotree


## Harpoon

| Your cmd | Omarchy equivalent | What it does on omarchy | Resolution |
|---|---|---|---|
| Harpoon plugin | *not installed by default* | Omarchy ships an official |  |
|  |  | **`lazyvim.plugins.extras.editor.harpoon2` extra** — literally the same plugin/branch you use — just not |  |
|  |  | enabled in this install's `lazyvim.json` |  |
| `<C-h>` select 1st | ⚠️ real conflict | `<C-h>` is LazyVim's default **"go to left window"** | |
| `<C-s>` select 4th | ⚠️ real conflict | `<C-s>` is LazyVim's default **"save file"** | |
| `<leader>a` add file | `<leader>H` (in the extra) | Add current file to Harpoon list | |
| `<C-e>` toggle menu | ⚠️ if you also want `<leader>h` | The official extra's toggle-menu key is **`<leader>h`** — |  |
|  |  | which is exactly the prefix you use for the whole gitsigns hunk group (`<leader>hs`, `<leader>hr`…). |  |
|  |  | Enabling the stock extra as-is would collide with your own git keymaps, not just omarchy's |  |

use my format leader f
1. I do not want to have lazy C-hjkl as movements for windows, i want to use C-wh C-wl etc

2. it looks like C-s is something else, looks like some search?
3. use leader H maybe becasue it makes sense and leader h to toggle



## Everything else (low-risk, mostly redundant)

| Your cmd | Omarchy equivalent | What it does on omarchy | Resolution |
|---|---|---|---|
| `J`/`K` move line in visual mode | *none* | No conflict, no built-in equivalent | |
| `<leader>p` paste without yanking replaced text | *none* | No conflict, no built-in equivalent | |
| `<C-d>`/`<C-u>` centered half-page scroll | *none* | No conflict, no built-in equivalent | |
| `n`/`N` centered search nav | built into LazyVim core keymaps | Same idea, LazyVim's own `n`/`N` remap already |  |
|  |  | centers/handles search direction |  |
| `<esc>` clear hlsearch | built into LazyVim core keymaps | Superset of yours — also cancels snippet jumping | |
| `<leader>zd`/`<leader>zn` checkbox toggle | *none* | Personal/custom, no omarchy equivalent | |
| `<leader>to` scratch terminal split | `<leader>ft`/`<leader>fT` | Snacks floating/root terminal — different UX, |  |
|  |  | same job |  |


1 2 3 use them
4,5 ok
6 i do not need
7 use omarchy


**Net conflict count: 6** — `<leader>e`, `<leader>f`, `<leader>u`, `<leader>sr`, `<leader>gs`, and harpoon's
`<C-h>`/`<C-s>`/`<leader>h`. Everything else transfers to a free key with a like-for-like (often
identical-plugin) equivalent already in place.


1. What causes me to accept on enter from blink or whatever complettiono i use, i do not want that
