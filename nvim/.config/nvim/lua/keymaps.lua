-- vim.keymap.set('n', '<C-x>', ':bd<CR>', { desc = 'Close current buffer' })
-- vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Keep cursor in the same position when moving a line up' })

-- MOVE VISUAL SELECTION
vim.keymap.set('v', '<C-J>', ":m '>+1<CR>gv=gv", { desc = 'Move current selection down' })
vim.keymap.set('v', '<C-K>', ":m '<-2<CR>gv=gv", { desc = 'Move current selection up' })

-- Center cursor on various actions
vim.keymap.set('n', '<C-o>', '<C-o>zz', { desc = 'Center cursor when going back in jump list' })
vim.keymap.set('n', '<C-i>', '<C-i>zz', { desc = 'Center cursor when going forwards in jump list' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center cursor when moving up the page' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center cursor when moving down the page' })
vim.keymap.set('n', 'n', 'nzz', { desc = 'Center curosr when moving to next search result' })
vim.keymap.set('n', 'N', 'Nzz', { desc = 'Center cursor when moving to previous search result' })

vim.keymap.set('x', '<leader>p', [["_dp]], { desc = 'Paste over selection without losing current register' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Copy to system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Copy to system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete to void register' })
vim.keymap.set('n', '<S-h>', ':bprev<CR>', { desc = 'Switch to prev buffers' })
vim.keymap.set('n', '<S-l>', ':bnext<CR>', { desc = 'Switch to next buffers' })
vim.keymap.set('n', '<leader>x', ':bd<CR>', { desc = 'Switch to next buffers' })
vim.keymap.set('n', '<leader>os', '<C-w>v <CR> <C-w>l', { desc = '[O]pen [S]plit' })
