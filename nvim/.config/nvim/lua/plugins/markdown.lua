return {
	'preservim/vim-markdown',
	dependencies = {
		{ 'godlygeek/tabular' },
	},
	config = function()
		vim.g.vim_markdown_frontmatter = 1
		vim.g.vim_markdown_toml_frontmatter = 1
		vim.g.vim_markdown_json_frontmatter = 1
		vim.g.vim_markdown_strikethrough = 1
		vim.g.vim_markdown_folding_level = 3
		vim.api.nvim_create_autocmd('BufWinEnter', {
			pattern = '*.md',
			callback = function()
				vim.o.foldlevel = 2 -- we only every use headings 3 or above for markdown files
			end,
			group = vim.api.nvim_create_augroup('mygroup3.1', {}),
		})
	end,
	ft = 'markdown',
}
