return {
  "sphamba/smear-cursor.nvim",
  -- Neovide already animates the cursor natively; this plugin is meant for
  -- terminals without that capability, so skip it under Neovide.
  cond = not vim.g.neovide,
  opts = {},
}
