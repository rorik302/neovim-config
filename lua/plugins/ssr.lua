return {
	"cshuaimin/ssr.nvim",
	event = "BufEnter",
	config = function()
		require("ssr").setup()

		vim.keymap.set({ "n", "x" }, "<leader>cr", function()
			require("ssr").open()
		end, { desc = "Code: Rename" })
	end,
}
