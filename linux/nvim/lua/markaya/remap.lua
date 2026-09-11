--vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Browse project files' })
vim.keymap.set('n', '<leader>pv', '<CMD>Oil<CR>', { desc = 'Browse project files' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move highlighted line up' })
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv", { desc = 'Move highlighted line down' })

-- Primagean kemap to save your pasted text inside buffer after you paste it over highlighted text
-- This usuaslly causes highlighted text to be deleted which is them moved to buffer
-- Remap is useful when changing some text on multiple places using same text
vim.keymap.set('x', '<leader>p', '"_dP')

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move half page down and center cursor' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move half page up and center cursor' })

vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Center view when moving to next instance of search' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Center view when moving to  .instance of search' })

-- When pressing Esc key, also remove highlighted text from search.
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>')

vim.diagnostic.config { jump = { float = true } }
-- diagnostic keymaps -  goto_prev & goto_next are deprecated so I added line above
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'go to previous [d]iagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'go to next [d]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'show diagnostic [e]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'open diagnostic [q]uickfix list' })

vim.keymap.set('n', '<leader>zd', '_f[lrx', { desc = 'toggle checkbox done' })
vim.keymap.set('n', '<leader>zn', '_f[lr ', { desc = 'toggle checkbox not done' })

-- c for quicklist
vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>', { desc = 'quicklist next item' })
vim.keymap.set('n', '<M-k>', '<cmd>cprev<CR>', { desc = 'quicklist next item' })
--cclose closes

--terminal options
vim.keymap.set('n', '<space>to', function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd 'J'
  vim.api.nvim_win_set_height(0, 15)
end)
