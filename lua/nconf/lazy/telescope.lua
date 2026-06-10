return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    "ahmedkhalf/project.nvim" -- 1. Add the project manager as a dependency
  },
  module = "telescope",

  config = function()
    -- 2. Initialize the project manager plugin first
    require("project_nvim").setup({
      manual_mode = false, -- Automatically discovers git repos you open
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
    })

    require('telescope').setup({})

    -- 3. Load the project extension into telescope
    require('telescope').load_extension('projects')

    local builtin = require('telescope.builtin')

    vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
    vim.keymap.set("n", "<leader>fr", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
    vim.keymap.set("n", "<leader>fh", ":Telescope find_files hidden=true <CR>")

    -- 4. VS CODE STYLE: Hotkey to view and switch recent projects
    vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>", { desc = "Recent Projects" })

    vim.keymap.set('n', '<leader>pws', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<leader>pWs', function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)
  end
}

