return {
  -- Your existing Copilot configuration
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    build = ":Copilot auth",
    opts = {
      panel = { enabled = false },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<M-l>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
    },
  },

  -- The New Copilot Chat Plugin Configuration
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- Pulls details from your active auth
      { "nvim-lua/plenary.nvim" },  -- Utility library requirement
    },
    opts = {
      debug = false, -- Disables internal log dumps
      window = {
        layout = "vertical", -- Opens the chat window in a vertical split layout
        width = 0.4,        -- Takes up 40% of your screen width
      },
    },
    keys = {
      -- Press Space + c + c to toggle the main Chat Sidebar layout open/closed
      { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle Sidebar" },
      -- Press Space + c + e in Visual Mode to ask a question about your highlighted selection
      {
        "<leader>ce",
        function()
          local input = vim.fn.input("Ask Copilot: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
          end
        end,
        mode = "x",
        desc = "CopilotChat - Ask question about selection",
      },
    },
  },
}

