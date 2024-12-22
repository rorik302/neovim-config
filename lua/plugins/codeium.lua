return {
	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({
				enable_cmp_source = false,
				virtual_text = {
					enabled = true,
					map_keys = true,
					key_bindings = {
						prev = "<A-[>",
						next = "<A-]>",
						accept = "<A-\\>",
						accept_word = "<A-w>",
						accept_line = "<A-l>",
						clear = "<A-x>",
					},
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		optional = true,
		event = "VeryLazy",
		opts = function(_, opts)
			-- table.insert(opts.sections.lualine_x, 2, require("util").lualine.cmp_source("codeium"))
		end,
	},
}
