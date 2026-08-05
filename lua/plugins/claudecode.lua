--- ~/.config/nvim/lua/plugins/claudecode.lua
return {
  "coder/claudecode.nvim",
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
