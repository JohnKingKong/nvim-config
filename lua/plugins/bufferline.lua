return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      always_show_bufferline = true,
      custom_filter = function(buf_number)
        return require("floo").buf_belongs_to_current_workspace(buf_number)
      end,
      custom_areas = {
        -- Both on the left: a custom_areas side's width always shifts the
        -- open-buffer tab list (whatever's left in between left/right), so
        -- putting clickaholic's buttons on the right made the actual
        -- fireplace's buffer tabs shrink/grow with the button count. Left
        -- doesn't eliminate that (any custom area does this, on either
        -- side), but it at least keeps the fireplace name and the buttons
        -- grouped together, growing in the same direction.
        left = function()
          local items = {}
          vim.list_extend(items, require("floo.tabline").custom_area())
          vim.list_extend(items, require("clickaholic.tabline").custom_area())
          return items
        end,
      },
    },
  },
}
