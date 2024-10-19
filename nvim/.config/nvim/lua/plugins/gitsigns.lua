return {
	'lewis6991/gitsigns.nvim',
	init = function()
		vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<cr>', { desc = 'Gitsigns | toggle blame', silent = true })
	end,
	config = {},
}
-- return {
--     'lewis6991/gitsigns.nvim',
--     config = {
--         numhl = true,
--         linehl = false
--     }
-- }
