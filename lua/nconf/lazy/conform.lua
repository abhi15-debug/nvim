return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" }, -- Load plugin automatically right before saving a file
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer manually",
    },
  },
  config = function()
    require("conform").setup({
      -- Define formatters for Web development, Python, Lua, and common configurations
      formatters_by_ft = {
        -- JavaScript & TypeScript ecosystems
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        
        -- Web layout and styling languages
        html = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        scss = { "prettierd", "prettier", stop_after_first = true },
        
        -- Structured data, configuration, and documentation
        json = { "prettierd", "prettier", stop_after_first = true },
        jsonc = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        graphql = { "prettierd", "prettier", stop_after_first = true },
        
        -- Other common language formatters
        lua = { "stylua" },
        python = { "isort", "black" }, -- Runs isort (imports) then black (syntax)
        sh = { "shfmt" },              -- For Bash and Shell scripts
        bash = { "shfmt" },
      },
      
      -- Clean format-on-save integration inside the setup options
      format_on_save = {
        timeout_ms = 500,    -- Time window to attempt formatting before giving up
        lsp_fallback = true, -- Falls back to default LSP formatting if tool is missing
      },
    })
  end
}

