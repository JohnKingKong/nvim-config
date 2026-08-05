-- ~/.config/nvim/lua/plugins/supermaven.lua
return {
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    opts = {
      keymaps = {
        accept_suggestion = "<C-a>", -- Maps Ctrl + a to accept
        clear_suggestion = "<C-]>", -- Maps Ctrl + ] to clear
        accept_word = "<C-j>", -- Maps Ctrl + j to accept word
      },
      ignore_filetypes = { "TelescopePrompt" },
    },
  },
}
