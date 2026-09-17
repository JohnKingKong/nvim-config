-- Fork with a fix for dashboard.lua's size() throwing "Invalid window id"
-- when the dashboard's window is closed/replaced and a later resize event
-- fires elsewhere. Not merged upstream yet.
return {
  "JohnKingKong/snacks.nvim",
  name = "snacks.nvim",
}
