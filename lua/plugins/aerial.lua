return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local map = vim.keymap.set

		require("aerial").setup({
			on_attach = function(bufnr)
				map("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				map("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
		})

		map("n", "<leader>a", "<cmd>AerialToggle<CR>")
	end,
}
