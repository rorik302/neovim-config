return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	init = function()
		local autocmd = vim.api.nvim_create_autocmd

		autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd
			end,
		})

		local prev = { new_name = "", old_name = "" }
		autocmd("User", {
			pattern = "NvimTreeSetup",
			callback = function()
				local events = require("nvim-tree.api").events
				events.subscribe(events.Event.NodeRenamed, function(data)
					if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
						data = data
						Snacks.rename.on_rename_file(data.old_name, data.new_name)
					end
				end)
			end,
		})
	end,
	---@type snacks.Config
	opts = {
		notifier = {
			enabled = true,
		},
		indent = {
			enabled = true,
		},
		input = {
			enabled = true,
		},
		scroll = {
			enabled = true,
		},
		dashboard = {
			width = 50,
			sections = {
				{ section = "header" },
				{
					pane = 2,
					section = "terminal",
					cmd = "echo  $(date)",
					height = 1,
					padding = 1,
				},
				{ section = "keys", gap = 1, padding = 1 },
				{ pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{
					pane = 2,
					icon = " ",
					title = "Git Status",
					section = "terminal",
					enabled = function()
						return Snacks.git.get_root() ~= nil
					end,
					cmd = "git status --short --branch --renames",
					height = 5,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				},
				{ section = "startup" },
			},
		},
	},
}
