return {
	'nvim-lualine/lualine.nvim',
	priority = 999,
	dependencies = {
		{ 'nvim-tree/nvim-web-devicons' },
	},
	config = {
		options = {
			disabled_filetypes = { 'NvimTree' },
			theme = 'tokyonight',
		},
		sections = {
			lualine_c = {
				{
					'filename',
					path = 1,
				},
			},
		},
	},
}
-- return {
--     -- Set lualine as statusline
--     'nvim-lualine/lualine.nvim',
--     -- See `:help lualine.txt`
--     opts = {
--         options = {
--             icons_enabled = false,
--             theme = 'onedark',
--             component_separators = '|',
--             section_separators = '',
--         },
--     },
-- }
