-- ~/.config/nvim/lua/plugins/albus-conflictius.lua
return {
  {
    "johnkingkong/albus-conflictius.nvim",
    lazy = false,
    config = function()
      require("albus-conflictius").setup()
    end,
  },
}
