return {
	'stevearc/conform.nvim',
	event = { 'BufWritePre' },
	cmd = { 'ConformInfo' },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			'<leader>fo',
			function()
				require('conform').format({ async = true })
			end,
			mode = '',
			desc = 'Format buffer',
		},
	},
	opts = {
		async = true,
		lsp_fallback = true,
		formatters_by_ft = {
			lua = { 'stylua' },
			liquid = { 'prettier' },
			javascript = { 'prettier' },
			typescript = { 'prettier' },
			typescriptreact = { 'prettier' },
			css = { 'prettier' },
			html = { 'prettier' },
			json = { 'prettier' },
			yaml = { 'prettier' },
			markdown = { 'prettier' },
			graphql = { 'prettier' },
			md = { 'prettier' },
			txt = { 'prettier' },
			astro = { 'prettier' },
		},
		format_on_save = {
			timeout_ms = 1000,
			lsp_fallback = 'fallback',
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
