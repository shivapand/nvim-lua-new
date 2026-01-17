return {
	'stevearc/oil.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('oil').setup({
			skip_confirm_for_simple_edits = true,
			view_options = { show_hidden = true },
			keymaps = {
				['g?'] = {
					'actions.show_help',
					mode = 'n'
				},
				['<CR>'] = 'actions.select',
				['<C-s>'] = {
					'actions.select',
					opts = { vertical = true }
				},
				['<C-h>'] = {
					'actions.select',
					opts = { horizontal = true }
				},
				['<C-t>'] = {
					function()
						require('oil').select({ tab = true })
						require('oil').close()
					end,
					mode = 'n'
				},
				['<C-p>'] = 'actions.preview',
				['<C-c>'] = {
					'actions.close',
					mode = 'n'
				},
				['q'] = {
					'actions.close',
					mode = 'n'
				},
				['<C-l>'] = 'actions.refresh',
				['-'] = {
					'actions.parent',
					mode = 'n'
				},
				_ = {
					'actions.open_cwd',
					mode = 'n'
				},
				['`'] = {
					'actions.cd',
					mode = 'n'
				},
				['~'] = {
					'actions.cd',
					opts = { scope = 'tab' },
					mode = 'n'
				},
				gs = {
					'actions.change_sort',
					mode = 'n'
				},
				gx = 'actions.open_external',
				['g.'] = {
					'actions.toggle_hidden',
					mode = 'n'
				},
				['g\\'] = {
					'actions.toggle_trash',
					mode = 'n'
				}
			}
		})
	end
}
