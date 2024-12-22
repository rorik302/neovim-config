return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"b0o/nvim-tree-preview.lua",
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		local map = vim.keymap.set
		local api = require("nvim-tree.api")
		local preview = require("nvim-tree-preview")

		require("nvim-tree").setup({
			on_attach = function(bufnr)
				api.config.mappings.default_on_attach(bufnr)

				local function opts(desc)
					return { desc = "NvimTree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				map("n", "P", preview.watch, opts("Preview (Watch)"))
				map("n", "<Esc>", preview.unwatch, opts("Close Preview/Unwatch"))
				map("n", "<C-f>", function()
					return preview.scroll(4)
				end, opts("Scroll Down"))
				map("n", "<C-b>", function()
					return preview.scroll(-4)
				end, opts("Scroll Up"))

				map("n", "<Tab>", function()
					local ok, node = pcall(api.tree.get_node_under_cursor)
					if ok and node then
						if node.type == "directory" then
							api.node.open.edit()
						else
							preview.node(node, { toggle_focus = true })
						end
					end
				end, opts("Preview"))
			end,
		})

		map("n", "<leader>e", function()
			vim.cmd(":NvimTreeFindFileToggle<CR>")
		end)

		-- Закрытие nvim-tree при открытии буфера
		vim.api.nvim_create_autocmd("BufEnter", {
			nested = true,
			callback = function()
				if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
					vim.cmd("quit")
				end
			end,
		})
	end,
}
