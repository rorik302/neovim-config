return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>ee", "<cmd>Yazi<CR>", desc = "File Explorer: Open explorer at the current file" },
		{ "<leader>ew", "<cmd>Yazi cwd<CR>", desc = "File Explorer: Open explorer at Neovim directory" },
	},
	opts = {
		open_for_directories = true,
	},
}
