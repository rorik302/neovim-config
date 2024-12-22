return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"css",
				"diff",
				"dockerfile",
				"html",
				"json",
				"lua",
				"luadoc",
				"python",
				"query",
				"regex",
				"scss",
				"sql",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"vue",
				"yaml",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
		})
	end,
}
