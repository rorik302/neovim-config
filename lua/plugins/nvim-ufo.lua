return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		local ufo = require("ufo")

		local map = vim.keymap.set

		map("n", "zR", ufo.openAllFolds)
		map("n", "zM", ufo.closeAllFolds)
		map("n", "zK", function()
			local winid = ufo.peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end, { desc = "Code: Preview Fold" })

		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "lsp", "indent" }
			end,
		})

		-- Убирает цифры вложенности fold в статусбаре
		local fcs = vim.opt.fillchars:get()

		local function get_fold(lnum)
			if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then
				return " "
			end
			return vim.fn.foldclosed(lnum) == -1 and fcs.foldopen or fcs.foldclose
		end

		_G.get_statuscol = function()
			return "%s%l " .. get_fold(vim.v.lnum) .. " "
		end

		vim.o.statuscolumn = "%!v:lua.get_statuscol()"
	end,
}
