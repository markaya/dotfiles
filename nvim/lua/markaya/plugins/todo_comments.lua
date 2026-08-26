return {
  'folke/todo-comments.nvim',
  event = 'vimenter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = false,
    highlight = {
      comments_only = false,
    },
  },
}

--[[
-- :TodoQuickFix 
This uses the quickfix list to show all todos in your project.
-- :TodoLocList
This uses the location list to show all todos in your project.
-- :Trouble todo
List all project todos in trouble
Use Trouble's filtering: Trouble todo filter = {tag = {TODO,FIX,FIXME}}
-- :TodoTelescope
Search through all project todos with Telescope
--]]
