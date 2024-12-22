local servers = {
	black = {},
	debugpy = {},
	eslint_d = {},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	mypy = {},
	prettier = {},
	pyright = {},
	ruff = {},
	stylua = {},
	ts_ls = {},
	vuels = {},
}

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		-- "hrsh7th/cmp-nvim-lsp",
		"saghen/blink.cmp",
	},
	config = function()
		local autocmd = vim.api.nvim_create_autocmd
		local augroup = vim.api.nvim_create_augroup

		autocmd("LspAttach", {
			group = augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					desc = desc or ""
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
					local highlight_augroup = augroup("lsp-highlight", { clear = false })
					autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					autocmd("LspDetach", {
						group = augroup("lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({
								group = highlight_augroup,
								buffer = event2.buf,
							})
						end,
					})
				end

				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({
							bufnr = event.buf,
						}))
					end)
				end
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		capabilities =
			vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities(capabilities))

		require("mason").setup()

		require("mason-tool-installer").setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
