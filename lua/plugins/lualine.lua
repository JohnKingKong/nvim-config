-- Extends LazyVim's default lualine (lazyvim/plugins/ui.lua) with
-- clickaholic's buttons, appended to lualine_x. clickaholic.nvim never
-- writes to vim.o.statusline itself -- lualine.nvim already owns and
-- continuously re-renders that, so clickaholic fires a "ClickaholicButtonsChanged"
-- User autocmd instead and this file is what actually re-runs
-- require('lualine').setup(...) with fresh button components.
return {
  "nvim-lualine/lualine.nvim",
  config = function(_, opts)
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
