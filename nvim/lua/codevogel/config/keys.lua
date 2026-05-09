-- Niceties
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set({ "i", "n", "v" }, "<C-c>", "<esc>", { desc = "Emulate escape with C-c" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Window focus
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Line movement
vim.keymap.set("n", "<up>", ":m--<CR>", { desc = "Move line up" })
vim.keymap.set("n", "<down>", ":m+<CR>", { desc = "Move line down" })
vim.keymap.set("n", "<left>", "0", { desc = "Move to start of line" })
vim.keymap.set("n", "<right>", "$", { desc = "Move to end of line" })
vim.keymap.set("n", "gg", "gg0", { desc = "Go to first character of file" })

-- Diagnostics
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
