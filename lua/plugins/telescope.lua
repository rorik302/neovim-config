return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
			defaults = {
				layout_strategy = "vertical",
				layout_config = {
					vertical = { width = 0.5, height = 0.7 },
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")
		local map = vim.keymap.set

		map("n", "<leader>ff", builtin.find_files)
		map("n", "<leader>fg", builtin.live_grep)
		map("n", "<leader>fb", builtin.buffers)
		map("n", "<leader>fh", builtin.help_tags)
		map("n", "<leader>fn", function()
			builtin.find_files({
				cwd = vim.fn.stdpath("config"),
			})
		end)
	end,
}
