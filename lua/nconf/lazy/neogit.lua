return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- Required
    "sindrets/diffview.nvim",        -- Recommended: For enhanced diff splits
    "nvim-telescope/telescope.nvim", -- Optional: For choosing branches/commits
  },
  config = function()
    require("neogit").setup({
      -- Integrates telescope as your selection interface inside neogit
      integrations = {
        telescope = true,
      },
    })

    -- Quick keymap to launch Neogit (Matches your <leader> styling)
    vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", { silent = true })
  end,
}
