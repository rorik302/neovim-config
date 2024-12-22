local options = {
	breakindent = true, -- wrapped line repeats indent
	clipboard = "unnamedplus", -- use the clipboard as the unnamed register
	cmdheight = 0, -- number of lines to use for the command-line
	confirm = true, -- ask what to do about unsaved/read-only files
	cursorline = true, -- highlight the screen line of the cursor
	expandtab = true, -- use spaces when <Tab> is inserted
	ignorecase = true, -- ignore case in search patterns
	langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz", --alphabetic characters for other language mode
	number = true, -- print the line number in front of each line
	pumheight = 10, -- maximum number of items to show in the popup menu
	relativenumber = true, -- show relative line number in front of each line
	scrolloff = 8, -- minimum nr. of lines above and below cursor
	shiftwidth = 2, -- number of spaces to use for (auto)indent step
	showmode = false, -- message on status line to show current mode
	sidescrolloff = 8, -- min. nr. of columns to left and right of cursor
	signcolumn = "yes", -- when and how to display the sign column
	smartcase = true, -- no ignore case when pattern has uppercase
	softtabstop = 2, -- number of spaces that <Tab> uses while editing
	spell = true, -- enable spell checking
	spelllang = "en_us,ru_ru", -- language(s) to do spell checking for
	splitbelow = true, -- new window from split is below the current one
	splitright = true, -- new window is put right of the current one
	swapfile = false, -- whether to use a swapfile for a buffer
	tabstop = 2, -- number of spaces that <Tab> in file uses
	termguicolors = true, -- enable 24-bit RGB color in the TUI
	timeoutlen = 300, -- time out time in milliseconds
	undofile = true, -- save undo information in a file
	updatetime = 50, -- after this many milliseconds flush swap file
	wrap = false, -- long lines wrap and continue on the next line
	writebackup = false, -- make a backup before overwriting a file
}

for key, value in pairs(options) do
	vim.opt[key] = value
end
