return {
	"romgrk/barbar.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	config = function()
		require("barbar").setup({
			icons = {
				buffer_index = true,
			},
			sidebar_filetypes = {
				NvimTree = true,
			},
		})

		local map = vim.keymap.set

		local opts = function(desc)
			desc = desc or ""
			return { noremap = true, silent = true, desc = "Buffer: " .. desc }
		end

		map("n", "<leader>bp", "<cmd>BufferPrevious<CR>", opts("Next"))
		map("n", "<leader>bn", "<cmd>BufferNext<CR>", opts("Previous"))
		map("n", "<leader>b1", "<cmd>BufferGoto 1<CR>", opts("1"))
		map("n", "<leader>b2", "<cmd>BufferGoto 2<CR>", opts("2"))
		map("n", "<leader>b3", "<cmd>BufferGoto 3<CR>", opts("3"))
		map("n", "<leader>b4", "<cmd>BufferGoto 4<CR>", opts("4"))
		map("n", "<leader>b5", "<cmd>BufferGoto 5<CR>", opts("5"))
		map("n", "<leader>b6", "<cmd>BufferGoto 6<CR>", opts("6"))
		map("n", "<leader>b7", "<cmd>BufferGoto 7<CR>", opts("7"))
		map("n", "<leader>b8", "<cmd>BufferGoto 8<CR>", opts("8"))
		map("n", "<leader>b9", "<cmd>BufferGoto 9<CR>", opts("9"))
		map("n", "<leader>bl", "<cmd>BufferLast<CR>", opts("Last"))
		map("n", "<leader>bP", "<cmd>BufferPin<CR>", opts("Pin"))
		map("n", "<leader>bc", "<cmd>BufferClose<CR>", opts("Close"))
	end,
}
