return {
  "JohnKingKong/floo-network.nvim",
  event = "VeryLazy",
  opts = {
    keys = {
      new = "<leader><tab>w",
      rename = "<leader><tab>n",
      pin = "<leader><tab>p",
      switch = "<leader><tab>s",
      close = "<leader><tab>d",
      close_others = "<leader><tab>o",
      switch_buffer = "<leader>bb",
      explorer = "<leader>e",
    },
    dropdown = {
      position = "top-right",
      border = "rounded",
    },
    session = {
      enabled = true,
      persist = "pinned",
    },
    neo_tree = {
      enabled = true,
    },
  },
}
