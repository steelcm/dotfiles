return {
	-- official helpers for setting up installed language servers
	'neovim/nvim-lspconfig',
	dependencies = {
		-- nice UI for installing language servers
		{
			'williamboman/mason.nvim',
			dependencies = {
				-- Automatically sets up any languages installed by mason
				{
					'williamboman/mason-lspconfig.nvim',
					config = function()
						require('mason').setup()
						local masonlsp = require('mason-lspconfig')
						masonlsp.setup({
							ensure_installed = {
								'rust_analyzer',
								'tsserver',
								'tailwindcss',
								'cssls',
								'html',
								'astro',
								'jsonls',
								'yamlls',
								'lua_ls',
							},
						})
						local lspconfig = require('lspconfig')
						local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
						masonlsp.setup_handlers({
							function(server_name)
								lspconfig[server_name].setup({
									capabilities = lsp_capabilities,
								})
							end,
						})
					end,
				},
			},
		},
		-- autocompletion engine
		{
			'hrsh7th/nvim-cmp',
			config = function()
				local cmp = require('cmp')
				cmp.setup({
					snippet = {
						expand = function(args)
							require('luasnip').lsp_expand(args.body)
						end,
					},
					mapping = cmp.mapping.preset.insert({
						['<C-u>'] = cmp.mapping.scroll_docs(-4),
						['<C-d>'] = cmp.mapping.scroll_docs(4),
						['<S-k>'] = cmp.mapping.select_prev_item(),
						['<S-j>'] = cmp.mapping.select_next_item(),
						['<C-Space>'] = cmp.mapping.complete(),
						['<C-e>'] = cmp.mapping.abort(),
						['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					}),
					sources = {
						{ name = 'nvim_lsp' },
						{ name = 'path' },
						{ name = 'luasnip' },
						{ name = 'buffer' },
					},
				})
			end,
		},
		-- makes lsp suggestions show up in autocomplete
		{ 'hrsh7th/cmp-nvim-lsp' },
		-- makes other words found in the same buffer show up in autocomplete
		{ 'hrsh7th/cmp-buffer' },
		-- makes path information (like imports) show up in autocomplete
		{ 'hrsh7th/cmp-path' },
		-- makes luasnip's show up in autocomplete
		{
			'saadparwaiz1/cmp_luasnip',
			-- snippet engine
			dependencies = {
				'L3MON4D3/LuaSnip',
				config = function()
					local ls = require('luasnip')
					require('luasnip.loaders.from_vscode').lazy_load()

					vim.keymap.set({ 'i' }, '<C-k>', function()
						ls.expand()
					end, { silent = true, desc = 'Expand snippet' })
					vim.keymap.set({ 'i', 's' }, '<C-l>', function()
						ls.jump(1)
					end, { silent = true, desc = 'Next snippet placeholder' })
					vim.keymap.set({ 'i', 's' }, '<C-h>', function()
						ls.jump(-1)
					end, { silent = true, desc = 'Prev snippet placeholder' })
				end,
				-- a collection of common useful vs-code like snippets that work with luasnip
				dependencies = { 'rafamadriz/friendly-snippets' },
			},
		},
	},
	config = function()
		vim.api.nvim_create_autocmd('LspAttach', {
			desc = 'LSP actions',
			callback = function(args)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover', buffer = args.buf })
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]o to [D]efinition', buffer = args.buf })
				vim.keymap.set('n', 'gh', vim.diagnostic.open_float, { desc = '[O]pen [D]iagnostics', buffer = args.buf })
				vim.keymap.set('n', '<leader>nd', vim.diagnostic.goto_next, { desc = '[N]ext [D]iagnostic', buffer = args.buf })
				vim.keymap.set('n', '<leader>pd', vim.diagnostic.goto_prev, { desc = '[P]rev [D]iagnostic', buffer = args.buf })
				vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { desc = '[G]o to [T]ype definition', buffer = args.buf })
				vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]ename', buffer = args.buf })
				vim.keymap.set('n', '<leader>fo', vim.lsp.buf.format, { desc = '[F]ormat', buffer = args.buf })
				vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction', buffer = args.buf })
			end,
		})
	end,
}
-- return {
--   {
--     'VonHeikemen/lsp-zero.nvim',
--     branch = 'v4.x',
--     lazy = true,
--     config = false,
--   },
--   {
--     'williamboman/mason.nvim',
--     lazy = false,
--     config = true,
--   },
--
--   -- Autocompletion
--   {
--     'hrsh7th/nvim-cmp',
--     event = 'InsertEnter',
--     dependencies = {
--       {'L3MON4D3/LuaSnip'},
--     },
--     config = function()
--       local cmp = require('cmp')
--
--       cmp.setup({
--         sources = {
--           {name = 'nvim_lsp'},
--         },
--         mapping = cmp.mapping.preset.insert({
--           ['<C-Space>'] = cmp.mapping.complete(),
--           ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--           ['<C-d>'] = cmp.mapping.scroll_docs(4),
--         }),
--         snippet = {
--           expand = function(args)
--             vim.snippet.expand(args.body)
--           end,
--         },
--       })
--     end
--   },
--
--   -- LSP
--   {
--     'neovim/nvim-lspconfig',
--     cmd = {'LspInfo', 'LspInstall', 'LspStart'},
--     event = {'BufReadPre', 'BufNewFile'},
--     dependencies = {
--       {'hrsh7th/cmp-nvim-lsp'},
--       {'williamboman/mason.nvim'},
--       {'williamboman/mason-lspconfig.nvim'},
--     },
--     keys = {
--
--         { '<CR>', 'cmp.mapping.confirm { select = true }', desc = 'Git', mode = 'n' }
-- -- ['<CR>'] = cmp.mapping.confirm { select = true },
-- -- ['<Tab>'] = cmp.mapping.select_next_item(),
-- -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),
--     },
--     config = function()
--       local lsp_zero = require('lsp-zero')
--
--       -- lsp_attach is where you enable features that only work
--       -- if there is a language server active in the file
--       local lsp_attach = function(client, bufnr)
--         local opts = {buffer = bufnr}
--
--         vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
--         vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
--         vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
--         vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
--         vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
--         vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
--         vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
--         vim.keymap.set('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
--         vim.keymap.set({'n', 'x'}, 'ff', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
--         vim.keymap.set('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
--       end
--
--       lsp_zero.extend_lspconfig({
--         sign_text = true,
--         lsp_attach = lsp_attach,
--         capabilities = require('cmp_nvim_lsp').default_capabilities()
--       })
--
--       require('mason-lspconfig').setup({
--         ensure_installed = {},
--         handlers = {
--           -- this first function is the "default handler"
--           -- it applies to every language server without a "custom handler"
--           function(server_name)
--             require('lspconfig')[server_name].setup({})
--           end,
--         }
--       })
--     end
--   }
-- }
-- NOTE: This is where your plugins related to LSP can be installed.
--  The configuration is done below. Search for lspconfig to find it below.
-- return {
--     -- LSP Configuration & Plugins
--     'neovim/nvim-lspconfig',
--     defaults = {
--         cond = false
--     },
--     dependencies = {
--         -- Automatically install LSPs to stdpath for neovim
--         'williamboman/mason.nvim',
--         'williamboman/mason-lspconfig.nvim',
--
--         -- Useful status updates for LSP
--         -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
--         { 'j-hui/fidget.nvim', opts = {} },
--
--         -- Additional lua configuration, makes nvim stuff amazing!
--         'folke/neodev.nvim',
--     },
-- }

-- return {
--     -- official helpers for setting up installed language servers
--     'neovim/nvim-lspconfig',
--     dependencies = {
--         -- nice UI for installing language servers
--         {
--             'williamboman/mason.nvim',
--             dependencies = {
--                 -- Automatically sets up any languages installed by mason
--                 {
--                     'williamboman/mason-lspconfig.nvim',
--                     config = function()
--                         require('mason').setup()
--                         local masonlsp = require('mason-lspconfig')
--                         masonlsp.setup({
--                             ensure_installed = {
--                                 'rust_analyzer',
--                                 'tsserver',
--                                 'tailwindcss',
--                                 'cssls',
--                                 'html',
--                                 'astro',
--                                 'jsonls',
--                                 'yamlls',
--                                 'lua_ls',
--                             },
--                         })
--                         local lspconfig = require('lspconfig')
--                         local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
--                         masonlsp.setup_handlers({
--                             function(server_name)
--                                 lspconfig[server_name].setup({
--                                     capabilities = lsp_capabilities,
--                                 })
--                             end,
--                         })
--                     end,
--                 },
--             },
--         },
--         -- autocompletion engine
--         {
--             'hrsh7th/nvim-cmp',
--             config = function()
--                 local cmp = require('cmp')
--                 cmp.setup({
--                     snippet = {
--                         expand = function(args)
--                             require('luasnip').lsp_expand(args.body)
--                         end,
--                     },
--                     mapping = cmp.mapping.preset.insert({
--                         ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--                         ['<C-d>'] = cmp.mapping.scroll_docs(4),
--                         ['<C-p>'] = cmp.mapping.select_prev_item(),
--                         ['<C-n>'] = cmp.mapping.select_next_item(),
--                         ['<C-Space>'] = cmp.mapping.complete(),
--                         ['<C-e>'] = cmp.mapping.abort(),
--                         ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--                     }),
--                     sources = {
--                         { name = 'nvim_lsp' },
--                         { name = 'path' },
--                         { name = 'luasnip' },
--                         { name = 'buffer' },
--                     },
--                 })
--             end,
--         },
--         -- makes lsp suggestions show up in autocomplete
--         { 'hrsh7th/cmp-nvim-lsp' },
--         -- makes other words found in the same buffer show up in autocomplete
--         { 'hrsh7th/cmp-buffer' },
--         -- makes path information (like imports) show up in autocomplete
--         { 'hrsh7th/cmp-path' },
--         -- makes luasnip's show up in autocomplete
--         {
--             'saadparwaiz1/cmp_luasnip',
--             -- snippet engine
--             dependencies = {
--                 'L3MON4D3/LuaSnip',
--                 config = function()
--                     local ls = require('luasnip')
--                     require('luasnip.loaders.from_vscode').lazy_load()
--
--                     vim.keymap.set({ 'i' }, '<C-k>', function()
--                         ls.expand()
--                     end, { silent = true, desc = 'Expand snippet' })
--                     vim.keymap.set({ 'i', 's' }, '<C-l>', function()
--                         ls.jump(1)
--                     end, { silent = true, desc = 'Next snippet placeholder' })
--                     vim.keymap.set({ 'i', 's' }, '<C-h>', function()
--                         ls.jump(-1)
--                     end, { silent = true, desc = 'Prev snippet placeholder' })
--                 end,
--                 -- a collection of common useful vs-code like snippets that work with luasnip
--                 dependencies = { 'rafamadriz/friendly-snippets' },
--             },
--         },
--     },
--     config = function()
--         vim.api.nvim_create_autocmd('LspAttach', {
--             desc = 'LSP actions',
--             callback = function(args)
--                 vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover', buffer = args.buf })
--                 vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]o to [D]efinition', buffer = args.buf })
--                 vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,
--                     { desc = '[G]o to [I]mplementation', buffer = args.buf })
--                 vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = '[G]o to [R]eferences' })
--                 vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition,
--                     { desc = '[G]o to [T]ype definition', buffer = args.buf })
--                 vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]ename', buffer = args.buf })
--                 vim.keymap.set('n', '<leader>fo', vim.lsp.buf.format, { desc = '[F]ormat', buffer = args.buf })
--                 vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,
--                     { desc = '[C]ode [A]ction', buffer = args.buf })
--             end,
--         })
--     end,
-- }
