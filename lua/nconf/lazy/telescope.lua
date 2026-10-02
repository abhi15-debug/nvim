return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ahmedkhalf/project.nvim" 
  },
  module = "telescope",

  config = function()
    -- FIX: This tells Neovim to ACTUALLY change directories to your project folder
    require("project_nvim").setup({
      manual_mode = false, 
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
      
      -- Add these lines to force Neovim to update its internal path automatically
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true
      },
    })

    require('telescope').setup({})
    require('telescope').load_extension('projects')

    local builtin = require('telescope.builtin')

    -- All keys now pull from Neovim's corrected path!
    vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
    vim.keymap.set("n", "<leader>fr", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
    vim.keymap.set("n", "<leader>fh", function() builtin.find_files({ hidden = true }) end, {})
    
    -- Remapped fG to look at your current directory instead of "~"
    vim.keymap.set("n", "<leader>fG", builtin.find_files, {})
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

