return {
  "pwntester/octo.nvim",
  cwd = "Octo",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("octo").setup({
      enable_builtin = true,
    })
  end,
  keys = {
    { "<leader>go", "<cmd>Octo<cr>", desc = "Octo Github" },
    { "<leader>gp", "<cmd>Octo pr list<cr>", desc = "List PRs" },
  },
}
