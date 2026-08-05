-- ~/.config/nvim/lua/plugins/claude-reviewer.lua
return {
  {
    "johnkingkong/claude-reviewer.nvim",
    lazy = false,
    config = function()
      require("claude-reviewer").setup({
        keymaps = {
          approve = "<leader>ca",
          deny = "<leader>cd",
        },
      })
    end,
  },
}
