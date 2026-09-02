return {
  "johnkingkong/scan-o-tron-3000.nvim",
  keys = {
    { "<leader>tt", function() require("scan-o-tron-3000").run_nearest() end, desc = "Run nearest test" },
    { "<leader>tf", function() require("scan-o-tron-3000").run_file() end, desc = "Run file's tests" },
    { "<leader>tp", function() require("scan-o-tron-3000").run_project() end, desc = "Run project's tests" },
    { "<leader>ts", function() require("scan-o-tron-3000").toggle_panel() end, desc = "Toggle test output panel" },
  },
  config = function()
    require("scan-o-tron-3000").setup()
  end,
}
