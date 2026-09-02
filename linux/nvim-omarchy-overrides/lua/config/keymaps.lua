-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- grug-far is disabled (lua/plugins/grug-far-disable.lua), so <leader>sr is free.
-- Rebind it to Snacks resume (default is <leader>sR) to match old Telescope muscle memory.
vim.keymap.set("n", "<leader>sr", function()
  Snacks.picker.resume()
end, { desc = "Resume (Search)" })

vim.keymap.set("n", "<F1>", function()
  vim.cmd.split(vim.fn.stdpath("config") .. "/docs/keymap-cheatsheet.md")
end, { desc = "Open keymap cheatsheet" })
