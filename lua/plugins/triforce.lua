return {
  "gisketch/triforce.nvim",
  dependencies = { "nvzone/volt" },
  -- Upstream's documented default is <leader>tp, which collides with
  -- scan-o-tron-3000's "run project's tests" binding -- moved to capital T.
  keys = {
    {
      "<leader>Tp",
      function()
        require("triforce").show_profile()
      end,
      desc = "Triforce: show profile",
    },
  },
  opts = {},
}
