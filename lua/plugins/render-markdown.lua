return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    opts = {
      -- LazyVim's markdown extra sets heading.icons = {}, which also disables
      -- concealing the '#' markers (position = "overlay" hides them by
      -- drawing the icon glyph over them, so an empty icon list means the
      -- markers are never covered). Restore the plugin's default icons.
      heading = {
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
    },
  },
}
