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
        label = "Console",
        icon = "🚀",
        action_type = "cmd",
        -- :terminal runs its command via `zsh -c`, which -- like clickaholic's
        -- own shell buttons -- never sources .zshrc, so the nvm-managed pnpm
        -- (and its pinned-version auto-switch) is invisible without this.
        action = "botright split | terminal source ~/.zshrc >/dev/null 2>&1; cd /Users/johnkingkong/Evolia/evolia-mono/apps/console && pnpm run start",
      },
    },
  },
  config = function(_, opts)
    require("clickaholic").setup(opts)
  end,
}
