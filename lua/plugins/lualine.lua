-- Extends LazyVim's default lualine (lazyvim/plugins/ui.lua) with
-- clickaholic's buttons, appended to lualine_x. clickaholic.nvim never
-- writes to vim.o.statusline itself -- lualine.nvim already owns and
-- continuously re-renders that, so clickaholic fires a "ClickaholicButtonsChanged"
-- User autocmd instead and this file is what actually re-runs
-- require('lualine').setup(...) with fresh button components.
return {
  "nvim-lualine/lualine.nvim",
  config = function(_, opts)
    -- LazyVim's lualine.nvim's `extensions = { "neo-tree", ... }` swaps in a
    -- minimal, neo-tree-specific statusline (no lualine_x, so no
    -- clickaholic buttons) whenever that window is focused. laststatus=3
    -- (LazyVim's own default) makes the statusline genuinely global -- one
    -- shared row -- but lualine still re-points that row's *content* at
    -- whichever window last took focus, neo-tree included, unless told
    -- otherwise. ignore_focus is lualine's own mechanism for exactly this:
    -- focusing a listed filetype doesn't update which window's content the
    -- global statusline shows, so it keeps showing the real edit window's
    -- content (buttons included) even while neo-tree's sidebar has focus.
    opts.options = opts.options or {}
    opts.options.ignore_focus = opts.options.ignore_focus or {}
    table.insert(opts.options.ignore_focus, "neo-tree")

    local base_x = vim.deepcopy(opts.sections.lualine_x or {})

    local function refresh()
      opts.sections.lualine_x = vim.list_extend(vim.deepcopy(base_x), require("clickaholic.lualine").components())
      require("lualine").setup(opts)
    end

    -- Render immediately with whatever's already available, then correct
    -- it on the next tick: VeryLazy handler order across different plugins
    -- is unspecified, so clickaholic's own buttons may not be populated yet
    -- at this exact point. vim.schedule runs after every VeryLazy handler
    -- in this tick (including clickaholic's own setup()) has finished,
    -- regardless of which one ran first.
    require("lualine").setup(opts)
    vim.schedule(refresh)

    vim.api.nvim_create_autocmd("User", {
      pattern = "ClickaholicButtonsChanged",
      callback = refresh,
    })
  end,
}
