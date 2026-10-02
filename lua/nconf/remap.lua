vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


-- 3. New Global NvimTree Mappings (Added Here)
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>",
  { desc = "Toggle file explorer", silent = true, noremap = true })
vim.keymap.set("n", "<leader>f", "<cmd>NvimTreeFocus<CR>",
  { desc = "Focus file explorer", silent = true, noremap = true })
vim.keymap.set("n", "<leader>r", "<cmd>NvimTreeRefresh<CR>",
  { desc = "Refresh file explorer", silent = true, noremap = true })


-- 4. Global Neogit Mapping (Added Here)
vim.keymap.set("n", "<leader>g", "<cmd>Neogit<CR>", { desc = "Open Neogit panel", silent = true, noremap = true })


-- 5. Escape Alternatives (Added Here)
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode" })


-- 6. Move Lines Up and Down with Alt + j/k (Added Here)
-- Normal Mode
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })

-- Insert Mode
vim.keymap.set("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move line down" })
vim.keymap.set("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move line up" })

-- Visual Mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })


-- Fast Page Scrolling with Ctrl + j/k
-- Normal Mode
vim.keymap.set("n", "<C-j>", "<C-d>", { desc = "Scroll half-page down (Fast)" })
vim.keymap.set("n", "<C-k>", "<C-u>", { desc = "Scroll half-page up (Fast)" })

-- Visual Mode (Keeps your selection intact while scrolling)
vim.keymap.set("v", "<C-j>", "<C-d>", { desc = "Scroll half-page down (Fast)" })
vim.keymap.set("v", "<C-k>", "<C-u>", { desc = "Scroll half-page up (Fast)" })

