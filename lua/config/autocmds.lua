-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- LazyVim.root() caches its result per-buffer, invalidated only on
-- LspAttach/BufWritePost/DirChanged/BufEnter - LazyVim's own root.lua admits
-- this doesn't reliably clear around neo-tree's own root-changing behavior
-- ("doesn't properly clear cache in neo-tree `set_root`... probably because
-- the event is triggered in the neo-tree buffer"). floo-network.nvim opens a
-- separate neo-tree instance per workspace tab, so anything built on
-- LazyVim.root() (<leader><space> find files, <leader>gg lazygit, etc.) can
-- intermittently resolve a stale root left over from a previous workspace.
-- Force a fresh lookup on every tab switch instead of trusting that cache.
vim.api.nvim_create_autocmd("TabEnter", {
  callback = function()
    local ok, root = pcall(require, "lazyvim.util.root")
    if ok then
      root.cache = {}
    end
  end,
})

-- Auto-enter terminal mode when a terminal is first opened. TermOpen (not
-- BufEnter) fires once, at creation -- BufEnter re-fires on every later
-- revisit too (buffer cycling, bufferline clicks, <C-6>, window nav), so it
-- was force-entering terminal-insert mode any time focus merely passed
-- through an existing terminal buffer, not just when one was freshly
-- opened. Once there, <leader> (space) -- along with nearly every other
-- key -- goes straight to the shell/TUI underneath instead of Neovim,
-- which looks exactly like "the leader key stopped working."
vim.api.nvim_create_autocmd("TermOpen", {
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

-- Auto-handle stale swap files instead of erroring. When snacks.nvim's picker
-- jumps to a file, it opens the buffer via nvim_exec2 from a vim.schedule
-- callback (a non-interactive API context), so nvim can't show the normal
-- E325 "swap file exists" dialog and throws instead. Silently editing anyway
-- avoids the crash; nvim still separately detects real concurrent writes on save.
vim.api.nvim_create_autocmd("SwapExists", {
  callback = function()
    vim.v.swapchoice = "e"
  end,
})

-- Transparent background: re-applied on every colorscheme load so it survives
-- colorscheme switches instead of only running once at startup.
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local groups = {
      "Normal",
      "NormalFloat",
      "FloatBorder",
      "Pmenu",
      "Terminal",
      "EndOfBuffer",
      "FoldColumn",
      "Folded",
      "SignColumn",
      "NormalNC",
      "WhichKeyFloat",
      "TelescopeBorder",
      "TelescopeNormal",
      "TelescopePromptBorder",
      "TelescopePromptTitle",
      "NeoTreeNormal",
      "NeoTreeNormalNC",
      "NeoTreeVertSplit",
      "NeoTreeWinSeparator",
      "NeoTreeEndOfBuffer",
      "NvimTreeNormal",
      "NvimTreeVertSplit",
      "NvimTreeEndOfBuffer",
      "NotifyINFOBody",
      "NotifyERRORBody",
      "NotifyWARNBody",
      "NotifyTRACEBody",
      "NotifyDEBUGBody",
      "NotifyINFOTitle",
      "NotifyERRORTitle",
      "NotifyWARNTitle",
      "NotifyTRACETitle",
      "NotifyDEBUGTitle",
      "NotifyINFOBorder",
      "NotifyERRORBorder",
      "NotifyWARNBorder",
      "NotifyTRACEBorder",
      "NotifyDEBUGBorder",
    }
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
    end
  end,
})
