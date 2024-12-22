return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				lua = { "stylua" },
				python = { "black" },
				typescript = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
