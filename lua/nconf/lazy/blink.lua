return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'L3MON4D3/LuaSnip', -- Integrates with your existing snippets engine
    },
    version = '*',
    -- 🌟 OPTIMIZATION: Removed manual cargo compilation. 
    -- Lazy will now pull the pre-compiled Rust binaries automatically.

    config = function()
      require('blink.cmp').setup({
        -- 1. Keymaps: Configured for ultimate home-row and standard navigation
        keymap = { 
          preset = 'default',
          -- Multi-option navigation (Tab, Arrows, or Ctrl chords all work!)
          ['<Tab>'] = { 'select_next', 'fallback' },
          ['<S-Tab>'] = { 'select_prev', 'fallback' },
          ['<Down>'] = { 'select_next', 'fallback' },
          ['<Up>'] = { 'select_prev', 'fallback' },
          ['<C-j>'] = { 'select_next', 'fallback' },
          ['<C-k>'] = { 'select_prev', 'fallback' },
          
          -- Hitting Enter accepts completion and runs LSP Auto-Imports
          ['<CR>'] = { 'accept', 'fallback' },
        },

        -- 2. Snippets Engine Integration
        snippets = {
          expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
          active = function(filter)
            if filter and filter.direction then
              return require('luasnip').jumpable(filter.direction)
            end
            return require('luasnip').in_snippet()
          end,
          jump = function(direction) require('luasnip').jump(direction) end,
        },

        -- 3. Visual appearance and icon support
        appearance = { 
          use_nvim_cmp_as_default = false, -- Shifted entirely away from nvim-cmp
          nerd_font_variant = 'mono' 
        },

        -- 4. Core feature: Automatic function signature help while typing
        signature = { 
          enabled = true,
          window = {
            border = 'rounded',
            winblend = 0,
          }
        },

        -- 5. Completion Menu Layout Configuration
        completion = {
          keyword = { range = 'full' },
          ghost_text = { enabled = true }, -- Shows a faint preview inside your text line
          documentation = { 
            auto_show = true, 
            auto_show_delay_ms = 200,
            window = { border = 'rounded' }
          },
          menu = {
            border = 'rounded',
            draw = {
              columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind', gap = 1 } },
            }
          }
        },

        -- 6. Balanced Data Sources
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
      })
    end
  }
}

