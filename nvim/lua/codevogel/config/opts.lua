-- Leader key
vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.o.timeoutlen = 200

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Hide mode (is redundant with statusline)
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- Indents
vim.o.breakindent = true

-- Undo history
vim.o.undofile = true

-- Search case sensitivity
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Split open options
vim.o.splitright = true
vim.o.splitbelow = true

-- List chars
vim.o.list = true
vim.opt.listchars = { tab = "▏ ", trail = "·", nbsp = "␣" }

-- Preview substitutions
vim.o.inccommand = "split"

-- Highlight the current line
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Confirm to save changes before exiting modified buffer
vim.o.confirm = true

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
