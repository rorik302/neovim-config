local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local opt = vim.opt

-- Форматирование python
autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.py",
  callback = function()
    opt.tabstop = 4
    opt.softtabstop = 4
    opt.shiftwidth = 4
    opt.textwidth = 99
    opt.colorcolumn = "99"
  end
})

-- Переход к последней позиции курсора при открытии
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end
})

-- Подсветка при копировании
local HighlightYank = augroup("HighlightYank", {})
autocmd("TextYankPost", {
  group = HighlightYank,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40
    })
  end
})

-- Удаление завершающих пробелов перед сохранением файла
local CleanOnSave = augroup("CleanOnSave", {})
autocmd("BufWritePre", {
  group = CleanOnSave,
  pattern = "*",
  command = [[%s/\s\+$//e]]
})
