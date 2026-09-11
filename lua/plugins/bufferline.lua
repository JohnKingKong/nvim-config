return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      always_show_bufferline = true,
      custom_filter = function(buf_number)
        return require("floo").buf_belongs_to_current_workspace(buf_number)
      end,
    },
  },
}
