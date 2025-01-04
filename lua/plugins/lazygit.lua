return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	cmd = {
		"LazyGit",
		"LazyGitCurrentFile",
		"LazyGitConfig",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	keys = {
		{ "<leader>gl", "<cmd>LazyGit<CR>", desc = "Git: LazyGit" },
	},
}
