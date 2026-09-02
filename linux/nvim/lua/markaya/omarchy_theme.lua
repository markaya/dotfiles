-- Applies Omarchy's system-wide theme to a non-LazyVim config.
--
-- omarchy-theme-set writes ~/.local/state/omarchy/current/theme/neovim.lua on
-- every theme change. omarchy-nvim (LazyVim-based) auto-imports that file as
-- a plugin spec, where the sentinel entry {"LazyVim/LazyVim", opts = {...}}
-- just merges opts.colorscheme onto the LazyVim plugin they already declare.
-- We don't declare that plugin, so importing the file the same way would
-- make lazy.nvim try to install the real LazyVim/LazyVim repo. Instead we
-- read the file directly with dofile() -- never through lazy's plugin
-- importer -- and only pull out the colorscheme name.
local M = {}

local theme_file = vim.fn.expand '~/.local/state/omarchy/current/theme/neovim.lua'
local transparency_file = vim.fn.stdpath 'config' .. '/plugin/after/transparency.lua'

local function read_colorscheme()
  if vim.fn.filereadable(theme_file) == 0 then
    return nil
  end

  local ok, spec = pcall(dofile, theme_file)
  if not ok or type(spec) ~= 'table' then
    return nil
  end

  for _, entry in ipairs(spec) do
    if type(entry) == 'table' and entry.opts and entry.opts.colorscheme then
      return entry.opts.colorscheme
    end
  end
end

function M.apply()
  local colorscheme = read_colorscheme()
  if not colorscheme then
    return
  end

  -- Lazy-load the colorscheme plugin declared in plugins/all-themes.lua,
  -- same call omarchy-nvim's own hot-reload uses.
  pcall(function()
    require('lazy.core.loader').colorscheme(colorscheme)
  end)

  local ok = pcall(vim.cmd.colorscheme, colorscheme)
  if not ok then
    return
  end

  if vim.fn.filereadable(transparency_file) == 1 then
    vim.cmd.source(transparency_file)
  end
end

function M.setup()
  M.apply()

  -- Omarchy doesn't push theme changes into a running nvim, so poll the
  -- theme file's mtime on focus and reapply when it moves.
  local last_mtime = vim.fn.getftime(theme_file)
  vim.api.nvim_create_autocmd('FocusGained', {
    desc = 'Reapply the Omarchy colorscheme when it changes system-wide',
    callback = function()
      local mtime = vim.fn.getftime(theme_file)
      if mtime ~= last_mtime then
        last_mtime = mtime
        M.apply()
      end
    end,
  })

  vim.api.nvim_create_user_command('OmarchyThemeReload', M.apply, {
    desc = "Re-read Omarchy's active theme and reapply it",
  })
end

return M
