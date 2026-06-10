return {
  "akinsho/toggleterm.nvim",
  version = "*",                     -- Use latest stable version
  dependencies = {
    -- No hard dependencies, but if you want extra features, none required
  },
  module = "toggleterm",            -- Optional: lazy-load on module require

  config = function()
    require("toggleterm").setup({
      -- Core settings
      size = 20,                     -- Default terminal size (rows for horiz, cols for vert, size for float)
      open_mapping = [[<c-\>]],     -- Toggle with Ctrl + \
      direction = 'float',          -- 'float', 'horizontal', 'vertical', 'tab'
      hide_numbers = true,          -- Hide line numbers in terminal buffers
      shade_terminals = true,       -- Shade background of floating terminal when unfocused
      start_in_insert = true,       -- Start in insert mode
      insert_mappings = true,       -- Enable mappings in insert mode
      close_on_exit = true,         -- Close terminal when process exits
      -- Floating window options (only used if direction = 'float')
      float_opts = {
        border = 'curved',          -- 'single', 'double', 'curved', 'shadow', 'rounded', 'solid'
        width = 90,                 -- Width percentage or fixed number of columns
        height = 30,                -- Height percentage or fixed number of rows
        winblend = 3,               -- Transparency level (0-100)
        title_pos = 'center',       -- 'center', 'left', 'right'
      },
    })

    -- Keymaps (normal mode)
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<CR>', opts)                     -- Toggle default terminal
    vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', opts) -- Horizontal split
    vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>', opts)   -- Vertical split
    vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', opts)      -- Floating window

    -- Optional: Quick exit terminal mode with 'jk'
    vim.keymap.set('t', 'jk', '<C-\\><C-n>', { noremap = true, silent = true })

    -- Optional: Open a terminal with a specific command (e.g., lazygit, htop)
    vim.keymap.set('n', '<leader>lg', '<cmd>ToggleTerm size=30 cmd=lazygit<CR>', opts)
    vim.keymap.set('n', '<leader>ht', '<cmd>ToggleTerm cmd=htop<CR>', opts)
  end,
}
