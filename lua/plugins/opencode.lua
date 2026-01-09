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
	config = function()
		vim.g.opencode_opts = {}

		vim.o.autoread = true

		vim.keymap.set(
			{ 'n', 'x' },
			'<C-x>',
			function()
				require('opencode').select()
			end,
			{ desc = 'Execute opencode action…' }
		)

		vim.keymap.set(
			{ 'n', 't' },
			'<S-x>',
			function()
				require('opencode').toggle()
			end,
			{ desc = 'Execute opencode toggle' }
		)
	end
}
