return {
	"Shatur/neovim-ayu",
	lazy = false,
	priority = 1000,
	config = function()
		require("ayu").setup({
			mirage = true,
		})

		vim.cmd("colorscheme ayu-mirage")
		vim.cmd("hi LineNrAbove guifg=#707a8c")
		vim.cmd("hi LineNrBelow guifg=#707a8c")
	end,
}
