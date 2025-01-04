return {
	"abecodes/tabout.nvim",
	lazy = false,
	event = "InsertCharPre",
	priority = 1000,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local tabout = require("tabout")

		tabout.setup()
	end,
}
