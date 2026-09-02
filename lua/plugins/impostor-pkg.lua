-- ~/.config/nvim/lua/plugins/impostor-pkg.lua
return {
  {
    "johnkingkong/impostor-pkg.nvim",
    lazy = false,
    config = function()
      require("impostor-pkg").setup()
    end,
  },
}
