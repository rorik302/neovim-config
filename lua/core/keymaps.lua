vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("n", "<C-h>", "<C-w><C-h>", { desc = "Cursor: Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Cursor: Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Cursor: Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Cursor: Move focus to the upper window" })
map("n", "<S-h>", "g^", { desc = "Cursor: Move to line start" })
map("n", "<S-l>", "g$", { desc = "Cursor: Move to line end" })
map("n", "<C-u>", "<C-u>zz", { desc = "Cursor: Go up and center" })
map("n", "<C-d>", "<C-d>zz", { desc = "Cursor: Go down and center" })
map("i", "<C-l>", "<Right>", { desc = "Cursor: Move cursor right" })
map("i", "<C-h>", "<Left>", { desc = "Cursor: Move cursor left" })
map("i", "<C-j>", "<Down>", { desc = "Cursor: Move cursor down" })
map("i", "<C-k>", "<Up>", { desc = "Cursor: Move cursor up" })
map("n", "<Esc>", "<CMD>nohlsearch<CR>", { desc = "Search: Clear search highlight" })
map("n", "n", "nzzzv", { desc = "Search: Centering next search result" })
map("n", "N", "Nzzzv", { desc = "Search: Centering previous search result" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Text: Move selected lines up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Text: Move selected lines down" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Window: Exit terminal mode" })
map("n", "<A-left>", ":vertical resize +5<CR>", { desc = "Window: Resize left" })
map("n", "<A-right>", ":vertical resize -5<CR>", { desc = "Window: Resize right" })
map("n", "<A-up>", ":resize +5<CR>", { desc = "Window: Resize up" })
map("n", "<A-down>", ":resize -5<CR>", { desc = "Window: Resize down" })
map("n", "<leader>wh", "<CMD>split<CR>", { desc = "Window: Split horizontally" })
map("n", "<leader>wv", "<CMD>vsplit<CR>", { desc = "Window: Split vertically" })
