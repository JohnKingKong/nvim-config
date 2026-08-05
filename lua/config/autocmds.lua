-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Auto-enter terminal mode when focusing a terminal buffer
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "term://*",
  callback = function()
    vim.cmd("startinsert")
  end,
})

-- Open Claude terminal on startup instead of neo-tree
-- vim.api.nvim_create_autocmd("UIEnter", {
--  once = true,
--  callback = function()
--    vim.defer_fn(function()
--      -- Close neo-tree if it opened automatically
--      require("neo-tree.command").execute({ action = "close" })
--      -- Open Claude pane
--      Snacks.terminal.toggle("claude", { win = { position = "left", width = 50 } })
--    end, 100)
--  end,
--})
