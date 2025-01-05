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

		local function get_lnum()
			local cur_num
			local sep = ","

			if vim.v.virtnum ~= 0 then
				return "-"
			end

			cur_num = vim.v.relnum == 0 and vim.v.lnum or vim.v.relnum

			cur_num = tostring(cur_num):reverse():gsub("(%d%d%d)", "%1" .. sep):reverse():gsub("^,", "")

			local function pad_str(in_str, width, align)
				local ralign_token = "%="

				local num_spaces = width - #in_str
				if num_spaces < 1 then
					num_spaces = 1
				end
				local spaces = string.rep(" ", num_spaces)

				if align == "left" then
					return table.concat({ in_str, spaces })
				end

				return table.concat({ spaces, in_str, ralign_token })
			end

			return pad_str(cur_num, 3, "right")
		end

		local function get_fold(lnum)
			if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then
				return " "
			end
			return vim.fn.foldclosed(lnum) == -1 and fcs.foldopen or fcs.foldclose
		end

		_G.get_statuscol = function()
			return "%s" .. get_lnum() .. " " .. get_fold(vim.v.lnum) .. " "
		end

		vim.o.statuscolumn = "%!v:lua.get_statuscol()"
	end,
}
