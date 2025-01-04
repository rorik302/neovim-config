return {
	"folke/trouble.nvim",
	opts = {
		win = {
			type = "float",
		},
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>dx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics: Toggle",
		},
		{
			"<leader>dX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Diagnostics: Buffer Diagnostics",
		},
		{
			"<leader>dL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Diagnostics: Location List",
		},
		{
			"<leader>dQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Diaggnostics: Quickfix List",
		},
	},
}
