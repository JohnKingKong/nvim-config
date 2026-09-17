return {
  {
    "stevearc/conform.nvim",
    opts = {
      -- LazyVim strips format_on_save/format_after_save and drives formatting
      -- itself via BufWritePre -> conform.format({ bufnr = buf }), which
      -- inherits default_format_opts. biome regularly takes 1-3s in this
      -- monorepo (workspace-wide config resolution), well past a reasonable
      -- synchronous wait, so async=true here is what actually stops the
      -- freeze (setting format_after_save does nothing under LazyVim).
      default_format_opts = {
        async = true,
      },
      -- "biome-check" is conform's builtin: resolves node_modules/.bin/biome
      -- automatically (a bare "biome" command only checks global $PATH,
      -- where it isn't installed) and pipes via stdin instead of writing
      -- $FILENAME directly.
      formatters_by_ft = {
        typescript = { "biome-check" },
        typescriptreact = { "biome-check" },
        javascript = { "biome-check" },
        javascriptreact = { "biome-check" },
        json = { "biome-check" },
      },
    },
  },
}
