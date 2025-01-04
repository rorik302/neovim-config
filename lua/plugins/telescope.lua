return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<Tab>"] = actions.move_selection_next,
						["<S-Tab>"] = actions.move_selection_previous,
					},
				},
				layout_config = {
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find: Keymaps" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find: Files" })
		vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "Find: Select Telescope" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find: by Grep" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find: Diagnostics" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find: Buffers" })
		vim.keymap.set("n", "<leader>fc", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "Find: in current buffer" })

		vim.keymap.set("n", "<leader>Cn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Find: Neovim config files" })
	end,
}
