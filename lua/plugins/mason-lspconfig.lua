return {
	'mason-org/mason-lspconfig.nvim',
	version = '*',
	dependencies = { {
		'mason-org/mason.nvim',
		version = '*',
		opts = {}
	}, {
		'neovim/nvim-lspconfig',
		version = '*'
	}, {
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		version = '*'
	}, { 'b0o/schemastore.nvim' } },
	config = function()
		require('mason-tool-installer').setup({
			ensure_installed = {
				'lua-language-server',
				'eslint-lsp',
				'typescript-language-server',
				'prettier',
				'emmet-language-server',
				'html-lsp',
				'css-lsp',
				'stylelint-lsp',
				'json-lsp'
			}
		})

		vim.lsp.config('eslint', { root_dir = function(bufnr, on_dir)
			local eslint_configs = { 'eslint.config.mjs', 'eslint.config.js' }
			local root = vim.fs.root(bufnr, eslint_configs)
			if root then
				on_dir(root)
			end
		end })

		vim.lsp.config('jsonls', {
			settings = {
				json = {
					schemas = require('schemastore').json.schemas(),
					validate = { enable = true }
				}
			}
		})

		require('mason-lspconfig').setup({
			automatic_installation = true,
			automatic_enable = true
		})

		vim.diagnostic.config({
			severity_sort = true,
			float = {
				border = 'rounded',
				source = 'if_many'
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = '󰅚 ',
					[vim.diagnostic.severity.WARN] = '󰀪 ',
					[vim.diagnostic.severity.INFO] = '󰋽 ',
					[vim.diagnostic.severity.HINT] = '󰌶 '
				}
			},
			update_in_insert = true,
			virtual_text = false
		})
	end
}
