-- Database viewer (WebStorm-style): connect, browse collections/tables in
-- a tree, click one to see its rows/documents, write and run raw queries
-- (including updates/inserts/deletes) in the same buffer. Requires
-- `mongosh` on PATH for MongoDB connections (dadbod shells out to it
-- directly) -- `brew install mongosh`.
--
-- Connection is read from environment variables (DBUI_URL / DBUI_NAME),
-- never committed to this config. Set them in your shell profile, e.g.:
--   export DBUI_URL="mongodb://user:pass@host:port/dbname"
--   export DBUI_NAME="mydb"
-- Multiple named connections (dev/staging/prod) are also supported later
-- via vim-dotenv + a DB_UI_<NAME> prefix convention, if ever needed.
return {
  {
    "tpope/vim-dadbod",
    lazy = true,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = { "tpope/vim-dadbod" },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    keys = {
      { "<leader>Du", "<cmd>DBUIToggle<cr>", desc = "Toggle Database UI" },
      { "<leader>Df", "<cmd>DBUIFindBuffer<cr>", desc = "Find Database Buffer" },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      -- Keep the query result window from swallowing the whole editor on a
      -- big result set.
      vim.g.db_ui_win_position = "right"
      vim.g.db_ui_winwidth = 40
    end,
  },
}
