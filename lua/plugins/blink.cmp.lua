return {
	'saghen/blink.cmp',
	dependencies = { 'Exafunction/codeium.nvim' },
	version = '1.*',
	opts = {
		keymap = { preset = 'enter' },
		appearance = { nerd_font_variant = 'mono' },
		completion = {
			menu = { border = 'rounded' },
			documentation = {
				auto_show = false,
				window = { border = 'rounded' }
			},
			accept = {
				auto_brackets = { enabled = false }
			},
			trigger = { show_on_trigger_character = false }
		},
		sources = {
			default = { 'lsp', 'path', 'buffer', 'codeium' },
			per_filetype = {
				oil = {}
			},
			providers = {
				codeium = {
					name = 'Codeium',
					module = 'codeium.blink',
					async = true,
					score_offset = -100
				}
			}
		},
		fuzzy = { implementation = 'prefer_rust_with_warning' }
	},
	opts_extend = { 'sources.default' }
}
