return {
  "JohnKingKong/clickaholic.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>cb", "<cmd>Clickaholic<cr>", desc = "Clickaholic: Manage Buttons" },
  },
  opts = {
    renderer = "tabline",
    buttons = {
      { label = "Explorer", icon = "🌳", action_type = "cmd", action = "Neotree toggle" },
    },
  },
  config = function(_, opts)
    require("clickaholic").setup(opts)
  end,
}
