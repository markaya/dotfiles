return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    -- Define your options here
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    -- Use config just to set the keymap after opts are applied
    config = function(_, opts)
      require('oil').setup(opts) -- This ensures opts above are actually used
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
  },
}
