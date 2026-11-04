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
        -- clickaholic.tabline.custom_area() pads itself out to the full
        -- (unfiltered) button list's width, so cwd-scoped buttons showing/
        -- hiding as you switch fireplaces no longer reflows the buffer
        -- tabs -- see clickaholic/tabline.lua for why that's needed.
        right = function()
          return require("clickaholic.tabline").custom_area()
        end,
      },
    },
  },
}
