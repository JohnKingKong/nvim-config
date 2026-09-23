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
      {
        label = "run console",
        icon = "🚀",
        action_type = "cmd",
        action = "botright split | terminal source ~/.zshrc >/dev/null 2>&1; cd /Users/johnkingkong/Evolia/evolia-mono/apps/console && pnpm run start",
        cwd = "/Users/johnkingkong/Evolia/evolia-mono",
      },
      {
        label = "run local",
        icon = "🚀",
        action_type = "cmd",
        action = "botright split | terminal source ~/.zshrc >/dev/null 2>&1; cd /Users/johnkingkong/Evolia/evolia-mono/apps/console && pnpm run start:local",
        cwd = "/Users/johnkingkong/Evolia/evolia-mono",
      },
    },
  },
  config = function(_, opts)
    require("clickaholic").setup(opts)
  end,
}
