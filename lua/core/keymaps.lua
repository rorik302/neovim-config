vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = function(mode, keys, cmd, desc)
  desc = desc or ""
  vim.keymap.set(mode, keys, cmd, { desc = desc, noremap = true, silent = true })
end

-- Работа с курсором
map("i", "<C-h>", "<Left>", "Cursor: Переместить курсор влево")
map("i", "<C-j>", "<Down>", "Cursor: Переместить курсор вниз")
map("i", "<C-k>", "<Up>", "Cursor: Переместить курсор вверх")
map("i", "<C-l>", "<Right>", "Cursor: Переместить курсор вправо")

map("n", "<C-d>", "<C-d>zz", "Cursor: Переместить вниз и центрировать")
map("n", "<C-u>", "<C-u>zz", "Cursor: Переместить вверх и центрировать")
--

-- Поиск
map("n", "<Esc><Esc>", "<CMD>nohlsearch<CR>", "Search: Отключить подсветку результатов поиска")
map("n", "n", "nzz", "Search: Центрирование результата поиска (вперед)")
map("n", "N", "Nzz", "Search: Центрирование результата поиска (назад)")
--

-- Работа с текстом
map("v", ">", ">gv", "Visual: Сдвиг текста вправо")
map("v", "<", "<gv", "Visual: Сдвиг текста влево")

map("v", "J", ":m '>+1<CR>gv=gv", "Visual: Сдвиг выделенных строк вниз")
map("v", "K", ":m '<-2<CR>gv=gv", "Visual: Сдвиг выделенных строк вверх")
--

-- Работа с окнами
map("n", "<leader>sv", "<CMD>vsplit<CR>", "Split: Разделение окна вертикально")
map("n", "<leader>sh", "<CMD>split<CR>", "Split: Разделение окна горизонтально")

map("n", "<C-h>", "<C-w>h", "Window: Переключить фокус в окно слева")
map("n", "<C-j>", "<C-w>j", "Window: Переключить фокус в окно снизу")
map("n", "<C-k>", "<C-w>k", "Window: Переключить фокус в окно сверху")
map("n", "<C-l>", "<C-w>l", "Window: Переключить фокус в окно справа")

map("n", "<A-h>", ":vertical resize +5<CR>", "Window: Изменить размер влево")
map("n", "<A-l>", ":vertical resize -5<CR>", "Window: Изменить размер вправо")
map("n", "<A-j>", ":resize +5<CR>", "Window: Изменить размер вниз")
map("n", "<A-k>", ":resize -5<CR>", "Window: Изменить размер вверх")

map("n", "<A-S-h>", "<C-w>h<C-w>x", "Window: Сменить окно слева")
map("n", "<A-S-j>", "<C-w>j<C-w>x", "Window: Сменить окно снизу")
map("n", "<A-S-k>", "<C-w>k<C-w>x", "Window: Сменить окно сверху")
map("n", "<A-S-l>", "<C-w>l<C-w>x", "Window: Сменить окно справа")
--
