return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        -- Disable netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        
        -- Setup nvim-tree
        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = {
                width = 30,
                side = "left",
            },
            renderer = {
                group_empty = true,
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },
                },
            },
            filters = {
                dotfiles = false,
                custom = { ".git" },
            },
            git = {
                enable = true,
                ignore = false,
            },
        })
        
        -- Key mappings
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", 
            { desc = "Toggle file explorer" })
        vim.keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>", 
            { desc = "Focus file explorer" })
        vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", 
            { desc = "Refresh file explorer" })
    end,
}
