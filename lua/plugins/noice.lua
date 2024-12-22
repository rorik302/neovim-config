return {
	enabled = false,
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			presets = {
				bottom_search = false,
				command_palette = false,
				long_message_to_split = true,
			},
		})
	end,
}
