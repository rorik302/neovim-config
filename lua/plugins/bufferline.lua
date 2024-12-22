return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				show_close_icon = false,
				show_buffer_close_icons = false,
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				indicator = {
					style = "underline",
				},
				close_command = function(n)
					Snacks.bufdelete(n)
				end,
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
			},
		})

		local map = vim.keymap.set

		map("n", "<leader>bn", ":bn<CR>")
		map("n", "<leader>bp", ":bp<CR>")
		map("n", "<leader>b#", ":b#<CR>")
	end,
}
