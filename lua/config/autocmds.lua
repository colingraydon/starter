-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Set 4-space indentation for JS/TS files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  callback = function()
    vim.opt_local.tabstop = 4 -- 1 tab = 4 spaces
    vim.opt_local.shiftwidth = 4 -- Indent = 4 spaces
    vim.opt_local.softtabstop = 4 -- Tab key inserts 4 spaces
    vim.opt_local.expandtab = true -- Convert tabs to spaces
  end,
})
