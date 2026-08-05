return {
  "johnkingkong/globular-telescope.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {},
  keys = {
    { "<leader>f/", "<cmd>GlobularGrep<cr>", desc = "Live Grep (choose glob)" },
  },
  config = function()
    require("globular-telescope").setup({
      presets = {
        {
          label = "Styles",
          glob = "*.{css,css.ts,scss}",
        },
      },
    })
  end,
}
