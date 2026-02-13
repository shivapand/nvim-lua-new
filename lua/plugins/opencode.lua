return {
	'NickvanDyke/opencode.nvim',
	dependencies = { {
		'folke/snacks.nvim',
		opts = {
			input = {},
			picker = {},
			terminal = {}
		}
	} },
	keys = {
		{
			'<Leader>oc',
			function() require('opencode').toggle() end,
			desc = 'Toggle OpenCode',
		},
		{
			'<C-x>',
			function() require('opencode').select() end,
			mode = { 'n', 'x' },
			desc = 'Execute opencode action…',
		},
		{
			'<Leader>of',
			function()
				local provider = require('opencode.config').provider
				if not provider or not provider.get then return end
				local win = provider:get()
				if not win or not win:valid() then return end

				if win.opts.width == 0 then
					win.opts.width = 120
					win.opts.height = 30
				else
					win.opts.width = 0
					win.opts.height = 0
				end
				win:update()
			end,
			desc = 'Toggle OpenCode fullscreen',
		},
	},
	config = function()
		vim.g.opencode_opts = {
			provider = {
				snacks = {
					auto_close = true,
					win = {
						position = 'float',
						width = 120,
						height = 30,
						border = 'rounded',
						wo = { winbar = '' },
						bo = { filetype = 'opencode_terminal' },
					},
				},
			},
		}
		vim.o.autoread = true
	end,
}
