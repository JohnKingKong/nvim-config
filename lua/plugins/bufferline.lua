return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      always_show_bufferline = true,
      custom_filter = function(buf_number)
        return require("floo").buf_belongs_to_current_workspace(buf_number)
      end,
      custom_areas = {
        left = function()
          return require("floo.tabline").custom_area()
        end,
        right = function()
          return require("clickaholic.tabline").custom_area()
        end,
      },
    },
  },
}
