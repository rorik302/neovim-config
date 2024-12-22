local map = vim.keymap.set

vim.g.mapleader = " "

-- Отключение подсветки поиска
map("n", "<Esc>", ":nohl<CR>")

-- Перемещение по строкам
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Down" })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Up" })

-- Переход между окнами
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })

-- Изменение размера окон
map("n", "<leader><left>", ":vertical resize +20<CR>", { desc = "Resize: left" })
map("n", "<leader><right>", ":vertical resize -20<CR>", { desc = "Resize: right" })
map("n", "<leader><up>", ":resize +10<CR>", { desc = "Resize: up" })
map("n", "<leader><down>", ":resize -10<CR>", { desc = "Resize: down" })

-- Перемещение курсора
map("n", "gh", "g^")
map("n", "gl", "g$")

-- Перемещение в командной строке
map("c", "<C-h>", "<Left>")
map("c", "<C-l>", "<Right>")
map("c", "<C-^>", "<Home>")
map("c", "<C-$>", "<End>")

-- Центрирование при перемещении по буферу
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- Не убирать выделение при смещении текста/копировании
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "<Tab>", ">gv")
map("v", "<S-Tab>", "<gv")
map("v", "y", "ygv")

-- Перемещение выделения в визуальном режиме
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Центрирование при перемещении по результатам поиска
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Вставка текста
map("x", "p", [["_dP]])

-- Удаление без копирования в буфер
map({ "n", "v" }, "d", [["_d]])

-- Переход между открывающими и закрывающими скобками
map({ "n", "v" }, "<BS>", "%")

-- Разделение окна
map("n", "<leader>sh", "<cmd>split<CR>")
map("n", "<leader>sv", "<cmd>vsplit<CR>")
