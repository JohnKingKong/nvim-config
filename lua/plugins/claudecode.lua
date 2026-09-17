--- ~/.config/nvim/lua/plugins/claudecode.lua
return {
  "JohnKingKong/claudecode.nvim", -- fork: openDiff/close_all_diff_tabs not registered, see commit c892c1d
  event = "VeryLazy",
  opts = {
    auto_start = true,
    terminal = {
      provider = "none",
    },
  },
  keys = {
    -- Added the actual command "<cmd>ClaudeCodeSend<cr>" right after the key binding
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = { "n", "v" }, desc = "Send context to Claude Code" },
  },
}
