return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      -- Seamless handoff to the completion engine (Blink)
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Automatically enable installed Mason servers, avoiding duplicate TS/Python servers
      require("mason-lspconfig").setup({
        automatic_enable = {
          exclude = { "vtsls", "pylsp" },
        },
      })

      -- Buffer-local keymaps configured whenever an LSP client attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(ev)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
          end

          local has_telescope, builtin = pcall(require, "telescope.builtin")

          -- Standard navigation mappings
          map("gd", vim.lsp.buf.definition, "Go to Definition")
          map("gD", vim.lsp.buf.declaration, "Go to Declaration")
          map("gr", has_telescope and builtin.lsp_references or vim.lsp.buf.references, "Go to References")
          map("gi", has_telescope and builtin.lsp_implementations or vim.lsp.buf.implementation, "Go to Implementation")
          map("<leader>D", has_telescope and builtin.lsp_type_definitions or vim.lsp.buf.type_definition, "Type Definition")

          -- Refactoring & actions
          map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
          map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "v" })

          -- Hover & Signature Help
          map("K", function() vim.lsp.buf.hover({ border = "rounded" }) end, "Hover Documentation")
          map("gK", function() vim.lsp.buf.signature_help({ border = "rounded" }) end, "Signature Help")
        end,
      })
    end,
  },
}
