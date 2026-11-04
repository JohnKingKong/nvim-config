return {
  "JohnKingKong/clickaholic.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>cb", "<cmd>Clickaholic<cr>", desc = "Clickaholic: Manage Buttons" },
  },
  opts = {
    renderer = "lualine",
    buttons = {
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
      {
        label = "run backend",
        icon = "🚀",
        action_type = "cmd",
        action = "botright split | terminal source ~/.zshrc >/dev/null 2>&1; cd /Users/johnkingkong/Evolia/evolia-api && npm run start",
        cwd = "/Users/johnkingkong/Evolia/evolia-api",
      },
      {
        label = "run backend (dev)",
        icon = "🚀",
        action_type = "cmd",
        action = "botright split | terminal source ~/.zshrc >/dev/null 2>&1; cd /Users/johnkingkong/Evolia/evolia-api && npm run start:dev",
        cwd = "/Users/johnkingkong/Evolia/evolia-api",
      },
      {
        label = "run mobile",
        icon = "🚀",
        action_type = "cmd",
        action = "botright split | terminal source ~/.zshrc >/dev/null 2>&1; cd /Users/johnkingkong/Evolia/voila-mobile && npm run start",
        cwd = "/Users/johnkingkong/Evolia/voila-mobile",
      },
      {
        label = "run ios",
        icon = "🚀",
        action_type = "cmd",
        action = "botright split | terminal source ~/.zshrc >/dev/null 2>&1; cd /Users/johnkingkong/Evolia/voila-mobile && npm run ios",
        cwd = "/Users/johnkingkong/Evolia/voila-mobile",
      },
      {
        label = "run android",
        icon = "🚀",
        action_type = "cmd",
        action = "botright split | terminal source ~/.zshrc >/dev/null 2>&1; cd /Users/johnkingkong/Evolia/voila-mobile && npm run android",
        cwd = "/Users/johnkingkong/Evolia/voila-mobile",
      },
    },
  },
  config = function(_, opts)
    require("clickaholic").setup(opts)
  end,
}
