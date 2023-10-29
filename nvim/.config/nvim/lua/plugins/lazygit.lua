-- https://github.com/kdheepak/lazygit.nvim
return {
    'kdheepak/lazygit.nvim',
    keys = { { '<leader>lg', desc = 'Git', mode = 'n' } },
    config = function()
        vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { desc = '[S]ource [C]ontrol' })
    end,
}
