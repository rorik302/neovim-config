return {
	"abecodes/tabout.nvim",
	lazy = false,
	event = "InsertCharPre",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"L3MON4D3/LuaSnip",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("tabout").setup()
	end,
}