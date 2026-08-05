return {
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = false,
      },
      formatters = {
        biome = {
          command = "biome",
          args = { "check", "--write", "--no-errors-on-unmatched", "$FILENAME" },
          stdin = false,
        },
      },
      formatters_by_ft = {
        typescript = { "biome" },
        typescriptreact = { "biome" },
        javascript = { "biome" },
        javascriptreact = { "biome" },
        json = { "biome" },
      },
    },
  },
}
