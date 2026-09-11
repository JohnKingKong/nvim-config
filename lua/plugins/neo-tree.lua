return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      bind_to_cwd = true,
      filtered_items = {
        always_show_by_pattern = {
          ".env*",
        },
      },
    },
    window = {
      mappings = {
        ["<leader>tr"] = {
          function(state)
            local node = state.tree:get_node()
            require("scan-o-tron-3000").run_path(node.path)
          end,
          desc = "Run tests at this path",
        },
        -- LazyVim's global <leader>bb ("switch to other buffer") runs `:e #`
        -- in whatever window is focused. Inside neo-tree's own window that
        -- replaces the tree with a file buffer, which then confuses
        -- neo-tree's window tracking (duplicate tree splits, tab closing
        -- when you close what you thought was the extra one). Jump to the
        -- adjacent edit window first, so the switch happens there instead.
        ["<leader>bb"] = {
          function()
            vim.cmd("wincmd p")
            require("floo").switch_to_other_buffer()
          end,
          desc = "Switch to Other Buffer (edit window)",
        },
      },
    },
  },
}
