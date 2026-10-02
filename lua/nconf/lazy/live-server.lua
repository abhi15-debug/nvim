return {
  "selimacerbas/live-server.nvim",
  cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
  keys = {
    { "<leader>ls", "<cmd>LiveServerToggle<cr>", desc = "Toggle Live Server" },
  },
  opts = {
    port = 8080,
    -- Tell the plugin NOT to handle opening the browser automatically
    -- This prevents background execution crashes on headless/WSL/TMUX setups
    browser = "none", 
  },
}

