-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Diff between unsaved buffer and saved file
vim.api.nvim_create_user_command("DiffOrig", function()
  -- 1. Get the current buffer and its absolute file path
  local start_buf = vim.api.nvim_get_current_buf()
  local filepath = vim.api.nvim_buf_get_name(start_buf)

  -- 2. Prevent errors if it's a brand new file that hasn't been saved yet
  if filepath == "" or vim.fn.filereadable(filepath) == 0 then
    vim.notify("No saved file on disk to compare against.", vim.log.levels.WARN)
    return
  end

  -- 3. Create a scratch buffer for the disk version
  local scratch_buf = vim.api.nvim_create_buf(false, true)

  -- 4. Open it in a vertical split
  vim.cmd("vertical sbuffer " .. scratch_buf)
  vim.bo[scratch_buf].filetype = vim.bo[start_buf].filetype

  -- 5. Read the file explicitly using its path (fixes E499)
  vim.cmd("read ++edit " .. vim.fn.fnameescape(filepath))

  -- 6. Clean up the empty first line and start diffing
  vim.cmd("0d_")
  vim.cmd("diffthis")
  vim.cmd("wincmd p")
  vim.cmd("diffthis")
end, { desc = "Diff current unsaved buffer with saved file" })

-- Keep your shortcut!
vim.keymap.set("n", "<leader>cd", "<cmd>DiffOrig<cr>", { desc = "Diff Unsaved Changes" })
