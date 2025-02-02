local user_group = vim.api.nvim_create_augroup("user_group", { clear = false })

-- Показывать текущую строку в текущем окне
vim.api.nvim_create_autocmd("WinEnter", {
  group = user_group,
  callback = function()
    vim.opt_local.cursorline = true 
  end
})
vim.api.nvim_create_autocmd("WinLeave", {
  group = user_group,
  callback = function()
    vim.opt_local.cursorline = false
  end
})
--

-- Изменение отступов для различных типов файлов
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  group = user_group,
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.tabstop = 4
  end
})
--

-- Проверка правописания для различных типов файлов
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "md", "markdown" },
  group = user_group,
  callback = function()
    vim.opt_local.spell = true
  end
})
--

-- Подсветка копируемого текста
vim.api.nvim_create_autocmd("TextYankPost", {
  group = user_group,
  callback = function()
    vim.highlight.on_yank()
  end
})
--
