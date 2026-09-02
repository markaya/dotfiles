return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup()
      require('nvim-treesitter').install { 'go', 'gomod', 'gowork', 'gosum', 'lua', 'luadoc', 'vim', 'vimdoc', 'bash' }
    end,
  },
}
