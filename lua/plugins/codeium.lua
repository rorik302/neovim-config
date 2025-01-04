return {
	"Exafunction/codeium.nvim",
	event = "InsertEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("codeium").setup({
			enable_cmp_source = false,
			virtual_text = {
				enabled = true,
				key_bindings = {
					next = "<A-]>",
					prev = "<A-[>",
					clear = "<A-x>",
					accept = "<A-\\>",
					accept_word = "<A-w>",
					accept_line = "<A-l>",
				},
			},
		})

		vim.api.nvim_set_hl(0, "CodeiumSuggestion", { fg = "#707a8c" })
	end,
}
