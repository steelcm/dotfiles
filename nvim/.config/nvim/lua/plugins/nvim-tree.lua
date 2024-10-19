return {
	'nvim-tree/nvim-tree.lua',
	version = '*',
	lazy = false,
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		require('nvim-tree').setup({
			view = {
				side = 'right',
				adaptive_size = true,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			update_focused_file = {
				enable = true,
			},
			renderer = {
				full_name = true,
				group_empty = false,
				indent_markers = {
					enable = true,
				},
				icons = {
					git_placement = 'signcolumn',
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
			},
			filters = {
				dotfiles = false,
				custom = {
					'^.git$',
				},
			},
		})
		vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = '[E]xplorer' })
	end,
}
