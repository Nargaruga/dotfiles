vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", function() vim.cmd "NvimTreeToggle" end,
    { desc = "Explore directory"})

-- Move selected text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv",
    { desc = "Move selected text up" })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv",
    { desc = "Move selected text down" })

-- Keep cursor centered during page up/down
vim.keymap.set("n", "<C-u>", "<C-u>zz",
    { desc = "Page up with centered cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz",
    { desc = "Page down with centered cursor" })

-- Keep search terms centered
vim.keymap.set("n", "n", "nzzzv",
    { desc = "Center next search item" })
vim.keymap.set("n", "N", "Nzzzv",
    { desc = "Center previous search item" })

vim.keymap.set("x", "p", "\"_dP",
    { desc = "Preserve copy buffer when pasting" })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float,
    { desc = "Open floating diagnostic message" })

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,
    { desc = "[R]e[n]ame" })

vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle,
    { desc = "Toggle Undotree" })
