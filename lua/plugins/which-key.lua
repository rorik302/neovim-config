return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		delay = 0,
		spec = {
			{ "<leader>b", group = "Buffers" },
			{ "<leader>c", group = "Code" },
			{ "<leader>C", group = "Config" },
			{ "<leader>d", group = "Debug/Diagnostics" },
			{ "<leader>e", group = "File Explorer" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>u", group = "UI" },
			{ "<leader>w", group = "Windows" },
		},
	},
}
