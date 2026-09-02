return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["<leader>tr"] = {
          function(state)
            local node = state.tree:get_node()
            require("scan-o-tron-3000").run_path(node.path)
          end,
          desc = "Run tests at this path",
        },
      },
    },
  },
}
