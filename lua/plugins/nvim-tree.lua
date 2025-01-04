return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			filters = {
				dotfiles = true,
			},
		})

		vim.keymap.set(
			"n",
			"<leader>ee",
			"<cmd>NvimTreeFindFileToggle<CR>",
			{ desc = "File explorer: Toggle (Find File)" }
		)
	end,
}
