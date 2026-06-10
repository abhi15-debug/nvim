return {
  "williamboman/mason.nvim",
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "vtsls", "eslint", "lua_ls" },
        automatic_installation = true,
      })

      vim.lsp.config("vtsls", {
        cmd = { "vtsls", "--stdio" },
        filetypes = {
          "javascript", "javascriptreact",
          "typescript", "typescriptreact",
          "vue", "svelte"
        },
        root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
        settings = {
          typescript = {
            suggest = { autoImports = true, completeFunctionCalls = true },
            updateImportsOnFileMove = { enabled = "always" },
            inlayHints = {
              parameterNames = { enabled = "all" },
              variableTypes = { enabled = true },
            },
          },
          javascript = { suggest = { autoImports = true } },
        },
      })

      vim.lsp.enable("vtsls")

      -- ✅ ADD THE AUTOCOMMAND HERE (the code block above)
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          local opts = { buffer = bufnr, remap = false }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
           vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

          -- Refactoring & actions
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)
          vim.keymap.set('v', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)

          -- Diagnostics (errors/warnings)
          vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        end,
      })
    end,
  },
}
