return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"meuter/lualine-so-fancy.nvim",
	},
	config = function()
		local codeium = function()
			local status = require("codeium.virtual_text").status()
			if status.state == "idle" then
				return " "
			end
			if status.state == "waiting" then
				return "Waiting..."
			end
			if status.state == "completions" and status.total > 0 then
				return string.format("%d/%d", status.current, status.total)
			end
			return " 0 "
		end

		require("lualine").setup({
			options = {
				theme = "ayu_mirage",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
				refresh = {
					statusline = 100,
				},
			},
			sections = {
				lualine_a = { { "fancy_mode", width = 7 } },
				lualine_b = { "fancy_branch", "fancy_diff" },
				lualine_c = { "fancy_cwd", "filename" },
				lualine_x = { "fancy_diagnostics", "fancy_macro" },
				lualine_y = { codeium, "fancy_searchcount" },
				lualine_z = { "fancy_filetype", "fancy_lsp_servers", "fancy_location" },
			},
		})
	end,
}
