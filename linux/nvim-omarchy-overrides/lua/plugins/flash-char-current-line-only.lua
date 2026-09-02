-- f/F/t/T only search the current line, like vanilla vim, instead of
-- flash.nvim's default of highlighting matches on every visible line.
return {
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          multi_line = false,
        },
      },
    },
  },
}
