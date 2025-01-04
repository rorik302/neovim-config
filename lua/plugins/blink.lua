return {
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		version = "*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "default",
				["<C-y>"] = {},
				["<CR>"] = { "accept", "fallback" },
				["<C-p>"] = {},
				["<C-n>"] = {},
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "luasnip", "buffer" },
			},
			completion = {
				menu = {
					auto_show = true,
					border = "single",
					draw = {
						columns = {
							{ "item_idx" },
							{ "kind_icon" },
							{ "label", "label_description", gap = 1 },
							{ "kind", "source_name" },
						},
						components = {
							item_idx = {
								text = function(ctx)
									return ctx.idx == 10 and "0" or ctx.idx >= 10 and " " or tostring(ctx.idx)
								end,
								highlight = "BlinkCmpItemIdx",
							},
						},
					},
				},
				list = {
					selection = "manual",
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
					window = {
						border = "single",
					},
				},
			},
			signature = {
				enabled = true,
				window = {
					border = "single",
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
